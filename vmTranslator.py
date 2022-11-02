
SEGMENT_TABLE = {  
    "local"    : 1,
    "argument" : 2,
    "pointer"  : 3,
    "this"     : 3,
    "that"     : 4,
    "temp"     : 5,
    "static"   : 16,
    "constant" : 256,
}

def getSegment(cmd: str) -> int:
    return SEGMENT_TABLE[cmd]


class VMState:
    DEBUG=True
    lineNumber = 0
    labelsGenerated = 0

    def generateLabel(self, s=""):
        i = self.labelsGenerated
        s = f"VmGeneratedLabel.{s}{i}"
        self.labelsGenerated = i + 1
        return s

def writePushOrPop(cmd: str, segment: str, i: int, state: VMState) -> list[str]:
    if (cmd == "pop" and segment == "constant") or (cmd != "pop" and cmd != "push"):
        raise Exception(f"On Line {state.lineNumber} - Invalid command: {cmd} {segment} {i}");

    match segment:
        case "constant":
            val = i
            # Push a constant into the stack
            return [
                # D = i
                f"@{val}",
                "D=A",
                # M[M[SP]] = D = i
                "@SP",
                "A=M",
                "M=D",
                # SP++
                "@SP",
                "M=M+1",
            ]

        case "temp" | "pointer" | "static":
            ptr = getSegment(segment) + i

            # Push the value of the (register + i)  into the stack
            if cmd == "push":
                return [
                    # D = r + i
                    f"@{ptr}",
                    "D=M",
                    # M[M[SP]] = D = i
                    "@SP",
                    "A=M",
                    "M=D",
                    # SP++
                    "@SP",
                    "M=M+1",
                ] 

            # Pop the stack into the register
            else:
                return [
                    # SP--
                    "@SP",
                    "M=M-1",
                    # D=M[M[SP]] 
                    "@SP",
                    "A=M",
                    "D=M",
                    f"@{ptr}",
                    "M=D",
                ] 
                

        case "local" | "argument" | "this" | "that":
            ptr = getSegment(segment)

            # Push the value of the segment + i = M[ptr] + i into the stack
            if (cmd == "push"):
                return [
                    # D = M[M[r] + i]
                    f"@{ptr}",
                    "D=M",
                    f"@{i}",
                    "A=D+A",
                    "D=M",
                    # M[M[SP]] = D = i
                    "@SP",
                    "A=M",
                    "M=D",
                    # SP++
                    "@SP",
                    "M=M+1",
                ]
            # Pop the stack into M[ptr] + i 
            else:
                return [
                    f"@{ptr}",
                    "D=M",
                    f"@{i}",
                    "D=D+A",
                    "@R13",
                    "M=D",
                    # SP--
                    "@SP",
                    "M=M-1",
                    # D=M[M[SP]] 
                    "@SP",
                    "A=M",
                    "D=M",
                    # M[R13] =D
                    "@R13",
                    "A=M",
                    "M=D",
                ] 
        case _:
            raise Exception(f"On Line {state.lineNumber} - Invalid command: {cmd} {segment} {i}");
    

def writeArithmetic(cmd: str, state: VMState) -> list[str]:

    match cmd:
        case "add" | "sub" | "and" | "or":
            # Read one value and pop it, rewrite the other with the result.
            cmdToAsm = {
                "add": "M=D+M",
                "sub": "M=M-D",
                "and": "M=M&D",
                "or": "M=M|D",
            }
            return [
                # Read memory from top of stack
                # SP-- 
                "@SP",
                "M=M-1",
                # A = M[SP]
                # D=M[A] = M[M[SP]]
                "@SP",
                "A=M",
                "D=M",
                # A = A-1
                "A=A-1",
                # M[A] = M[A] op D
                cmdToAsm[cmd],

            ]
        case "neg" | "not":
            return [
                # Read and write memory from top of stack
                "@SP",
                "A=M-1",
                # M[A] = !M[M[SP]-1]
                "M=!M" if cmd == "not" else "M=-M",
            ]

        case "eq" | "gt" | "lt":
                # TODO
                # "eq": "M=M+D",
                # "gt": "M=M+D",
                # "lt": "M=M+D",

            x = {    
                "eq": "D;JEQ", 
                "lt": "D;JLT", 
                "gt": "D;JGT", 
            }

            label1 = state.generateLabel("truecmp"+cmd)
            label2 = state.generateLabel("endcmp"+cmd)

            return [
                # Read memory from top of stack
                # SP-- 
                "@SP",
                "M=M-1",
                # A = M[SP]
                # D=M[A] = M[M[SP]]
                "@SP",
                "A=M",
                "D=M",
                # A = A-1
                "A=A-1",
                # Result of M[M[SP]-1]-M[M[SP]]
                "D=M-D",
                # Jump to label1 if true
                f"@{label1}",
                x[cmd],
                # Set to 0 and jump to end
                "D=0",
                f"@{label2}",
                "0,JMP",
                # True, set to -1
                f"({label1})",
                "D=-1",
                # if M[SP] = 0, then eq. if M[SP] has zero byte, 
                f"({label2})",
                "@SP",
                "A=M-1",
                # M[M[SP]-1] = D
                "M=D",
            ]
        case _:
            raise Exception("Invalid Command for Arithmetic: " + cmd)

def convertVmStatementToAsm(vmStatement: str, state: VMState) -> list[str]:
    line = vmStatement.strip()
    symbols = line.split(" ")

    cmd = symbols[0]
    asm = [f"// {vmStatement}"] if state.DEBUG else [] 

    match cmd:
        case "add" | "sub" | "neg" | "eq" | "gt" | "lt" | "and" | "or" | "not":
            asm += writeArithmetic(cmd, state)
        case "push" | "pop":
            segment = symbols[1]
            index = int(symbols[2])
            asm += writePushOrPop(cmd, segment, index, state)
        case _:
            raise Exception(f"Line {state.lineNumber} - Invalid Command: {cmd}")

    return asm

def convertVmToAsm(vmStatements: list[str]) -> list[str]:
    state = VMState()
    asmCommands = []

    for lineNumber, line in enumerate(vmStatements):

        state.lineNumber = lineNumber
        line = line.strip()
        if line.startswith("//") or line == "":
            continue;

        asmCommands += convertVmStatementToAsm(line, state)

    return asmCommands
    

def main(fIn: str, fOut: str):
    with open(fIn, "r") as inputFile, open(fOut, "w") as outputFile:
        asmCommands = convertVmToAsm(list(inputFile))
        # asmCommands = convertStrToSymbols(asmCommands)
        outputFile.write("\n".join(asmCommands))

if __name__ == "__main__":

    files = [
        r"projects\07\StackArithmetic\SimpleAdd\SimpleAdd",
        r"projects\07\StackArithmetic\SimpleAdd\SimpleSub",
        r"projects\07\StackArithmetic\SimpleAdd\SimpleAnd",
        r"projects\07\StackArithmetic\SimpleAdd\SimpleOr",
        r"projects\07\StackArithmetic\SimpleAdd\SimpleNeg",
        r"projects\07\StackArithmetic\SimpleAdd\SimpleNot",
        r"projects\07\StackArithmetic\SimpleAdd\SimpleLt",
        r"projects\07\StackArithmetic\SimpleAdd\SimpleGt",
        r"projects\07\StackArithmetic\SimpleAdd\SimpleEq",
        r"projects\07\StackArithmetic\StackTest\StackTest",
        r"projects\07\MemoryAccess\StaticTest\StaticTest",
        r"projects\07\MemoryAccess\BasicTest\BasicTest",
        r"projects\07\MemoryAccess\PointerTest\PointerTest",
    ]

    for file in files:
        main(f"{file}.vm", f"{file}.asm")

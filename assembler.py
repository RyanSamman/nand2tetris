import re
from typing import List, Set, Tuple

def isLabel(s: str) -> bool:
    return not (re.match(r"^\(.+\)$",s) is None)

def buildLabelMap(symbolList: List[str]) -> dict[str,int]:
    labelMap: dict[str, int] = {
        "SP": 0,
        "LCL": 1,
        "ARG": 2,
        "THIS": 3,
        "THAT": 4,
        "SCREEN": 16384,
        "KBD": 24576,
        "R0": 0,
        "R1": 1,
        "R2": 2,
        "R3": 3,
        "R4": 4,
        "R5": 5,
        "R6": 6,
        "R7": 7,
        "R8": 8,
        "R9": 9,
        "R10":10,
        "R11":11,
        "R12":12,
        "R13":13,
        "R14":14,
        "R15":15,
    }

    address = 0

    for s in symbolList:
        if isLabel(s):
            labelMap[s[1:-1]] = address
        else:
            address+= 1

    address = 16
    for s in symbolList:
        if isLabel(s):
            continue

        if s[0] == "@" and not s[1:].isnumeric() and not s[1:] in labelMap:
            labelMap[s[1:]] = address
            address += 1 

    return labelMap

def removeInvalidLines(symbolList: List[str]) -> List[str]:
    lst: List[str] = []
    for s in symbolList:
        x = s.split("//")
        s = x[0].strip()

        if (len(s) == 0):
            continue

        lst.append(s)

    return lst 

def convertStrToSymbols(symbolList: List[str]) -> List[str]:
    symbolList = removeInvalidLines(symbolList)
    labelMap = buildLabelMap(symbolList)
    commandList: List[str] = list(filter(lambda s: not isLabel(s), symbolList))

    # Replace Labels and convert to binary
    for (i,s) in enumerate(commandList):
        if s[0] == "@":
            # If label, get it from the labelMap, and update
            if not s[1:].isnumeric():
                address = labelMap.get(s[1:])

                if address is None:
                    address = len(labelMap) + 1
                    labelMap[s[1:]] = address

                s = f"@{address}"

            commandList[i] = f"{int(s[1:]):b}".zfill(16) 

        else:
            commandList[i] = cInstrToBinary(s)

    return commandList

def splitCInstToDestCompJump(cInst: str) -> Tuple[str, str, str]:
    destStr: str = ""
    compStr: str = ""
    jumpStr: str = ""

    x = cInst.split("=")

    if len(x) == 1:
        compStr = x[0]

    else:
        destStr = x[0] 
        compStr = x[1]

    y = compStr.split(";")

    if len(y) == 1:
        compStr = y[0]
    else:
        compStr = y[0]
        jumpStr = y[1]

    return (destStr, compStr, jumpStr)
    
def processA(s:str) -> str:
    return "1" if s.find("M") != -1 else "0"


compMap = {
    "0": "101010",
    "1": "111111",
    "-1": "111010",
    "D": "001100",
    "A": "110000",
    "M": "110000",
    "!D": "001101",
    "!A": "110001",
    "!M": "110001",
    "-D": "001111",
    "-A": "110011",
    "-M": "110011",
    "D+1": "011111",
    "A+1": "110111",
    "M+1": "110111",
    "D-1": "001110",
    "A-1": "110010",
    "M-1": "110010",
    "D+A": "000010",
    "D+M": "000010",
    "D-A": "010011",
    "D-M": "010011",
    "A-D": "000111",
    "M-D": "000111",
    "D&A": "000000",
    "D&M": "000000",
    "D|A": "010101",
    "D|M": "010101",
}

def processComp(s:str) -> str:

    return compMap[s]

jumpMap = {
    "null":"000",
    "JGT": "001",
    "JEQ": "010",
    "JGE": "011",
    "JLT": "100",
    "JNE": "101",
    "JLE": "110",
    "JMP":"111"
}

def processJump(s:str) -> str:
    if len(s) == 0:
        s = "null"
    return jumpMap[s]

def processDest(s:str) -> str:
    dest = ""
    dest += "1" if s.find("A") != -1 else "0"
    dest += "1" if s.find("D") != -1 else "0"
    dest += "1" if s.find("M") != -1 else "0"

    return dest 

def cInstrToBinary(cInst: str) -> str:
    (destStr, compStr, jumpStr) = splitCInstToDestCompJump(cInst);
    return f"111{processA(compStr)}{processComp(compStr)}{processDest(destStr)}{processJump(jumpStr)}"

def saveSymbolsToFile(outFile: str, opList: list[str]) -> None:
    with open(outFile, "w") as file:
        file.writelines(opList);
        
def loadLinesFromFile(inFile: str) -> List[str]:
    with open(inFile, "r") as file:
        return [line.strip() for line in file]


def main(inputFileName: str, outputFileName:str):
    with open(inputFileName, "r") as inputFile, open(outputFileName, "w") as outputFile:
        symbols = convertStrToSymbols(list(inputFile))
        outputFile.write("\n".join(symbols))

if __name__ == "__main__":
    files = [
        "./add/Add",
        "./max/Max",
        "./max/MaxL",
        "./pong/Pong",
        "./pong/PongL",
        "./rect/Rect",
        "./rect/RectL",
    ]

    for f in files:
        main(f"{f}.asm", f"{f}.hack")
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
A=A-1
D=M-D
@VmGeneratedLabel.truecmplt0
D;JLT
D=0
@VmGeneratedLabel.endcmplt1
0,JMP
(VmGeneratedLabel.truecmplt0)
D=-1
(VmGeneratedLabel.endcmplt1)
@SP
A=M-1
M=D
// push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 7
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
M=M-1
@SP
A=M
D=M
A=A-1
D=M-D
@VmGeneratedLabel.truecmplt2
D;JLT
D=0
@VmGeneratedLabel.endcmplt3
0,JMP
(VmGeneratedLabel.truecmplt2)
D=-1
(VmGeneratedLabel.endcmplt3)
@SP
A=M-1
M=D
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
A=A-1
D=M-D
@VmGeneratedLabel.truecmpeq0
D;JEQ
D=0
@VmGeneratedLabel.endcmpeq1
0,JMP
(VmGeneratedLabel.truecmpeq0)
D=-1
(VmGeneratedLabel.endcmpeq1)
@SP
A=M-1
M=D
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
A=A-1
D=M-D
@VmGeneratedLabel.truecmpeq2
D;JEQ
D=0
@VmGeneratedLabel.endcmpeq3
0,JMP
(VmGeneratedLabel.truecmpeq2)
D=-1
(VmGeneratedLabel.endcmpeq3)
@SP
A=M-1
M=D
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq
@SP
M=M-1
@SP
A=M
D=M
A=A-1
D=M-D
@VmGeneratedLabel.truecmpeq4
D;JEQ
D=0
@VmGeneratedLabel.endcmpeq5
0,JMP
(VmGeneratedLabel.truecmpeq4)
D=-1
(VmGeneratedLabel.endcmpeq5)
@SP
A=M-1
M=D
// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
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
@VmGeneratedLabel.truecmplt6
D;JLT
D=0
@VmGeneratedLabel.endcmplt7
0,JMP
(VmGeneratedLabel.truecmplt6)
D=-1
(VmGeneratedLabel.endcmplt7)
@SP
A=M-1
M=D
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 892
@892
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
@VmGeneratedLabel.truecmplt8
D;JLT
D=0
@VmGeneratedLabel.endcmplt9
0,JMP
(VmGeneratedLabel.truecmplt8)
D=-1
(VmGeneratedLabel.endcmplt9)
@SP
A=M-1
M=D
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
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
@VmGeneratedLabel.truecmplt10
D;JLT
D=0
@VmGeneratedLabel.endcmplt11
0,JMP
(VmGeneratedLabel.truecmplt10)
D=-1
(VmGeneratedLabel.endcmplt11)
@SP
A=M-1
M=D
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
A=A-1
D=M-D
@VmGeneratedLabel.truecmpgt12
D;JGT
D=0
@VmGeneratedLabel.endcmpgt13
0,JMP
(VmGeneratedLabel.truecmpgt12)
D=-1
(VmGeneratedLabel.endcmpgt13)
@SP
A=M-1
M=D
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
A=A-1
D=M-D
@VmGeneratedLabel.truecmpgt14
D;JGT
D=0
@VmGeneratedLabel.endcmpgt15
0,JMP
(VmGeneratedLabel.truecmpgt14)
D=-1
(VmGeneratedLabel.endcmpgt15)
@SP
A=M-1
M=D
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt
@SP
M=M-1
@SP
A=M
D=M
A=A-1
D=M-D
@VmGeneratedLabel.truecmpgt16
D;JGT
D=0
@VmGeneratedLabel.endcmpgt17
0,JMP
(VmGeneratedLabel.truecmpgt16)
D=-1
(VmGeneratedLabel.endcmpgt17)
@SP
A=M-1
M=D
// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
M=M-1
@SP
A=M
D=M
A=A-1
M=D+M
// push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
M=M-1
@SP
A=M
D=M
A=A-1
M=M-D
// neg
@SP
A=M-1
M=-M
// and
@SP
M=M-1
@SP
A=M
D=M
A=A-1
M=M&D
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// or
@SP
M=M-1
@SP
A=M
D=M
A=A-1
M=M|D
// not
@SP
A=M-1
M=!M
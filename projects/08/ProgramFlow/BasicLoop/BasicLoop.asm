// push constant 0
@0              // 0
D=A             // 1
@SP             // 2
A=M             // 3
M=D             // 4
@SP             // 5
M=M+1           // 6
// pop local 0         // initializes sum = 0
@1              // 7
D=M             // 8
@0              // 9
D=D+A           // 10
@R13            // 11
M=D             // 12
@SP             // 13
M=M-1           // 14
@SP             // 15
A=M             // 16
D=M             // 17
@R13            // 18
A=M             // 19
M=D             // 20
// label LOOP_START
(LOOP_START)
// push argument 0
@2              // 21
D=M             // 22
@0              // 23
A=D+A           // 24
D=M             // 25
@SP             // 26
A=M             // 27
M=D             // 28
@SP             // 29
M=M+1           // 30
// push local 0
@1              // 31
D=M             // 32
@0              // 33
A=D+A           // 34
D=M             // 35
@SP             // 36
A=M             // 37
M=D             // 38
@SP             // 39
M=M+1           // 40
// add
@SP             // 41
M=M-1           // 42
@SP             // 43
A=M             // 44
D=M             // 45
A=A-1           // 46
M=D+M           // 47
// pop local 0	        // sum = sum + counter
@1              // 48
D=M             // 49
@0              // 50
D=D+A           // 51
@R13            // 52
M=D             // 53
@SP             // 54
M=M-1           // 55
@SP             // 56
A=M             // 57
D=M             // 58
@R13            // 59
A=M             // 60
M=D             // 61
// push argument 0
@2              // 62
D=M             // 63
@0              // 64
A=D+A           // 65
D=M             // 66
@SP             // 67
A=M             // 68
M=D             // 69
@SP             // 70
M=M+1           // 71
// push constant 1
@1              // 72
D=A             // 73
@SP             // 74
A=M             // 75
M=D             // 76
@SP             // 77
M=M+1           // 78
// sub
@SP             // 79
M=M-1           // 80
@SP             // 81
A=M             // 82
D=M             // 83
A=A-1           // 84
M=M-D           // 85
// pop argument 0      // counter--
@2              // 86
D=M             // 87
@0              // 88
D=D+A           // 89
@R13            // 90
M=D             // 91
@SP             // 92
M=M-1           // 93
@SP             // 94
A=M             // 95
D=M             // 96
@R13            // 97
A=M             // 98
M=D             // 99
// push argument 0
@2              // 100
D=M             // 101
@0              // 102
A=D+A           // 103
D=M             // 104
@SP             // 105
A=M             // 106
M=D             // 107
@SP             // 108
M=M+1           // 109
// if-goto LOOP_START  // If counter != 0, goto LOOP_START
@SP             // 110
M=M-1           // 111
A=M             // 112
D=M             // 113
@LOOP_START     // 114
D;JNE           // 115
// push local 0
@1              // 116
D=M             // 117
@0              // 118
A=D+A           // 119
D=M             // 120
@SP             // 121
A=M             // 122
M=D             // 123
@SP             // 124
M=M+1           // 125
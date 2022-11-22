// push argument 1
@2              // 0
D=M             // 1
@1              // 2
A=D+A           // 3
D=M             // 4
@SP             // 5
A=M             // 6
M=D             // 7
@SP             // 8
M=M+1           // 9
// pop pointer 1           // that = argument[1]
@SP             // 10
M=M-1           // 11
@SP             // 12
A=M             // 13
D=M             // 14
@4              // 15
M=D             // 16
// push constant 0
@0              // 17
D=A             // 18
@SP             // 19
A=M             // 20
M=D             // 21
@SP             // 22
M=M+1           // 23
// pop that 0              // first element in the series = 0
@4              // 24
D=M             // 25
@0              // 26
D=D+A           // 27
@R13            // 28
M=D             // 29
@SP             // 30
M=M-1           // 31
@SP             // 32
A=M             // 33
D=M             // 34
@R13            // 35
A=M             // 36
M=D             // 37
// push constant 1
@1              // 38
D=A             // 39
@SP             // 40
A=M             // 41
M=D             // 42
@SP             // 43
M=M+1           // 44
// pop that 1              // second element in the series = 1
@4              // 45
D=M             // 46
@1              // 47
D=D+A           // 48
@R13            // 49
M=D             // 50
@SP             // 51
M=M-1           // 52
@SP             // 53
A=M             // 54
D=M             // 55
@R13            // 56
A=M             // 57
M=D             // 58
// push argument 0
@2              // 59
D=M             // 60
@0              // 61
A=D+A           // 62
D=M             // 63
@SP             // 64
A=M             // 65
M=D             // 66
@SP             // 67
M=M+1           // 68
// push constant 2
@2              // 69
D=A             // 70
@SP             // 71
A=M             // 72
M=D             // 73
@SP             // 74
M=M+1           // 75
// sub
@SP             // 76
M=M-1           // 77
@SP             // 78
A=M             // 79
D=M             // 80
A=A-1           // 81
M=M-D           // 82
// pop argument 0          // num_of_elements -= 2 (first 2 elements are set)
@2              // 83
D=M             // 84
@0              // 85
D=D+A           // 86
@R13            // 87
M=D             // 88
@SP             // 89
M=M-1           // 90
@SP             // 91
A=M             // 92
D=M             // 93
@R13            // 94
A=M             // 95
M=D             // 96
// label MAIN_LOOP_START
(MAIN_LOOP_START)
// push argument 0
@2              // 97
D=M             // 98
@0              // 99
A=D+A           // 100
D=M             // 101
@SP             // 102
A=M             // 103
M=D             // 104
@SP             // 105
M=M+1           // 106
// if-goto COMPUTE_ELEMENT // if num_of_elements > 0, goto COMPUTE_ELEMENT
@SP             // 107
M=M-1           // 108
A=M             // 109
D=M             // 110
@COMPUTE_ELEMENT // 111
D;JNE           // 112
@END_PROGRAM    // 113
0;JEQ           // 114
// label COMPUTE_ELEMENT
(COMPUTE_ELEMENT)
// push that 0
@4              // 115
D=M             // 116
@0              // 117
A=D+A           // 118
D=M             // 119
@SP             // 120
A=M             // 121
M=D             // 122
@SP             // 123
M=M+1           // 124
// push that 1
@4              // 125
D=M             // 126
@1              // 127
A=D+A           // 128
D=M             // 129
@SP             // 130
A=M             // 131
M=D             // 132
@SP             // 133
M=M+1           // 134
// add
@SP             // 135
M=M-1           // 136
@SP             // 137
A=M             // 138
D=M             // 139
A=A-1           // 140
M=D+M           // 141
// pop that 2              // that[2] = that[0] + that[1]
@4              // 142
D=M             // 143
@2              // 144
D=D+A           // 145
@R13            // 146
M=D             // 147
@SP             // 148
M=M-1           // 149
@SP             // 150
A=M             // 151
D=M             // 152
@R13            // 153
A=M             // 154
M=D             // 155
// push pointer 1
@4              // 156
D=M             // 157
@SP             // 158
A=M             // 159
M=D             // 160
@SP             // 161
M=M+1           // 162
// push constant 1
@1              // 163
D=A             // 164
@SP             // 165
A=M             // 166
M=D             // 167
@SP             // 168
M=M+1           // 169
// add
@SP             // 170
M=M-1           // 171
@SP             // 172
A=M             // 173
D=M             // 174
A=A-1           // 175
M=D+M           // 176
// pop pointer 1           // that += 1
@SP             // 177
M=M-1           // 178
@SP             // 179
A=M             // 180
D=M             // 181
@4              // 182
M=D             // 183
// push argument 0
@2              // 184
D=M             // 185
@0              // 186
A=D+A           // 187
D=M             // 188
@SP             // 189
A=M             // 190
M=D             // 191
@SP             // 192
M=M+1           // 193
// push constant 1
@1              // 194
D=A             // 195
@SP             // 196
A=M             // 197
M=D             // 198
@SP             // 199
M=M+1           // 200
// sub
@SP             // 201
M=M-1           // 202
@SP             // 203
A=M             // 204
D=M             // 205
A=A-1           // 206
M=M-D           // 207
// pop argument 0          // num_of_elements--
@2              // 208
D=M             // 209
@0              // 210
D=D+A           // 211
@R13            // 212
M=D             // 213
@SP             // 214
M=M-1           // 215
@SP             // 216
A=M             // 217
D=M             // 218
@R13            // 219
A=M             // 220
M=D             // 221
@MAIN_LOOP_START // 222
0;JEQ           // 223
// label END_PROGRAM
(END_PROGRAM)
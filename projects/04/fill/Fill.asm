// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Reset index of the visual buffer to beginning
(RESETINDEX)

@8192
D=A

@i
M=D

@LOOP
0,JMP

// Keyboard
// 24576

// Darken the screen while i is pressed
(DARKEN)
@i
D=M
@SCREEN
A=A+D
M=-1
@LOOP
0,JMP

// LIGHTEN the screen while i is pressed
(LIGHTEN)
@i
D=M
@SCREEN
A=A+D
M=0

// Main loop
(LOOP)

@i
M=M-1

// If i > screen end, 
@i
D=M

@RESETINDEX
D,JEQ

// Check input
@24576
D=M

// If i != 0, darken 
@DARKEN
D,JNE

@LIGHTEN
0,JMP



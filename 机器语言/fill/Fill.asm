// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

@i //预定义的符号，代表16
M=0 // RAM[16]=0

(LOOP)
@KBD // 符号KBD预定义为键盘的内存映像的基地址24576(0x6000).
D=M // D=RAM[24576]
@BLACK
D;JGT    // if RAM[24576]>0 JUMP BLACK
@WHITE
D;JEQ    // if RAM[24576]=0 JUMP WHITE

(BLACK)
@i
D=M // D=RAM[16]
@8191 //8k的内存映射
D=D-A //D=D-8191
@LOOP
D;JGT   // if D>0 jump LOOP

@i
D=M // D=RAM[16]=0
@SCREEN
A=A+D
M=-1 // RAM[A]=-1;
@i
M=M+1 //RAM[16]=RAM[16]+1;
@LOOP
0;JMP //jump LOOP.

(WHITE)
@i
D=M //D=RAM[16]
@RESET
D;JLT   // if RAM[16]<0 Then jump RESET

@i
D=M
@SCREEN
A=A+D
M=0 //RAM[A]=0;

@i
M=M-1 //RAM[16]=RAM[16]-1
@LOOP
0;JMP

(RESET)
@i
M=0
@LOOP
0;JMP
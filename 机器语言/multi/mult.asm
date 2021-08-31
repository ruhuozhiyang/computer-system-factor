//SET R2=0
//D寄存器仅用来存储数据，A寄存器存储数据和地址。

@R2 //A指令，将A寄存器设置为R2（R2：汇编语言中常数或符号表示内存位置，R0到R15表示0到15号RAM地址）。
M=0 //Hack语言语法规定，M总是代表一个内存单元的数值，该内存单元的地址就是当前A寄存器中的数值。此处即设置RAM[2]=0;

// RO R1 > 0 
@R0 //A寄存器设置为R0；
D=M //D设置为RAM[0]
@END
D;JLE
@R1
D=M
@END
D;JLE

// SET R3=R1
@R1
D=M
@R3
M=D

// LOOP BODY 
(LOOP)
@R0
D=M
@R2
M=M+D
@R3
M=M-1
@R3
D=M
// R3=0 JUMP END
@END
D;JEQ
// R3>0 JUMP LOOP
@LOOP
D;JGT

// END PROGRAM
(END)
@END
0;JMP //无限循环
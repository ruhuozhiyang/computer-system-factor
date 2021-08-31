//D寄存器仅用来存储数据，A寄存器存储数据和地址。

//SET R2=0
@R2 //A指令，将A寄存器设置为R2（R2：汇编语言中常数或符号表示内存位置，R0到R15表示0到15号RAM地址）。
M=0 //Hack语言语法规定，M总是代表一个内存单元的数值，该内存单元的地址就是当前A寄存器中的数值。此处即设置RAM[2]=0;

// RO R1 > 0 
@R0 //A寄存器设置为R0；
D=M //D设置为RAM[0]
@END
D;JLE  //C指令，dest = comp;jump，当dest为空的时候，“=”可以省略。此处即comp域为D，也就是RAM[0]，JLE是if out<=0 jump;
@R1
D=M
@END
D;JLE // 此处的D是助记符，代表寄存器D，且不对寄存器D进行操作，取原值。和上面被赋值的D不一样，上面的D是寄存器D。

// SET R3=R1
@R1
D=M
@R3
M=D

// LOOP BODY 
(LOOP)
@R0
D=M // D=RAM[0]
@R2
M=M+D // RAM[2]=RAM[2]+RAM[0]
@R3
M=M-1 // RAM[3]=RAM[3]-1

@R3
D=M // D=RAM[3]
@END
D;JEQ // if RAM[3]=0 JUMP END;

@LOOP
D;JGT // if RAM[3]>0 JUMP LOOP

// END PROGRAM
(END)
@END
0;JMP //无限循环

// 以上方法就是，将RAM[1]的值复制一份在RAM[3]中，也就是RAM[0]要累加的次数，也就是RAM[0]*RAM[1]的值.
// 每累加一次的值放在RAM[2]中，RAM3减1，直到等于0推出循环。
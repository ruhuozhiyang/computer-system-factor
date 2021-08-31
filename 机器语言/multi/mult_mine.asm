@R0
D=M
@END
D;JLE

@R1
D=M
@END
D;JLE

@R2
M=0

(LOOP1)
@R0
D=M
@R2
M=M+D

@R1
M=M-1

D=M
@END
D;JEQ

@LOOP1
D;JGT

(END)
@END
0;JMP

//还有很大的优化空间，例如如果R0是1，R1是10000，如果按照这种算肯定很耗费时间，1*10000与10000*1；
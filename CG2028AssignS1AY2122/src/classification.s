 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	classification
 	.thumb_func

@ CG2028 Assignment, Sem 2, AY 2021/21
@ (c) CG2028 Teaching Team, ECE NUS, 2021

@ student 1: Name: , Matriculation No.:
@ student 2: Name: , Matriculation No.:
@ eg: student 1: Name: John Doe , Matriculation No.: A021234N

@Register map
@R0 - N, returns class
@R1 - points, SHORTESTKDIST
@R2 - label
@R3 - sample, K
@R4 - Array of distance
@R5 - Sample X1
@R6 - Sample Y1
@R7 - Working Reg

@Variables map
@ .lcomm distance - Contains all the distance. Currently set for N = 100
@ Equates
classification:
@ PUSH / save (only those) registers which are modified by your function
			PUSH {R1-R7,LR}
@ parameter registers need not be saved.
			LDR R4, =DISTANCE

@ write asm function body here
			PUSH {R7}
			BL LOADSAMPLE @Load in X1, Y1
			POP {R7}
			PUSH {R0,R4,R7} @Save pointer of dist array & N to 8 & R7
CALCDIST:	BL SETDISTANCE @Loop to set distance array
			SUBS R0, #1
			BNE CALCDIST @Once done: R5,R6 is free.
			POP {R0,R4,R7} @Set pointer back to start of dist array & N to 8
			LDR R1, =SHORTESTKDIST
			PUSH {

		MOV R0, #5

@ POP / restore original register values. DO NOT save or restore R0. Why?
		POP {R1-R7,LR}
@ return to C program
		BX	LR

@R0 - N(Int)
@R1 - SHORTESTKDIST
@R2 - labels
@R3 - K
@R4 - Dist(Array)
@R5/R6/R7 - Working (Unsorted Counter, Sorted coutner,
SORTDIST:
		MOV R5, #0 			@Load Unsorted array counter
		MOV R6, #0			@Load Sorted array counter
OUTER:


@R0 - N(Int)
@R1 - Points(Array)
@R4 - Dist(Array)
@R5 - Sample X1
@R6 - Sample Y1
@R7 - X1, X2
SETDISTANCE:

		PUSH {R5-R6}
		LDR R7, [R1], #4 @Get x2
		SUB R5, R7
		MUL R5, R5 @Store (x1-x2)^2 into R5
		LDR R7, [R1], #4 @get y2
		SUB R6, R7 	   @Value of y1 - y2
		MLA R5, R6, R6, R5 @R6^2 + R5 into R5.
		STR R5, [R4], #4 @put value into Memory
		POP {R5-R6}
		BX LR

LOADSAMPLE:
		@Load Sample X,Y,K
		LDR R5, [R3], #4
		LDR R6, [R3], #4
		LDR R7, [R3], #4
		MOV R3, R7
		BX LR


@label: .word value
K: .word 1
@.lcomm label num_bytes
.lcomm DISTANCE 400 		@Set for N = 100
.lcomm SHORTESTKDIST 400 	@Set for K = 100
.lcomm SORTEDDIST 400 		@Set For K = 100
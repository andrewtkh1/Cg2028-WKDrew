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
@R8 - Total int of Label
@R9 - Shortest Dist

@Variables map
@ .lcomm distance - Contains all the distance. Currently set for N = 100
@ Equates
classification:
@ PUSH / save (only those) registers which are modified by your function
			PUSH {R1-R9,LR}
@ parameter registers need not be saved.
			LDR R4, =DISTANCE	@Store all distance from K

@ write asm function body here
			@PUSH {R7}
			BL LOADSAMPLE 		@Load in X1, Y1
			@POP {R7}
			PUSH {R0,R4,R7} 	@Save pointer of dist array & N to 8 & R7
CALCDIST:	BL SETDISTANCE 		@Loop to set distance array
			SUBS R0, #1
			BNE CALCDIST 		@Once done: R5,R6 is free.
			POP {R0,R4,R7} 		@Set pointer back to start of dist array & N to 8
			LDR R1, =SHORTESTKDIST	@Load array of size 100
			PUSH {R0-R7}
			BL GETDIST			@Get K Shortest Dist
			POP {R0-R7}
			PUSH {R0-R7}
			MOV R8, #0			@Set R8 to 0 first.
			BL SETLABELS		@Gets the K Shortest Label
			POP {R0-R7}
			MOV R0, R8
@ POP / restore original register values. DO NOT save or restore R0. Why?
			POP {R1-R9,LR}
@ return to C program
			BX	LR

@R0 - N(Int)
@R1 - SHORTESTKDIST
@R2 - labels
@R3 - K
@R4 - Dist(Array)
@R5/R6/R7 - Working (Cur K val, Cur Dist label, CurDist)
@R8 - SHORTESTLABEL (INT)
@R9 - Shortest Dist chosen

SETLABELS:
			PUSH {R0,R2,R4}
			CMP R3,#0			@If found all K Labels
			ITT EQ				@Check if K = 0
			POPEQ {R0,R2,R4}	@Pop Before exit
			BXEQ LR
			LDR R5, [R1], #4 	@Load K val
LOOPNARR:						@Loop N times
			LDR	R7, [R4], #4 	@Get CurDist
			LDR R6, [R2], #4 	@Get Label
			CMP R7, R5
			IT EQ				@Get shortest dist
			MOVEQ R9, R5		@Set R9 to shortest.
			SUBS R7, R5
			ITTTT EQ
			ADDEQ R8, R6		@Can replace as MOV
			SUBEQ R3, #1
			POPEQ {R0,R2,R4}	@Reload all values for next loop
			BEQ SETLABELS
			SUBS R0, #1
			BNE LOOPNARR		@End loop N times
			POP {R0,R2,R4}		@Pop if Never found
			BX LR				@Go back if can't find



@R0 - N(Int)
@R1 - SHORTESTKDIST
@R3 - K
@R4 - Dist(Array)
@R5/R6/R7 - Working (Unused ,curDist in K , curDist in N)
GETDIST:
		PUSH {R1,R3}
FIRSTK:						@Load first K dist into K-array
		LDR R7, [R4], #4
		STR R7, [R1], #4
		SUBS R3, #1
		SUB R0, #1			@Decrease N
		BNE FIRSTK
		POP {R1,R3}
REMAIN:
		PUSH {R1,R3}		@Store K & Pointer of ShorestK array
		CMP R0, #0			@Check if N == 0
		IT EQ
		BXEQ LR				@Return If N = 0
		LDR R7, [R4], #4	@Load next from DistN
LOOPK:
		LDR R6, [R1], #4	@Load next from ShortestK
		CMP R7, R6
		ITTTT LT			@If R7 LessThan R6
		STRLT R7,[R1,#-4] 	@Store R7
		ADDLT R7, R6		@Swaps R7 & R6
		SUBLT R6, R7, R6
		SUBLT R7, R6
		SUBS R3, #1			@Minus 1 K
		BNE LOOPK			@End of K loop
		POP {R1,R3}
		SUBS R0, #1
		BNE REMAIN			@End of Whole N loop
		BX LR

@R0 - N(Int)
@R1 - Points(Array)
@R4 - Dist(Array)
@R5 - Sample X1
@R6 - Sample Y1
@R7 - X1, X2
SETDISTANCE:
		PUSH {R5-R6}
		LDR R7, [R1], #4 	@Get x2
		SUB R5, R7
		MUL R5, R5 			@Store (x1-x2)^2 into R5
		LDR R7, [R1], #4 	@get y2
		SUB R6, R7 	   		@Value of y1 - y2
		MLA R5, R6, R6, R5 	@R6^2 + R5 into R5.
		STR R5, [R4], #4 	@put value into Memory
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
POINTER: .word 0
@.lcomm label num_bytes
.lcomm DISTANCE 400 		@Set for N = 100
.lcomm SHORTESTKDIST 400 	@Set for K = 100
.lcomm SHORTESTLABEL 400 	@Set For K = 100

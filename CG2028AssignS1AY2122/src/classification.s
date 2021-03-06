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
@R8 - Shortest Dist Label
@R9 - Shortest Dist

@Variables map
@ .lcomm distance - Contains all the distance. Currently set for N = 100
@ Equates
classification:
@ PUSH / save (only those) registers which are modified by your function
			PUSH {R1-R9,LR}
@ parameter registers need not be saved.
			LDR R4, =DISTANCE		@Store all distance from K

@ write asm function body here
			BL LOADSAMPLE 			@Load in X1, Y1
			PUSH {R0,R4} 			@Save pointer of dist array & N to 8
CALCDIST:	BL SETDISTANCE 			@Loop to set distance array
			SUBS R0, #1																		@0b0000 0010 0101 0000 0000 0000 0000 0001
			BNE CALCDIST 			@Once done: R5,R6 is free.								@0b0001 1000 0000 0000 0000 0000 0000 1100
			POP {R0,R4} 			@Set pointer back to start of dist array & N to 8
			LDR R1, =SHORTESTKDIST	@Load array of size 100
			PUSH {R0-R7}
			BL GETDIST				@Get K Shortest Dist
			POP {R0-R7}				@Reg status:
									@R0 - N
									@R1 - SHORTESTKDIST
									@R2 - Label
									@R3 - Free
									@R4 - Array of Dist
									@R5:R9 - Free
			PUSH {R0-R4}
			MOV R8, #0				@Set R8 to 0 first.										@0b0000 0011 1010 0000 1000 0000 0000 0000
			BL SETLABELS			@Gets the Shortest Label
			POP {R0-R4}
			MOV R0, R8																		@0b0000 0001 1010 0000 0000 0000 0000 1000
@ POP / restore original register values. DO NOT save or restore R0. Why?
			POP {R1-R9,LR}
@ return to C program
			BX	LR

@R0 - N(Int)
@R1 - SHORTESTKDIST
@R2 - labels
@R4 - Dist(Array)
@R5/R6/R7 - Working (Free, Cur Dist label, CurDist)
@R8 - SHORTESTLABEL (INT)
@R9 - Shortest Dist chosen

SETLABELS:
			PUSH {R0,R2,R4}
			LDR R5, [R1]	 		@Load 1st val											@0b0000 0101 1001 0001 0101 0000 0000 0000
LOOPNARR:							@Loop N times
			LDR	R7, [R4], #4 		@Get CurDist											@0b0000 0100 1001 0100 0111 0000 0000 0100
			LDR R6, [R2], #4 		@Get Label												@0b0000 0100 1001 0010 0110 0000 0000 0100
			CMP R7, R5																		@0b0000 0001 0101 0111 0000 0000 0000 0101
			ITTTT EQ
			MOVEQ R9, R5			@Set R9 to shortest.									@0b0000 0001 1010 0000 1001 0000 0000 0101
			MOVEQ R8, R6			@Set Label												@0b0000 0001 1010 0000 1000 0000 0000 0110
			POPEQ {R0,R2,R4}		@POP back Reg.
			BXEQ LR					@Return back
			SUBS R0, #1																		@0b0000 0010 0101 0000 0000 0000 0000 0001
			BNE LOOPNARR			@End loop N times										@0b0001 1000 0000 0000 0000 0000 0010 1100
			POP {R0,R2,R4}			@Pop if Never found
			MOV R9, #0																		@0b0000 0011 1010 0000 1001 0000 0000 0000
			MOV R8, #2																		@0b0000 0011 1010 0000 1000 0000 0000 0010
			BX LR					@Return label -2 if not found

@R0 - N(Int)
@R1 - SHORTESTKDIST
@R4 - Dist(Array)
@R5/R6/R7 - Working (Unused ,curDist in K , curDist in N)
GETDIST:							@Load first dist into K-array
		LDR R7, [R4], #4																	@0b0000 0100 1001 0100 0111 0000 0000 0100
		STR R7, [R1]																		@0b0000 0101 1000 0001 0111 0000 0000 0000
		SUB R0, #1					@Decrease N												@0b0000 0010 0100 0000 0000 0000 0000 0001
REMAIN:
		LDR R7, [R4], #4			@Load next from DistN									@0b0000 0100 1001 0100 0111 0000 0000 0100
		LDR R6, [R1]				@Load Cur item from ShortestK							@0b0000 0101 1001 0001 0110 0000 0000 0000
		CMP R7, R6																			@0b0000 0001 0101 0111 0000 0000 0000 0110
		IT LT						@If R7 LessThan R6
		STRLT R7,[R1] 				@Store R7												@0b0000 0101 1000 0001 0111 0000 0000 0000
		SUBS R0, #1					@Decrease N												@0b0000 0010 0101 0000 0000 0000 0000 0001
		IT EQ
		BXEQ LR						@Return If N = 0
		B REMAIN					@End of Whole N loop									@0b1110 1000 0000 0000 0000 0000 0010 1000

@R0 - N(Int)
@R1 - Points(Array)
@R4 - Dist(Array)
@R5 - Sample X1
@R6 - Sample Y1
@R7 - X1, X2
SETDISTANCE:
		PUSH {R5-R6}
		LDR R7, [R1], #4 			@Get x2													@0b0000 0100 1001 0001 0111 0000 0000 0100
		SUB R5, R7																			@0b0000 0000 0100 0101 0101 0000 0000 0111
		MUL R5, R5 					@Store (x1-x2)^2 into R5								@0b0000 0000 0000 0000 0101 0101 0001 0101
		LDR R7, [R1], #4 			@get y2													@0b0000 0100 1001 0001 0111 0000 0000 0100
		SUB R6, R7 	   				@Value of y1 - y2										@0b0000 0000 0100 0110 0110 0000 0000 0111
		MLA R5, R6, R6, R5 			@R6^2 + R5 into R5.										@0b0000 0000 0010 0101 0101 0110 0001 0110
		STR R5, [R4], #4 			@put value into Memory									@0b0000 0100 1000 0100 0101 0000 0000 0100
		POP {R5-R6}
		BX LR

LOADSAMPLE:
		@Load Sample X,Y,K
		LDR R5, [R3], #4																	@0b0000 0100 1001 0011 0101 0000 0000 0100
		LDR R6, [R3], #4																	@0b0000 0100 1001 0011 0110 0000 0000 0100
		LDR R7, [R3], #4																	@0b0000 0100 1001 0011 0111 0000 0000 0100
		MOV R3, R7																			@0b0000 0001 1010 0000 0011 0000 0000 0111
		BX LR


@label: .word value
POINTER: .word 0
@.lcomm label num_bytes
.lcomm DISTANCE 400 				@Set for N = 100
.lcomm SHORTESTKDIST 4 				@Set for K = 1

classification:
            PUSH {R1-R9,LR}
            LDR R4, =DISTANCE        	@Psudo instr
            BL LOADSAMPLE            	@Not Needed
            PUSH {R0,R4}
CALCDIST:   BL SETDISTANCE           	@Not Needed
            SUBS R0, #1					@0b0000 0010 0101 0000 0000 0000 0000 0001
            BNE CALCDIST             	@0b0001 1000 0000 0000 0000 0000 0000 1100
            POP {R0,R4}
            LDR R1, =SHORTESTKDIST    	@Psudo instr
            PUSH {R0-R7}
            BL GETDIST
            POP {R0-R7}
            PUSH {R0-R4}
            MOV R8, #0                	@0b0000 0011 1010 0000 1000 0000 0000 0000
            BL SETLABELS            	@Not Needed
            POP {R0-R4}
            MOV R0, R8					@0b0000 0001 1010 0000 0000 0000 0000 1000
            POP {R1-R9,LR}
            BX    LR
SETLABELS:
            PUSH {R0,R2,R4}
            LDR R5, [R1]             	@0b0000 0101 1001 0001 0101 0000 0000 0000
LOOPNARR:
            LDR R7, [R4], #4         	@0b0000 0100 1001 0100 0111 0000 0000 0100
            LDR R6, [R2], #4         	@0b0000 0100 1001 0010 0110 0000 0000 0100
            CMP R7, R5					@0b0000 0001 0101 0111 0000 0000 0000 0101
            ITTTT EQ
            MOVEQ R9, R5            	@0b0000 0001 1010 0000 1001 0000 0000 0101
            MOVEQ R8, R6            	@0b0000 0001 1010 0000 1000 0000 0000 0110
            POPEQ {R0,R2,R4}
            BXEQ LR
            SUBS R0, #1					@0b0000 0010 0101 0000 0000 0000 0000 0001
            BNE LOOPNARR            	@0b0001 1000 0000 0000 0000 0000 0010 1100
            POP {R0,R2,R4}
            MOV R9, #0					@0b0000 0011 1010 0000 1001 0000 0000 0000
            MOV R8, #2					@0b0000 0011 1010 0000 1000 0000 0000 0010
            BX LR

@R0 - N(Int)
@R1 - SHORTESTKDIST
@R4 - Dist(Array)
@R5/R6/R7 - Working (Unused ,curDist in K , curDist in N)
GETDIST:
        LDR R7, [R4], #4				@0b0000 0100 1001 0100 0111 0000 0000 0100
        STR R7, [R1]					@0b0000 0101 1000 0001 0111 0000 0000 0000
        SUB R0, #1                    	@0b0000 0010 0100 0000 0000 0000 0000 0001
REMAIN:
        LDR R7, [R4], #4            	@0b0000 0100 1001 0100 0111 0000 0000 0100
        LDR R6, [R1]                	@0b0000 0101 1001 0001 0110 0000 0000 0000
        CMP R7, R6						@0b0000 0001 0101 0111 0000 0000 0000 0110
        IT LT
        STRLT R7,[R1]                 	@0b0000 0101 1000 0001 0111 0000 0000 0000
        SUBS R0, #1                    	@0b0000 0010 0101 0000 0000 0000 0000 0001
        IT EQ
        BXEQ LR
        B REMAIN                    	@0b1110 1000 0000 0000 0000 0000 0010 1000

@R0 - N(Int)
@R1 - Points(Array)
@R4 - Dist(Array)
@R5 - Sample X1
@R6 - Sample Y1
@R7 - X1, X2
SETDISTANCE:
        PUSH {R5-R6}
        LDR R7, [R1], #4             	@0b0000 0100 1001 0001 0111 0000 0000 0100
        SUB R5, R7						@0b0000 0000 0100 0101 0101 0000 0000 0111
        MUL R5, R5                   	@0b0000 0000 0000 0000 0101 0101 0001 0101
        LDR R7, [R1], #4             	@0b0000 0100 1001 0001 0111 0000 0000 0100
        SUB R6, R7                   	@0b0000 0000 0100 0110 0110 0000 0000 0111
        MLA R5, R6, R6, R5           	@0b0000 0000 0010 0101 0101 0110 0001 0110
        STR R5, [R4], #4             	@0b0000 0100 1000 0100 0101 0000 0000 0100
        POP {R5-R6}
        BX LR

LOADSAMPLE:
        @Load Sample X,Y,K
        LDR R5, [R3], #4				@0b0000 0100 1001 0011 0101 0000 0000 0100
        LDR R6, [R3], #4				@0b0000 0100 1001 0011 0110 0000 0000 0100
        LDR R7, [R3], #4				@0b0000 0100 1001 0011 0111 0000 0000 0100
        MOV R3, R7						@0b0000 0001 1010 0000 0011 0000 0000 0111
        BX LR

   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.section	.rodata
  19              		.align	2
  20              	.LC3:
  21 0000 4320203A 		.ascii	"C  : class = %d \012\000"
  21      20636C61 
  21      7373203D 
  21      20256420 
  21      0A00
  22 0012 0000     		.align	2
  23              	.LC0:
  24 0014 23000000 		.word	35
  25 0018 00000000 		.word	0
  26 001c 00000000 		.word	0
  27 0020 0F000000 		.word	15
  28 0024 0A000000 		.word	10
  29 0028 0A000000 		.word	10
  30 002c 0A000000 		.word	10
  31 0030 00000000 		.word	0
  32 0034 1E000000 		.word	30
  33 0038 00000000 		.word	0
  34 003c 1E000000 		.word	30
  35 0040 0A000000 		.word	10
  36 0044 28000000 		.word	40
  37 0048 00000000 		.word	0
  38 004c 28000000 		.word	40
  39 0050 0A000000 		.word	10
  40              		.align	2
  41              	.LC1:
  42 0054 01000000 		.word	1
  43 0058 01000000 		.word	1
  44 005c 00000000 		.word	0
  45 0060 00000000 		.word	0
  46 0064 01000000 		.word	1
  47 0068 00000000 		.word	0
  48 006c 01000000 		.word	1
  49 0070 00000000 		.word	0
  50              		.align	2
  51              	.LC2:
  52 0074 0F000000 		.word	15
  53 0078 14000000 		.word	20
  54              		.section	.text.main,"ax",%progbits
  55              		.align	2
  56              		.global	main
  57              		.thumb
  58              		.thumb_func
  60              	main:
  61              	.LFB0:
  62              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** #define k 1
   3:../src/main.c **** 
   4:../src/main.c **** 
   5:../src/main.c **** // CG2028 Assignment, Sem 1, AY 2021/22
   6:../src/main.c **** // (c) CG2028 Teaching Team, ECE NUS, 2021
   7:../src/main.c **** 
   8:../src/main.c **** extern int classification(int N, int* points, int* label, int* sample); // asm implementation
   9:../src/main.c **** int classification_c(int N, int* points, int* label, int* sample); // reference C implementation
  10:../src/main.c **** 
  11:../src/main.c **** int main(void)
  12:../src/main.c **** {
  63              		.loc 1 12 0
  64              		.cfi_startproc
  65              		@ args = 0, pretend = 0, frame = 112
  66              		@ frame_needed = 1, uses_anonymous_args = 0
  67 0000 B0B5     		push	{r4, r5, r7, lr}
  68              	.LCFI0:
  69              		.cfi_def_cfa_offset 16
  70              		.cfi_offset 14, -4
  71              		.cfi_offset 7, -8
  72              		.cfi_offset 5, -12
  73              		.cfi_offset 4, -16
  74 0002 9CB0     		sub	sp, sp, #112
  75              	.LCFI1:
  76              		.cfi_def_cfa_offset 128
  77 0004 00AF     		add	r7, sp, #0
  78              	.LCFI2:
  79              		.cfi_def_cfa_register 7
  13:../src/main.c **** 	//variables
  14:../src/main.c **** 	int N = 8;
  80              		.loc 1 14 0
  81 0006 4FF00803 		mov	r3, #8
  82 000a FB66     		str	r3, [r7, #108]
  15:../src/main.c **** 	// think of the values below as numbers of the form x.y
  16:../src/main.c **** 	// (decimal fixed point with 1 fractional decimal digits precision)
  17:../src/main.c **** 	// which are scaled up to allow them to be used integers
  18:../src/main.c **** 
  19:../src/main.c **** 	int points[16] = {35, 0, 0, 15, 10, 10, 10, 0, 30, 0, 30, 10, 40, 0, 40, 10};
  83              		.loc 1 19 0
  84 000c 40F20003 		movw	r3, #:lower16:.LC0
  85 0010 C0F20003 		movt	r3, #:upper16:.LC0
  86 0014 07F12C04 		add	r4, r7, #44
  87 0018 1D46     		mov	r5, r3
  88 001a 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  89 001c 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  90 001e 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  91 0020 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  92 0022 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  93 0024 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  94 0026 95E80F00 		ldmia	r5, {r0, r1, r2, r3}
  95 002a 84E80F00 		stmia	r4, {r0, r1, r2, r3}
  20:../src/main.c **** 	int label[8] = {1, 1, 0, 0, 1, 0, 1, 0};
  96              		.loc 1 20 0
  97 002e 40F20003 		movw	r3, #:lower16:.LC1
  98 0032 C0F20003 		movt	r3, #:upper16:.LC1
  99 0036 07F10C04 		add	r4, r7, #12
 100 003a 1D46     		mov	r5, r3
 101 003c 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 102 003e 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 103 0040 95E80F00 		ldmia	r5, {r0, r1, r2, r3}
 104 0044 84E80F00 		stmia	r4, {r0, r1, r2, r3}
  21:../src/main.c **** 	int sample[2] = {15, 20};
 105              		.loc 1 21 0
 106 0048 40F20003 		movw	r3, #:lower16:.LC2
 107 004c C0F20003 		movt	r3, #:upper16:.LC2
 108 0050 07F10402 		add	r2, r7, #4
 109 0054 93E80300 		ldmia	r3, {r0, r1}
 110 0058 82E80300 		stmia	r2, {r0, r1}
  22:../src/main.c **** 
  23:../src/main.c **** 	// Call assembly language function to perform classification
  24:../src/main.c **** 	//printf( "asm: class = %d \n", classification(N, points, label, sample) ) ;
  25:../src/main.c **** 	printf( "C  : class = %d \n", classification_c(N, points, label, sample) ) ;
 111              		.loc 1 25 0
 112 005c 40F20004 		movw	r4, #:lower16:.LC3
 113 0060 C0F20004 		movt	r4, #:upper16:.LC3
 114 0064 07F12C01 		add	r1, r7, #44
 115 0068 07F10C02 		add	r2, r7, #12
 116 006c 07F10403 		add	r3, r7, #4
 117 0070 F86E     		ldr	r0, [r7, #108]
 118 0072 FFF7FEFF 		bl	classification_c
 119 0076 0346     		mov	r3, r0
 120 0078 2046     		mov	r0, r4
 121 007a 1946     		mov	r1, r3
 122 007c FFF7FEFF 		bl	printf
 123              	.L2:
  26:../src/main.c **** 
  27:../src/main.c **** 	while (1); //halt
 124              		.loc 1 27 0 discriminator 1
 125 0080 FEE7     		b	.L2
 126              		.cfi_endproc
 127              	.LFE0:
 129 0082 00BF     		.section	.rodata
 130              		.align	2
 131              	.LC4:
 132 007c 64256420 		.ascii	"d%d = %d, class = %d \012\000"
 132      3D202564 
 132      2C20636C 
 132      61737320 
 132      3D202564 
 133 0093 00       		.align	2
 134              	.LC5:
 135 0094 44697374 		.ascii	"Distance = %d \012\000"
 135      616E6365 
 135      203D2025 
 135      64200A00 
 136              		.section	.text.classification_c,"ax",%progbits
 137              		.align	2
 138              		.global	classification_c
 139              		.thumb
 140              		.thumb_func
 142              	classification_c:
 143              	.LFB1:
  28:../src/main.c **** }
  29:../src/main.c **** 
  30:../src/main.c **** int classification_c(int N, int* points, int* label, int* sample)
  31:../src/main.c **** { 	// The implementation below is meant only for verifying your results.
 144              		.loc 1 31 0
 145              		.cfi_startproc
 146              		@ args = 0, pretend = 0, frame = 56
 147              		@ frame_needed = 1, uses_anonymous_args = 0
 148 0000 2DE9F043 		push	{r4, r5, r6, r7, r8, r9, lr}
 149              	.LCFI3:
 150              		.cfi_def_cfa_offset 28
 151              		.cfi_offset 14, -4
 152              		.cfi_offset 9, -8
 153              		.cfi_offset 8, -12
 154              		.cfi_offset 7, -16
 155              		.cfi_offset 6, -20
 156              		.cfi_offset 5, -24
 157              		.cfi_offset 4, -28
 158 0004 8FB0     		sub	sp, sp, #60
 159              	.LCFI4:
 160              		.cfi_def_cfa_offset 88
 161 0006 00AF     		add	r7, sp, #0
 162              	.LCFI5:
 163              		.cfi_def_cfa_register 7
 164 0008 F860     		str	r0, [r7, #12]
 165 000a B960     		str	r1, [r7, #8]
 166 000c 7A60     		str	r2, [r7, #4]
 167 000e 3B60     		str	r3, [r7, #0]
 168              		.loc 1 31 0
 169 0010 6B46     		mov	r3, sp
 170 0012 1E46     		mov	r6, r3
  32:../src/main.c **** 	
  33:../src/main.c **** 	int i,j,n;
  34:../src/main.c **** 	int class;// returned labels of k=1 nearest neighbors
  35:../src/main.c **** 	int d[N]; // squared Euclidean distance
 171              		.loc 1 35 0
 172 0014 F868     		ldr	r0, [r7, #12]
 173 0016 00F1FF33 		add	r3, r0, #-1
 174 001a 3B62     		str	r3, [r7, #32]
 175 001c 0146     		mov	r1, r0
 176 001e 0A46     		mov	r2, r1
 177 0020 4FF00003 		mov	r3, #0
 178 0024 4FEAD261 		lsr	r1, r2, #27
 179 0028 4FEA4319 		lsl	r9, r3, #5
 180 002c 41EA0909 		orr	r9, r1, r9
 181 0030 4FEA4218 		lsl	r8, r2, #5
 182 0034 0146     		mov	r1, r0
 183 0036 0A46     		mov	r2, r1
 184 0038 4FF00003 		mov	r3, #0
 185 003c 4FEAD261 		lsr	r1, r2, #27
 186 0040 4FEA4315 		lsl	r5, r3, #5
 187 0044 0D43     		orrs	r5, r5, r1
 188 0046 4FEA4214 		lsl	r4, r2, #5
 189 004a 0346     		mov	r3, r0
 190 004c 4FEA8303 		lsl	r3, r3, #2
 191 0050 03F10703 		add	r3, r3, #7
 192 0054 03F10703 		add	r3, r3, #7
 193 0058 4FEAD303 		lsr	r3, r3, #3
 194 005c 4FEAC303 		lsl	r3, r3, #3
 195 0060 ADEB030D 		sub	sp, sp, r3
 196 0064 6B46     		mov	r3, sp
 197 0066 03F10703 		add	r3, r3, #7
 198 006a 4FEAD303 		lsr	r3, r3, #3
 199 006e 4FEAC303 		lsl	r3, r3, #3
 200 0072 FB61     		str	r3, [r7, #28]
  36:../src/main.c **** 	int d1, d2;
  37:../src/main.c **** 	int dout;
  38:../src/main.c **** 
  39:../src/main.c **** 	
  40:../src/main.c **** 	// calculate the squared distance between test sample and each training data points
  41:../src/main.c **** 	for (i=0; i<N; i++){
 201              		.loc 1 41 0
 202 0074 4FF00003 		mov	r3, #0
 203 0078 7B63     		str	r3, [r7, #52]
 204 007a 38E0     		b	.L4
 205              	.L5:
  42:../src/main.c **** 		d[i] = (points[2*i]-sample[0]) * (points[2*i]-sample[0])
 206              		.loc 1 42 0 discriminator 2
 207 007c 7B6B     		ldr	r3, [r7, #52]
 208 007e 4FEAC303 		lsl	r3, r3, #3
 209 0082 BA68     		ldr	r2, [r7, #8]
 210 0084 D318     		adds	r3, r2, r3
 211 0086 1A68     		ldr	r2, [r3, #0]
 212 0088 3B68     		ldr	r3, [r7, #0]
 213 008a 1B68     		ldr	r3, [r3, #0]
 214 008c D31A     		subs	r3, r2, r3
 215 008e 7A6B     		ldr	r2, [r7, #52]
 216 0090 4FEAC202 		lsl	r2, r2, #3
 217 0094 B968     		ldr	r1, [r7, #8]
 218 0096 8A18     		adds	r2, r1, r2
 219 0098 1168     		ldr	r1, [r2, #0]
 220 009a 3A68     		ldr	r2, [r7, #0]
 221 009c 1268     		ldr	r2, [r2, #0]
 222 009e 8A1A     		subs	r2, r1, r2
 223 00a0 02FB03F2 		mul	r2, r2, r3
  43:../src/main.c **** 		+ (points[2*i+1]-sample[1])*(points[2*i+1]-sample[1]);
 224              		.loc 1 43 0 discriminator 2
 225 00a4 7B6B     		ldr	r3, [r7, #52]
 226 00a6 4FEAC303 		lsl	r3, r3, #3
 227 00aa 03F10403 		add	r3, r3, #4
 228 00ae B968     		ldr	r1, [r7, #8]
 229 00b0 CB18     		adds	r3, r1, r3
 230 00b2 1968     		ldr	r1, [r3, #0]
 231 00b4 3B68     		ldr	r3, [r7, #0]
 232 00b6 03F10403 		add	r3, r3, #4
 233 00ba 1B68     		ldr	r3, [r3, #0]
 234 00bc CB1A     		subs	r3, r1, r3
 235 00be 796B     		ldr	r1, [r7, #52]
 236 00c0 4FEAC101 		lsl	r1, r1, #3
 237 00c4 01F10401 		add	r1, r1, #4
 238 00c8 B868     		ldr	r0, [r7, #8]
 239 00ca 4118     		adds	r1, r0, r1
 240 00cc 0868     		ldr	r0, [r1, #0]
 241 00ce 3968     		ldr	r1, [r7, #0]
 242 00d0 01F10401 		add	r1, r1, #4
 243 00d4 0968     		ldr	r1, [r1, #0]
 244 00d6 411A     		subs	r1, r0, r1
 245 00d8 01FB03F3 		mul	r3, r1, r3
 246 00dc D118     		adds	r1, r2, r3
  42:../src/main.c **** 		d[i] = (points[2*i]-sample[0]) * (points[2*i]-sample[0])
 247              		.loc 1 42 0 discriminator 2
 248 00de FB69     		ldr	r3, [r7, #28]
 249 00e0 7A6B     		ldr	r2, [r7, #52]
 250 00e2 43F82210 		str	r1, [r3, r2, lsl #2]
  41:../src/main.c **** 	for (i=0; i<N; i++){
 251              		.loc 1 41 0 discriminator 2
 252 00e6 7B6B     		ldr	r3, [r7, #52]
 253 00e8 03F10103 		add	r3, r3, #1
 254 00ec 7B63     		str	r3, [r7, #52]
 255              	.L4:
  41:../src/main.c **** 	for (i=0; i<N; i++){
 256              		.loc 1 41 0 is_stmt 0 discriminator 1
 257 00ee 7A6B     		ldr	r2, [r7, #52]
 258 00f0 FB68     		ldr	r3, [r7, #12]
 259 00f2 9A42     		cmp	r2, r3
 260 00f4 C2DB     		blt	.L5
  44:../src/main.c **** 	}
  45:../src/main.c **** 
  46:../src/main.c **** 	// print all distances
  47:../src/main.c **** 	for (i=0; i<N; i++){
 261              		.loc 1 47 0 is_stmt 1
 262 00f6 4FF00003 		mov	r3, #0
 263 00fa 7B63     		str	r3, [r7, #52]
 264 00fc 18E0     		b	.L6
 265              	.L7:
  48:../src/main.c **** 		printf( "d%d = %d, class = %d \n",i+1, d[i],label[i]) ;
 266              		.loc 1 48 0 discriminator 2
 267 00fe 40F20003 		movw	r3, #:lower16:.LC4
 268 0102 C0F20003 		movt	r3, #:upper16:.LC4
 269 0106 7A6B     		ldr	r2, [r7, #52]
 270 0108 02F10101 		add	r1, r2, #1
 271 010c FA69     		ldr	r2, [r7, #28]
 272 010e 786B     		ldr	r0, [r7, #52]
 273 0110 52F82020 		ldr	r2, [r2, r0, lsl #2]
 274 0114 786B     		ldr	r0, [r7, #52]
 275 0116 4FEA8000 		lsl	r0, r0, #2
 276 011a 7C68     		ldr	r4, [r7, #4]
 277 011c 2018     		adds	r0, r4, r0
 278 011e 0468     		ldr	r4, [r0, #0]
 279 0120 1846     		mov	r0, r3
 280 0122 2346     		mov	r3, r4
 281 0124 FFF7FEFF 		bl	printf
  47:../src/main.c **** 	for (i=0; i<N; i++){
 282              		.loc 1 47 0 discriminator 2
 283 0128 7B6B     		ldr	r3, [r7, #52]
 284 012a 03F10103 		add	r3, r3, #1
 285 012e 7B63     		str	r3, [r7, #52]
 286              	.L6:
  47:../src/main.c **** 	for (i=0; i<N; i++){
 287              		.loc 1 47 0 is_stmt 0 discriminator 1
 288 0130 7A6B     		ldr	r2, [r7, #52]
 289 0132 FB68     		ldr	r3, [r7, #12]
 290 0134 9A42     		cmp	r2, r3
 291 0136 E2DB     		blt	.L7
  49:../src/main.c **** 	}
  50:../src/main.c **** 
  51:../src/main.c **** 	// find the k=1 nearest neighbors
  52:../src/main.c **** 
  53:../src/main.c **** 	for (j=0; j<N; j++){
 292              		.loc 1 53 0 is_stmt 1
 293 0138 4FF00003 		mov	r3, #0
 294 013c 3B63     		str	r3, [r7, #48]
 295 013e 3CE0     		b	.L8
 296              	.L13:
  54:../src/main.c **** 		d1 = d[j];
 297              		.loc 1 54 0
 298 0140 FB69     		ldr	r3, [r7, #28]
 299 0142 3A6B     		ldr	r2, [r7, #48]
 300 0144 53F82230 		ldr	r3, [r3, r2, lsl #2]
 301 0148 BB61     		str	r3, [r7, #24]
  55:../src/main.c **** 		for (n=0; n<N; n++){
 302              		.loc 1 55 0
 303 014a 4FF00003 		mov	r3, #0
 304 014e FB62     		str	r3, [r7, #44]
 305 0150 2BE0     		b	.L9
 306              	.L12:
  56:../src/main.c **** 			d2 = d[n];
 307              		.loc 1 56 0
 308 0152 FB69     		ldr	r3, [r7, #28]
 309 0154 FA6A     		ldr	r2, [r7, #44]
 310 0156 53F82230 		ldr	r3, [r3, r2, lsl #2]
 311 015a 7B61     		str	r3, [r7, #20]
  57:../src/main.c **** 			if (d1<d2 && d1>=0 && d2>=0){
 312              		.loc 1 57 0
 313 015c BA69     		ldr	r2, [r7, #24]
 314 015e 7B69     		ldr	r3, [r7, #20]
 315 0160 9A42     		cmp	r2, r3
 316 0162 0FDA     		bge	.L10
 317              		.loc 1 57 0 is_stmt 0 discriminator 1
 318 0164 BB69     		ldr	r3, [r7, #24]
 319 0166 002B     		cmp	r3, #0
 320 0168 0CDB     		blt	.L10
 321 016a 7B69     		ldr	r3, [r7, #20]
 322 016c 002B     		cmp	r3, #0
 323 016e 09DB     		blt	.L10
  58:../src/main.c **** 				class = label[j];
 324              		.loc 1 58 0 is_stmt 1
 325 0170 3B6B     		ldr	r3, [r7, #48]
 326 0172 4FEA8303 		lsl	r3, r3, #2
 327 0176 7A68     		ldr	r2, [r7, #4]
 328 0178 D318     		adds	r3, r2, r3
 329 017a 1B68     		ldr	r3, [r3, #0]
 330 017c BB62     		str	r3, [r7, #40]
  59:../src/main.c **** 				dout = d1;
 331              		.loc 1 59 0
 332 017e BB69     		ldr	r3, [r7, #24]
 333 0180 7B62     		str	r3, [r7, #36]
 334 0182 0EE0     		b	.L11
 335              	.L10:
  60:../src/main.c **** 			}
  61:../src/main.c **** 			else if (d1>=0 && d2>=0){
 336              		.loc 1 61 0
 337 0184 BB69     		ldr	r3, [r7, #24]
 338 0186 002B     		cmp	r3, #0
 339 0188 0BDB     		blt	.L11
 340              		.loc 1 61 0 is_stmt 0 discriminator 1
 341 018a 7B69     		ldr	r3, [r7, #20]
 342 018c 002B     		cmp	r3, #0
 343 018e 08DB     		blt	.L11
  62:../src/main.c **** 				class = label[n];
 344              		.loc 1 62 0 is_stmt 1
 345 0190 FB6A     		ldr	r3, [r7, #44]
 346 0192 4FEA8303 		lsl	r3, r3, #2
 347 0196 7A68     		ldr	r2, [r7, #4]
 348 0198 D318     		adds	r3, r2, r3
 349 019a 1B68     		ldr	r3, [r3, #0]
 350 019c BB62     		str	r3, [r7, #40]
  63:../src/main.c **** 				dout = d2;
 351              		.loc 1 63 0
 352 019e 7B69     		ldr	r3, [r7, #20]
 353 01a0 7B62     		str	r3, [r7, #36]
 354              	.L11:
  55:../src/main.c **** 		for (n=0; n<N; n++){
 355              		.loc 1 55 0
 356 01a2 FB6A     		ldr	r3, [r7, #44]
 357 01a4 03F10103 		add	r3, r3, #1
 358 01a8 FB62     		str	r3, [r7, #44]
 359              	.L9:
  55:../src/main.c **** 		for (n=0; n<N; n++){
 360              		.loc 1 55 0 is_stmt 0 discriminator 1
 361 01aa FA6A     		ldr	r2, [r7, #44]
 362 01ac FB68     		ldr	r3, [r7, #12]
 363 01ae 9A42     		cmp	r2, r3
 364 01b0 CFDB     		blt	.L12
  53:../src/main.c **** 	for (j=0; j<N; j++){
 365              		.loc 1 53 0 is_stmt 1
 366 01b2 3B6B     		ldr	r3, [r7, #48]
 367 01b4 03F10103 		add	r3, r3, #1
 368 01b8 3B63     		str	r3, [r7, #48]
 369              	.L8:
  53:../src/main.c **** 	for (j=0; j<N; j++){
 370              		.loc 1 53 0 is_stmt 0 discriminator 1
 371 01ba 3A6B     		ldr	r2, [r7, #48]
 372 01bc FB68     		ldr	r3, [r7, #12]
 373 01be 9A42     		cmp	r2, r3
 374 01c0 BEDB     		blt	.L13
  64:../src/main.c **** 			}
  65:../src/main.c **** 		}
  66:../src/main.c **** 	}
  67:../src/main.c **** 	printf("Distance = %d \n",dout) ;
 375              		.loc 1 67 0 is_stmt 1
 376 01c2 40F20003 		movw	r3, #:lower16:.LC5
 377 01c6 C0F20003 		movt	r3, #:upper16:.LC5
 378 01ca 1846     		mov	r0, r3
 379 01cc 796A     		ldr	r1, [r7, #36]
 380 01ce FFF7FEFF 		bl	printf
  68:../src/main.c **** 	return class;
 381              		.loc 1 68 0
 382 01d2 BB6A     		ldr	r3, [r7, #40]
 383 01d4 B546     		mov	sp, r6
  69:../src/main.c **** }
 384              		.loc 1 69 0
 385 01d6 1846     		mov	r0, r3
 386 01d8 07F13C07 		add	r7, r7, #60
 387 01dc BD46     		mov	sp, r7
 388 01de BDE8F083 		pop	{r4, r5, r6, r7, r8, r9, pc}
 389              		.cfi_endproc
 390              	.LFE1:
 392 01e2 00BF     		.text
 393              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\Pryo\AppData\Local\Temp\ccHJ7Cmy.s:19     .rodata:00000000 $d
C:\Users\Pryo\AppData\Local\Temp\ccHJ7Cmy.s:20     .rodata:00000000 .LC3
C:\Users\Pryo\AppData\Local\Temp\ccHJ7Cmy.s:23     .rodata:00000014 .LC0
C:\Users\Pryo\AppData\Local\Temp\ccHJ7Cmy.s:41     .rodata:00000054 .LC1
C:\Users\Pryo\AppData\Local\Temp\ccHJ7Cmy.s:51     .rodata:00000074 .LC2
C:\Users\Pryo\AppData\Local\Temp\ccHJ7Cmy.s:55     .text.main:00000000 $t
C:\Users\Pryo\AppData\Local\Temp\ccHJ7Cmy.s:60     .text.main:00000000 main
C:\Users\Pryo\AppData\Local\Temp\ccHJ7Cmy.s:142    .text.classification_c:00000000 classification_c
C:\Users\Pryo\AppData\Local\Temp\ccHJ7Cmy.s:131    .rodata:0000007c .LC4
C:\Users\Pryo\AppData\Local\Temp\ccHJ7Cmy.s:134    .rodata:00000094 .LC5
C:\Users\Pryo\AppData\Local\Temp\ccHJ7Cmy.s:137    .text.classification_c:00000000 $t
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
printf

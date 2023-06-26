	.file	"forward_kernel_2.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	cgra_execute
	.type	cgra_execute, @function
cgra_execute:
	addi	sp,sp,-160
	mv	a3,a1
	lla	a5,.LANCHOR0
	addi	a4,sp,8
	lla	a2,.LANCHOR0+144
.L2:
	ld	a7,0(a5)
	ld	a6,8(a5)
	ld	a1,16(a5)
	sd	a7,0(a4)
	ld	a7,24(a5)
	sd	a6,8(a4)
	ld	a6,32(a5)
	sd	a1,16(a4)
	ld	a1,40(a5)
	sd	a7,24(a4)
	sd	a6,32(a4)
	sd	a1,40(a4)
	addi	a5,a5,48
	addi	a4,a4,48
	bne	a5,a2,.L2
	lw	a2,0(a5)
	lhu	a5,4(a5)
	addi	a1,sp,8
	sw	a2,0(a4)
	sh	a5,4(a4)
	ld	a2,.LC1
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC2
	ld	a1,0(a0)
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC3
	ld	a1,8(a0)
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,100663296
	addi	a2,a2,9
	ld	a1,16(a0)
	slli	a2,a2,13
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,25
	li	a1,0
	slli	a2,a2,32
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,12288
	addi	a1,a1,-1008
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,25165824
	addi	a2,a2,3
	ld	a1,0(a3)
	slli	a2,a2,15
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,160
	jr	ra
	.size	cgra_execute, .-cgra_execute
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36029441264189440
	.align	3
.LC2:
	.dword	4504424261124096
	.align	3
.LC3:
	.dword	4504424261156864
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	8192
	.half	3072
	.half	20
	.half	-128
	.half	-32665
	.half	21
	.half	16384
	.half	256
	.half	22
	.half	0
	.half	0
	.half	23
	.half	0
	.half	16
	.half	56
	.half	0
	.half	1536
	.half	128
	.half	0
	.half	1536
	.half	200
	.half	8192
	.half	0
	.half	272
	.half	-12019
	.half	0
	.half	305
	.half	-10162
	.half	0
	.half	309
	.half	64
	.half	0
	.half	340
	.half	16
	.half	0
	.half	344
	.half	0
	.half	0
	.half	348
	.half	-32768
	.half	3073
	.half	372
	.half	-1472
	.half	-32665
	.half	373
	.half	20462
	.half	256
	.half	374
	.half	0
	.half	0
	.half	375
	.half	2048
	.half	3072
	.half	376
	.half	64
	.half	-32672
	.half	377
	.half	16384
	.half	256
	.half	378
	.half	0
	.half	0
	.half	379
	.half	0
	.half	3072
	.half	384
	.half	64
	.half	-32672
	.half	385
	.half	16384
	.half	-28416
	.half	386
	.half	0
	.half	0
	.half	387
	.ident	"GCC: (g2ee5e430018) 12.2.0"

	.file	"forward_kernel_1.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	forward_kernel_1
	.type	forward_kernel_1, @function
forward_kernel_1:
	addi	sp,sp,-176
	mv	a6,a2
	mv	a7,a1
	lla	a5,.LANCHOR0
	addi	a4,sp,8
	lla	a2,.LANCHOR0+160
.L2:
	ld	a1,0(a5)
	ld	t3,8(a5)
	ld	t1,16(a5)
	sd	a1,0(a4)
	ld	a1,24(a5)
	sd	t3,8(a4)
	sd	t1,16(a4)
	sd	a1,24(a4)
	addi	a5,a5,32
	addi	a4,a4,32
	bne	a5,a2,.L2
	ld	a5,0(a5)
	addi	a1,sp,8
	ld	a2,.LC1
	sd	a5,0(a4)
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,2359296
	addi	a2,a2,1
	mv	a1,a0
	slli	a2,a2,16
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,18874368
	addi	a2,a2,1
	mv	a1,a7
	slli	a2,a2,13
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a5,9437184
	addi	a2,a5,1
	mv	a1,a6
	slli	a2,a2,14
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,7
	li	a1,0
	slli	a2,a2,34
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,4096
	addi	a1,a1,-2041
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,9
	mv	a1,a3
	slli	a2,a2,34
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,176
	jr	ra
	.size	forward_kernel_1, .-forward_kernel_1
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36029518573600768
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	28672
	.half	3072
	.half	4
	.half	-320
	.half	31
	.half	5
	.half	16380
	.half	256
	.half	6
	.half	0
	.half	0
	.half	7
	.half	10240
	.half	3072
	.half	8
	.half	-128
	.half	-32737
	.half	9
	.half	12288
	.half	256
	.half	10
	.half	0
	.half	0
	.half	11
	.half	0
	.half	3072
	.half	12
	.half	64
	.half	-32744
	.half	13
	.half	12288
	.half	-28416
	.half	14
	.half	0
	.half	0
	.half	15
	.half	0
	.half	0
	.half	44
	.half	48
	.half	0
	.half	48
	.half	20493
	.half	0
	.half	77
	.half	6161
	.half	0
	.half	81
	.half	0
	.half	-24574
	.half	82
	.half	-32744
	.half	4
	.half	83
	.half	0
	.half	0
	.half	116
	.half	0
	.half	0
	.half	120
	.half	24654
	.half	0
	.half	157
	.half	3
	.half	0
	.half	196
	.half	0
	.half	32
	.half	268
	.half	0
	.half	0
	.half	340
	.half	0
	.half	3072
	.half	376
	.half	64
	.half	-32744
	.half	377
	.half	12288
	.half	256
	.half	378
	.half	0
	.half	0
	.half	379
	.ident	"GCC: (g2ee5e430018) 12.2.0"

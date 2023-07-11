	.file	"forward_kernel_0.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"execute:\n"
	.align	3
.LC3:
	.string	"%d \n"
	.text
	.align	1
	.globl	forward_kernel_0
	.type	forward_kernel_0, @function
forward_kernel_0:
	addi	sp,sp,-224
	sd	s3,184(sp)
	mv	s3,a0
	lla	a0,.LC1
	sd	s0,208(sp)
	sd	s1,200(sp)
	sd	s2,192(sp)
	mv	s1,a2
	sd	ra,216(sp)
	mv	s2,a1
	mv	s0,a3
	call	printf
	lla	a5,.LANCHOR0
	addi	a4,sp,8
	lla	a2,.LANCHOR0+160
.L2:
	ld	a3,0(a5)
	ld	a7,8(a5)
	ld	a6,16(a5)
	sd	a3,0(a4)
	ld	a3,24(a5)
	sd	a7,8(a4)
	sd	a6,16(a4)
	sd	a3,24(a4)
	addi	a5,a5,32
	addi	a4,a4,32
	bne	a5,a2,.L2
	ld	a5,0(a5)
	addi	a1,sp,8
	ld	a2,.LC2
	sd	a5,0(a4)
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,6291456
	addi	a2,a2,5
	slli	a2,a2,14
	mv	a1,s3
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a5,4718592
	addi	a5,a5,1
	slli	a2,a5,15
	mv	a1,s2
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a5,12582912
	addi	a5,a5,9
	slli	a2,a5,13
	mv	a1,s1
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,7
	slli	a2,a2,34
	li	a1,0
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,4096
	addi	a1,a1,-496
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,1572864
	addi	a2,a2,1
	slli	a2,a2,16
	mv	a1,s0
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
# 82 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (10 << (7)) | (0 << (7+5)) | (0 << (7+5+1)) | (1 << (7+5+2)) | (0 << (7+5+3)) | (0 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 0) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	lw	a1,0(s0)
	lla	a0,.LC3
	call	printf
	lw	a1,4(s0)
	lla	a0,.LC3
	call	printf
	lw	a1,8(s0)
	lla	a0,.LC3
	call	printf
	lw	a1,12(s0)
	lla	a0,.LC3
	call	printf
	lw	a1,16(s0)
	lla	a0,.LC3
	call	printf
	lw	a1,20(s0)
	lla	a0,.LC3
	call	printf
	ld	ra,216(sp)
	ld	s0,208(sp)
	ld	s1,200(sp)
	ld	s2,192(sp)
	ld	s3,184(sp)
	addi	sp,sp,224
	jr	ra
	.size	forward_kernel_0, .-forward_kernel_0
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC2:
	.dword	36029518573600768
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	24576
	.half	3072
	.half	20
	.half	-320
	.half	31
	.half	21
	.half	12284
	.half	256
	.half	22
	.half	0
	.half	0
	.half	23
	.half	0
	.half	16
	.half	56
	.half	-32768
	.half	0
	.half	128
	.half	-26365
	.half	0
	.half	161
	.half	48
	.half	0
	.half	196
	.half	4114
	.half	0
	.half	229
	.half	0
	.half	-24574
	.half	230
	.half	24
	.half	2051
	.half	231
	.half	1024
	.half	0
	.half	264
	.half	0
	.half	32
	.half	268
	.half	22625
	.half	0
	.half	301
	.half	16
	.half	0
	.half	336
	.half	0
	.half	4
	.half	340
	.half	2048
	.half	3072
	.half	368
	.half	64
	.half	-32744
	.half	369
	.half	8192
	.half	256
	.half	370
	.half	0
	.half	0
	.half	371
	.half	12288
	.half	3072
	.half	372
	.half	-128
	.half	-32737
	.half	373
	.half	8192
	.half	256
	.half	374
	.half	0
	.half	0
	.half	375
	.half	0
	.half	3072
	.half	376
	.half	64
	.half	-32744
	.half	377
	.half	8192
	.half	-28928
	.half	378
	.half	0
	.half	0
	.half	379
	.ident	"GCC: (g2ee5e430018) 12.2.0"

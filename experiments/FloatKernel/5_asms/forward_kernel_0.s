	.file	"forward_kernel_0.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC2:
	.string	"fo:\n"
	.align	3
.LC4:
	.string	"(%d,%d):%d\n "
	.align	3
.LC5:
	.string	"\n"
	.text
	.align	1
	.globl	forward_kernel_0
	.type	forward_kernel_0, @function
forward_kernel_0:
	addi	sp,sp,-240
	sd	s0,224(sp)
	mv	t1,a2
	sd	ra,232(sp)
	sd	s1,216(sp)
	sd	s2,208(sp)
	sd	s3,200(sp)
	sd	s4,192(sp)
	fsd	fs0,184(sp)
	mv	t3,a1
	mv	s0,a3
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
	ld	a2,.LC1
	sd	a5,0(a4)
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a5,3145728
	addi	a2,a5,3
	mv	a1,a0
	slli	a2,a2,15
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a4,18874368
	addi	a4,a4,13
	mv	a1,t3
	slli	a2,a4,13
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,3
	mv	a1,t1
	slli	a2,a2,35
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
	li	a1,20480
	addi	a1,a1,24
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	a2,a5,1
	slli	a2,a2,15
	mv	s2,s0
	mv	a1,s0
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
# 82 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (10 << (7)) | (0 << (7+5)) | (0 << (7+5+1)) | (1 << (7+5+2)) | (0 << (7+5+3)) | (0 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 0) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	lla	a0,.LC2
	call	printf
	li	s1,0
	flw	fs0,.LC3,a5
	lla	s4,.LC4
	li	s3,3
.L3:
	flw	fa5,0(s2)
	mv	a2,s1
	li	a1,0
	fmul.s	fa5,fa5,fs0
	addiw	s1,s1,1
	mv	a0,s4
	addi	s2,s2,4
	fcvt.w.s a3,fa5,rtz
	sext.w	a3,a3
	call	printf
	bne	s1,s3,.L3
	lla	a0,.LC5
	call	printf
	addi	s0,s0,12
	li	s1,0
	lla	s3,.LC4
	li	s2,3
.L4:
	flw	fa5,0(s0)
	mv	a2,s1
	li	a1,1
	fmul.s	fa5,fa5,fs0
	addiw	s1,s1,1
	mv	a0,s3
	addi	s0,s0,4
	fcvt.w.s a3,fa5,rtz
	sext.w	a3,a3
	call	printf
	bne	s1,s2,.L4
	lla	a0,.LC5
	call	printf
	ld	ra,232(sp)
	ld	s0,224(sp)
	ld	s1,216(sp)
	ld	s2,208(sp)
	ld	s3,200(sp)
	ld	s4,192(sp)
	fld	fs0,184(sp)
	addi	sp,sp,240
	jr	ra
	.size	forward_kernel_0, .-forward_kernel_0
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36029518573600768
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC3:
	.word	1176256512
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	0
	.half	3072
	.half	16
	.half	64
	.half	-32744
	.half	17
	.half	8192
	.half	256
	.half	18
	.half	0
	.half	0
	.half	19
	.half	0
	.half	3072
	.half	20
	.half	64
	.half	-32744
	.half	21
	.half	8192
	.half	-28928
	.half	22
	.half	128
	.half	0
	.half	23
	.half	0
	.half	0
	.half	56
	.half	1
	.half	0
	.half	60
	.half	-14226
	.half	0
	.half	93
	.half	192
	.half	0
	.half	128
	.half	0
	.half	0
	.half	200
	.half	8209
	.half	0
	.half	237
	.half	0
	.half	-24574
	.half	238
	.half	24
	.half	2051
	.half	239
	.half	0
	.half	0
	.half	276
	.half	6157
	.half	1
	.half	313
	.half	16
	.half	0
	.half	348
	.half	0
	.half	0
	.half	352
	.half	8192
	.half	3072
	.half	380
	.half	-128
	.half	-32737
	.half	381
	.half	8192
	.half	256
	.half	382
	.half	0
	.half	0
	.half	383
	.half	26624
	.half	3072
	.half	388
	.half	-320
	.half	31
	.half	389
	.half	12284
	.half	256
	.half	390
	.half	0
	.half	0
	.half	391
	.ident	"GCC: (g2ee5e430018) 12.2.0"

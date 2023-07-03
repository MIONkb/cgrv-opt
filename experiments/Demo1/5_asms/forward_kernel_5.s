	.file	"forward_kernel_5.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	forward_kernel_5
	.type	forward_kernel_5, @function
forward_kernel_5:
	addi	sp,sp,-128
	mv	a6,a2
	mv	a7,a1
	lla	a5,.LANCHOR0
	mv	a4,sp
	lla	a2,.LANCHOR0+120
.L2:
	ld	t1,0(a5)
	ld	a1,8(a5)
	ld	t3,16(a5)
	sd	t1,0(a4)
	ld	t1,24(a5)
	sd	a1,8(a4)
	ld	a1,32(a5)
	sd	t3,16(a4)
	sd	t1,24(a4)
	sd	a1,32(a4)
	addi	a5,a5,40
	addi	a4,a4,40
	bne	a5,a2,.L2
	lw	a2,0(a5)
	lhu	a5,4(a5)
	mv	a1,sp
	sw	a2,0(a4)
	sh	a5,4(a4)
	ld	a2,.LC1
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,3
	mv	a1,a0
	slli	a2,a2,38
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,18874368
	addi	a2,a2,1
	mv	a1,a7
	slli	a2,a2,15
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a5,25165824
	addi	a2,a5,1
	mv	a1,a6
	slli	a2,a2,13
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,21
	slli	a2,a2,32
	li	a1,0
	addi	a2,a2,17
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,30
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,12582912
	addi	a2,a2,1
	mv	a1,a3
	slli	a2,a2,14
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
# 82 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (10 << (7)) | (0 << (7+5)) | (0 << (7+5+1)) | (1 << (7+5+2)) | (0 << (7+5+3)) | (0 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 0) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,128
	jr	ra
	.size	forward_kernel_5, .-forward_kernel_5
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36029338184974472
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	2048
	.half	12288
	.half	8
	.half	64
	.half	-32744
	.half	9
	.half	16384
	.half	256
	.half	10
	.half	0
	.half	0
	.half	11
	.half	8192
	.half	12288
	.half	12
	.half	-704
	.half	-32737
	.half	13
	.half	16384
	.half	256
	.half	14
	.half	0
	.half	0
	.half	15
	.half	4096
	.half	12288
	.half	16
	.half	64
	.half	-32744
	.half	17
	.half	16384
	.half	-28928
	.half	18
	.half	0
	.half	0
	.half	19
	.half	24576
	.half	12288
	.half	20
	.half	-2048
	.half	-32737
	.half	21
	.half	20462
	.half	256
	.half	22
	.half	0
	.half	0
	.half	23
	.half	0
	.half	0
	.half	48
	.half	16400
	.half	0
	.half	52
	.half	0
	.half	0
	.half	56
	.half	-30674
	.half	0
	.half	85
	.half	-30707
	.half	0
	.half	89
	.ident	"GCC: (g2ee5e430018) 12.2.0"

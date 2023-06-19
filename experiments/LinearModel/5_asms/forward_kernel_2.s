	.file	"forward_kernel_2.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	forward_kernel_2
	.type	forward_kernel_2, @function
forward_kernel_2:
	addi	sp,sp,-160
	mv	a6,a2
	mv	a7,a1
	lla	a5,.LANCHOR0
	addi	a4,sp,8
	lla	a2,.LANCHOR0+144
.L2:
	ld	t3,0(a5)
	ld	t1,8(a5)
	ld	a1,16(a5)
	sd	t3,0(a4)
	ld	t3,24(a5)
	sd	t1,8(a4)
	ld	t1,32(a5)
	sd	a1,16(a4)
	ld	a1,40(a5)
	sd	t3,24(a4)
	sd	t1,32(a4)
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
	li	a2,268447744
	mv	a1,a0
	slli	a2,a2,24
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC2
	mv	a1,a7
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a5,6291456
	addi	a2,a5,1
	mv	a1,a6
	slli	a2,a2,15
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
	li	a1,147
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,25165824
	addi	a2,a2,5
	mv	a1,a3
	slli	a2,a2,13
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,160
	jr	ra
	.size	forward_kernel_2, .-forward_kernel_2
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36029441264189440
	.align	3
.LC2:
	.dword	4503805785808896
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	26624
	.half	3072
	.half	4
	.half	-320
	.half	31
	.half	5
	.half	20476
	.half	256
	.half	6
	.half	0
	.half	0
	.half	7
	.half	8192
	.half	3072
	.half	8
	.half	-128
	.half	-32737
	.half	9
	.half	16384
	.half	256
	.half	10
	.half	0
	.half	0
	.half	11
	.half	2048
	.half	3072
	.half	20
	.half	64
	.half	-32744
	.half	21
	.half	16384
	.half	-29440
	.half	22
	.half	0
	.half	0
	.half	23
	.half	0
	.half	3072
	.half	32
	.half	64
	.half	-32744
	.half	33
	.half	16384
	.half	256
	.half	34
	.half	0
	.half	0
	.half	35
	.half	256
	.half	0
	.half	44
	.half	0
	.half	4
	.half	48
	.half	2048
	.half	0
	.half	52
	.half	8208
	.half	0
	.half	56
	.half	0
	.half	2
	.half	60
	.half	0
	.half	2
	.half	64
	.half	0
	.half	0
	.half	68
	.half	9219
	.half	0
	.half	81
	.half	10369
	.half	0
	.half	89
	.ident	"GCC: (g2ee5e430018) 12.2.0"

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
	addi	sp,sp,-144
	mv	a6,a2
	mv	a7,a1
	lla	a5,.LANCHOR0
	addi	a4,sp,8
	lla	a2,.LANCHOR0+128
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
	lw	a5,0(a5)
	addi	a1,sp,8
	ld	a2,.LC1
	sw	a5,0(a4)
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,6291456
	addi	a2,a2,1
	mv	a1,a0
	slli	a2,a2,15
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,9
	mv	a1,a7
	slli	a2,a2,36
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a5,100663296
	addi	a2,a5,5
	mv	a1,a6
	slli	a2,a2,13
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,11
	li	a1,0
	slli	a2,a2,33
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,120
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,50331648
	addi	a2,a2,3
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
	addi	sp,sp,144
	jr	ra
	.size	forward_kernel_2, .-forward_kernel_2
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36029363954778112
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	-32768
	.half	3073
	.half	16
	.half	-1472
	.half	-32665
	.half	17
	.half	20462
	.half	256
	.half	18
	.half	0
	.half	0
	.half	19
	.half	4096
	.half	3072
	.half	20
	.half	64
	.half	-32672
	.half	21
	.half	16384
	.half	-28928
	.half	22
	.half	128
	.half	0
	.half	23
	.half	8192
	.half	3072
	.half	24
	.half	-128
	.half	-32665
	.half	25
	.half	16384
	.half	256
	.half	26
	.half	0
	.half	0
	.half	27
	.half	2048
	.half	3072
	.half	28
	.half	64
	.half	-32672
	.half	29
	.half	16384
	.half	256
	.half	30
	.half	0
	.half	0
	.half	31
	.half	0
	.half	0
	.half	56
	.half	0
	.half	0
	.half	60
	.half	0
	.half	0
	.half	64
	.half	20493
	.half	0
	.half	93
	.half	-12242
	.half	0
	.half	97
	.half	0
	.half	0
	.half	132
	.ident	"GCC: (g2ee5e430018) 12.2.0"

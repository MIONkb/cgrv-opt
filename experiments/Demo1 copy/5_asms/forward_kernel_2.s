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
	addi	sp,sp,-176
	mv	a3,a1
	lla	a5,.LANCHOR0
	addi	a4,sp,8
	lla	a2,.LANCHOR0+160
.L2:
	ld	a1,0(a5)
	ld	a7,8(a5)
	ld	a6,16(a5)
	sd	a1,0(a4)
	ld	a1,24(a5)
	sd	a7,8(a4)
	sd	a6,16(a4)
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
	li	a2,3
	ld	a1,16(a0)
	slli	a2,a2,38
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
	li	a1,32768
	addi	a1,a1,50
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,100663296
	addi	a2,a2,5
	ld	a1,0(a3)
	slli	a2,a2,13
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,176
	jr	ra
	.size	cgra_execute, .-cgra_execute
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36029518573600768
	.align	3
.LC2:
	.dword	4504424261189632
	.align	3
.LC3:
	.dword	4504424261124096
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	0
	.half	3072
	.half	8
	.half	64
	.half	-32672
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
	.half	-32672
	.half	21
	.half	16384
	.half	-27904
	.half	22
	.half	0
	.half	0
	.half	23
	.half	-32768
	.half	3073
	.half	24
	.half	-1472
	.half	-32665
	.half	25
	.half	20462
	.half	256
	.half	26
	.half	0
	.half	0
	.half	27
	.half	0
	.half	0
	.half	48
	.half	512
	.half	0
	.half	52
	.half	16
	.half	0
	.half	56
	.half	0
	.half	0
	.half	64
	.half	2158
	.half	1
	.half	89
	.half	8
	.half	0
	.half	128
	.half	0
	.half	3
	.half	132
	.half	3072
	.half	1
	.half	136
	.half	24845
	.half	0
	.half	173
	.half	3
	.half	0
	.half	212
	.half	0
	.half	32
	.half	284
	.half	0
	.half	0
	.half	356
	.half	8192
	.half	3072
	.half	392
	.half	-128
	.half	-32665
	.half	393
	.half	16384
	.half	256
	.half	394
	.half	0
	.half	0
	.half	395
	.ident	"GCC: (g2ee5e430018) 12.2.0"

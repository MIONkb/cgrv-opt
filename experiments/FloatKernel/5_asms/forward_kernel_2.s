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
	addi	sp,sp,-320
	mv	t2,a1
	mv	t0,a2
	lla	t1,.LANCHOR0
	mv	t3,sp
	lla	t4,.LANCHOR0+288
.L2:
	ld	a2,0(t1)
	ld	t5,8(t1)
	ld	a1,16(t1)
	sd	a2,0(t3)
	ld	a2,24(t1)
	sd	t5,8(t3)
	sd	a1,16(t3)
	sd	a2,24(t3)
	addi	t1,t1,32
	addi	t3,t3,32
	bne	t1,t4,.L2
	ld	t4,0(t1)
	ld	t6,8(t1)
	ld	t5,16(t1)
	sd	t4,0(t3)
	lw	t4,24(t1)
	sd	t6,8(t3)
	lhu	t1,28(t1)
	sd	t5,16(t3)
	sw	t4,24(t3)
	sh	t1,28(t3)
	mv	a1,sp
	ld	a2,.LC1
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	t1,2621440
	addi	a2,t1,1
	mv	a1,a0
	slli	a2,a2,16
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,1073770496
	mv	a1,t2
	slli	a2,a2,22
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC2
	mv	a1,t0
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,14680064
	addi	a2,a2,3
	mv	a1,a3
	slli	a2,a2,13
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC3
	mv	a1,a4
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC4
	mv	a1,a5
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,8388608
	addi	a2,a2,5
	mv	a1,a6
	slli	a2,a2,13
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,53
	li	a1,0
	slli	a2,a2,32
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,4096
	addi	a1,a1,-1921
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,10485760
	addi	a2,a2,3
	mv	a1,a7
	slli	a2,a2,14
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,320
	jr	ra
	.size	forward_kernel_2, .-forward_kernel_2
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36030162818695168
	.align	3
.LC2:
	.dword	4503719886471168
	.align	3
.LC3:
	.dword	4503668346855424
	.align	3
.LC4:
	.dword	4503668346880000
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	6146
	.half	4096
	.half	4
	.half	192
	.half	24
	.half	5
	.half	0
	.half	256
	.half	6
	.half	0
	.half	0
	.half	7
	.half	4097
	.half	4096
	.half	8
	.half	192
	.half	24
	.half	9
	.half	0
	.half	256
	.half	10
	.half	0
	.half	0
	.half	11
	.half	0
	.half	4096
	.half	12
	.half	192
	.half	24
	.half	13
	.half	0
	.half	256
	.half	14
	.half	0
	.half	0
	.half	15
	.half	10240
	.half	4096
	.half	16
	.half	-192
	.half	31
	.half	17
	.half	0
	.half	256
	.half	18
	.half	0
	.half	0
	.half	19
	.half	8195
	.half	4096
	.half	20
	.half	-192
	.half	31
	.half	21
	.half	0
	.half	256
	.half	22
	.half	0
	.half	0
	.half	23
	.half	12288
	.half	4096
	.half	24
	.half	0
	.half	24
	.half	25
	.half	0
	.half	-27904
	.half	26
	.half	128
	.half	0
	.half	27
	.half	10246
	.half	4096
	.half	28
	.half	-192
	.half	31
	.half	29
	.half	0
	.half	256
	.half	30
	.half	0
	.half	0
	.half	31
	.half	0
	.half	0
	.half	44
	.half	0
	.half	16
	.half	48
	.half	512
	.half	16
	.half	52
	.half	0
	.half	0
	.half	56
	.half	-32768
	.half	0
	.half	60
	.half	1
	.half	0
	.half	64
	.half	-30707
	.half	0
	.half	89
	.half	-26099
	.half	0
	.half	93
	.half	-9970
	.half	0
	.half	97
	.half	0
	.half	192
	.half	116
	.half	768
	.half	128
	.half	120
	.half	-32768
	.half	128
	.half	124
	.half	32
	.half	0
	.half	128
	.half	16
	.half	0
	.half	132
	.half	-30675
	.half	0
	.half	157
	.half	23054
	.half	0
	.half	165
	.half	0
	.half	0
	.half	196
	.half	16
	.half	0
	.half	200
	.half	22606
	.half	0
	.half	233
	.half	48
	.half	0
	.half	268
	.half	0
	.half	0
	.half	340
	.half	8192
	.half	4096
	.half	376
	.half	0
	.half	24
	.half	377
	.half	0
	.half	256
	.half	378
	.half	0
	.half	0
	.half	379
	.ident	"GCC: (g2ee5e430018) 12.2.0"

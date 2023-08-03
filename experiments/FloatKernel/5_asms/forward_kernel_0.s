	.file	"forward_kernel_0.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	forward_kernel_0
	.type	forward_kernel_0, @function
forward_kernel_0:
	lla	a5,.LANCHOR0
	ld	a2,0(a5)
	ld	a3,8(a5)
	addi	sp,sp,-80
	ld	a4,16(a5)
	sd	a2,8(sp)
	ld	a2,24(a5)
	sd	a3,16(sp)
	ld	a3,32(a5)
	sd	a4,24(sp)
	ld	a4,40(a5)
	sd	a2,32(sp)
	ld	a2,48(a5)
	sd	a3,40(sp)
	ld	a3,56(a5)
	sd	a4,48(sp)
	lhu	a4,64(a5)
	sd	a2,56(sp)
	sd	a3,64(sp)
	mv	a5,a1
	sh	a4,72(sp)
	addi	a1,sp,8
	ld	a2,.LC1
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,4718592
	addi	a2,a2,3
	mv	a1,a0
	slli	a2,a2,15
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,11
	li	a1,0
	slli	a2,a2,32
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,36864
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,18874368
	addi	a2,a2,13
	mv	a1,a5
	slli	a2,a2,13
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,80
	jr	ra
	.size	forward_kernel_0, .-forward_kernel_0
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36029080486936576
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	12288
	.half	0
	.half	348
	.half	0
	.half	3
	.half	352
	.half	0
	.half	1
	.half	356
	.half	26624
	.half	3072
	.half	380
	.half	-320
	.half	31
	.half	381
	.half	0
	.half	-30464
	.half	382
	.half	128
	.half	0
	.half	383
	.half	8192
	.half	3072
	.half	392
	.half	64
	.half	24
	.half	393
	.half	0
	.half	256
	.half	394
	.half	0
	.half	0
	.half	395
	.ident	"GCC: (g2ee5e430018) 12.2.0"

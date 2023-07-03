	.file	"forward_kernel_3.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	forward_kernel_3
	.type	forward_kernel_3, @function
forward_kernel_3:
	lla	a5,.LANCHOR0
	ld	a3,0(a5)
	ld	a4,8(a5)
	addi	sp,sp,-64
	ld	a2,16(a5)
	sd	a3,0(sp)
	ld	a3,24(a5)
	sd	a4,8(sp)
	ld	a4,32(a5)
	sd	a2,16(sp)
	ld	a2,40(a5)
	sd	a3,24(sp)
	ld	a3,48(a5)
	sd	a4,32(sp)
	lw	a4,56(a5)
	sd	a2,40(sp)
	sd	a3,48(sp)
	mv	a5,a1
	sw	a4,56(sp)
	mv	a1,sp
	ld	a2,.LC1
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,9437184
	addi	a2,a2,1
	mv	a1,a0
	slli	a2,a2,16
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,5
	li	a1,0
	slli	a2,a2,33
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,4096
	addi	a1,a1,-1536
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,75497472
	addi	a2,a2,9
	mv	a1,a5
	slli	a2,a2,13
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
# 82 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (10 << (7)) | (0 << (7+5)) | (0 << (7+5+1)) | (1 << (7+5+2)) | (0 << (7+5+3)) | (0 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 0) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,64
	jr	ra
	.size	forward_kernel_3, .-forward_kernel_3
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36029054717132800
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	12288
	.half	0
	.half	336
	.half	0
	.half	1
	.half	340
	.half	26624
	.half	12288
	.half	368
	.half	-2048
	.half	31
	.half	369
	.half	0
	.half	-30464
	.half	370
	.half	128
	.half	0
	.half	371
	.half	8192
	.half	12288
	.half	376
	.half	64
	.half	24
	.half	377
	.half	0
	.half	256
	.half	378
	.half	0
	.half	0
	.half	379
	.ident	"GCC: (g2ee5e430018) 12.2.0"

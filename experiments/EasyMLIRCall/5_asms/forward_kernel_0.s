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
	ld	a6,0(a5)
	ld	a4,8(a5)
	addi	sp,sp,-96
	ld	a3,16(a5)
	sd	a6,0(sp)
	ld	a6,24(a5)
	sd	a4,8(sp)
	ld	a4,32(a5)
	sd	a3,16(sp)
	ld	a3,40(a5)
	sd	a6,24(sp)
	ld	a6,48(a5)
	sd	a4,32(sp)
	ld	a4,56(a5)
	sd	a3,40(sp)
	ld	a3,64(a5)
	sd	a6,48(sp)
	ld	a6,72(a5)
	sd	a4,56(sp)
	ld	a4,80(a5)
	sd	a3,64(sp)
	lhu	a3,88(a5)
	sd	a6,72(sp)
	sd	a4,80(sp)
	mv	a5,a1
	mv	a4,a2
	sh	a3,88(sp)
	mv	a1,sp
	ld	a2,.LC1
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,5767168
	addi	a2,a2,3
	mv	a1,a0
	slli	a2,a2,15
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,23068672
	addi	a2,a2,13
	mv	a1,a5
	slli	a2,a2,13
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,15
	li	a1,0
	slli	a2,a2,32
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,57344
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a5,11534336
	addi	a2,a5,7
	mv	a1,a4
	slli	a2,a2,14
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,96
	jr	ra
	.size	forward_kernel_0, .-forward_kernel_0
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36029183566151680
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	-8178
	.half	0
	.half	317
	.half	64
	.half	0
	.half	352
	.half	1
	.half	0
	.half	356
	.half	10240
	.half	11264
	.half	384
	.half	0
	.half	0
	.half	385
	.half	0
	.half	256
	.half	386
	.half	0
	.half	0
	.half	387
	.half	8192
	.half	11264
	.half	388
	.half	0
	.half	0
	.half	389
	.half	0
	.half	256
	.half	390
	.half	0
	.half	0
	.half	391
	.half	12288
	.half	11264
	.half	392
	.half	0
	.half	0
	.half	393
	.half	0
	.half	-30464
	.half	394
	.half	0
	.half	0
	.half	395
	.ident	"GCC: (g2ee5e430018) 12.2.0"

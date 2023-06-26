	.file	"forward_kernel_5.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	cgra_execute
	.type	cgra_execute, @function
cgra_execute:
	addi	sp,sp,-160
	mv	a3,a1
	lla	a5,.LANCHOR0
	mv	a4,sp
	lla	a2,.LANCHOR0+144
.L2:
	ld	a7,0(a5)
	ld	a6,8(a5)
	ld	a1,16(a5)
	sd	a7,0(a4)
	ld	a7,24(a5)
	sd	a6,8(a4)
	ld	a6,32(a5)
	sd	a1,16(a4)
	ld	a1,40(a5)
	sd	a7,24(a4)
	sd	a6,32(a4)
	sd	a1,40(a4)
	addi	a5,a5,48
	addi	a4,a4,48
	bne	a5,a2,.L2
	ld	a2,0(a5)
	lw	a5,8(a5)
	mv	a1,sp
	sd	a2,0(a4)
	sw	a5,8(a4)
	ld	a2,.LC1
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
	li	a2,67121152
	ld	a1,8(a0)
	slli	a2,a2,26
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,12582912
	addi	a2,a2,1
	ld	a1,16(a0)
	slli	a2,a2,16
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,13
	li	a1,0
	slli	a2,a2,33
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,8192
	addi	a1,a1,-1980
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,6291456
	addi	a2,a2,3
	ld	a1,0(a3)
	slli	a2,a2,15
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,160
	jr	ra
	.size	cgra_execute, .-cgra_execute
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36029467033993216
	.align	3
.LC2:
	.dword	4504424261124096
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	24576
	.half	12288
	.half	12
	.half	-2048
	.half	-32737
	.half	13
	.half	20462
	.half	256
	.half	14
	.half	0
	.half	0
	.half	15
	.half	8192
	.half	12288
	.half	28
	.half	-704
	.half	-32737
	.half	29
	.half	16384
	.half	256
	.half	30
	.half	0
	.half	0
	.half	31
	.half	0
	.half	0
	.half	52
	.half	2048
	.half	0
	.half	56
	.half	8192
	.half	0
	.half	60
	.half	0
	.half	0
	.half	64
	.half	20525
	.half	0
	.half	93
	.half	0
	.half	512
	.half	128
	.half	3072
	.half	0
	.half	200
	.half	22638
	.half	0
	.half	237
	.half	48
	.half	512
	.half	272
	.half	768
	.half	4
	.half	344
	.half	0
	.half	12288
	.half	376
	.half	64
	.half	-32744
	.half	377
	.half	16384
	.half	256
	.half	378
	.half	0
	.half	0
	.half	379
	.half	0
	.half	12288
	.half	380
	.half	64
	.half	-32744
	.half	381
	.half	16384
	.half	-27392
	.half	382
	.half	0
	.half	0
	.half	383
	.ident	"GCC: (g2ee5e430018) 12.2.0"

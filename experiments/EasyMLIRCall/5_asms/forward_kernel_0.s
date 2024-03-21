	.file	"forward_kernel_0.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"In kernel func:\n"
	.align	3
.LC2:
	.string	"din_0:\n"
	.align	3
.LC4:
	.string	"a[%d]:%d\n"
	.align	3
.LC5:
	.string	"din_1:\n"
	.align	3
.LC6:
	.string	"b[%d]:%d\n"
	.align	3
.LC8:
	.string	"before fence\n"
	.align	3
.LC9:
	.string	"after fence\n"
	.align	3
.LC10:
	.string	"output:\n"
	.align	3
.LC11:
	.string	"f[%d]:%d\n"
	.text
	.align	1
	.globl	forward_kernel_0
	.type	forward_kernel_0, @function
forward_kernel_0:
	lla	a5,.LANCHOR0
	ld	a3,0(a5)
	ld	a4,8(a5)
	addi	sp,sp,-176
	ld	a6,16(a5)
	sd	a3,0(sp)
	ld	a3,24(a5)
	sd	a4,8(sp)
	ld	a4,32(a5)
	sd	a6,16(sp)
	ld	a6,40(a5)
	sd	a3,24(sp)
	ld	a3,48(a5)
	sd	a4,32(sp)
	ld	a4,56(a5)
	sd	a6,40(sp)
	ld	a6,64(a5)
	sd	a3,48(sp)
	ld	a3,72(a5)
	sd	a4,56(sp)
	ld	a4,80(a5)
	sd	a6,64(sp)
	lhu	a5,88(a5)
	sd	a3,72(sp)
	sd	ra,168(sp)
	sd	a4,80(sp)
	sd	s0,160(sp)
	sd	s1,152(sp)
	sd	s2,144(sp)
	sd	s3,136(sp)
	sd	s4,128(sp)
	sd	s5,120(sp)
	sd	s6,112(sp)
	fsd	fs0,104(sp)
	mv	s6,a0
	lla	a0,.LC1
	sh	a5,88(sp)
	mv	s5,a1
	mv	s1,a2
	call	printf
	lla	a0,.LC2
	call	printf
	mv	s2,s6
	li	s0,0
	flw	fs0,.LC3,a5
	lla	s4,.LC4
	li	s3,15
.L2:
	flw	fa5,0(s2)
	mv	a1,s0
	mv	a0,s4
	fmul.s	fa5,fa5,fs0
	addiw	s0,s0,1
	addi	s2,s2,4
	fcvt.w.s a2,fa5,rtz
	sext.w	a2,a2
	call	printf
	bne	s0,s3,.L2
	lla	a0,.LC5
	call	printf
	mv	s2,s5
	li	s0,0
	lla	s4,.LC6
	li	s3,15
.L3:
	flw	fa5,0(s2)
	mv	a1,s0
	mv	a0,s4
	fmul.s	fa5,fa5,fs0
	addiw	s0,s0,1
	addi	s2,s2,4
	fcvt.w.s a2,fa5,rtz
	sext.w	a2,a2
	call	printf
	bne	s0,s3,.L3
	mv	a1,sp
	ld	a2,.LC7
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,3932160
	addi	a2,a2,1
	slli	a2,a2,16
	mv	a1,s6
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,7864320
	addi	a2,a2,3
	slli	a2,a2,15
	mv	a1,s5
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,0
	slli	a2,s0,32
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,16384
	addi	a1,a1,-2048
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,31457280
	addi	a2,a2,13
	slli	a2,a2,13
	mv	a1,s1
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	lla	a0,.LC8
	call	printf
 #APP
# 82 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (10 << (7)) | (0 << (7+5)) | (0 << (7+5+1)) | (1 << (7+5+2)) | (0 << (7+5+3)) | (0 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 0) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	lla	a0,.LC9
	call	printf
	lla	a0,.LC10
	call	printf
	li	s0,0
	lla	s3,.LC11
	li	s2,15
.L4:
	flw	fa5,0(s1)
	mv	a1,s0
	mv	a0,s3
	fmul.s	fa5,fa5,fs0
	addiw	s0,s0,1
	addi	s1,s1,4
	fcvt.w.s a2,fa5,rtz
	sext.w	a2,a2
	call	printf
	bne	s0,s2,.L4
	ld	ra,168(sp)
	ld	s0,160(sp)
	ld	s1,152(sp)
	ld	s2,144(sp)
	ld	s3,136(sp)
	ld	s4,128(sp)
	ld	s5,120(sp)
	ld	s6,112(sp)
	fld	fs0,104(sp)
	addi	sp,sp,176
	jr	ra
	.size	forward_kernel_0, .-forward_kernel_0
	.section	.rodata.str1.8
	.align	3
.LC12:
	.string	"In kernel func 1:\n"
	.text
	.align	1
	.globl	forward_kernel_1
	.type	forward_kernel_1, @function
forward_kernel_1:
	lla	a5,.LANCHOR0
	ld	a3,0(a5)
	ld	a4,8(a5)
	addi	sp,sp,-176
	ld	a6,16(a5)
	sd	a3,0(sp)
	ld	a3,24(a5)
	sd	a4,8(sp)
	ld	a4,32(a5)
	sd	a6,16(sp)
	ld	a6,40(a5)
	sd	a3,24(sp)
	ld	a3,48(a5)
	sd	a4,32(sp)
	ld	a4,56(a5)
	sd	a6,40(sp)
	ld	a6,64(a5)
	sd	a3,48(sp)
	ld	a3,72(a5)
	sd	a4,56(sp)
	ld	a4,80(a5)
	sd	a6,64(sp)
	lhu	a5,88(a5)
	sd	a3,72(sp)
	sd	ra,168(sp)
	sd	a4,80(sp)
	sd	s0,160(sp)
	sd	s1,152(sp)
	sd	s2,144(sp)
	sd	s3,136(sp)
	sd	s4,128(sp)
	sd	s5,120(sp)
	sd	s6,112(sp)
	fsd	fs0,104(sp)
	mv	s6,a0
	lla	a0,.LC12
	sh	a5,88(sp)
	mv	s5,a1
	mv	s1,a2
	call	printf
	lla	a0,.LC2
	call	printf
	mv	s2,s6
	li	s0,0
	flw	fs0,.LC3,a5
	lla	s4,.LC4
	li	s3,15
.L11:
	flw	fa5,0(s2)
	mv	a1,s0
	mv	a0,s4
	fmul.s	fa5,fa5,fs0
	addiw	s0,s0,1
	addi	s2,s2,4
	fcvt.w.s a2,fa5,rtz
	sext.w	a2,a2
	call	printf
	bne	s0,s3,.L11
	lla	a0,.LC5
	call	printf
	mv	s2,s5
	li	s0,0
	lla	s4,.LC6
	li	s3,15
.L12:
	flw	fa5,0(s2)
	mv	a1,s0
	mv	a0,s4
	fmul.s	fa5,fa5,fs0
	addiw	s0,s0,1
	addi	s2,s2,4
	fcvt.w.s a2,fa5,rtz
	sext.w	a2,a2
	call	printf
	bne	s0,s3,.L12
	mv	a1,sp
	ld	a2,.LC13
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC14
	mv	a1,s6
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC15
	mv	a1,s5
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,16777216
	addi	a2,a2,15
	slli	a2,a2,32
	li	a1,0
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,16384
	li	a2,1
	addi	a1,a1,-2048
	slli	a2,a2,56
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC16
	mv	a1,s1
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	lla	a0,.LC8
	call	printf
 #APP
# 82 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (10 << (7)) | (0 << (7+5)) | (0 << (7+5+1)) | (1 << (7+5+2)) | (0 << (7+5+3)) | (0 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 0) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	lla	a0,.LC9
	call	printf
	lla	a0,.LC10
	call	printf
	li	s0,0
	lla	s3,.LC11
	li	s2,15
.L13:
	flw	fa5,0(s1)
	mv	a1,s0
	mv	a0,s3
	fmul.s	fa5,fa5,fs0
	addiw	s0,s0,1
	addi	s1,s1,4
	fcvt.w.s a2,fa5,rtz
	sext.w	a2,a2
	call	printf
	bne	s0,s2,.L13
	ld	ra,168(sp)
	ld	s0,160(sp)
	ld	s1,152(sp)
	ld	s2,144(sp)
	ld	s3,136(sp)
	ld	s4,128(sp)
	ld	s5,120(sp)
	ld	s6,112(sp)
	fld	fs0,104(sp)
	addi	sp,sp,176
	jr	ra
	.size	forward_kernel_1, .-forward_kernel_1
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC3:
	.word	1176256512
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC7:
	.dword	36029183566151680
	.align	3
.LC13:
	.dword	108086777604079616
	.align	3
.LC14:
	.dword	72057851736031232
	.align	3
.LC15:
	.dword	72057851736064000
	.align	3
.LC16:
	.dword	72057851736072192
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	-16370
	.half	8
	.half	617
	.half	272
	.half	0
	.half	688
	.half	0
	.half	0
	.half	696
	.half	8192
	.half	5120
	.half	752
	.half	64
	.half	24
	.half	753
	.half	0
	.half	256
	.half	754
	.half	0
	.half	0
	.half	755
	.half	10240
	.half	5120
	.half	760
	.half	64
	.half	24
	.half	761
	.half	0
	.half	-30464
	.half	762
	.half	0
	.half	0
	.half	763
	.half	8192
	.half	5120
	.half	768
	.half	64
	.half	24
	.half	769
	.half	0
	.half	256
	.half	770
	.half	0
	.half	0
	.half	771
	.ident	"GCC: (g2ee5e430018) 12.2.0"

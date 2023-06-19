	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"IT is stupid!\n"
	.align	3
.LC4:
	.string	"Initialization finished!\n"
	.align	3
.LC5:
	.string	"It takes %d cycles for CPU to finish the task.\n"
	.align	3
.LC6:
	.string	"Done!\n"
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	lla	a0,.LC0
	sd	ra,56(sp)
	sd	s0,48(sp)
	call	printf
	li	a2,1073741824
	li	a3,1086324736
	slli	a4,a2,32
	add	a4,a4,a2
	slli	a5,a3,32
	add	a5,a5,a3
	sd	a4,8(sp)
	li	a3,127
	ld	a4,.LC1
	slli	a3,a3,55
	sd	a4,16(sp)
	sd	a5,32(sp)
	ld	a4,.LC2
	ld	a5,.LC3
	lla	a0,.LC4
	sd	a3,0(sp)
	sd	a4,24(sp)
	sd	a5,40(sp)
	call	printf
 #APP
# 23 "./main.c" 1
	csrr s0, cycle
# 0 "" 2
 #NO_APP
	mv	a0,sp
	call	forward
 #APP
# 25 "./main.c" 1
	csrr a1, cycle
# 0 "" 2
 #NO_APP
	lla	a0,.LC5
	sub	a1,a1,s0
	call	printf
	lla	a0,.LC6
	call	printf
	ld	ra,56(sp)
	ld	s0,48(sp)
	li	a0,0
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	4647714816524288000
	.align	3
.LC2:
	.dword	4656722015783223296
	.align	3
.LC3:
	.dword	4683743613553737728
	.ident	"GCC: (g2ee5e430018) 12.2.0"

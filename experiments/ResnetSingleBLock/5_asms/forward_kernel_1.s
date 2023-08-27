	.file	"forward_kernel_1.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	forward_kernel_1
	.type	forward_kernel_1, @function
forward_kernel_1:
	addi	sp,sp,-528
	mv	t4,a2
	mv	t5,a1
	lla	t1,.LANCHOR0
	mv	t3,sp
	lla	a2,.LANCHOR0+528
.L2:
	ld	t0,0(t1)
	ld	t6,8(t1)
	ld	a1,16(t1)
	sd	t0,0(t3)
	ld	t0,24(t1)
	sd	t6,8(t3)
	ld	t6,32(t1)
	sd	a1,16(t3)
	ld	a1,40(t1)
	sd	t0,24(t3)
	sd	t6,32(t3)
	sd	a1,40(t3)
	addi	t1,t1,48
	addi	t3,t3,48
	bne	t1,a2,.L2
	mv	a1,sp
	ld	a2,.LC1
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,98304
	mv	a1,a0
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,0
	mv	a1,t5
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,32768
	mv	a1,t4
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,40960
	mv	a1,a3
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC2
	mv	a1,a4
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,469499904
	addi	a2,a2,1
	mv	a1,a5
	slli	a2,a2,16
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,11
	li	a1,0
	slli	a2,a2,35
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,32768
	addi	a1,a1,1524
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC3
	mv	a1,a6
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC4
	mv	a1,a7
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,528
	jr	ra
	.size	forward_kernel_1, .-forward_kernel_1
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36031064761827328
	.align	3
.LC2:
	.dword	4534368773128192
	.align	3
.LC3:
	.dword	30769145765888
	.align	3
.LC4:
	.dword	30786325651456
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	0
	.half	-8192
	.half	24
	.half	0
	.half	0
	.half	25
	.half	0
	.half	6400
	.half	26
	.half	0
	.half	0
	.half	27
	.half	0
	.half	-8192
	.half	40
	.half	0
	.half	0
	.half	41
	.half	0
	.half	1792
	.half	42
	.half	0
	.half	0
	.half	43
	.half	2048
	.half	-8192
	.half	48
	.half	0
	.half	0
	.half	49
	.half	0
	.half	256
	.half	50
	.half	0
	.half	0
	.half	51
	.half	20480
	.half	-8192
	.half	56
	.half	128
	.half	128
	.half	57
	.half	0
	.half	1792
	.half	58
	.half	0
	.half	0
	.half	59
	.half	22528
	.half	-8192
	.half	64
	.half	128
	.half	128
	.half	65
	.half	0
	.half	-22272
	.half	66
	.half	0
	.half	0
	.half	67
	.half	0
	.half	48
	.half	96
	.half	0
	.half	14
	.half	104
	.half	0
	.half	32
	.half	112
	.half	4608
	.half	48
	.half	120
	.half	1024
	.half	0
	.half	128
	.half	48
	.half	0
	.half	136
	.half	1
	.half	0
	.half	184
	.half	-32762
	.half	0
	.half	185
	.half	-14932
	.half	14119
	.half	192
	.half	14
	.half	2
	.half	193
	.half	-15793
	.half	2
	.half	201
	.half	3
	.half	0
	.half	241
	.half	0
	.half	0
	.half	248
	.half	3
	.half	0
	.half	249
	.half	-16384
	.half	0
	.half	256
	.half	16384
	.half	24576
	.half	264
	.half	128
	.half	0
	.half	272
	.half	1
	.half	0
	.half	273
	.half	0
	.half	1024
	.half	280
	.half	23007
	.half	24375
	.half	320
	.half	2
	.half	4
	.half	321
	.half	-16339
	.half	2
	.half	329
	.half	0
	.half	16128
	.half	336
	.half	13
	.half	2
	.half	337
	.half	-16370
	.half	8
	.half	345
	.half	-16384
	.half	0
	.half	384
	.half	8192
	.half	0
	.half	392
	.half	3
	.half	0
	.half	393
	.half	16384
	.half	0
	.half	400
	.half	16384
	.half	8192
	.half	408
	.half	-12096
	.half	0
	.half	416
	.half	12
	.half	0
	.half	424
	.half	-16049
	.half	2
	.half	457
	.half	16526
	.half	8
	.half	465
	.half	781
	.half	3
	.half	473
	.half	17165
	.half	2
	.half	481
	.half	17421
	.half	2
	.half	489
	.half	0
	.half	-32768
	.half	520
	.half	128
	.half	0
	.half	528
	.half	0
	.half	24576
	.half	536
	.half	1
	.half	0
	.half	537
	.half	8
	.half	16384
	.half	544
	.half	16384
	.half	16768
	.half	552
	.half	0
	.half	2176
	.half	560
	.half	0
	.half	0
	.half	568
	.half	-31731
	.half	2
	.half	609
	.half	0
	.half	16320
	.half	624
	.half	15
	.half	2
	.half	625
	.half	141
	.half	7
	.half	633
	.half	17421
	.half	8
	.half	641
	.half	0
	.half	4
	.half	664
	.half	8192
	.half	0
	.half	680
	.half	0
	.half	0
	.half	688
	.half	0
	.half	32
	.half	696
	.half	64
	.half	0
	.half	704
	.half	0
	.half	0
	.half	712
	.half	16385
	.half	-8192
	.half	728
	.half	128
	.half	128
	.half	729
	.half	0
	.half	1792
	.half	730
	.half	0
	.half	0
	.half	731
	.half	18433
	.half	-8192
	.half	744
	.half	128
	.half	128
	.half	745
	.half	0
	.half	-21760
	.half	746
	.half	128
	.half	0
	.half	747
	.half	0
	.half	-8192
	.half	784
	.half	0
	.half	0
	.half	785
	.half	0
	.half	5376
	.half	786
	.half	0
	.half	0
	.half	787
	.ident	"GCC: (g2ee5e430018) 12.2.0"

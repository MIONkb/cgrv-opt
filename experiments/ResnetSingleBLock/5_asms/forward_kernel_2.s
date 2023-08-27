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
	addi	sp,sp,-624
	mv	t4,a2
	mv	t5,a1
	lla	t1,.LANCHOR0
	mv	t3,sp
	lla	a2,.LANCHOR0+608
.L2:
	ld	a1,0(t1)
	ld	t0,8(t1)
	ld	t6,16(t1)
	sd	a1,0(t3)
	ld	a1,24(t1)
	sd	t0,8(t3)
	sd	t6,16(t3)
	sd	a1,24(t3)
	addi	t1,t1,32
	addi	t3,t3,32
	bne	t1,a2,.L2
	ld	t6,0(t1)
	lhu	a2,8(t1)
	mv	a1,sp
	sd	t6,0(t3)
	sh	a2,8(t3)
	ld	a2,.LC1
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,540528640
	mv	a1,a0
	slli	a2,a2,23
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC2
	mv	a1,t5
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC3
	mv	a1,t4
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC4
	mv	a1,a3
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC5
	mv	a1,a4
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC6
	mv	a1,a5
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC7
	mv	a1,a6
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,103
	li	a1,0
	slli	a2,a2,32
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,65536
	addi	a1,a1,-261
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC8
	mv	a1,a7
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC9
	ld	a1,624(sp)
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC10
	ld	a1,632(sp)
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,468451328
	addi	a2,a2,1
	ld	a1,640(sp)
	slli	a2,a2,16
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC11
	ld	a1,648(sp)
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,1873805312
	addi	a2,a2,5
	ld	a1,656(sp)
	slli	a2,a2,14
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,1872756736
	addi	a2,a2,1
	ld	a1,664(sp)
	slli	a2,a2,14
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,624
	jr	ra
	.size	forward_kernel_2, .-forward_kernel_2
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36031451308883968
	.align	3
.LC2:
	.dword	4534282873765888
	.align	3
.LC3:
	.dword	4534282873831424
	.align	3
.LC4:
	.dword	4534282873847808
	.align	3
.LC5:
	.dword	4534282873782272
	.align	3
.LC6:
	.dword	4534282873806848
	.align	3
.LC7:
	.dword	30683246485504
	.align	3
.LC8:
	.dword	30683246370816
	.align	3
.LC9:
	.dword	30700426272768
	.align	3
.LC10:
	.dword	30683246469120
	.align	3
.LC11:
	.dword	30683246419968
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	-6144
	.half	16384
	.half	8
	.half	448
	.half	128
	.half	9
	.half	0
	.half	-29952
	.half	10
	.half	128
	.half	0
	.half	11
	.half	-8192
	.half	16384
	.half	16
	.half	448
	.half	128
	.half	17
	.half	0
	.half	256
	.half	18
	.half	0
	.half	0
	.half	19
	.half	-4096
	.half	16384
	.half	32
	.half	448
	.half	128
	.half	33
	.half	0
	.half	-27392
	.half	34
	.half	128
	.half	0
	.half	35
	.half	-2048
	.half	16384
	.half	40
	.half	448
	.half	128
	.half	41
	.half	0
	.half	-28416
	.half	42
	.half	128
	.half	0
	.half	43
	.half	-6143
	.half	16384
	.half	48
	.half	448
	.half	128
	.half	49
	.half	0
	.half	-29952
	.half	50
	.half	128
	.half	0
	.half	51
	.half	-8191
	.half	16384
	.half	56
	.half	448
	.half	128
	.half	57
	.half	0
	.half	256
	.half	58
	.half	0
	.half	0
	.half	59
	.half	-4092
	.half	16384
	.half	64
	.half	448
	.half	128
	.half	65
	.half	0
	.half	256
	.half	66
	.half	0
	.half	0
	.half	67
	.half	512
	.half	0
	.half	88
	.half	2
	.half	0
	.half	112
	.half	2
	.half	3
	.half	120
	.half	512
	.half	51
	.half	128
	.half	0
	.half	0
	.half	136
	.half	0
	.half	0
	.half	152
	.half	-32748
	.half	0
	.half	153
	.half	0
	.half	0
	.half	160
	.half	268
	.half	50
	.half	161
	.half	0
	.half	0
	.half	192
	.half	-32748
	.half	0
	.half	193
	.half	0
	.half	0
	.half	200
	.half	268
	.half	50
	.half	201
	.half	0
	.half	0
	.half	208
	.half	-16364
	.half	0
	.half	209
	.half	0
	.half	0
	.half	232
	.half	0
	.half	3072
	.half	264
	.half	0
	.half	28160
	.half	272
	.half	-32640
	.half	128
	.half	280
	.half	0
	.half	0
	.half	352
	.half	268
	.half	18
	.half	353
	.half	0
	.half	-32768
	.half	408
	.half	0
	.half	1
	.half	416
	.half	0
	.half	0
	.half	488
	.half	524
	.half	22
	.half	489
	.half	0
	.half	-32768
	.half	544
	.half	4096
	.half	16384
	.half	552
	.half	256
	.half	0
	.half	560
	.half	0
	.half	0
	.half	584
	.half	20
	.half	1
	.half	585
	.half	0
	.half	0
	.half	592
	.half	268
	.half	56
	.half	593
	.half	0
	.half	0
	.half	608
	.half	20
	.half	1
	.half	609
	.half	0
	.half	0
	.half	616
	.half	268
	.half	56
	.half	617
	.half	0
	.half	0
	.half	624
	.half	16404
	.half	0
	.half	625
	.half	0
	.half	0
	.half	632
	.half	20
	.half	1
	.half	633
	.half	0
	.half	0
	.half	640
	.half	268
	.half	56
	.half	641
	.half	0
	.half	0
	.half	664
	.half	2
	.half	0
	.half	672
	.half	0
	.half	12
	.half	688
	.half	2
	.half	1
	.half	696
	.half	0
	.half	0
	.half	712
	.half	-6139
	.half	16384
	.half	736
	.half	448
	.half	128
	.half	737
	.half	0
	.half	256
	.half	738
	.half	0
	.half	0
	.half	739
	.half	-4095
	.half	16384
	.half	744
	.half	448
	.half	128
	.half	745
	.half	0
	.half	-29952
	.half	746
	.half	0
	.half	0
	.half	747
	.half	-8191
	.half	16384
	.half	752
	.half	448
	.half	128
	.half	753
	.half	0
	.half	-29952
	.half	754
	.half	128
	.half	0
	.half	755
	.half	-4093
	.half	16384
	.half	760
	.half	448
	.half	128
	.half	761
	.half	0
	.half	256
	.half	762
	.half	0
	.half	0
	.half	763
	.half	-2042
	.half	16384
	.half	768
	.half	448
	.half	128
	.half	769
	.half	0
	.half	256
	.half	770
	.half	0
	.half	0
	.half	771
	.half	-6144
	.half	16384
	.half	776
	.half	448
	.half	128
	.half	777
	.half	0
	.half	-29952
	.half	778
	.half	128
	.half	0
	.half	779
	.half	-8190
	.half	16384
	.half	784
	.half	448
	.half	128
	.half	785
	.half	0
	.half	256
	.half	786
	.half	0
	.half	0
	.half	787
	.ident	"GCC: (g2ee5e430018) 12.2.0"

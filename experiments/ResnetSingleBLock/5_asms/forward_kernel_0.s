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
	addi	sp,sp,-656
	mv	t4,a2
	mv	t5,a1
	lla	t1,.LANCHOR0
	addi	t3,sp,8
	lla	a2,.LANCHOR0+640
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
	lhu	t1,0(t1)
	addi	a1,sp,8
	ld	a2,.LC1
	sh	t1,0(t3)
 #APP
# 26 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,4194304
	addi	a2,a2,3
	mv	a1,a0
	slli	a2,a2,15
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,1512812544
	mv	a1,t5
	slli	a2,a2,22
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC2
	mv	a1,t4
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC3
	mv	a1,a3
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC4
	mv	a1,a4
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC5
	mv	a1,a5
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC6
	mv	a1,a6
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC7
	mv	a1,a7
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC8
	ld	a1,656(sp)
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC9
	ld	a1,664(sp)
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC10
	ld	a1,672(sp)
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC11
	ld	a1,680(sp)
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC12
	ld	a1,688(sp)
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC13
	ld	a1,696(sp)
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,295698432
	addi	a2,a2,3
	ld	a1,704(sp)
	slli	a2,a2,13
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,107
	li	a1,0
	slli	a2,a2,32
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,65536
	addi	a1,a1,-1
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,16777216
	addi	a2,a2,13
	ld	a1,712(sp)
	slli	a2,a2,13
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,656
	jr	ra
	.size	forward_kernel_0, .-forward_kernel_0
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36031554388099072
	.align	3
.LC2:
	.dword	6345195704614912
	.align	3
.LC3:
	.dword	6345195704582144
	.align	3
.LC4:
	.dword	6345195704598528
	.align	3
.LC5:
	.dword	6345195704631296
	.align	3
.LC6:
	.dword	6345195704639488
	.align	3
.LC7:
	.dword	1841596077195264
	.align	3
.LC8:
	.dword	4506021988933632
	.align	3
.LC9:
	.dword	4506021988999168
	.align	3
.LC10:
	.dword	4506021988966400
	.align	3
.LC11:
	.dword	4506021988982784
	.align	3
.LC12:
	.dword	4506021989040128
	.align	3
.LC13:
	.dword	4506021989048320
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	-12282
	.half	7196
	.half	8
	.half	20480
	.half	26
	.half	9
	.half	-29013
	.half	256
	.half	10
	.half	0
	.half	0
	.half	11
	.half	-6144
	.half	7168
	.half	16
	.half	448
	.half	24
	.half	17
	.half	-28742
	.half	256
	.half	18
	.half	0
	.half	0
	.half	19
	.half	-2042
	.half	7168
	.half	24
	.half	448
	.half	24
	.half	25
	.half	-28742
	.half	256
	.half	26
	.half	0
	.half	0
	.half	27
	.half	-16384
	.half	7196
	.half	32
	.half	20480
	.half	26
	.half	33
	.half	-29013
	.half	256
	.half	34
	.half	0
	.half	0
	.half	35
	.half	-16382
	.half	7196
	.half	40
	.half	20480
	.half	26
	.half	41
	.half	-29013
	.half	256
	.half	42
	.half	0
	.half	0
	.half	43
	.half	-12285
	.half	7196
	.half	48
	.half	20480
	.half	26
	.half	49
	.half	-29013
	.half	256
	.half	50
	.half	0
	.half	0
	.half	51
	.half	-6142
	.half	7168
	.half	56
	.half	448
	.half	24
	.half	57
	.half	-28742
	.half	256
	.half	58
	.half	0
	.half	0
	.half	59
	.half	-2045
	.half	7168
	.half	64
	.half	448
	.half	24
	.half	65
	.half	-28742
	.half	256
	.half	66
	.half	0
	.half	0
	.half	67
	.half	0
	.half	0
	.half	88
	.half	0
	.half	0
	.half	96
	.half	0
	.half	0
	.half	104
	.half	16384
	.half	16
	.half	120
	.half	0
	.half	48
	.half	128
	.half	0
	.half	0
	.half	136
	.half	16397
	.half	4
	.half	161
	.half	-32755
	.half	2
	.half	169
	.half	-15858
	.half	4
	.half	185
	.half	16397
	.half	4
	.half	193
	.half	16384
	.half	12
	.half	240
	.half	0
	.half	128
	.half	248
	.half	16576
	.half	4
	.half	256
	.half	8192
	.half	4
	.half	264
	.half	0
	.half	32
	.half	272
	.half	-31986
	.half	8
	.half	305
	.half	16398
	.half	2
	.half	313
	.half	-32498
	.half	8
	.half	321
	.half	-32690
	.half	2
	.half	329
	.half	16397
	.half	4
	.half	337
	.half	8
	.half	0
	.half	384
	.half	0
	.half	512
	.half	392
	.half	12
	.half	1024
	.half	400
	.half	16401
	.half	0
	.half	457
	.half	0
	.half	128
	.half	458
	.half	10840
	.half	256
	.half	459
	.half	0
	.half	0
	.half	460
	.half	16654
	.half	6
	.half	465
	.half	0
	.half	0
	.half	536
	.half	0
	.half	16432
	.half	544
	.half	-32768
	.half	384
	.half	552
	.half	0
	.half	512
	.half	560
	.half	13
	.half	7
	.half	601
	.half	-16339
	.half	4
	.half	609
	.half	-16115
	.half	8
	.half	617
	.half	-16242
	.half	2
	.half	625
	.half	0
	.half	16
	.half	664
	.half	0
	.half	32
	.half	672
	.half	16
	.half	32
	.half	680
	.half	32
	.half	0
	.half	688
	.half	276
	.half	0
	.half	696
	.half	0
	.half	3
	.half	704
	.half	0
	.half	1
	.half	712
	.half	-12284
	.half	7196
	.half	728
	.half	20480
	.half	26
	.half	729
	.half	-29013
	.half	256
	.half	730
	.half	0
	.half	0
	.half	731
	.half	-6143
	.half	7168
	.half	736
	.half	448
	.half	24
	.half	737
	.half	-28742
	.half	256
	.half	738
	.half	0
	.half	0
	.half	739
	.half	-10235
	.half	7196
	.half	744
	.half	20480
	.half	26
	.half	745
	.half	-29013
	.half	256
	.half	746
	.half	0
	.half	0
	.half	747
	.half	-16381
	.half	7196
	.half	752
	.half	20480
	.half	26
	.half	753
	.half	-29013
	.half	256
	.half	754
	.half	0
	.half	0
	.half	755
	.half	0
	.half	7168
	.half	760
	.half	0
	.half	-32744
	.half	761
	.half	-32768
	.half	3328
	.half	762
	.half	0
	.half	0
	.half	763
	.half	2048
	.half	7168
	.half	768
	.half	0
	.half	-32744
	.half	769
	.half	-32768
	.half	-25344
	.half	770
	.half	0
	.half	0
	.half	771
	.half	-2043
	.half	7168
	.half	776
	.half	448
	.half	24
	.half	777
	.half	-28742
	.half	256
	.half	778
	.half	0
	.half	0
	.half	779
	.half	-4092
	.half	7168
	.half	784
	.half	448
	.half	24
	.half	785
	.half	-28742
	.half	256
	.half	786
	.half	0
	.half	0
	.half	787
	.ident	"GCC: (g2ee5e430018) 12.2.0"

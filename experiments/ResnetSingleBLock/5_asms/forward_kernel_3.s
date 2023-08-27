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
	addi	sp,sp,-576
	mv	t4,a2
	mv	t5,a1
	lla	t1,.LANCHOR0
	mv	t3,sp
	lla	a2,.LANCHOR0+560
.L2:
	ld	t6,0(t1)
	ld	a1,8(t1)
	ld	t0,16(t1)
	sd	t6,0(t3)
	ld	t6,24(t1)
	sd	a1,8(t3)
	ld	a1,32(t1)
	sd	t0,16(t3)
	sd	t6,24(t3)
	sd	a1,32(t3)
	addi	t1,t1,40
	addi	t3,t3,40
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
	li	a2,7
	mv	a1,a0
	slli	a2,a2,39
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
	ld	a2,.LC8
	mv	a1,a7
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	ld	a2,.LC9
	ld	a1,576(sp)
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,833617920
	addi	a2,a2,3
	ld	a1,584(sp)
	slli	a2,a2,14
 #APP
# 34 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 1) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,95
	li	a1,0
	slli	a2,a2,32
 #APP
# 50 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 3) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a1,49152
	addi	a1,a1,1021
	li	a2,0
 #APP
# 58 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 4) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	li	a2,469762048
	addi	a2,a2,7
	ld	a1,592(sp)
	slli	a2,a2,13
 #APP
# 42 "/home/tianyi/chipyard/generators/fdra/software/tests/include/ISA.h" 1
	.word 0b0001011 | (0 << (7)) | (1 << (7+5)) | (1 << (7+5+1)) | (0 << (7+5+2)) | (11 << (7+5+3)) | (12 << (7+5+3+5)) | ((((~(~0 << 7) << 0) & 2) >> 0) << (7+5+3+5+5))
	
# 0 "" 2
 #NO_APP
	addi	sp,sp,576
	jr	ra
	.size	forward_kernel_3, .-forward_kernel_3
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC1:
	.dword	36031245150453760
	.align	3
.LC2:
	.dword	4517257623379968
	.align	3
.LC3:
	.dword	4517257623388160
	.align	3
.LC4:
	.dword	4517257623437312
	.align	3
.LC5:
	.dword	4517257623404544
	.align	3
.LC6:
	.dword	4517257623445504
	.align	3
.LC7:
	.dword	4517257623470080
	.align	3
.LC8:
	.dword	4517257623478272
	.align	3
.LC9:
	.dword	4517257623412736
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC0:
	.half	18432
	.half	-8192
	.half	8
	.half	7552
	.half	32
	.half	9
	.half	0
	.half	256
	.half	10
	.half	0
	.half	0
	.half	11
	.half	8192
	.half	-8192
	.half	24
	.half	64
	.half	32
	.half	25
	.half	0
	.half	256
	.half	26
	.half	0
	.half	0
	.half	27
	.half	20481
	.half	-8192
	.half	32
	.half	7552
	.half	32
	.half	33
	.half	0
	.half	768
	.half	34
	.half	0
	.half	0
	.half	35
	.half	16498
	.half	-8192
	.half	40
	.half	7552
	.half	32
	.half	41
	.half	0
	.half	2304
	.half	42
	.half	0
	.half	0
	.half	43
	.half	18661
	.half	-8192
	.half	48
	.half	7552
	.half	32
	.half	49
	.half	0
	.half	6400
	.half	50
	.half	0
	.half	0
	.half	51
	.half	14336
	.half	-8192
	.half	56
	.half	64
	.half	32
	.half	57
	.half	0
	.half	-21248
	.half	58
	.half	128
	.half	0
	.half	59
	.half	20710
	.half	-8192
	.half	64
	.half	7552
	.half	32
	.half	65
	.half	0
	.half	7936
	.half	66
	.half	0
	.half	0
	.half	67
	.half	-32768
	.half	0
	.half	88
	.half	0
	.half	32
	.half	96
	.half	0
	.half	16
	.half	104
	.half	0
	.half	16
	.half	112
	.half	0
	.half	0
	.half	128
	.half	515
	.half	16
	.half	136
	.half	524
	.half	53
	.half	153
	.half	-32748
	.half	2
	.half	161
	.half	-15852
	.half	4
	.half	169
	.half	-32628
	.half	70
	.half	177
	.half	16524
	.half	72
	.half	201
	.half	-15852
	.half	2
	.half	209
	.half	1
	.half	0
	.half	232
	.half	1
	.half	0
	.half	233
	.half	-32640
	.half	256
	.half	240
	.half	512
	.half	8
	.half	248
	.half	1
	.half	0
	.half	249
	.half	0
	.half	32
	.half	256
	.half	-16384
	.half	0
	.half	272
	.half	8204
	.half	0
	.half	280
	.half	-32436
	.half	18
	.half	313
	.half	-15596
	.half	4
	.half	321
	.half	788
	.half	3
	.half	345
	.half	16716
	.half	18
	.half	353
	.half	4
	.half	0
	.half	368
	.half	0
	.half	256
	.half	376
	.half	0
	.half	8192
	.half	384
	.half	1
	.half	0
	.half	385
	.half	128
	.half	2056
	.half	392
	.half	3
	.half	0
	.half	393
	.half	2
	.half	4096
	.half	424
	.half	-16052
	.half	68
	.half	449
	.half	-31980
	.half	6
	.half	457
	.half	192
	.half	0
	.half	520
	.half	512
	.half	8
	.half	528
	.half	0
	.half	8224
	.half	536
	.half	4096
	.half	16384
	.half	544
	.half	-32768
	.half	0
	.half	552
	.half	0
	.half	8192
	.half	560
	.half	-32768
	.half	0
	.half	568
	.half	-32236
	.half	6
	.half	593
	.half	-16244
	.half	20
	.half	601
	.half	17172
	.half	8
	.half	617
	.half	140
	.half	51
	.half	625
	.half	-15596
	.half	8
	.half	633
	.half	-16244
	.half	50
	.half	641
	.half	0
	.half	4
	.half	664
	.half	16
	.half	4
	.half	672
	.half	4
	.half	0
	.half	696
	.half	1
	.half	3
	.half	704
	.half	18
	.half	1
	.half	712
	.half	16386
	.half	-8192
	.half	728
	.half	7552
	.half	32
	.half	729
	.half	0
	.half	1792
	.half	730
	.half	0
	.half	0
	.half	731
	.half	18547
	.half	-8192
	.half	736
	.half	7552
	.half	32
	.half	737
	.half	0
	.half	3328
	.half	738
	.half	0
	.half	0
	.half	739
	.half	18660
	.half	-8192
	.half	776
	.half	7552
	.half	32
	.half	777
	.half	0
	.half	5376
	.half	778
	.half	0
	.half	0
	.half	779
	.half	16500
	.half	-8192
	.half	784
	.half	7552
	.half	32
	.half	785
	.half	0
	.half	3840
	.half	786
	.half	0
	.half	0
	.half	787
	.ident	"GCC: (g2ee5e430018) 12.2.0"

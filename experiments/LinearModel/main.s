	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel" "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/main.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"IT is stupid!\n"
	.align	3
.LC9:
	.string	"Before malloc!\n"
	.align	3
.LC10:
	.string	"after malloc!\n"
	.align	3
.LC11:
	.string	"start cycle:%d\n"
	.align	3
.LC12:
	.string	"It takes %d cycles for CPU to finish the task.\n"
	.align	3
.LC13:
	.string	"Done!\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB11:
	.file 1 "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/main.c"
	.loc 1 11 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 1 12 3
	lla	a0,.LC0
.LVL1:
	call	printf
.LVL2:
	.loc 1 13 3
	.loc 1 14 3
	.loc 1 15 2
	.loc 1 16 3
	.loc 1 17 2
	.loc 1 18 2
	.loc 1 18 15
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	sw	zero,0(sp)
	.loc 1 19 24 is_stmt 1
.LVL3:
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	flw	fa5,.LC1,a5
	fsw	fa5,4(sp)
	.loc 1 19 24 is_stmt 1
.LVL4:
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	flw	fa5,.LC2,a5
	fsw	fa5,8(sp)
	.loc 1 19 24 is_stmt 1
.LVL5:
	.loc 1 19 18
	.loc 1 18 21
	.loc 1 18 15
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	fsw	fa5,12(sp)
	.loc 1 19 24 is_stmt 1
.LVL6:
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	flw	fa5,.LC3,a5
	fsw	fa5,16(sp)
	.loc 1 19 24 is_stmt 1
.LVL7:
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	flw	fa5,.LC4,a5
	fsw	fa5,20(sp)
	.loc 1 19 24 is_stmt 1
.LVL8:
	.loc 1 19 18
	.loc 1 18 21
	.loc 1 18 15
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	fsw	fa5,24(sp)
	.loc 1 19 24 is_stmt 1
.LVL9:
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	flw	fa5,.LC5,a5
	fsw	fa5,28(sp)
	.loc 1 19 24 is_stmt 1
.LVL10:
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	flw	fa5,.LC6,a5
	fsw	fa5,32(sp)
	.loc 1 19 24 is_stmt 1
.LVL11:
	.loc 1 19 18
	.loc 1 18 21
	.loc 1 18 15
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	fsw	fa5,36(sp)
	.loc 1 19 24 is_stmt 1
.LVL12:
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	flw	fa5,.LC7,a5
	fsw	fa5,40(sp)
	.loc 1 19 24 is_stmt 1
.LVL13:
	.loc 1 19 18
	.loc 1 20 5
	.loc 1 20 12 is_stmt 0
	flw	fa5,.LC8,a5
	fsw	fa5,44(sp)
	.loc 1 19 24 is_stmt 1
.LVL14:
	.loc 1 19 18
	.loc 1 18 21
	.loc 1 18 15
	.loc 1 22 3
	lla	a0,.LC9
	call	printf
.LVL15:
	.loc 1 23 3
	.loc 1 25 3
	lla	a0,.LC10
	call	printf
.LVL16:
	.loc 1 27 3
.LBB2:
	.loc 1 27 11
	.loc 1 27 11
 #APP
# 27 "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/main.c" 1
	csrr s0, cycle
# 0 "" 2
.LVL17:
	.loc 1 27 11
 #NO_APP
.LBE2:
	.loc 1 28 3
	mv	a1,s0
	lla	a0,.LC11
	call	printf
.LVL18:
	.loc 1 29 3
	.loc 1 29 7 is_stmt 0
	mv	a0,sp
	call	forward
.LVL19:
	.loc 1 30 3 is_stmt 1
.LBB3:
	.loc 1 30 9
	.loc 1 30 9
 #APP
# 30 "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/main.c" 1
	csrr a1, cycle
# 0 "" 2
.LVL20:
	.loc 1 30 9
 #NO_APP
.LBE3:
	.loc 1 32 3
	sub	a1,a1,s0
.LVL21:
	lla	a0,.LC12
	call	printf
.LVL22:
	.loc 1 35 3
	lla	a0,.LC13
	call	printf
.LVL23:
	.loc 1 37 3
	.loc 1 38 1 is_stmt 0
	li	a0,0
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
.LVL24:
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC1:
	.word	1065353216
	.align	2
.LC2:
	.word	1073741824
	.align	2
.LC3:
	.word	1077936128
	.align	2
.LC4:
	.word	1082130432
	.align	2
.LC5:
	.word	1084227584
	.align	2
.LC6:
	.word	1086324736
	.align	2
.LC7:
	.word	1088421888
	.align	2
.LC8:
	.word	1090519040
	.text
.Letext0:
	.file 2 "/home/tianyi/chipyard/.conda-env/riscv-tools/riscv64-unknown-elf/include/stdlib.h"
	.file 3 "/home/tianyi/chipyard/.conda-env/riscv-tools/riscv64-unknown-elf/include/stdio.h"
	.file 4 "/home/tianyi/chipyard/.conda-env/riscv-tools/lib/gcc/riscv64-unknown-elf/12.2.0/include/stddef.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x2e2
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xd
	.4byte	.LASF22
	.byte	0xc
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.byte	0xe
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.byte	0xf
	.4byte	.LASF23
	.byte	0x4
	.byte	0xd6
	.byte	0x17
	.4byte	0x5f
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.byte	0x10
	.byte	0x8
	.byte	0x3
	.4byte	0x80
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0x11
	.4byte	0x80
	.byte	0x3
	.4byte	0x87
	.byte	0x12
	.4byte	0x8c
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.byte	0x3
	.4byte	0x7b
	.byte	0x1
	.byte	0x4
	.byte	0x4
	.4byte	.LASF12
	.byte	0x1
	.byte	0x8
	.byte	0x4
	.4byte	.LASF13
	.byte	0x5
	.4byte	.LASF14
	.byte	0x1
	.byte	0x9
	.byte	0x9
	.4byte	0xc6
	.4byte	0xc6
	.byte	0x6
	.4byte	0xd0
	.byte	0
	.byte	0x3
	.4byte	0xcb
	.byte	0x3
	.4byte	0xa2
	.byte	0x3
	.4byte	0xd5
	.byte	0xa
	.4byte	0xa2
	.4byte	0xe5
	.byte	0x7
	.4byte	0x5f
	.byte	0x2
	.byte	0
	.byte	0x5
	.4byte	.LASF15
	.byte	0x2
	.byte	0x6c
	.byte	0x7
	.4byte	0x79
	.4byte	0xfb
	.byte	0x6
	.4byte	0x66
	.byte	0
	.byte	0x5
	.4byte	.LASF16
	.byte	0x3
	.byte	0xc8
	.byte	0x5
	.4byte	0x4a
	.4byte	0x112
	.byte	0x6
	.4byte	0x91
	.byte	0x13
	.byte	0
	.byte	0x14
	.4byte	.LASF24
	.byte	0x1
	.byte	0xa
	.byte	0x5
	.4byte	0x4a
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x2ca
	.byte	0xb
	.4byte	.LASF17
	.byte	0xe
	.4byte	0x4a
	.4byte	.LLST0
	.byte	0xb
	.4byte	.LASF18
	.byte	0x1b
	.4byte	0x9d
	.4byte	.LLST1
	.byte	0x8
	.4byte	.LASF19
	.byte	0xd
	.byte	0x16
	.4byte	0x96
	.4byte	.LLST2
	.byte	0x9
	.string	"end"
	.byte	0xe
	.byte	0x16
	.4byte	0x96
	.4byte	.LLST3
	.byte	0x15
	.string	"a"
	.byte	0x1
	.byte	0xf
	.byte	0x8
	.4byte	0x2ca
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x16
	.string	"b"
	.byte	0x1
	.byte	0x10
	.byte	0xb
	.4byte	0xc6
	.byte	0x9
	.string	"i"
	.byte	0x11
	.byte	0x6
	.4byte	0x4a
	.4byte	.LLST4
	.byte	0x9
	.string	"j"
	.byte	0x11
	.byte	0xa
	.4byte	0x4a
	.4byte	.LLST5
	.byte	0x17
	.4byte	.LASF20
	.byte	0x1
	.byte	0x17
	.byte	0x8
	.4byte	0x2e0
	.byte	0xc
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x1d0
	.byte	0x8
	.4byte	.LASF21
	.byte	0x1b
	.byte	0xb
	.4byte	0x5f
	.4byte	.LLST2
	.byte	0
	.byte	0xc
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x1f5
	.byte	0x8
	.4byte	.LASF21
	.byte	0x1e
	.byte	0x9
	.4byte	0x5f
	.4byte	.LLST3
	.byte	0
	.byte	0x4
	.8byte	.LVL2
	.4byte	0xfb
	.4byte	0x214
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0
	.byte	0x4
	.8byte	.LVL15
	.4byte	0xfb
	.4byte	0x233
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC9
	.byte	0
	.byte	0x4
	.8byte	.LVL16
	.4byte	0xfb
	.4byte	0x252
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC10
	.byte	0
	.byte	0x4
	.8byte	.LVL18
	.4byte	0xfb
	.4byte	0x277
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC11
	.byte	0x2
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x4
	.8byte	.LVL19
	.4byte	0xb0
	.4byte	0x28f
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x72
	.byte	0
	.byte	0
	.byte	0x4
	.8byte	.LVL22
	.4byte	0xfb
	.4byte	0x2ae
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC12
	.byte	0
	.byte	0x18
	.8byte	.LVL23
	.4byte	0xfb
	.byte	0x2
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC13
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	0xa2
	.4byte	0x2e0
	.byte	0x7
	.4byte	0x5f
	.byte	0x3
	.byte	0x7
	.4byte	0x5f
	.byte	0x2
	.byte	0
	.byte	0x3
	.4byte	0x4a
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x21
	.byte	0xa
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x37
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x8
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST0:
	.byte	0x7
	.8byte	.LVL0
	.8byte	.LVL1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.8byte	.LVL1
	.8byte	.LFE11
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.8byte	.LVL0
	.8byte	.LVL2-1
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.8byte	.LVL2-1
	.8byte	.LFE11
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x7
	.8byte	.LVL17
	.8byte	.LVL24
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST3:
	.byte	0x7
	.8byte	.LVL20
	.8byte	.LVL21
	.byte	0x1
	.byte	0x5b
	.byte	0
.LLST4:
	.byte	0x7
	.8byte	.LVL2
	.8byte	.LVL5
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL5
	.8byte	.LVL8
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL8
	.8byte	.LVL11
	.byte	0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL11
	.8byte	.LVL14
	.byte	0x2
	.byte	0x33
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL14
	.8byte	.LFE11
	.byte	0x2
	.byte	0x34
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x7
	.8byte	.LVL2
	.8byte	.LVL3
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL3
	.8byte	.LVL4
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL4
	.8byte	.LVL5
	.byte	0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL5
	.8byte	.LVL6
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL6
	.8byte	.LVL7
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL7
	.8byte	.LVL8
	.byte	0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL8
	.8byte	.LVL9
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL9
	.8byte	.LVL10
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL10
	.8byte	.LVL11
	.byte	0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL11
	.8byte	.LVL12
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL12
	.8byte	.LVL13
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL13
	.8byte	.LVL14
	.byte	0x2
	.byte	0x32
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL14
	.8byte	.LFE11
	.byte	0x2
	.byte	0x33
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF9:
	.string	"long long int"
.LASF23:
	.string	"size_t"
.LASF20:
	.string	"mlc_ptr"
.LASF21:
	.string	"__tmp"
.LASF24:
	.string	"main"
.LASF2:
	.string	"signed char"
.LASF22:
	.string	"GNU C99 12.2.0 -mcmodel=medany -mtune=rocket -mabi=lp64d -misa-spec=2.2 -march=rv64imafdc -g -O1 -std=gnu99 -ffast-math -fno-common -fno-builtin-printf -fno-tree-loop-distribute-patterns"
.LASF11:
	.string	"long long unsigned int"
.LASF14:
	.string	"forward"
.LASF3:
	.string	"unsigned char"
.LASF10:
	.string	"char"
.LASF19:
	.string	"start"
.LASF7:
	.string	"long int"
.LASF8:
	.string	"long unsigned int"
.LASF13:
	.string	"double"
.LASF17:
	.string	"argc"
.LASF5:
	.string	"short unsigned int"
.LASF16:
	.string	"printf"
.LASF18:
	.string	"argv"
.LASF12:
	.string	"float"
.LASF4:
	.string	"short int"
.LASF6:
	.string	"unsigned int"
.LASF15:
	.string	"malloc"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel"
.LASF0:
	.string	"/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/main.c"
	.ident	"GCC: (g2ee5e430018) 12.2.0"

	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel" "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/main.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"IT is stupid!\n"
	.align	3
.LC1:
	.string	"Before malloc!\n"
	.align	3
.LC2:
	.string	"after malloc!\n"
	.align	3
.LC3:
	.string	"start cycle:%d\n"
	.align	3
.LC4:
	.string	"It takes %d cycles for CPU to finish the task.\n"
	.align	3
.LC5:
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
	addi	sp,sp,-144
	.cfi_def_cfa_offset 144
	sd	ra,136(sp)
	sd	s0,128(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,144
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sd	a1,-144(s0)
	sw	a5,-132(s0)
	.loc 1 12 3
	lla	a0,.LC0
	call	printf
	.loc 1 18 8
	sw	zero,-20(s0)
	.loc 1 18 2
	j	.L2
.L5:
	.loc 1 19 11
	sw	zero,-24(s0)
	.loc 1 19 5
	j	.L3
.L4:
	.loc 1 20 14 discriminator 3
	lw	a5,-20(s0)
	slliw	a5,a5,1
	sext.w	a5,a5
	.loc 1 20 16 discriminator 3
	lw	a4,-24(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	.loc 1 20 12 discriminator 3
	fcvt.s.w	fa5,a5
	lw	a3,-24(s0)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,1
	add	a5,a5,a4
	add	a5,a5,a3
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	fsw	fa5,-104(a5)
	.loc 1 19 24 discriminator 3
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L3:
	.loc 1 19 18 discriminator 1
	lw	a5,-24(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L4
	.loc 1 18 21 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	.loc 1 18 15 discriminator 1
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,3
	ble	a4,a5,.L5
	.loc 1 22 3
	lla	a0,.LC1
	call	printf
	.loc 1 23 24
	li	a0,16
	call	malloc2
	mv	a5,a0
	sd	a5,-32(s0)
	.loc 1 25 3
	lla	a0,.LC2
	call	printf
.LBB2:
	.loc 1 27 11
 #APP
# 27 "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/main.c" 1
	csrr a5, cycle
# 0 "" 2
 #NO_APP
	sd	a5,-40(s0)
	ld	a5,-40(s0)
.LBE2:
	.loc 1 27 9
	sd	a5,-48(s0)
	.loc 1 28 3
	ld	a1,-48(s0)
	lla	a0,.LC3
	call	printf
	.loc 1 29 7
	addi	a5,s0,-120
	mv	a0,a5
	call	forward
	sd	a0,-56(s0)
.LBB3:
	.loc 1 30 9
 #APP
# 30 "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel/main.c" 1
	csrr a5, cycle
# 0 "" 2
 #NO_APP
	sd	a5,-64(s0)
	ld	a5,-64(s0)
.LBE3:
	.loc 1 30 7
	sd	a5,-72(s0)
	.loc 1 32 3
	ld	a4,-72(s0)
	ld	a5,-48(s0)
	sub	a5,a4,a5
	mv	a1,a5
	lla	a0,.LC4
	call	printf
	.loc 1 35 3
	lla	a0,.LC5
	call	printf
	.loc 1 37 10
	li	a5,0
	.loc 1 38 1
	mv	a0,a5
	ld	ra,136(sp)
	.cfi_restore 1
	ld	s0,128(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 144
	addi	sp,sp,144
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	main, .-main
.Letext0:
	.file 2 "/home/tianyi/chipyard/.conda-env/riscv-tools/riscv64-unknown-elf/include/stdlib.h"
	.file 3 "/home/tianyi/chipyard/.conda-env/riscv-tools/riscv64-unknown-elf/include/stdio.h"
	.file 4 "/home/tianyi/chipyard/.conda-env/riscv-tools/lib/gcc/riscv64-unknown-elf/12.2.0/include/stddef.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x209
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
	.4byte	.LASF23
	.byte	0x4
	.byte	0xd6
	.byte	0x17
	.4byte	0x5f
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.byte	0xd
	.byte	0x8
	.byte	0x2
	.4byte	0x80
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0xe
	.4byte	0x80
	.byte	0x2
	.4byte	0x87
	.byte	0xf
	.4byte	0x8c
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.byte	0x2
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
	.byte	0x2
	.4byte	0xcb
	.byte	0x2
	.4byte	0xa2
	.byte	0x2
	.4byte	0xd5
	.byte	0x8
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
	.byte	0x10
	.byte	0
	.byte	0x11
	.4byte	.LASF24
	.byte	0x1
	.byte	0xa
	.byte	0x5
	.4byte	0x4a
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x1f1
	.byte	0x9
	.4byte	.LASF17
	.byte	0xe
	.4byte	0x4a
	.byte	0x3
	.byte	0x91
	.byte	0xfc,0x7e
	.byte	0x9
	.4byte	.LASF18
	.byte	0x1b
	.4byte	0x9d
	.byte	0x3
	.byte	0x91
	.byte	0xf0,0x7e
	.byte	0x4
	.4byte	.LASF19
	.byte	0xd
	.byte	0x16
	.4byte	0x96
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.string	"end"
	.byte	0xe
	.byte	0x16
	.4byte	0x96
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x3
	.string	"a"
	.byte	0xf
	.byte	0x8
	.4byte	0x1f1
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0x3
	.string	"b"
	.byte	0x10
	.byte	0xb
	.4byte	0xc6
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x3
	.string	"i"
	.byte	0x11
	.byte	0x6
	.4byte	0x4a
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x3
	.string	"j"
	.byte	0x11
	.byte	0xa
	.4byte	0x4a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.4byte	.LASF20
	.byte	0x17
	.byte	0x8
	.4byte	0x207
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x12
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x1d0
	.byte	0x4
	.4byte	.LASF21
	.byte	0x1b
	.byte	0xb
	.4byte	0x5f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x13
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x4
	.4byte	.LASF21
	.byte	0x1e
	.byte	0x9
	.4byte	0x5f
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	0xa2
	.4byte	0x207
	.byte	0x7
	.4byte	0x5f
	.byte	0x3
	.byte	0x7
	.4byte	0x5f
	.byte	0x2
	.byte	0
	.byte	0x2
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0x18
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x37
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x13
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0
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
.LASF22:
	.string	"GNU C99 12.2.0 -mcmodel=medany -mtune=rocket -mabi=lp64d -misa-spec=2.2 -march=rv64imafdc -g -O0 -std=gnu99 -ffast-math -fno-common -fno-builtin-printf -fno-tree-loop-distribute-patterns"
.LASF2:
	.string	"signed char"
.LASF8:
	.string	"long unsigned int"
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
.LASF13:
	.string	"double"
.LASF17:
	.string	"argc"
.LASF5:
	.string	"short unsigned int"
.LASF16:
	.string	"printf"
.LASF24:
	.string	"main"
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

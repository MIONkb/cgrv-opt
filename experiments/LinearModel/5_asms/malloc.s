	.file	"tiny-malloc.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel" "/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/debug/programs/tiny-malloc.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"[Info] malloc size: %d\n"
	.text
	.align	1
	.globl	malloc
	.type	malloc, @function
malloc:
.LFB3:
	.file 1 "/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/debug/programs/tiny-malloc.c"
	.loc 1 135 1
	.cfi_startproc
.LVL0:
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	sd	s1,8(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	s1,a0
	.loc 1 136 3
	.loc 1 137 3
	.loc 1 138 3
	mv	a1,a0
	lla	a0,.LC0
.LVL1:
	call	printf
.LVL2:
	.loc 1 142 3
	.loc 1 142 22 is_stmt 0
	li	a5,7
	li	a3,16
	bleu	s1,a5,.L2
	.loc 1 142 22 discriminator 1
	neg	a3,s1
	andi	a3,a3,7
	addi	s1,s1,8
.LVL3:
	add	a3,a3,s1
.LVL4:
.L2:
	.loc 1 145 3 is_stmt 1 discriminator 4
	.loc 1 145 17 is_stmt 0 discriminator 4
	ld	a5,__malloc_freelist
	.loc 1 146 8 is_stmt 1 discriminator 4
	beq	a5,zero,.L3
	.loc 1 145 17 is_stmt 0
	lla	a2,__malloc_freelist
	j	.L9
.LVL5:
.L13:
	.loc 1 155 4 is_stmt 1
	.loc 1 155 32 is_stmt 0
	addi	a1,a3,16
	.loc 1 155 7
	bgeu	a4,a1,.L5
	.loc 1 157 8 is_stmt 1
	.loc 1 157 25 is_stmt 0
	ld	a4,8(a5)
	.loc 1 157 18
	sd	a4,0(a2)
.LVL6:
	.loc 1 158 8 is_stmt 1
	.loc 1 158 15 is_stmt 0
	addi	a0,a5,8
	j	.L1
.LVL7:
.L5:
.LBB2:
	.loc 1 162 8 is_stmt 1
	.loc 1 163 8
	.loc 1 163 12 is_stmt 0
	ld	a0,8(a5)
.LVL8:
	.loc 1 164 8 is_stmt 1
	.loc 1 164 40 is_stmt 0
	add	a1,a5,a3
	.loc 1 164 18
	sd	a1,0(a2)
.LVL9:
	.loc 1 165 8 is_stmt 1
	.loc 1 162 15 is_stmt 0
	sub	a4,a4,a3
.LVL10:
	.loc 1 165 26
	sd	a4,0(a1)
	.loc 1 166 8 is_stmt 1
	.loc 1 166 9 is_stmt 0
	ld	a4,0(a2)
.LVL11:
	.loc 1 166 26
	sd	a0,8(a4)
.LVL12:
	.loc 1 167 8 is_stmt 1
	j	.L7
.LVL13:
.L14:
.LBE2:
.LBB3:
	.loc 1 176 4
	.loc 1 177 4
	.loc 1 177 10 is_stmt 0
	sub	a1,s0,a1
	addi	a1,a1,-32
	.loc 1 176 11
	sub	a4,a3,a4
.LVL14:
	.loc 1 177 7
	bltu	a1,a4,.L1
	.loc 1 180 4 is_stmt 1
	.loc 1 180 14 is_stmt 0
	sd	zero,0(a2)
.LVL15:
	.loc 1 181 4 is_stmt 1
	.loc 1 187 8
	.loc 1 187 46 is_stmt 0
	add	a7,a5,a3
	.loc 1 187 21
	sd	a7,__malloc_end,a4
.LVL16:
	.loc 1 190 4 is_stmt 1
	j	.L7
.LVL17:
.L8:
.LBE3:
	.loc 1 147 17
	addi	a2,a5,8
.LVL18:
	.loc 1 146 8
	.loc 1 147 17 is_stmt 0
	mv	a5,a0
.LVL19:
.L9:
	.loc 1 149 7 is_stmt 1
	.loc 1 151 7
	.loc 1 151 16 is_stmt 0
	ld	a4,0(a5)
	.loc 1 151 10
	bgeu	a4,a3,.L13
	.loc 1 173 7 is_stmt 1
	.loc 1 173 18 is_stmt 0
	ld	a0,8(a5)
	.loc 1 173 10
	bne	a0,zero,.L8
	.loc 1 174 20
	ld	a1,__malloc_end
	.loc 1 174 46
	add	a6,a4,a5
	.loc 1 174 4
	beq	a1,a6,.L14
.LVL20:
.L3:
	.loc 1 197 3 is_stmt 1
	.loc 1 197 9 is_stmt 0
	ld	a5,__malloc_end
	sub	a4,s0,a5
	addi	a4,a4,-32
	.loc 1 197 6
	bltu	a4,a3,.L11
	.loc 1 200 3 is_stmt 1
	.loc 1 202 7
.LVL21:
	.loc 1 203 7
	.loc 1 203 52 is_stmt 0
	add	a4,a5,a3
	.loc 1 203 20
	sd	a4,__malloc_end,a2
.LVL22:
.L7:
	.loc 1 210 3 is_stmt 1
	.loc 1 210 15 is_stmt 0
	sd	a3,0(a5)
	.loc 1 211 3 is_stmt 1
	.loc 1 211 10 is_stmt 0
	addi	a0,a5,8
.LVL23:
.L1:
	.loc 1 212 1
	ld	ra,24(sp)
	.cfi_remember_state
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	ld	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L11:
	.cfi_restore_state
	.loc 1 198 12
	li	a0,0
	j	.L1
	.cfi_endproc
.LFE3:
	.size	malloc, .-malloc
	.globl	__malloc_freelist
	.globl	__malloc_end
	.section	.sbss,"aw",@nobits
	.align	3
	.type	__malloc_freelist, @object
	.size	__malloc_freelist, 8
__malloc_freelist:
	.zero	8
	.section	.sdata,"aw"
	.align	3
	.type	__malloc_end, @object
	.size	__malloc_end, 8
__malloc_end:
	.dword	__malloc_start
	.text
.Letext0:
	.file 2 "/home/tianyi/chipyard/.conda-env/riscv-tools/lib/gcc/riscv64-unknown-elf/12.2.0/include/stddef.h"
	.file 3 "/home/tianyi/chipyard/.conda-env/riscv-tools/riscv64-unknown-elf/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x218
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x9
	.4byte	.LASF24
	.byte	0xc
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.byte	0xa
	.4byte	.LASF14
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.4byte	0x41
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF3
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.byte	0xc
	.byte	0x8
	.byte	0x3
	.4byte	0x80
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0xd
	.4byte	0x80
	.byte	0x3
	.4byte	0x87
	.byte	0xe
	.4byte	0x8c
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.byte	0xf
	.4byte	.LASF25
	.byte	0x10
	.byte	0x1
	.byte	0x50
	.byte	0x10
	.4byte	0xc3
	.byte	0x5
	.4byte	.LASF12
	.byte	0x51
	.byte	0xa
	.4byte	0x35
	.byte	0
	.byte	0x5
	.4byte	.LASF13
	.byte	0x52
	.byte	0x1a
	.4byte	0xc3
	.byte	0x8
	.byte	0
	.byte	0x3
	.4byte	0x9d
	.byte	0x10
	.string	"fle"
	.byte	0x1
	.byte	0x53
	.byte	0x4
	.4byte	0xc3
	.byte	0x4
	.4byte	.LASF15
	.byte	0x55
	.byte	0xf
	.4byte	0x79
	.byte	0x4
	.4byte	.LASF16
	.byte	0x56
	.byte	0xc
	.4byte	0xc8
	.byte	0x4
	.4byte	.LASF17
	.byte	0x60
	.byte	0xe
	.4byte	0x7b
	.byte	0x6
	.4byte	0xd4
	.byte	0x82
	.byte	0x8
	.byte	0x9
	.byte	0x3
	.8byte	__malloc_end
	.byte	0x6
	.4byte	0xdf
	.byte	0x83
	.byte	0x5
	.byte	0x9
	.byte	0x3
	.8byte	__malloc_freelist
	.byte	0x11
	.4byte	.LASF26
	.byte	0x3
	.byte	0xc8
	.byte	0x5
	.4byte	0x48
	.4byte	0x12e
	.byte	0x12
	.4byte	0x91
	.byte	0x13
	.byte	0
	.byte	0x14
	.4byte	.LASF27
	.byte	0x1
	.byte	0x86
	.byte	0x1
	.4byte	0x79
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x216
	.byte	0x15
	.string	"sz"
	.byte	0x1
	.byte	0x86
	.byte	0x10
	.4byte	0x35
	.4byte	.LLST0
	.byte	0x2
	.4byte	.LASF18
	.byte	0x88
	.byte	0x8
	.4byte	0x216
	.4byte	.LLST1
	.byte	0x2
	.4byte	.LASF19
	.byte	0x89
	.byte	0x7
	.4byte	0xc8
	.4byte	.LLST2
	.byte	0x16
	.4byte	.LASF20
	.byte	0x1
	.byte	0x8e
	.byte	0xa
	.4byte	0x35
	.byte	0x1
	.byte	0x5d
	.byte	0x17
	.4byte	.LASF28
	.byte	0x1
	.byte	0xd1
	.byte	0x2
	.8byte	.L7
	.byte	0x7
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x1cf
	.byte	0x2
	.4byte	.LASF21
	.byte	0xa2
	.byte	0xf
	.4byte	0x35
	.4byte	.LLST3
	.byte	0x2
	.4byte	.LASF22
	.byte	0xa3
	.byte	0xc
	.4byte	0xc8
	.4byte	.LLST4
	.byte	0
	.byte	0x7
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x1f4
	.byte	0x2
	.4byte	.LASF23
	.byte	0xb0
	.byte	0xb
	.4byte	0x35
	.4byte	.LLST5
	.byte	0
	.byte	0x18
	.8byte	.LVL2
	.4byte	0x117
	.byte	0x8
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x3
	.8byte	.LC0
	.byte	0x8
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x3
	.4byte	0xc8
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0x8
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x37
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x16
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
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
	.8byte	.LVL3
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.8byte	.LVL3
	.8byte	.LVL4
	.byte	0x3
	.byte	0x79
	.byte	0x78
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL4
	.8byte	.LFE3
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.8byte	.LVL4
	.8byte	.LVL5
	.byte	0xa
	.byte	0x3
	.8byte	__malloc_freelist
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL5
	.8byte	.LVL20
	.byte	0x1
	.byte	0x5c
	.byte	0
.LLST2:
	.byte	0x7
	.8byte	.LVL5
	.8byte	.LVL6
	.byte	0x2
	.byte	0x7c
	.byte	0
	.byte	0x7
	.8byte	.LVL7
	.8byte	.LVL9
	.byte	0x2
	.byte	0x7c
	.byte	0
	.byte	0x7
	.8byte	.LVL13
	.8byte	.LVL15
	.byte	0x2
	.byte	0x7c
	.byte	0
	.byte	0x7
	.8byte	.LVL17
	.8byte	.LVL20
	.byte	0x2
	.byte	0x7c
	.byte	0
	.byte	0x7
	.8byte	.LVL21
	.8byte	.LVL23
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST3:
	.byte	0x7
	.8byte	.LVL7
	.8byte	.LVL10
	.byte	0x6
	.byte	0x7e
	.byte	0
	.byte	0x7d
	.byte	0
	.byte	0x1c
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL10
	.8byte	.LVL11
	.byte	0x1
	.byte	0x5e
	.byte	0x7
	.8byte	.LVL11
	.8byte	.LVL12
	.byte	0x2
	.byte	0x7b
	.byte	0
	.byte	0
.LLST4:
	.byte	0x7
	.8byte	.LVL8
	.8byte	.LVL13
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST5:
	.byte	0x7
	.8byte	.LVL13
	.8byte	.LVL14
	.byte	0x6
	.byte	0x7d
	.byte	0
	.byte	0x7e
	.byte	0
	.byte	0x1c
	.byte	0x9f
	.byte	0x7
	.8byte	.LVL14
	.8byte	.LVL16
	.byte	0x1
	.byte	0x5e
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
.LASF25:
	.string	"freelist_entry"
.LASF14:
	.string	"size_t"
.LASF15:
	.string	"__malloc_end"
.LASF21:
	.string	"newsize"
.LASF4:
	.string	"signed char"
.LASF28:
	.string	"done"
.LASF18:
	.string	"nextfree"
.LASF24:
	.string	"GNU C99 12.2.0 -mcmodel=medany -mtune=rocket -mabi=lp64d -misa-spec=2.2 -march=rv64imafdc -g -O1 -std=gnu99 -ffast-math -fno-common -fno-builtin-printf -fno-tree-loop-distribute-patterns"
.LASF11:
	.string	"long long unsigned int"
.LASF23:
	.string	"moresize"
.LASF16:
	.string	"__malloc_freelist"
.LASF17:
	.string	"__malloc_start"
.LASF5:
	.string	"unsigned char"
.LASF10:
	.string	"char"
.LASF2:
	.string	"long int"
.LASF3:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF26:
	.string	"printf"
.LASF12:
	.string	"size"
.LASF22:
	.string	"newnext"
.LASF6:
	.string	"short int"
.LASF19:
	.string	"block"
.LASF8:
	.string	"unsigned int"
.LASF20:
	.string	"real_size"
.LASF27:
	.string	"malloc"
.LASF13:
	.string	"next"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel"
.LASF0:
	.string	"/home/tianyi/chipyard/generators/fdra/software/tests/riscv-tests/debug/programs/tiny-malloc.c"
	.ident	"GCC: (g2ee5e430018) 12.2.0"

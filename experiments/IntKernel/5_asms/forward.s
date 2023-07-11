	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_f2p0_d2p0_c2p0"
	.file	"LLVMDialectModule"
	.globl	forward                         # -- Begin function forward
	.p2align	1
	.type	forward,@function
forward:                                # @forward
.Lfunc_begin0:
	.file	1 "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/IntKernel" "3_forward_llvm.mlir"
	.loc	1 4 0                           # 3_forward_llvm.mlir:4:0
	.cfi_startproc
# %bb.0:                                # %.preheader2
	addi	sp, sp, -192
	.cfi_def_cfa_offset 192
	sd	ra, 184(sp)                     # 8-byte Folded Spill
	sd	s0, 176(sp)                     # 8-byte Folded Spill
	sd	s1, 168(sp)                     # 8-byte Folded Spill
	sd	s2, 160(sp)                     # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	.cfi_offset s2, -32
	addi	s0, sp, 192
	.cfi_def_cfa s0, 0
	andi	sp, sp, -64
	mv	s2, a0
	li	a0, -1
	slli	a1, a0, 34
	addi	a1, a1, 1
.Ltmp0:
	.loc	1 79 5 prologue_end             # 3_forward_llvm.mlir:79:5
	sd	a1, 0(sp)
	li	a1, -3
	slli	a1, a1, 33
	addi	a1, a1, 3
	sd	a1, 24(sp)
	slli	a1, a0, 35
	addi	a1, a1, 5
	sd	a1, 16(sp)
	slli	a0, a0, 33
	addi	a0, a0, 7
	sd	a0, 8(sp)
	li	a0, 9
	sw	a0, 32(sp)
	.loc	1 133 12                        # 3_forward_llvm.mlir:133:12
	li	a0, 88
	call	malloc@plt
	.loc	1 138 12                        # 3_forward_llvm.mlir:138:12
	addi	a0, a0, 63
	.loc	1 140 12                        # 3_forward_llvm.mlir:140:12
	andi	s1, a0, -64
	.loc	1 161 5                         # 3_forward_llvm.mlir:161:5
	sd	zero, 0(s1)
	sd	zero, 8(s1)
	sd	zero, 16(s1)
	.loc	1 164 5                         # 3_forward_llvm.mlir:164:5
	mv	a1, sp
	mv	a0, s2
	mv	a2, s1
	call	forward_kernel_0@plt
	.loc	1 166 5                         # 3_forward_llvm.mlir:166:5
	mv	a0, s1
	addi	sp, s0, -192
	ld	ra, 184(sp)                     # 8-byte Folded Reload
	ld	s0, 176(sp)                     # 8-byte Folded Reload
	ld	s1, 168(sp)                     # 8-byte Folded Reload
	ld	s2, 160(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 192
	ret
.Ltmp1:
.Lfunc_end0:
	.size	forward, .Lfunc_end0-forward
	.cfi_endproc
                                        # -- End function
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	14                              # DW_FORM_strp
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	14                              # DW_FORM_strp
	.ascii	"\264B"                         # DW_AT_GNU_pubnames
	.byte	25                              # DW_FORM_flag_present
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	0                               # DW_CHILDREN_no
	.byte	17                              # DW_AT_low_pc
	.byte	1                               # DW_FORM_addr
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	110                             # DW_AT_linkage_name
	.byte	14                              # DW_FORM_strp
	.byte	3                               # DW_AT_name
	.byte	14                              # DW_FORM_strp
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	4                               # DWARF version number
	.word	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	8                               # Address Size (in bytes)
	.byte	1                               # Abbrev [1] 0xb:0x39 DW_TAG_compile_unit
	.word	.Linfo_string0                  # DW_AT_producer
	.half	2                               # DW_AT_language
	.word	.Linfo_string1                  # DW_AT_name
	.word	.Lline_table_start0             # DW_AT_stmt_list
	.word	.Linfo_string2                  # DW_AT_comp_dir
                                        # DW_AT_GNU_pubnames
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	2                               # Abbrev [2] 0x2a:0x19 DW_TAG_subprogram
	.quad	.Lfunc_begin0                   # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string3                  # DW_AT_linkage_name
	.word	.Linfo_string3                  # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
                                        # DW_AT_external
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"mlir"                          # string offset=0
.Linfo_string1:
	.asciz	"LLVMDialectModule"             # string offset=5
.Linfo_string2:
	.asciz	"/"                             # string offset=23
.Linfo_string3:
	.asciz	"forward"                       # string offset=25
	.section	.debug_pubnames,"",@progbits
	.word	.LpubNames_end0-.LpubNames_start0 # Length of Public Names Info
.LpubNames_start0:
	.half	2                               # DWARF Version
	.word	.Lcu_begin0                     # Offset of Compilation Unit Info
	.word	68                              # Compilation Unit Length
	.word	42                              # DIE offset
	.asciz	"forward"                       # External Name
	.word	0                               # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.word	.LpubTypes_end0-.LpubTypes_start0 # Length of Public Types Info
.LpubTypes_start0:
	.half	2                               # DWARF Version
	.word	.Lcu_begin0                     # Offset of Compilation Unit Info
	.word	68                              # Compilation Unit Length
	.word	0                               # End Mark
.LpubTypes_end0:
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:

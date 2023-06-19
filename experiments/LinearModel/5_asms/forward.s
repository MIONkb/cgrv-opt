	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_f2p0_d2p0_c2p0"
	.file	"LLVMDialectModule"
	.globl	forward                         # -- Begin function forward
	.p2align	1
	.type	forward,@function
forward:                                # @forward
.Lfunc_begin0:
	.file	1 "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/LinearModel" "3_forward_llvm.mlir"
	.loc	1 4 0                           # 3_forward_llvm.mlir:4:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -368
	.cfi_def_cfa_offset 368
	sd	ra, 360(sp)                     # 8-byte Folded Spill
	sd	s0, 352(sp)                     # 8-byte Folded Spill
	sd	s1, 344(sp)                     # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	mv	s0, a0
.Lpcrel_hi0:
.Ltmp0:
	.loc	1 57 5 prologue_end             # 3_forward_llvm.mlir:57:5
	auipc	a0, %pcrel_hi(.L__constant_3x3xf32)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	addi	a1, sp, 200
	call	forward_kernel_0@plt
	.loc	1 76 5                          # 3_forward_llvm.mlir:76:5
	addi	a0, sp, 8
	call	forward_kernel_1@plt
	.loc	1 86 11                         # 3_forward_llvm.mlir:86:11
	li	a0, 112
	call	malloc@plt
	.loc	1 91 11                         # 3_forward_llvm.mlir:91:11
	addi	a0, a0, 63
	.loc	1 93 11                         # 3_forward_llvm.mlir:93:11
	andi	s1, a0, -64
	.loc	1 114 5                         # 3_forward_llvm.mlir:114:5
	addi	a1, sp, 8
	li	a2, 48
	mv	a0, s1
	call	memcpy@plt
	.loc	1 117 5                         # 3_forward_llvm.mlir:117:5
	addi	a1, sp, 200
	mv	a0, s0
	mv	a2, s1
	call	forward_kernel_2@plt
	.loc	1 119 5                         # 3_forward_llvm.mlir:119:5
	mv	a0, s1
	ld	ra, 360(sp)                     # 8-byte Folded Reload
	ld	s0, 352(sp)                     # 8-byte Folded Reload
	ld	s1, 344(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 368
	ret
.Ltmp1:
.Lfunc_end0:
	.size	forward, .Lfunc_end0-forward
	.cfi_endproc
                                        # -- End function
	.type	.L__constant_3x3xf32,@object    # @__constant_3x3xf32
	.section	.rodata,"a",@progbits
	.p2align	4
.L__constant_3x3xf32:
	.word	0x3f11aeae                      # float 0.569071651
	.word	0xbef26904                      # float -0.473457456
	.word	0x3f04eae9                      # float 0.519209445
	.word	0xbe6d2c4d                      # float -0.231614307
	.word	0xbdaf5b13                      # float -0.085622929
	.word	0x3f13c6da                      # float 0.577252984
	.word	0xbdc9cd03                      # float -0.09853556
	.word	0xbc6c904a                      # float -0.0144386981
	.word	0x3ebcd96f                      # float 0.368846387
	.size	.L__constant_3x3xf32, 36

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
	.byte	82
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

	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p0_f2p0_d2p0_c2p0"
	.file	"LLVMDialectModule"
	.globl	forward                         # -- Begin function forward
	.p2align	1
	.type	forward,@function
forward:                                # @forward
.Lfunc_begin0:
	.file	1 "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/Demo1" "3_forward_llvm.mlir"
	.loc	1 5 0                           # 3_forward_llvm.mlir:5:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -2032
	.cfi_def_cfa_offset 2032
	sd	ra, 2024(sp)                    # 8-byte Folded Spill
	sd	s0, 2016(sp)                    # 8-byte Folded Spill
	sd	s1, 2008(sp)                    # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset s1, -24
	addi	s0, sp, 2032
	.cfi_def_cfa s0, 0
	addi	sp, sp, -976
	andi	sp, sp, -64
	mv	s1, a0
.Lpcrel_hi0:
.Ltmp0:
	.loc	1 78 5 prologue_end             # 3_forward_llvm.mlir:78:5
	auipc	a0, %pcrel_hi(.L__constant_12x3xf32)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	lui	a1, 1
	addiw	a1, a1, -1728
	add	a1, a1, sp
	call	forward_kernel_0@plt
	.loc	1 97 5                          # 3_forward_llvm.mlir:97:5
	addi	a0, sp, 1600
	call	forward_kernel_1@plt
	.loc	1 125 5                         # 3_forward_llvm.mlir:125:5
	addi	a0, sp, 832
	addi	a1, sp, 1600
	li	a2, 192
	call	memcpy@plt
	.loc	1 128 5                         # 3_forward_llvm.mlir:128:5
	lui	a0, 1
	addiw	a0, a0, -1728
	add	a1, sp, a0
	addi	a2, sp, 832
	mv	a0, s1
	call	forward_kernel_2@plt
.Lpcrel_hi1:
	.loc	1 148 5                         # 3_forward_llvm.mlir:148:5
	auipc	a0, %pcrel_hi(.L__constant_3x12xf32)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi1)
	addi	a1, sp, 256
	call	forward_kernel_3@plt
	.loc	1 167 5                         # 3_forward_llvm.mlir:167:5
	addi	a0, sp, 64
	call	forward_kernel_4@plt
	.loc	1 177 12                        # 3_forward_llvm.mlir:177:12
	li	a0, 112
	call	malloc@plt
	.loc	1 182 12                        # 3_forward_llvm.mlir:182:12
	addi	a0, a0, 63
	.loc	1 184 12                        # 3_forward_llvm.mlir:184:12
	andi	s1, a0, -64
	.loc	1 205 5                         # 3_forward_llvm.mlir:205:5
	addi	a1, sp, 64
	li	a2, 48
	mv	a0, s1
	call	memcpy@plt
	.loc	1 209 5                         # 3_forward_llvm.mlir:209:5
	addi	a0, sp, 832
	addi	a1, sp, 256
	mv	a2, s1
	call	forward_kernel_5@plt
	.loc	1 211 5                         # 3_forward_llvm.mlir:211:5
	mv	a0, s1
	addi	sp, s0, -2048
	addi	sp, sp, -960
	addi	sp, sp, 976
	ld	ra, 2024(sp)                    # 8-byte Folded Reload
	ld	s0, 2016(sp)                    # 8-byte Folded Reload
	ld	s1, 2008(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 2032
	ret
.Ltmp1:
.Lfunc_end0:
	.size	forward, .Lfunc_end0-forward
	.cfi_endproc
                                        # -- End function
	.type	.L__constant_12x3xf32,@object   # @__constant_12x3xf32
	.section	.rodata,"a",@progbits
	.p2align	4
.L__constant_12x3xf32:
	.word	0x3e8e9abb                      # float 0.27852425
	.word	0x3edb5206                      # float 0.428360164
	.word	0x3e030af0                      # float 0.127971411
	.word	0xbe65dd45                      # float -0.224476889
	.word	0x3ed5d1e4                      # float 0.417616963
	.word	0x3f0ad220                      # float 0.542268753
	.word	0xbf10d1a9                      # float -0.56569916
	.word	0xbef76c1f                      # float -0.483246773
	.word	0xbeb9edeb                      # float -0.363143295
	.word	0xbe6f77a5                      # float -0.233854845
	.word	0xbec47fb7                      # float -0.383786887
	.word	0x3d1d80a0                      # float 0.0384527445
	.word	0x3db659d6                      # float 0.089038536
	.word	0xbe923ce6                      # float -0.285620868
	.word	0x3ef69925                      # float 0.48163715
	.word	0x3e44d45a                      # float 0.192216307
	.word	0xbe1889a9                      # float -0.148962632
	.word	0x3ed60446                      # float 0.418001354
	.word	0xbd965815                      # float -0.0734101906
	.word	0xbe9acb84                      # float -0.302333951
	.word	0x3ead83c0                      # float 0.338895798
	.word	0xbef07361                      # float -0.469630271
	.word	0xbdb2b545                      # float -0.0872598066
	.word	0xbea59c82                      # float -0.323459685
	.word	0x3f075836                      # float 0.528689742
	.word	0xbf08aa6e                      # float -0.533850551
	.word	0x3c877d0a                      # float 0.0165391155
	.word	0xbe704ca7                      # float -0.234667405
	.word	0xbdfc8449                      # float -0.123299189
	.word	0x3e9574d7                      # float 0.291907042
	.word	0xbe176bc9                      # float -0.147872105
	.word	0xbf00acd0                      # float -0.502636909
	.word	0xbed3403a                      # float -0.412599385
	.word	0xbe2af887                      # float -0.166963682
	.word	0x3dc2d033                      # float 0.0951236709
	.word	0xbdbe95ab                      # float -0.0930589064
	.size	.L__constant_12x3xf32, 144

	.type	.L__constant_3x12xf32,@object   # @__constant_3x12xf32
	.p2align	4
.L__constant_3x12xf32:
	.word	0xbd9b13d0                      # float -0.0757213831
	.word	0xbdea7d94                      # float -0.114497334
	.word	0xbe02c6af                      # float -0.127711043
	.word	0xbdf04333                      # float -0.117315672
	.word	0x3e4ef83a                      # float 0.202118784
	.word	0xbe851bc6                      # float -0.25997752
	.word	0xbe365ee5                      # float -0.178096369
	.word	0xbe0f7715                      # float -0.140102699
	.word	0xbdf2c819                      # float -0.118545718
	.word	0xbe80d962                      # float -0.251658499
	.word	0xbddea4a2                      # float -0.10871245
	.word	0xbe86d85f                      # float -0.26336953
	.word	0x3e699fd7                      # float 0.228148803
	.word	0x3e6f550a                      # float 0.233722836
	.word	0x3e8a87f2                      # float 0.27056843
	.word	0x3dd0e0f0                      # float 0.101991534
	.word	0xbdd46e68                      # float -0.103726208
	.word	0x3b5c4f0a                      # float 0.00336164469
	.word	0xbda1773b                      # float -0.0788406953
	.word	0x3e6ef845                      # float 0.233368948
	.word	0x3d9a1b76                      # float 0.0752476901
	.word	0x3e4470fe                      # float 0.191837281
	.word	0xbe8bf599                      # float -0.273358136
	.word	0xbe8feb23                      # float -0.281090826
	.word	0xbd0d862c                      # float -0.0345517844
	.word	0x3e7825b2                      # float 0.242331296
	.word	0xbe3d030c                      # float -0.184581935
	.word	0x3e8847da                      # float 0.266173184
	.word	0xbe11e0c8                      # float -0.142459035
	.word	0xbe6d8f6d                      # float -0.231992438
	.word	0xbe738f3f                      # float -0.237851128
	.word	0x3e690a02                      # float 0.227577239
	.word	0x3e7b73af                      # float 0.245558485
	.word	0xbd2f79b6                      # float -0.042840682
	.word	0x3e0c6e60                      # float 0.137139797
	.word	0x3dc1e06c                      # float 0.094666332
	.size	.L__constant_3x12xf32, 144

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
	.byte	5                               # DW_AT_decl_line
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

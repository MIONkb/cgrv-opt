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
	.word	0xbe84bb1f                      # float -0.259240121
	.word	0xbe70521e                      # float -0.234688252
	.word	0x3f02b0cb                      # float 0.510510147
	.word	0x3e6f2b18                      # float 0.233562827
	.word	0xbd07c29c                      # float -0.0331445783
	.word	0x3ec50b6f                      # float 0.384852856
	.word	0xbf0240e4                      # float -0.508802652
	.word	0x3e314126                      # float 0.173100084
	.word	0xbee9a381                      # float -0.456325561
	.word	0x3eab572d                      # float 0.334649473
	.word	0x3dcfa77d                      # float 0.101393677
	.word	0xbdadb4d1                      # float -0.0848175361
	.word	0x3ed47ca7                      # float 0.415013522
	.word	0x3f0c59e2                      # float 0.548246503
	.word	0xbd53feda                      # float -0.0517567173
	.word	0x3f0ef2bf                      # float 0.558391511
	.word	0xbe7535f5                      # float -0.239463642
	.word	0xbe5a117e                      # float -0.212957352
	.word	0x3c864da4                      # float 0.0163944438
	.word	0xbea50af6                      # float -0.32234925
	.word	0x3e52e560                      # float 0.205953121
	.word	0xbe91c5b8                      # float -0.284711599
	.word	0x3d9ace9f                      # float 0.075589411
	.word	0x3e11a277                      # float 0.142221317
	.word	0xbf139e06                      # float -0.576629996
	.word	0xbe6d6984                      # float -0.231847823
	.word	0xbe25916e                      # float -0.161687583
	.word	0xbf09f4c9                      # float -0.538891375
	.word	0x3eaee543                      # float 0.341592878
	.word	0xbf1395b9                      # float -0.576503336
	.word	0x3ee330e5                      # float 0.443732411
	.word	0xbea39c74                      # float -0.319553018
	.word	0xbe2b92bc                      # float -0.167551935
	.word	0x3e1215ca                      # float 0.142661244
	.word	0x3e28fe35                      # float 0.165032223
	.word	0xbf138d80                      # float -0.576377869
	.size	.L__constant_12x3xf32, 144

	.type	.L__constant_3x12xf32,@object   # @__constant_3x12xf32
	.p2align	4
.L__constant_3x12xf32:
	.word	0x3e252565                      # float 0.161275461
	.word	0x3dcad9e1                      # float 0.0990483835
	.word	0x3e0f9739                      # float 0.140225306
	.word	0x3d973277                      # float 0.0738267228
	.word	0xbcbc8e05                      # float -0.0230169389
	.word	0xbe442991                      # float -0.191564813
	.word	0x3e15424b                      # float 0.1457607
	.word	0x3e4a80e5                      # float 0.197757319
	.word	0xbdc723fe                      # float -0.0972366183
	.word	0x3e018b7a                      # float 0.126508623
	.word	0x3e0e8c33                      # float 0.139206693
	.word	0xbd8d1a55                      # float -0.0688978806
	.word	0xbe345fef                      # float -0.176147208
	.word	0xbe5b1888                      # float -0.213960767
	.word	0xbe4ace8a                      # float -0.198053509
	.word	0xbd1da8ca                      # float -0.0384910479
	.word	0xbe7b79cd                      # float -0.245581821
	.word	0x3e0f0b9b                      # float 0.139692709
	.word	0xbe88e001                      # float -0.267334014
	.word	0xbe6470a3                      # float -0.223085925
	.word	0xbe48bbc8                      # float -0.196028829
	.word	0xbe68163d                      # float -0.226647332
	.word	0xbc2b84ee                      # float -0.0104687046
	.word	0x3e02d4e4                      # float 0.127765238
	.word	0x3dcbbe13                      # float 0.0994836315
	.word	0xbe031ec2                      # float -0.128047019
	.word	0xbdbbf250                      # float -0.0917707682
	.word	0x3dec77b7                      # float 0.115462713
	.word	0x3d33020f                      # float 0.0437031351
	.word	0xbd7b4437                      # float -0.0613443516
	.word	0x3c6df8b3                      # float 0.0145246265
	.word	0x3e76a48d                      # float 0.240862086
	.word	0x3e08c255                      # float 0.133553818
	.word	0xbcfa0364                      # float -0.0305191949
	.word	0xbe92c88c                      # float -0.286686301
	.word	0xbe515f44                      # float -0.204464972
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

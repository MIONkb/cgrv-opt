; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_1_1_14_1_1_gvn.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_1(ptr nocapture readonly %arg, ptr nocapture readonly %arg1, ptr nocapture readonly %arg2, ptr nocapture readonly %arg3, ptr nocapture readonly %arg4, ptr nocapture writeonly %arg5) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %bb6, !dbg !7

bb6:                                              ; preds = %bb139, %bb
  %i = phi i64 [ 0, %bb ], [ %i140, %bb139 ]
  %i7 = load float, ptr %arg, align 4, !dbg !9
  %i8 = load float, ptr %arg1, align 4, !dbg !10
  %i9 = load float, ptr %arg2, align 4, !dbg !11
  %i10 = load float, ptr %arg3, align 4, !dbg !12
  %i11 = mul nuw nsw i64 %i, 112
  %i12 = fadd float %i10, 0x3EE4F8B580000000
  %i13 = fmul float %i12, 5.000000e-01
  %i14 = bitcast float %i12 to i32
  %i15 = lshr i32 %i14, 1
  %i16 = sub nsw i32 1597463007, %i15
  %i17 = bitcast i32 %i16 to float
  %i18 = fmul float %i17, %i17
  %i19 = fmul float %i13, %i18
  %i20 = fsub float 1.500000e+00, %i19
  %i21 = fmul float %i18, %i20
  br label %bb22, !dbg !13

bb22:                                             ; preds = %bb22, %bb6
  %i23 = phi i64 [ 0, %bb6 ], [ %i137, %bb22 ]
  %i24 = add nuw nsw i64 %i23, %i11, !dbg !14
  %i25 = getelementptr float, ptr %arg4, i64 %i24, !dbg !15
  %i26 = load float, ptr %i25, align 4, !dbg !16
  %i27 = fsub float %i26, %i9, !dbg !17
  %i28 = fmul float %i21, %i27, !dbg !18
  %i29 = fmul float %i7, %i28, !dbg !19
  %i30 = fadd float %i8, %i29, !dbg !20
  %i31 = getelementptr float, ptr %arg5, i64 %i24, !dbg !21
  store float %i30, ptr %i31, align 4, !dbg !22
  %i32 = or i64 %i23, 1, !dbg !23
  %i33 = add nuw nsw i64 %i32, %i11, !dbg !24
  %i34 = getelementptr float, ptr %arg4, i64 %i33, !dbg !25
  %i35 = load float, ptr %i34, align 4, !dbg !26
  %i36 = fsub float %i35, %i9, !dbg !27
  %i37 = fmul float %i21, %i36, !dbg !28
  %i38 = fmul float %i7, %i37, !dbg !29
  %i39 = fadd float %i8, %i38, !dbg !30
  %i40 = getelementptr float, ptr %arg5, i64 %i33, !dbg !31
  store float %i39, ptr %i40, align 4, !dbg !32
  %i41 = add nuw nsw i64 %i24, 2, !dbg !33
  %i42 = getelementptr float, ptr %arg4, i64 %i41, !dbg !34
  %i43 = load float, ptr %i42, align 4, !dbg !35
  %i44 = fsub float %i43, %i9, !dbg !36
  %i45 = fmul float %i21, %i44, !dbg !37
  %i46 = fmul float %i7, %i45, !dbg !38
  %i47 = fadd float %i8, %i46, !dbg !39
  %i48 = getelementptr float, ptr %arg5, i64 %i41, !dbg !40
  store float %i47, ptr %i48, align 4, !dbg !41
  %i49 = add nuw nsw i64 %i24, 3, !dbg !42
  %i50 = getelementptr float, ptr %arg4, i64 %i49, !dbg !43
  %i51 = load float, ptr %i50, align 4, !dbg !44
  %i52 = fsub float %i51, %i9, !dbg !45
  %i53 = fmul float %i21, %i52, !dbg !46
  %i54 = fmul float %i7, %i53, !dbg !47
  %i55 = fadd float %i8, %i54, !dbg !48
  %i56 = getelementptr float, ptr %arg5, i64 %i49, !dbg !49
  store float %i55, ptr %i56, align 4, !dbg !50
  %i57 = add nuw nsw i64 %i24, 4, !dbg !51
  %i58 = getelementptr float, ptr %arg4, i64 %i57, !dbg !52
  %i59 = load float, ptr %i58, align 4, !dbg !53
  %i60 = fsub float %i59, %i9, !dbg !54
  %i61 = fmul float %i21, %i60, !dbg !55
  %i62 = fmul float %i7, %i61, !dbg !56
  %i63 = fadd float %i8, %i62, !dbg !57
  %i64 = getelementptr float, ptr %arg5, i64 %i57, !dbg !58
  store float %i63, ptr %i64, align 4, !dbg !59
  %i65 = add nuw nsw i64 %i24, 5, !dbg !60
  %i66 = getelementptr float, ptr %arg4, i64 %i65, !dbg !61
  %i67 = load float, ptr %i66, align 4, !dbg !62
  %i68 = fsub float %i67, %i9, !dbg !63
  %i69 = fmul float %i21, %i68, !dbg !64
  %i70 = fmul float %i7, %i69, !dbg !65
  %i71 = fadd float %i8, %i70, !dbg !66
  %i72 = getelementptr float, ptr %arg5, i64 %i65, !dbg !67
  store float %i71, ptr %i72, align 4, !dbg !68
  %i73 = add nuw nsw i64 %i24, 6, !dbg !69
  %i74 = getelementptr float, ptr %arg4, i64 %i73, !dbg !70
  %i75 = load float, ptr %i74, align 4, !dbg !71
  %i76 = fsub float %i75, %i9, !dbg !72
  %i77 = fmul float %i21, %i76, !dbg !73
  %i78 = fmul float %i7, %i77, !dbg !74
  %i79 = fadd float %i8, %i78, !dbg !75
  %i80 = getelementptr float, ptr %arg5, i64 %i73, !dbg !76
  store float %i79, ptr %i80, align 4, !dbg !77
  %i81 = add nuw nsw i64 %i24, 7, !dbg !78
  %i82 = getelementptr float, ptr %arg4, i64 %i81, !dbg !79
  %i83 = load float, ptr %i82, align 4, !dbg !80
  %i84 = fsub float %i83, %i9, !dbg !81
  %i85 = fmul float %i21, %i84, !dbg !82
  %i86 = fmul float %i7, %i85, !dbg !83
  %i87 = fadd float %i8, %i86, !dbg !84
  %i88 = getelementptr float, ptr %arg5, i64 %i81, !dbg !85
  store float %i87, ptr %i88, align 4, !dbg !86
  %i89 = add nuw nsw i64 %i24, 8, !dbg !87
  %i90 = getelementptr float, ptr %arg4, i64 %i89, !dbg !88
  %i91 = load float, ptr %i90, align 4, !dbg !89
  %i92 = fsub float %i91, %i9, !dbg !90
  %i93 = fmul float %i21, %i92, !dbg !91
  %i94 = fmul float %i7, %i93, !dbg !92
  %i95 = fadd float %i8, %i94, !dbg !93
  %i96 = getelementptr float, ptr %arg5, i64 %i89, !dbg !94
  store float %i95, ptr %i96, align 4, !dbg !95
  %i97 = add nuw nsw i64 %i24, 9, !dbg !96
  %i98 = getelementptr float, ptr %arg4, i64 %i97, !dbg !97
  %i99 = load float, ptr %i98, align 4, !dbg !98
  %i100 = fsub float %i99, %i9, !dbg !99
  %i101 = fmul float %i21, %i100, !dbg !100
  %i102 = fmul float %i7, %i101, !dbg !101
  %i103 = fadd float %i8, %i102, !dbg !102
  %i104 = getelementptr float, ptr %arg5, i64 %i97, !dbg !103
  store float %i103, ptr %i104, align 4, !dbg !104
  %i105 = add nuw nsw i64 %i24, 10, !dbg !105
  %i106 = getelementptr float, ptr %arg4, i64 %i105, !dbg !106
  %i107 = load float, ptr %i106, align 4, !dbg !107
  %i108 = fsub float %i107, %i9, !dbg !108
  %i109 = fmul float %i21, %i108, !dbg !109
  %i110 = fmul float %i7, %i109, !dbg !110
  %i111 = fadd float %i8, %i110, !dbg !111
  %i112 = getelementptr float, ptr %arg5, i64 %i105, !dbg !112
  store float %i111, ptr %i112, align 4, !dbg !113
  %i113 = add nuw nsw i64 %i24, 11, !dbg !114
  %i114 = getelementptr float, ptr %arg4, i64 %i113, !dbg !115
  %i115 = load float, ptr %i114, align 4, !dbg !116
  %i116 = fsub float %i115, %i9, !dbg !117
  %i117 = fmul float %i21, %i116, !dbg !118
  %i118 = fmul float %i7, %i117, !dbg !119
  %i119 = fadd float %i8, %i118, !dbg !120
  %i120 = getelementptr float, ptr %arg5, i64 %i113, !dbg !121
  store float %i119, ptr %i120, align 4, !dbg !122
  %i121 = add nuw nsw i64 %i24, 12, !dbg !123
  %i122 = getelementptr float, ptr %arg4, i64 %i121, !dbg !124
  %i123 = load float, ptr %i122, align 4, !dbg !125
  %i124 = fsub float %i123, %i9, !dbg !126
  %i125 = fmul float %i21, %i124, !dbg !127
  %i126 = fmul float %i7, %i125, !dbg !128
  %i127 = fadd float %i8, %i126, !dbg !129
  %i128 = getelementptr float, ptr %arg5, i64 %i121, !dbg !130
  store float %i127, ptr %i128, align 4, !dbg !131
  %i129 = add nuw nsw i64 %i24, 13, !dbg !132
  %i130 = getelementptr float, ptr %arg4, i64 %i129, !dbg !133
  %i131 = load float, ptr %i130, align 4, !dbg !134
  %i132 = fsub float %i131, %i9, !dbg !135
  %i133 = fmul float %i21, %i132, !dbg !136
  %i134 = fmul float %i7, %i133, !dbg !137
  %i135 = fadd float %i8, %i134, !dbg !138
  %i136 = getelementptr float, ptr %arg5, i64 %i129, !dbg !139
  store float %i135, ptr %i136, align 4, !dbg !140
  %i137 = add nuw nsw i64 %i23, 14, !dbg !141
  %i138 = icmp ult i64 %i23, 98, !dbg !142
  br i1 %i138, label %bb22, label %bb139, !dbg !13

bb139:                                            ; preds = %bb22
  %i140 = add nuw nsw i64 %i, 1, !dbg !143
  %i141 = icmp ult i64 %i, 15, !dbg !144
  br i1 %i141, label %bb6, label %bb142, !dbg !7

bb142:                                            ; preds = %bb139
  ret void, !dbg !145
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_1", linkageName: "forward_kernel_1", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_1_1_14_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 32, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 34, column: 11, scope: !8)
!10 = !DILocation(line: 35, column: 11, scope: !8)
!11 = !DILocation(line: 36, column: 11, scope: !8)
!12 = !DILocation(line: 37, column: 11, scope: !8)
!13 = !DILocation(line: 41, column: 5, scope: !8)
!14 = !DILocation(line: 48, column: 11, scope: !8)
!15 = !DILocation(line: 49, column: 11, scope: !8)
!16 = !DILocation(line: 50, column: 11, scope: !8)
!17 = !DILocation(line: 62, column: 11, scope: !8)
!18 = !DILocation(line: 63, column: 11, scope: !8)
!19 = !DILocation(line: 64, column: 11, scope: !8)
!20 = !DILocation(line: 65, column: 11, scope: !8)
!21 = !DILocation(line: 72, column: 11, scope: !8)
!22 = !DILocation(line: 73, column: 5, scope: !8)
!23 = !DILocation(line: 74, column: 11, scope: !8)
!24 = !DILocation(line: 80, column: 11, scope: !8)
!25 = !DILocation(line: 81, column: 11, scope: !8)
!26 = !DILocation(line: 82, column: 11, scope: !8)
!27 = !DILocation(line: 94, column: 11, scope: !8)
!28 = !DILocation(line: 95, column: 11, scope: !8)
!29 = !DILocation(line: 96, column: 11, scope: !8)
!30 = !DILocation(line: 97, column: 11, scope: !8)
!31 = !DILocation(line: 104, column: 11, scope: !8)
!32 = !DILocation(line: 105, column: 5, scope: !8)
!33 = !DILocation(line: 112, column: 11, scope: !8)
!34 = !DILocation(line: 113, column: 12, scope: !8)
!35 = !DILocation(line: 114, column: 12, scope: !8)
!36 = !DILocation(line: 126, column: 12, scope: !8)
!37 = !DILocation(line: 127, column: 12, scope: !8)
!38 = !DILocation(line: 128, column: 12, scope: !8)
!39 = !DILocation(line: 129, column: 12, scope: !8)
!40 = !DILocation(line: 136, column: 12, scope: !8)
!41 = !DILocation(line: 137, column: 5, scope: !8)
!42 = !DILocation(line: 144, column: 12, scope: !8)
!43 = !DILocation(line: 145, column: 12, scope: !8)
!44 = !DILocation(line: 146, column: 12, scope: !8)
!45 = !DILocation(line: 158, column: 12, scope: !8)
!46 = !DILocation(line: 159, column: 12, scope: !8)
!47 = !DILocation(line: 160, column: 12, scope: !8)
!48 = !DILocation(line: 161, column: 12, scope: !8)
!49 = !DILocation(line: 168, column: 12, scope: !8)
!50 = !DILocation(line: 169, column: 5, scope: !8)
!51 = !DILocation(line: 176, column: 12, scope: !8)
!52 = !DILocation(line: 177, column: 12, scope: !8)
!53 = !DILocation(line: 178, column: 12, scope: !8)
!54 = !DILocation(line: 190, column: 12, scope: !8)
!55 = !DILocation(line: 191, column: 12, scope: !8)
!56 = !DILocation(line: 192, column: 12, scope: !8)
!57 = !DILocation(line: 193, column: 12, scope: !8)
!58 = !DILocation(line: 200, column: 12, scope: !8)
!59 = !DILocation(line: 201, column: 5, scope: !8)
!60 = !DILocation(line: 208, column: 12, scope: !8)
!61 = !DILocation(line: 209, column: 12, scope: !8)
!62 = !DILocation(line: 210, column: 12, scope: !8)
!63 = !DILocation(line: 222, column: 12, scope: !8)
!64 = !DILocation(line: 223, column: 12, scope: !8)
!65 = !DILocation(line: 224, column: 12, scope: !8)
!66 = !DILocation(line: 225, column: 12, scope: !8)
!67 = !DILocation(line: 232, column: 12, scope: !8)
!68 = !DILocation(line: 233, column: 5, scope: !8)
!69 = !DILocation(line: 240, column: 12, scope: !8)
!70 = !DILocation(line: 241, column: 12, scope: !8)
!71 = !DILocation(line: 242, column: 12, scope: !8)
!72 = !DILocation(line: 254, column: 12, scope: !8)
!73 = !DILocation(line: 255, column: 12, scope: !8)
!74 = !DILocation(line: 256, column: 12, scope: !8)
!75 = !DILocation(line: 257, column: 12, scope: !8)
!76 = !DILocation(line: 264, column: 12, scope: !8)
!77 = !DILocation(line: 265, column: 5, scope: !8)
!78 = !DILocation(line: 272, column: 12, scope: !8)
!79 = !DILocation(line: 273, column: 12, scope: !8)
!80 = !DILocation(line: 274, column: 12, scope: !8)
!81 = !DILocation(line: 286, column: 12, scope: !8)
!82 = !DILocation(line: 287, column: 12, scope: !8)
!83 = !DILocation(line: 288, column: 12, scope: !8)
!84 = !DILocation(line: 289, column: 12, scope: !8)
!85 = !DILocation(line: 296, column: 12, scope: !8)
!86 = !DILocation(line: 297, column: 5, scope: !8)
!87 = !DILocation(line: 304, column: 12, scope: !8)
!88 = !DILocation(line: 305, column: 12, scope: !8)
!89 = !DILocation(line: 306, column: 12, scope: !8)
!90 = !DILocation(line: 318, column: 12, scope: !8)
!91 = !DILocation(line: 319, column: 12, scope: !8)
!92 = !DILocation(line: 320, column: 12, scope: !8)
!93 = !DILocation(line: 321, column: 12, scope: !8)
!94 = !DILocation(line: 328, column: 12, scope: !8)
!95 = !DILocation(line: 329, column: 5, scope: !8)
!96 = !DILocation(line: 336, column: 12, scope: !8)
!97 = !DILocation(line: 337, column: 12, scope: !8)
!98 = !DILocation(line: 338, column: 12, scope: !8)
!99 = !DILocation(line: 350, column: 12, scope: !8)
!100 = !DILocation(line: 351, column: 12, scope: !8)
!101 = !DILocation(line: 352, column: 12, scope: !8)
!102 = !DILocation(line: 353, column: 12, scope: !8)
!103 = !DILocation(line: 360, column: 12, scope: !8)
!104 = !DILocation(line: 361, column: 5, scope: !8)
!105 = !DILocation(line: 368, column: 12, scope: !8)
!106 = !DILocation(line: 369, column: 12, scope: !8)
!107 = !DILocation(line: 370, column: 12, scope: !8)
!108 = !DILocation(line: 382, column: 12, scope: !8)
!109 = !DILocation(line: 383, column: 12, scope: !8)
!110 = !DILocation(line: 384, column: 12, scope: !8)
!111 = !DILocation(line: 385, column: 12, scope: !8)
!112 = !DILocation(line: 392, column: 12, scope: !8)
!113 = !DILocation(line: 393, column: 5, scope: !8)
!114 = !DILocation(line: 400, column: 12, scope: !8)
!115 = !DILocation(line: 401, column: 12, scope: !8)
!116 = !DILocation(line: 402, column: 12, scope: !8)
!117 = !DILocation(line: 414, column: 12, scope: !8)
!118 = !DILocation(line: 415, column: 12, scope: !8)
!119 = !DILocation(line: 416, column: 12, scope: !8)
!120 = !DILocation(line: 417, column: 12, scope: !8)
!121 = !DILocation(line: 424, column: 12, scope: !8)
!122 = !DILocation(line: 425, column: 5, scope: !8)
!123 = !DILocation(line: 432, column: 12, scope: !8)
!124 = !DILocation(line: 433, column: 12, scope: !8)
!125 = !DILocation(line: 434, column: 12, scope: !8)
!126 = !DILocation(line: 446, column: 12, scope: !8)
!127 = !DILocation(line: 447, column: 12, scope: !8)
!128 = !DILocation(line: 448, column: 12, scope: !8)
!129 = !DILocation(line: 449, column: 12, scope: !8)
!130 = !DILocation(line: 456, column: 12, scope: !8)
!131 = !DILocation(line: 457, column: 5, scope: !8)
!132 = !DILocation(line: 464, column: 12, scope: !8)
!133 = !DILocation(line: 465, column: 12, scope: !8)
!134 = !DILocation(line: 466, column: 12, scope: !8)
!135 = !DILocation(line: 478, column: 12, scope: !8)
!136 = !DILocation(line: 479, column: 12, scope: !8)
!137 = !DILocation(line: 480, column: 12, scope: !8)
!138 = !DILocation(line: 481, column: 12, scope: !8)
!139 = !DILocation(line: 488, column: 12, scope: !8)
!140 = !DILocation(line: 489, column: 5, scope: !8)
!141 = !DILocation(line: 490, column: 12, scope: !8)
!142 = !DILocation(line: 40, column: 11, scope: !8)
!143 = !DILocation(line: 493, column: 12, scope: !8)
!144 = !DILocation(line: 31, column: 11, scope: !8)
!145 = !DILocation(line: 496, column: 5, scope: !8)
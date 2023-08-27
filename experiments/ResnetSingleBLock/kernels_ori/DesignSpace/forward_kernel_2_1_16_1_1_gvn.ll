; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_16_1_1_opt.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %arg, ptr nocapture writeonly %arg1) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %bb102, %bb
  %i = phi i64 [ 0, %bb ], [ %i103, %bb102 ]
  %i2 = mul nuw nsw i64 %i, 112
  br label %bb3, !dbg !9

bb3:                                              ; preds = %bb3, %.preheader
  %i4 = phi i64 [ 0, %.preheader ], [ %i100, %bb3 ]
  %i5 = add nuw nsw i64 %i4, %i2, !dbg !10
  %i6 = getelementptr float, ptr %arg, i64 %i5, !dbg !11
  %i7 = load float, ptr %i6, align 4, !dbg !12
  %.inv = fcmp ole float %i7, 0.000000e+00, !dbg !13
  %i8 = select i1 %.inv, float 0.000000e+00, float %i7, !dbg !13
  %i9 = getelementptr float, ptr %arg1, i64 %i5, !dbg !14
  store float %i8, ptr %i9, align 4, !dbg !15
  %i10 = or i64 %i4, 1, !dbg !16
  %i11 = add nuw nsw i64 %i10, %i2, !dbg !17
  %i12 = getelementptr float, ptr %arg, i64 %i11, !dbg !18
  %i13 = load float, ptr %i12, align 4, !dbg !19
  %.inv1 = fcmp ole float %i13, 0.000000e+00, !dbg !20
  %i14 = select i1 %.inv1, float 0.000000e+00, float %i13, !dbg !20
  %i15 = getelementptr float, ptr %arg1, i64 %i11, !dbg !21
  store float %i14, ptr %i15, align 4, !dbg !22
  %i16 = or i64 %i4, 2, !dbg !23
  %i17 = add nuw nsw i64 %i16, %i2, !dbg !24
  %i18 = getelementptr float, ptr %arg, i64 %i17, !dbg !25
  %i19 = load float, ptr %i18, align 4, !dbg !26
  %.inv2 = fcmp ole float %i19, 0.000000e+00, !dbg !27
  %i20 = select i1 %.inv2, float 0.000000e+00, float %i19, !dbg !27
  %i21 = getelementptr float, ptr %arg1, i64 %i17, !dbg !28
  store float %i20, ptr %i21, align 4, !dbg !29
  %i22 = or i64 %i4, 3, !dbg !30
  %i23 = add nuw nsw i64 %i22, %i2, !dbg !31
  %i24 = getelementptr float, ptr %arg, i64 %i23, !dbg !32
  %i25 = load float, ptr %i24, align 4, !dbg !33
  %.inv3 = fcmp ole float %i25, 0.000000e+00, !dbg !34
  %i26 = select i1 %.inv3, float 0.000000e+00, float %i25, !dbg !34
  %i27 = getelementptr float, ptr %arg1, i64 %i23, !dbg !35
  store float %i26, ptr %i27, align 4, !dbg !36
  %i28 = or i64 %i4, 4, !dbg !37
  %i29 = add nuw nsw i64 %i28, %i2, !dbg !38
  %i30 = getelementptr float, ptr %arg, i64 %i29, !dbg !39
  %i31 = load float, ptr %i30, align 4, !dbg !40
  %.inv4 = fcmp ole float %i31, 0.000000e+00, !dbg !41
  %i32 = select i1 %.inv4, float 0.000000e+00, float %i31, !dbg !41
  %i33 = getelementptr float, ptr %arg1, i64 %i29, !dbg !42
  store float %i32, ptr %i33, align 4, !dbg !43
  %i34 = or i64 %i4, 5, !dbg !44
  %i35 = add nuw nsw i64 %i34, %i2, !dbg !45
  %i36 = getelementptr float, ptr %arg, i64 %i35, !dbg !46
  %i37 = load float, ptr %i36, align 4, !dbg !47
  %.inv5 = fcmp ole float %i37, 0.000000e+00, !dbg !48
  %i38 = select i1 %.inv5, float 0.000000e+00, float %i37, !dbg !48
  %i39 = getelementptr float, ptr %arg1, i64 %i35, !dbg !49
  store float %i38, ptr %i39, align 4, !dbg !50
  %i40 = or i64 %i4, 6, !dbg !51
  %i41 = add nuw nsw i64 %i40, %i2, !dbg !52
  %i42 = getelementptr float, ptr %arg, i64 %i41, !dbg !53
  %i43 = load float, ptr %i42, align 4, !dbg !54
  %.inv6 = fcmp ole float %i43, 0.000000e+00, !dbg !55
  %i44 = select i1 %.inv6, float 0.000000e+00, float %i43, !dbg !55
  %i45 = getelementptr float, ptr %arg1, i64 %i41, !dbg !56
  store float %i44, ptr %i45, align 4, !dbg !57
  %i46 = or i64 %i4, 7, !dbg !58
  %i47 = add nuw nsw i64 %i46, %i2, !dbg !59
  %i48 = getelementptr float, ptr %arg, i64 %i47, !dbg !60
  %i49 = load float, ptr %i48, align 4, !dbg !61
  %.inv7 = fcmp ole float %i49, 0.000000e+00, !dbg !62
  %i50 = select i1 %.inv7, float 0.000000e+00, float %i49, !dbg !62
  %i51 = getelementptr float, ptr %arg1, i64 %i47, !dbg !63
  store float %i50, ptr %i51, align 4, !dbg !64
  %i52 = or i64 %i4, 8, !dbg !65
  %i53 = add nuw nsw i64 %i52, %i2, !dbg !66
  %i54 = getelementptr float, ptr %arg, i64 %i53, !dbg !67
  %i55 = load float, ptr %i54, align 4, !dbg !68
  %.inv8 = fcmp ole float %i55, 0.000000e+00, !dbg !69
  %i56 = select i1 %.inv8, float 0.000000e+00, float %i55, !dbg !69
  %i57 = getelementptr float, ptr %arg1, i64 %i53, !dbg !70
  store float %i56, ptr %i57, align 4, !dbg !71
  %i58 = or i64 %i4, 9, !dbg !72
  %i59 = add nuw nsw i64 %i58, %i2, !dbg !73
  %i60 = getelementptr float, ptr %arg, i64 %i59, !dbg !74
  %i61 = load float, ptr %i60, align 4, !dbg !75
  %.inv9 = fcmp ole float %i61, 0.000000e+00, !dbg !76
  %i62 = select i1 %.inv9, float 0.000000e+00, float %i61, !dbg !76
  %i63 = getelementptr float, ptr %arg1, i64 %i59, !dbg !77
  store float %i62, ptr %i63, align 4, !dbg !78
  %i64 = or i64 %i4, 10, !dbg !79
  %i65 = add nuw nsw i64 %i64, %i2, !dbg !80
  %i66 = getelementptr float, ptr %arg, i64 %i65, !dbg !81
  %i67 = load float, ptr %i66, align 4, !dbg !82
  %.inv10 = fcmp ole float %i67, 0.000000e+00, !dbg !83
  %i68 = select i1 %.inv10, float 0.000000e+00, float %i67, !dbg !83
  %i69 = getelementptr float, ptr %arg1, i64 %i65, !dbg !84
  store float %i68, ptr %i69, align 4, !dbg !85
  %i70 = or i64 %i4, 11, !dbg !86
  %i71 = add nuw nsw i64 %i70, %i2, !dbg !87
  %i72 = getelementptr float, ptr %arg, i64 %i71, !dbg !88
  %i73 = load float, ptr %i72, align 4, !dbg !89
  %.inv11 = fcmp ole float %i73, 0.000000e+00, !dbg !90
  %i74 = select i1 %.inv11, float 0.000000e+00, float %i73, !dbg !90
  %i75 = getelementptr float, ptr %arg1, i64 %i71, !dbg !91
  store float %i74, ptr %i75, align 4, !dbg !92
  %i76 = or i64 %i4, 12, !dbg !93
  %i77 = add nuw nsw i64 %i76, %i2, !dbg !94
  %i78 = getelementptr float, ptr %arg, i64 %i77, !dbg !95
  %i79 = load float, ptr %i78, align 4, !dbg !96
  %.inv12 = fcmp ole float %i79, 0.000000e+00, !dbg !97
  %i80 = select i1 %.inv12, float 0.000000e+00, float %i79, !dbg !97
  %i81 = getelementptr float, ptr %arg1, i64 %i77, !dbg !98
  store float %i80, ptr %i81, align 4, !dbg !99
  %i82 = or i64 %i4, 13, !dbg !100
  %i83 = add nuw nsw i64 %i82, %i2, !dbg !101
  %i84 = getelementptr float, ptr %arg, i64 %i83, !dbg !102
  %i85 = load float, ptr %i84, align 4, !dbg !103
  %.inv13 = fcmp ole float %i85, 0.000000e+00, !dbg !104
  %i86 = select i1 %.inv13, float 0.000000e+00, float %i85, !dbg !104
  %i87 = getelementptr float, ptr %arg1, i64 %i83, !dbg !105
  store float %i86, ptr %i87, align 4, !dbg !106
  %i88 = or i64 %i4, 14, !dbg !107
  %i89 = add nuw nsw i64 %i88, %i2, !dbg !108
  %i90 = getelementptr float, ptr %arg, i64 %i89, !dbg !109
  %i91 = load float, ptr %i90, align 4, !dbg !110
  %.inv14 = fcmp ole float %i91, 0.000000e+00, !dbg !111
  %i92 = select i1 %.inv14, float 0.000000e+00, float %i91, !dbg !111
  %i93 = getelementptr float, ptr %arg1, i64 %i89, !dbg !112
  store float %i92, ptr %i93, align 4, !dbg !113
  %i94 = or i64 %i4, 15, !dbg !114
  %i95 = add nuw nsw i64 %i94, %i2, !dbg !115
  %i96 = getelementptr float, ptr %arg, i64 %i95, !dbg !116
  %i97 = load float, ptr %i96, align 4, !dbg !117
  %.inv15 = fcmp ole float %i97, 0.000000e+00, !dbg !118
  %i98 = select i1 %.inv15, float 0.000000e+00, float %i97, !dbg !118
  %i99 = getelementptr float, ptr %arg1, i64 %i95, !dbg !119
  store float %i98, ptr %i99, align 4, !dbg !120
  %i100 = add nuw nsw i64 %i4, 16, !dbg !121
  %i101 = icmp ult i64 %i4, 96, !dbg !122
  br i1 %i101, label %bb3, label %bb102, !dbg !9

bb102:                                            ; preds = %bb3
  %i103 = add nuw nsw i64 %i, 1, !dbg !123
  %i104 = icmp ult i64 %i, 15, !dbg !124
  br i1 %i104, label %.preheader, label %bb105, !dbg !7

bb105:                                            ; preds = %bb102
  ret void, !dbg !125
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_16_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 29, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 34, column: 5, scope: !8)
!10 = !DILocation(line: 41, column: 11, scope: !8)
!11 = !DILocation(line: 42, column: 11, scope: !8)
!12 = !DILocation(line: 43, column: 11, scope: !8)
!13 = !DILocation(line: 45, column: 11, scope: !8)
!14 = !DILocation(line: 52, column: 11, scope: !8)
!15 = !DILocation(line: 53, column: 5, scope: !8)
!16 = !DILocation(line: 54, column: 11, scope: !8)
!17 = !DILocation(line: 60, column: 11, scope: !8)
!18 = !DILocation(line: 61, column: 11, scope: !8)
!19 = !DILocation(line: 62, column: 11, scope: !8)
!20 = !DILocation(line: 64, column: 11, scope: !8)
!21 = !DILocation(line: 71, column: 11, scope: !8)
!22 = !DILocation(line: 72, column: 5, scope: !8)
!23 = !DILocation(line: 73, column: 11, scope: !8)
!24 = !DILocation(line: 79, column: 11, scope: !8)
!25 = !DILocation(line: 80, column: 11, scope: !8)
!26 = !DILocation(line: 81, column: 11, scope: !8)
!27 = !DILocation(line: 83, column: 11, scope: !8)
!28 = !DILocation(line: 90, column: 11, scope: !8)
!29 = !DILocation(line: 91, column: 5, scope: !8)
!30 = !DILocation(line: 92, column: 11, scope: !8)
!31 = !DILocation(line: 98, column: 11, scope: !8)
!32 = !DILocation(line: 99, column: 11, scope: !8)
!33 = !DILocation(line: 100, column: 11, scope: !8)
!34 = !DILocation(line: 102, column: 11, scope: !8)
!35 = !DILocation(line: 109, column: 11, scope: !8)
!36 = !DILocation(line: 110, column: 5, scope: !8)
!37 = !DILocation(line: 111, column: 11, scope: !8)
!38 = !DILocation(line: 117, column: 12, scope: !8)
!39 = !DILocation(line: 118, column: 12, scope: !8)
!40 = !DILocation(line: 119, column: 12, scope: !8)
!41 = !DILocation(line: 121, column: 12, scope: !8)
!42 = !DILocation(line: 128, column: 12, scope: !8)
!43 = !DILocation(line: 129, column: 5, scope: !8)
!44 = !DILocation(line: 130, column: 12, scope: !8)
!45 = !DILocation(line: 136, column: 12, scope: !8)
!46 = !DILocation(line: 137, column: 12, scope: !8)
!47 = !DILocation(line: 138, column: 12, scope: !8)
!48 = !DILocation(line: 140, column: 12, scope: !8)
!49 = !DILocation(line: 147, column: 12, scope: !8)
!50 = !DILocation(line: 148, column: 5, scope: !8)
!51 = !DILocation(line: 149, column: 12, scope: !8)
!52 = !DILocation(line: 155, column: 12, scope: !8)
!53 = !DILocation(line: 156, column: 12, scope: !8)
!54 = !DILocation(line: 157, column: 12, scope: !8)
!55 = !DILocation(line: 159, column: 12, scope: !8)
!56 = !DILocation(line: 166, column: 12, scope: !8)
!57 = !DILocation(line: 167, column: 5, scope: !8)
!58 = !DILocation(line: 168, column: 12, scope: !8)
!59 = !DILocation(line: 174, column: 12, scope: !8)
!60 = !DILocation(line: 175, column: 12, scope: !8)
!61 = !DILocation(line: 176, column: 12, scope: !8)
!62 = !DILocation(line: 178, column: 12, scope: !8)
!63 = !DILocation(line: 185, column: 12, scope: !8)
!64 = !DILocation(line: 186, column: 5, scope: !8)
!65 = !DILocation(line: 187, column: 12, scope: !8)
!66 = !DILocation(line: 193, column: 12, scope: !8)
!67 = !DILocation(line: 194, column: 12, scope: !8)
!68 = !DILocation(line: 195, column: 12, scope: !8)
!69 = !DILocation(line: 197, column: 12, scope: !8)
!70 = !DILocation(line: 204, column: 12, scope: !8)
!71 = !DILocation(line: 205, column: 5, scope: !8)
!72 = !DILocation(line: 206, column: 12, scope: !8)
!73 = !DILocation(line: 212, column: 12, scope: !8)
!74 = !DILocation(line: 213, column: 12, scope: !8)
!75 = !DILocation(line: 214, column: 12, scope: !8)
!76 = !DILocation(line: 216, column: 12, scope: !8)
!77 = !DILocation(line: 223, column: 12, scope: !8)
!78 = !DILocation(line: 224, column: 5, scope: !8)
!79 = !DILocation(line: 225, column: 12, scope: !8)
!80 = !DILocation(line: 231, column: 12, scope: !8)
!81 = !DILocation(line: 232, column: 12, scope: !8)
!82 = !DILocation(line: 233, column: 12, scope: !8)
!83 = !DILocation(line: 235, column: 12, scope: !8)
!84 = !DILocation(line: 242, column: 12, scope: !8)
!85 = !DILocation(line: 243, column: 5, scope: !8)
!86 = !DILocation(line: 244, column: 12, scope: !8)
!87 = !DILocation(line: 250, column: 12, scope: !8)
!88 = !DILocation(line: 251, column: 12, scope: !8)
!89 = !DILocation(line: 252, column: 12, scope: !8)
!90 = !DILocation(line: 254, column: 12, scope: !8)
!91 = !DILocation(line: 261, column: 12, scope: !8)
!92 = !DILocation(line: 262, column: 5, scope: !8)
!93 = !DILocation(line: 263, column: 12, scope: !8)
!94 = !DILocation(line: 269, column: 12, scope: !8)
!95 = !DILocation(line: 270, column: 12, scope: !8)
!96 = !DILocation(line: 271, column: 12, scope: !8)
!97 = !DILocation(line: 273, column: 12, scope: !8)
!98 = !DILocation(line: 280, column: 12, scope: !8)
!99 = !DILocation(line: 281, column: 5, scope: !8)
!100 = !DILocation(line: 282, column: 12, scope: !8)
!101 = !DILocation(line: 288, column: 12, scope: !8)
!102 = !DILocation(line: 289, column: 12, scope: !8)
!103 = !DILocation(line: 290, column: 12, scope: !8)
!104 = !DILocation(line: 292, column: 12, scope: !8)
!105 = !DILocation(line: 299, column: 12, scope: !8)
!106 = !DILocation(line: 300, column: 5, scope: !8)
!107 = !DILocation(line: 301, column: 12, scope: !8)
!108 = !DILocation(line: 307, column: 12, scope: !8)
!109 = !DILocation(line: 308, column: 12, scope: !8)
!110 = !DILocation(line: 309, column: 12, scope: !8)
!111 = !DILocation(line: 311, column: 12, scope: !8)
!112 = !DILocation(line: 318, column: 12, scope: !8)
!113 = !DILocation(line: 319, column: 5, scope: !8)
!114 = !DILocation(line: 320, column: 12, scope: !8)
!115 = !DILocation(line: 326, column: 12, scope: !8)
!116 = !DILocation(line: 327, column: 12, scope: !8)
!117 = !DILocation(line: 328, column: 12, scope: !8)
!118 = !DILocation(line: 330, column: 12, scope: !8)
!119 = !DILocation(line: 337, column: 12, scope: !8)
!120 = !DILocation(line: 338, column: 5, scope: !8)
!121 = !DILocation(line: 339, column: 12, scope: !8)
!122 = !DILocation(line: 33, column: 11, scope: !8)
!123 = !DILocation(line: 342, column: 12, scope: !8)
!124 = !DILocation(line: 28, column: 11, scope: !8)
!125 = !DILocation(line: 345, column: 5, scope: !8)

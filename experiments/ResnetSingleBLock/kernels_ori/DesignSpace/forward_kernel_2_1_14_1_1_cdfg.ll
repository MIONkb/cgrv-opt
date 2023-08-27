; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_14_1_1_gvn.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %arg, ptr nocapture writeonly %arg1) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %bb78, %bb
  %i = phi i64 [ 0, %bb ], [ %i79, %bb78 ]
  %i2 = mul nuw nsw i64 %i, 112
  br label %bb3, !dbg !9

bb3:                                              ; preds = %bb3, %.preheader
  %i4 = phi i64 [ 0, %.preheader ], [ %i76, %bb3 ]
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
  %i16 = add nuw nsw i64 %i5, 2, !dbg !23
  %i17 = getelementptr float, ptr %arg, i64 %i16, !dbg !24
  %i18 = load float, ptr %i17, align 4, !dbg !25
  %.inv2 = fcmp ole float %i18, 0.000000e+00, !dbg !26
  %i19 = select i1 %.inv2, float 0.000000e+00, float %i18, !dbg !26
  %i20 = getelementptr float, ptr %arg1, i64 %i16, !dbg !27
  store float %i19, ptr %i20, align 4, !dbg !28
  %i21 = add nuw nsw i64 %i5, 3, !dbg !29
  %i22 = getelementptr float, ptr %arg, i64 %i21, !dbg !30
  %i23 = load float, ptr %i22, align 4, !dbg !31
  %.inv3 = fcmp ole float %i23, 0.000000e+00, !dbg !32
  %i24 = select i1 %.inv3, float 0.000000e+00, float %i23, !dbg !32
  %i25 = getelementptr float, ptr %arg1, i64 %i21, !dbg !33
  store float %i24, ptr %i25, align 4, !dbg !34
  %i26 = add nuw nsw i64 %i5, 4, !dbg !35
  %i27 = getelementptr float, ptr %arg, i64 %i26, !dbg !36
  %i28 = load float, ptr %i27, align 4, !dbg !37
  %.inv4 = fcmp ole float %i28, 0.000000e+00, !dbg !38
  %i29 = select i1 %.inv4, float 0.000000e+00, float %i28, !dbg !38
  %i30 = getelementptr float, ptr %arg1, i64 %i26, !dbg !39
  store float %i29, ptr %i30, align 4, !dbg !40
  %i31 = add nuw nsw i64 %i5, 5, !dbg !41
  %i32 = getelementptr float, ptr %arg, i64 %i31, !dbg !42
  %i33 = load float, ptr %i32, align 4, !dbg !43
  %.inv5 = fcmp ole float %i33, 0.000000e+00, !dbg !44
  %i34 = select i1 %.inv5, float 0.000000e+00, float %i33, !dbg !44
  %i35 = getelementptr float, ptr %arg1, i64 %i31, !dbg !45
  store float %i34, ptr %i35, align 4, !dbg !46
  %i36 = add nuw nsw i64 %i5, 6, !dbg !47
  %i37 = getelementptr float, ptr %arg, i64 %i36, !dbg !48
  %i38 = load float, ptr %i37, align 4, !dbg !49
  %.inv6 = fcmp ole float %i38, 0.000000e+00, !dbg !50
  %i39 = select i1 %.inv6, float 0.000000e+00, float %i38, !dbg !50
  %i40 = getelementptr float, ptr %arg1, i64 %i36, !dbg !51
  store float %i39, ptr %i40, align 4, !dbg !52
  %i41 = add nuw nsw i64 %i5, 7, !dbg !53
  %i42 = getelementptr float, ptr %arg, i64 %i41, !dbg !54
  %i43 = load float, ptr %i42, align 4, !dbg !55
  %.inv7 = fcmp ole float %i43, 0.000000e+00, !dbg !56
  %i44 = select i1 %.inv7, float 0.000000e+00, float %i43, !dbg !56
  %i45 = getelementptr float, ptr %arg1, i64 %i41, !dbg !57
  store float %i44, ptr %i45, align 4, !dbg !58
  %i46 = add nuw nsw i64 %i5, 8, !dbg !59
  %i47 = getelementptr float, ptr %arg, i64 %i46, !dbg !60
  %i48 = load float, ptr %i47, align 4, !dbg !61
  %.inv8 = fcmp ole float %i48, 0.000000e+00, !dbg !62
  %i49 = select i1 %.inv8, float 0.000000e+00, float %i48, !dbg !62
  %i50 = getelementptr float, ptr %arg1, i64 %i46, !dbg !63
  store float %i49, ptr %i50, align 4, !dbg !64
  %i51 = add nuw nsw i64 %i5, 9, !dbg !65
  %i52 = getelementptr float, ptr %arg, i64 %i51, !dbg !66
  %i53 = load float, ptr %i52, align 4, !dbg !67
  %.inv9 = fcmp ole float %i53, 0.000000e+00, !dbg !68
  %i54 = select i1 %.inv9, float 0.000000e+00, float %i53, !dbg !68
  %i55 = getelementptr float, ptr %arg1, i64 %i51, !dbg !69
  store float %i54, ptr %i55, align 4, !dbg !70
  %i56 = add nuw nsw i64 %i5, 10, !dbg !71
  %i57 = getelementptr float, ptr %arg, i64 %i56, !dbg !72
  %i58 = load float, ptr %i57, align 4, !dbg !73
  %.inv10 = fcmp ole float %i58, 0.000000e+00, !dbg !74
  %i59 = select i1 %.inv10, float 0.000000e+00, float %i58, !dbg !74
  %i60 = getelementptr float, ptr %arg1, i64 %i56, !dbg !75
  store float %i59, ptr %i60, align 4, !dbg !76
  %i61 = add nuw nsw i64 %i5, 11, !dbg !77
  %i62 = getelementptr float, ptr %arg, i64 %i61, !dbg !78
  %i63 = load float, ptr %i62, align 4, !dbg !79
  %.inv11 = fcmp ole float %i63, 0.000000e+00, !dbg !80
  %i64 = select i1 %.inv11, float 0.000000e+00, float %i63, !dbg !80
  %i65 = getelementptr float, ptr %arg1, i64 %i61, !dbg !81
  store float %i64, ptr %i65, align 4, !dbg !82
  %i66 = add nuw nsw i64 %i5, 12, !dbg !83
  %i67 = getelementptr float, ptr %arg, i64 %i66, !dbg !84
  %i68 = load float, ptr %i67, align 4, !dbg !85
  %.inv12 = fcmp ole float %i68, 0.000000e+00, !dbg !86
  %i69 = select i1 %.inv12, float 0.000000e+00, float %i68, !dbg !86
  %i70 = getelementptr float, ptr %arg1, i64 %i66, !dbg !87
  store float %i69, ptr %i70, align 4, !dbg !88
  %i71 = add nuw nsw i64 %i5, 13, !dbg !89
  %i72 = getelementptr float, ptr %arg, i64 %i71, !dbg !90
  %i73 = load float, ptr %i72, align 4, !dbg !91
  %.inv13 = fcmp ole float %i73, 0.000000e+00, !dbg !92
  %i74 = select i1 %.inv13, float 0.000000e+00, float %i73, !dbg !92
  %i75 = getelementptr float, ptr %arg1, i64 %i71, !dbg !93
  store float %i74, ptr %i75, align 4, !dbg !94
  %i76 = add nuw nsw i64 %i4, 14, !dbg !95
  %i77 = icmp ult i64 %i4, 98, !dbg !96
  br i1 %i77, label %bb3, label %bb78, !dbg !9

bb78:                                             ; preds = %bb3
  %i79 = add nuw nsw i64 %i, 1, !dbg !97
  %i80 = icmp ult i64 %i, 15, !dbg !98
  br i1 %i80, label %.preheader, label %bb81, !dbg !7

bb81:                                             ; preds = %bb78
  ret void, !dbg !99
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_14_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 28, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 33, column: 5, scope: !8)
!10 = !DILocation(line: 40, column: 11, scope: !8)
!11 = !DILocation(line: 41, column: 11, scope: !8)
!12 = !DILocation(line: 42, column: 11, scope: !8)
!13 = !DILocation(line: 44, column: 11, scope: !8)
!14 = !DILocation(line: 51, column: 11, scope: !8)
!15 = !DILocation(line: 52, column: 5, scope: !8)
!16 = !DILocation(line: 53, column: 11, scope: !8)
!17 = !DILocation(line: 59, column: 11, scope: !8)
!18 = !DILocation(line: 60, column: 11, scope: !8)
!19 = !DILocation(line: 61, column: 11, scope: !8)
!20 = !DILocation(line: 63, column: 11, scope: !8)
!21 = !DILocation(line: 70, column: 11, scope: !8)
!22 = !DILocation(line: 71, column: 5, scope: !8)
!23 = !DILocation(line: 78, column: 11, scope: !8)
!24 = !DILocation(line: 79, column: 11, scope: !8)
!25 = !DILocation(line: 80, column: 11, scope: !8)
!26 = !DILocation(line: 82, column: 11, scope: !8)
!27 = !DILocation(line: 89, column: 11, scope: !8)
!28 = !DILocation(line: 90, column: 5, scope: !8)
!29 = !DILocation(line: 97, column: 11, scope: !8)
!30 = !DILocation(line: 98, column: 11, scope: !8)
!31 = !DILocation(line: 99, column: 11, scope: !8)
!32 = !DILocation(line: 101, column: 11, scope: !8)
!33 = !DILocation(line: 108, column: 11, scope: !8)
!34 = !DILocation(line: 109, column: 5, scope: !8)
!35 = !DILocation(line: 116, column: 12, scope: !8)
!36 = !DILocation(line: 117, column: 12, scope: !8)
!37 = !DILocation(line: 118, column: 12, scope: !8)
!38 = !DILocation(line: 120, column: 12, scope: !8)
!39 = !DILocation(line: 127, column: 12, scope: !8)
!40 = !DILocation(line: 128, column: 5, scope: !8)
!41 = !DILocation(line: 135, column: 12, scope: !8)
!42 = !DILocation(line: 136, column: 12, scope: !8)
!43 = !DILocation(line: 137, column: 12, scope: !8)
!44 = !DILocation(line: 139, column: 12, scope: !8)
!45 = !DILocation(line: 146, column: 12, scope: !8)
!46 = !DILocation(line: 147, column: 5, scope: !8)
!47 = !DILocation(line: 154, column: 12, scope: !8)
!48 = !DILocation(line: 155, column: 12, scope: !8)
!49 = !DILocation(line: 156, column: 12, scope: !8)
!50 = !DILocation(line: 158, column: 12, scope: !8)
!51 = !DILocation(line: 165, column: 12, scope: !8)
!52 = !DILocation(line: 166, column: 5, scope: !8)
!53 = !DILocation(line: 173, column: 12, scope: !8)
!54 = !DILocation(line: 174, column: 12, scope: !8)
!55 = !DILocation(line: 175, column: 12, scope: !8)
!56 = !DILocation(line: 177, column: 12, scope: !8)
!57 = !DILocation(line: 184, column: 12, scope: !8)
!58 = !DILocation(line: 185, column: 5, scope: !8)
!59 = !DILocation(line: 192, column: 12, scope: !8)
!60 = !DILocation(line: 193, column: 12, scope: !8)
!61 = !DILocation(line: 194, column: 12, scope: !8)
!62 = !DILocation(line: 196, column: 12, scope: !8)
!63 = !DILocation(line: 203, column: 12, scope: !8)
!64 = !DILocation(line: 204, column: 5, scope: !8)
!65 = !DILocation(line: 211, column: 12, scope: !8)
!66 = !DILocation(line: 212, column: 12, scope: !8)
!67 = !DILocation(line: 213, column: 12, scope: !8)
!68 = !DILocation(line: 215, column: 12, scope: !8)
!69 = !DILocation(line: 222, column: 12, scope: !8)
!70 = !DILocation(line: 223, column: 5, scope: !8)
!71 = !DILocation(line: 230, column: 12, scope: !8)
!72 = !DILocation(line: 231, column: 12, scope: !8)
!73 = !DILocation(line: 232, column: 12, scope: !8)
!74 = !DILocation(line: 234, column: 12, scope: !8)
!75 = !DILocation(line: 241, column: 12, scope: !8)
!76 = !DILocation(line: 242, column: 5, scope: !8)
!77 = !DILocation(line: 249, column: 12, scope: !8)
!78 = !DILocation(line: 250, column: 12, scope: !8)
!79 = !DILocation(line: 251, column: 12, scope: !8)
!80 = !DILocation(line: 253, column: 12, scope: !8)
!81 = !DILocation(line: 260, column: 12, scope: !8)
!82 = !DILocation(line: 261, column: 5, scope: !8)
!83 = !DILocation(line: 268, column: 12, scope: !8)
!84 = !DILocation(line: 269, column: 12, scope: !8)
!85 = !DILocation(line: 270, column: 12, scope: !8)
!86 = !DILocation(line: 272, column: 12, scope: !8)
!87 = !DILocation(line: 279, column: 12, scope: !8)
!88 = !DILocation(line: 280, column: 5, scope: !8)
!89 = !DILocation(line: 287, column: 12, scope: !8)
!90 = !DILocation(line: 288, column: 12, scope: !8)
!91 = !DILocation(line: 289, column: 12, scope: !8)
!92 = !DILocation(line: 291, column: 12, scope: !8)
!93 = !DILocation(line: 298, column: 12, scope: !8)
!94 = !DILocation(line: 299, column: 5, scope: !8)
!95 = !DILocation(line: 300, column: 12, scope: !8)
!96 = !DILocation(line: 32, column: 11, scope: !8)
!97 = !DILocation(line: 303, column: 12, scope: !8)
!98 = !DILocation(line: 27, column: 11, scope: !8)
!99 = !DILocation(line: 306, column: 5, scope: !8)

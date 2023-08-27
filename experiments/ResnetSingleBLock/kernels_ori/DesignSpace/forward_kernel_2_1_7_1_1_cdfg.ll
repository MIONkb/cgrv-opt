; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_7_1_1_gvn.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %arg, ptr nocapture writeonly %arg1) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %bb42, %bb
  %i = phi i64 [ 0, %bb ], [ %i43, %bb42 ]
  %i2 = mul nuw nsw i64 %i, 112
  br label %bb3, !dbg !9

bb3:                                              ; preds = %bb3, %.preheader
  %i4 = phi i64 [ 0, %.preheader ], [ %i40, %bb3 ]
  %i5 = add nuw nsw i64 %i4, %i2, !dbg !10
  %i6 = getelementptr float, ptr %arg, i64 %i5, !dbg !11
  %i7 = load float, ptr %i6, align 4, !dbg !12
  %.inv = fcmp ole float %i7, 0.000000e+00, !dbg !13
  %i8 = select i1 %.inv, float 0.000000e+00, float %i7, !dbg !13
  %i9 = getelementptr float, ptr %arg1, i64 %i5, !dbg !14
  store float %i8, ptr %i9, align 4, !dbg !15
  %i10 = add nuw nsw i64 %i5, 1, !dbg !16
  %i11 = getelementptr float, ptr %arg, i64 %i10, !dbg !17
  %i12 = load float, ptr %i11, align 4, !dbg !18
  %.inv1 = fcmp ole float %i12, 0.000000e+00, !dbg !19
  %i13 = select i1 %.inv1, float 0.000000e+00, float %i12, !dbg !19
  %i14 = getelementptr float, ptr %arg1, i64 %i10, !dbg !20
  store float %i13, ptr %i14, align 4, !dbg !21
  %i15 = add nuw nsw i64 %i5, 2, !dbg !22
  %i16 = getelementptr float, ptr %arg, i64 %i15, !dbg !23
  %i17 = load float, ptr %i16, align 4, !dbg !24
  %.inv2 = fcmp ole float %i17, 0.000000e+00, !dbg !25
  %i18 = select i1 %.inv2, float 0.000000e+00, float %i17, !dbg !25
  %i19 = getelementptr float, ptr %arg1, i64 %i15, !dbg !26
  store float %i18, ptr %i19, align 4, !dbg !27
  %i20 = add nuw nsw i64 %i5, 3, !dbg !28
  %i21 = getelementptr float, ptr %arg, i64 %i20, !dbg !29
  %i22 = load float, ptr %i21, align 4, !dbg !30
  %.inv3 = fcmp ole float %i22, 0.000000e+00, !dbg !31
  %i23 = select i1 %.inv3, float 0.000000e+00, float %i22, !dbg !31
  %i24 = getelementptr float, ptr %arg1, i64 %i20, !dbg !32
  store float %i23, ptr %i24, align 4, !dbg !33
  %i25 = add nuw nsw i64 %i5, 4, !dbg !34
  %i26 = getelementptr float, ptr %arg, i64 %i25, !dbg !35
  %i27 = load float, ptr %i26, align 4, !dbg !36
  %.inv4 = fcmp ole float %i27, 0.000000e+00, !dbg !37
  %i28 = select i1 %.inv4, float 0.000000e+00, float %i27, !dbg !37
  %i29 = getelementptr float, ptr %arg1, i64 %i25, !dbg !38
  store float %i28, ptr %i29, align 4, !dbg !39
  %i30 = add nuw nsw i64 %i5, 5, !dbg !40
  %i31 = getelementptr float, ptr %arg, i64 %i30, !dbg !41
  %i32 = load float, ptr %i31, align 4, !dbg !42
  %.inv5 = fcmp ole float %i32, 0.000000e+00, !dbg !43
  %i33 = select i1 %.inv5, float 0.000000e+00, float %i32, !dbg !43
  %i34 = getelementptr float, ptr %arg1, i64 %i30, !dbg !44
  store float %i33, ptr %i34, align 4, !dbg !45
  %i35 = add nuw nsw i64 %i5, 6, !dbg !46
  %i36 = getelementptr float, ptr %arg, i64 %i35, !dbg !47
  %i37 = load float, ptr %i36, align 4, !dbg !48
  %.inv6 = fcmp ole float %i37, 0.000000e+00, !dbg !49
  %i38 = select i1 %.inv6, float 0.000000e+00, float %i37, !dbg !49
  %i39 = getelementptr float, ptr %arg1, i64 %i35, !dbg !50
  store float %i38, ptr %i39, align 4, !dbg !51
  %i40 = add nuw nsw i64 %i4, 7, !dbg !52
  %i41 = icmp ult i64 %i4, 105, !dbg !53
  br i1 %i41, label %bb3, label %bb42, !dbg !9

bb42:                                             ; preds = %bb3
  %i43 = add nuw nsw i64 %i, 1, !dbg !54
  %i44 = icmp ult i64 %i, 15, !dbg !55
  br i1 %i44, label %.preheader, label %bb45, !dbg !7

bb45:                                             ; preds = %bb42
  ret void, !dbg !56
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_7_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 21, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 26, column: 5, scope: !8)
!10 = !DILocation(line: 33, column: 11, scope: !8)
!11 = !DILocation(line: 34, column: 11, scope: !8)
!12 = !DILocation(line: 35, column: 11, scope: !8)
!13 = !DILocation(line: 37, column: 11, scope: !8)
!14 = !DILocation(line: 44, column: 11, scope: !8)
!15 = !DILocation(line: 45, column: 5, scope: !8)
!16 = !DILocation(line: 52, column: 11, scope: !8)
!17 = !DILocation(line: 53, column: 11, scope: !8)
!18 = !DILocation(line: 54, column: 11, scope: !8)
!19 = !DILocation(line: 56, column: 11, scope: !8)
!20 = !DILocation(line: 63, column: 11, scope: !8)
!21 = !DILocation(line: 64, column: 5, scope: !8)
!22 = !DILocation(line: 71, column: 11, scope: !8)
!23 = !DILocation(line: 72, column: 11, scope: !8)
!24 = !DILocation(line: 73, column: 11, scope: !8)
!25 = !DILocation(line: 75, column: 11, scope: !8)
!26 = !DILocation(line: 82, column: 11, scope: !8)
!27 = !DILocation(line: 83, column: 5, scope: !8)
!28 = !DILocation(line: 90, column: 11, scope: !8)
!29 = !DILocation(line: 91, column: 11, scope: !8)
!30 = !DILocation(line: 92, column: 11, scope: !8)
!31 = !DILocation(line: 94, column: 11, scope: !8)
!32 = !DILocation(line: 101, column: 11, scope: !8)
!33 = !DILocation(line: 102, column: 5, scope: !8)
!34 = !DILocation(line: 109, column: 11, scope: !8)
!35 = !DILocation(line: 110, column: 11, scope: !8)
!36 = !DILocation(line: 111, column: 11, scope: !8)
!37 = !DILocation(line: 113, column: 11, scope: !8)
!38 = !DILocation(line: 120, column: 12, scope: !8)
!39 = !DILocation(line: 121, column: 5, scope: !8)
!40 = !DILocation(line: 128, column: 12, scope: !8)
!41 = !DILocation(line: 129, column: 12, scope: !8)
!42 = !DILocation(line: 130, column: 12, scope: !8)
!43 = !DILocation(line: 132, column: 12, scope: !8)
!44 = !DILocation(line: 139, column: 12, scope: !8)
!45 = !DILocation(line: 140, column: 5, scope: !8)
!46 = !DILocation(line: 147, column: 12, scope: !8)
!47 = !DILocation(line: 148, column: 12, scope: !8)
!48 = !DILocation(line: 149, column: 12, scope: !8)
!49 = !DILocation(line: 151, column: 12, scope: !8)
!50 = !DILocation(line: 158, column: 12, scope: !8)
!51 = !DILocation(line: 159, column: 5, scope: !8)
!52 = !DILocation(line: 160, column: 12, scope: !8)
!53 = !DILocation(line: 25, column: 11, scope: !8)
!54 = !DILocation(line: 163, column: 12, scope: !8)
!55 = !DILocation(line: 20, column: 11, scope: !8)
!56 = !DILocation(line: 166, column: 5, scope: !8)

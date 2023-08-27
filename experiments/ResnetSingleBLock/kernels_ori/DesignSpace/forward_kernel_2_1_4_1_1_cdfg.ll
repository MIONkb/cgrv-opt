; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_4_1_1_gvn.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %arg, ptr nocapture writeonly %arg1) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %bb30, %bb
  %i = phi i64 [ 0, %bb ], [ %i31, %bb30 ]
  %i2 = mul nuw nsw i64 %i, 112
  br label %bb3, !dbg !9

bb3:                                              ; preds = %bb3, %.preheader
  %i4 = phi i64 [ 0, %.preheader ], [ %i28, %bb3 ]
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
  %i28 = add nuw nsw i64 %i4, 4, !dbg !37
  %i29 = icmp ult i64 %i4, 108, !dbg !38
  br i1 %i29, label %bb3, label %bb30, !dbg !9

bb30:                                             ; preds = %bb3
  %i31 = add nuw nsw i64 %i, 1, !dbg !39
  %i32 = icmp ult i64 %i, 15, !dbg !40
  br i1 %i32, label %.preheader, label %bb33, !dbg !7

bb33:                                             ; preds = %bb30
  ret void, !dbg !41
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_4_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 18, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 23, column: 5, scope: !8)
!10 = !DILocation(line: 30, column: 11, scope: !8)
!11 = !DILocation(line: 31, column: 11, scope: !8)
!12 = !DILocation(line: 32, column: 11, scope: !8)
!13 = !DILocation(line: 34, column: 11, scope: !8)
!14 = !DILocation(line: 41, column: 11, scope: !8)
!15 = !DILocation(line: 42, column: 5, scope: !8)
!16 = !DILocation(line: 43, column: 11, scope: !8)
!17 = !DILocation(line: 49, column: 11, scope: !8)
!18 = !DILocation(line: 50, column: 11, scope: !8)
!19 = !DILocation(line: 51, column: 11, scope: !8)
!20 = !DILocation(line: 53, column: 11, scope: !8)
!21 = !DILocation(line: 60, column: 11, scope: !8)
!22 = !DILocation(line: 61, column: 5, scope: !8)
!23 = !DILocation(line: 62, column: 11, scope: !8)
!24 = !DILocation(line: 68, column: 11, scope: !8)
!25 = !DILocation(line: 69, column: 11, scope: !8)
!26 = !DILocation(line: 70, column: 11, scope: !8)
!27 = !DILocation(line: 72, column: 11, scope: !8)
!28 = !DILocation(line: 79, column: 11, scope: !8)
!29 = !DILocation(line: 80, column: 5, scope: !8)
!30 = !DILocation(line: 81, column: 11, scope: !8)
!31 = !DILocation(line: 87, column: 11, scope: !8)
!32 = !DILocation(line: 88, column: 11, scope: !8)
!33 = !DILocation(line: 89, column: 11, scope: !8)
!34 = !DILocation(line: 91, column: 11, scope: !8)
!35 = !DILocation(line: 98, column: 11, scope: !8)
!36 = !DILocation(line: 99, column: 5, scope: !8)
!37 = !DILocation(line: 100, column: 11, scope: !8)
!38 = !DILocation(line: 22, column: 11, scope: !8)
!39 = !DILocation(line: 103, column: 11, scope: !8)
!40 = !DILocation(line: 17, column: 11, scope: !8)
!41 = !DILocation(line: 106, column: 5, scope: !8)

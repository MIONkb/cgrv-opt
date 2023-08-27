; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_3_1_1_1_1_1_1_1_1_gvn.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_3(ptr nocapture readonly %arg, ptr nocapture readonly %arg1, ptr nocapture writeonly %arg2) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %.preheader2, !dbg !7

.preheader2:                                      ; preds = %bb32, %bb
  %i = phi i64 [ 0, %bb ], [ %i33, %bb32 ]
  %i3 = mul nuw nsw i64 %i, 56
  %i4 = shl nuw nsw i64 %i, 1
  br label %bb5, !dbg !9

bb5:                                              ; preds = %bb28, %.preheader2
  %i6 = phi i64 [ 0, %.preheader2 ], [ %i30, %bb28 ]
  %i7 = add nuw nsw i64 %i6, %i3, !dbg !10
  %i8 = getelementptr float, ptr %arg, i64 %i7, !dbg !11
  %i9 = load float, ptr %i8, align 4, !dbg !12
  %i10 = shl nuw nsw i64 %i6, 1
  br label %.preheader, !dbg !13

.preheader:                                       ; preds = %bb25, %bb5
  %i11 = phi float [ %i9, %bb5 ], [ %.lcssa, %bb25 ]
  %i12 = phi i64 [ 0, %bb5 ], [ %i26, %bb25 ]
  %i13 = add nuw nsw i64 %i12, %i4
  %i14 = mul nuw nsw i64 %i13, 114
  %i15 = add nuw nsw i64 %i14, %i10
  br label %bb16, !dbg !14

bb16:                                             ; preds = %bb16, %.preheader
  %i17 = phi float [ %i11, %.preheader ], [ %i22, %bb16 ]
  %i18 = phi i64 [ 0, %.preheader ], [ %i23, %bb16 ]
  %i19 = add nuw nsw i64 %i15, %i18, !dbg !15
  %i20 = getelementptr float, ptr %arg1, i64 %i19, !dbg !16
  %i21 = load float, ptr %i20, align 4, !dbg !17
  %.inv = fcmp ole float %i17, %i21, !dbg !18
  %i22 = select i1 %.inv, float %i21, float %i17, !dbg !18
  %i23 = add nuw nsw i64 %i18, 1, !dbg !19
  %i24 = icmp ult i64 %i18, 2, !dbg !20
  br i1 %i24, label %bb16, label %bb25, !dbg !14

bb25:                                             ; preds = %bb16
  %.lcssa = phi float [ %i22, %bb16 ], !dbg !18
  %i26 = add nuw nsw i64 %i12, 1, !dbg !21
  %i27 = icmp ult i64 %i12, 2, !dbg !22
  br i1 %i27, label %.preheader, label %bb28, !dbg !13

bb28:                                             ; preds = %bb25
  %.lcssa.lcssa = phi float [ %.lcssa, %bb25 ], !dbg !18
  %i29 = getelementptr float, ptr %arg2, i64 %i7, !dbg !23
  store float %.lcssa.lcssa, ptr %i29, align 4, !dbg !24
  %i30 = add nuw nsw i64 %i6, 1, !dbg !25
  %i31 = icmp ult i64 %i6, 55, !dbg !26
  br i1 %i31, label %bb5, label %bb32, !dbg !9

bb32:                                             ; preds = %bb28
  %i33 = add nuw nsw i64 %i, 1, !dbg !27
  %i34 = icmp ult i64 %i, 3, !dbg !28
  br i1 %i34, label %.preheader2, label %bb35, !dbg !7

bb35:                                             ; preds = %bb32
  ret void, !dbg !29
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_3", linkageName: "forward_kernel_3", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_3_1_1_1_1_1_1_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 19, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 24, column: 5, scope: !8)
!10 = !DILocation(line: 31, column: 11, scope: !8)
!11 = !DILocation(line: 32, column: 11, scope: !8)
!12 = !DILocation(line: 33, column: 11, scope: !8)
!13 = !DILocation(line: 37, column: 5, scope: !8)
!14 = !DILocation(line: 42, column: 5, scope: !8)
!15 = !DILocation(line: 53, column: 11, scope: !8)
!16 = !DILocation(line: 54, column: 11, scope: !8)
!17 = !DILocation(line: 55, column: 11, scope: !8)
!18 = !DILocation(line: 57, column: 11, scope: !8)
!19 = !DILocation(line: 58, column: 11, scope: !8)
!20 = !DILocation(line: 41, column: 11, scope: !8)
!21 = !DILocation(line: 61, column: 11, scope: !8)
!22 = !DILocation(line: 36, column: 11, scope: !8)
!23 = !DILocation(line: 70, column: 11, scope: !8)
!24 = !DILocation(line: 71, column: 5, scope: !8)
!25 = !DILocation(line: 72, column: 11, scope: !8)
!26 = !DILocation(line: 23, column: 11, scope: !8)
!27 = !DILocation(line: 75, column: 11, scope: !8)
!28 = !DILocation(line: 18, column: 11, scope: !8)
!29 = !DILocation(line: 78, column: 5, scope: !8)

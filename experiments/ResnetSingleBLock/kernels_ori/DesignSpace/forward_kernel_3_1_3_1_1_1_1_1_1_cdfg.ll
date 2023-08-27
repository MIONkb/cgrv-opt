; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_3_1_3_1_1_1_1_1_1_gvn.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_3(ptr nocapture readonly %arg, ptr nocapture readonly %arg1, ptr nocapture writeonly %arg2) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %bb34, %bb
  %i = phi i64 [ 0, %bb ], [ %i35, %bb34 ]
  %i3 = mul nuw nsw i64 %i, 56
  %i4 = shl nuw nsw i64 %i, 1
  br label %bb5, !dbg !9

bb5:                                              ; preds = %bb30, %.preheader
  %i6 = phi i64 [ 0, %.preheader ], [ %i32, %bb30 ]
  %i7 = add nuw nsw i64 %i6, %i3, !dbg !10
  %i8 = getelementptr float, ptr %arg, i64 %i7, !dbg !11
  %i9 = load float, ptr %i8, align 4, !dbg !12
  %i10 = shl nuw nsw i64 %i6, 1
  br label %bb11, !dbg !13

bb11:                                             ; preds = %bb11, %bb5
  %i12 = phi float [ %i9, %bb5 ], [ %i27, %bb11 ]
  %i13 = phi i64 [ 0, %bb5 ], [ %i28, %bb11 ]
  %i14 = add nuw nsw i64 %i13, %i4, !dbg !14
  %i15 = mul nuw nsw i64 %i14, 114, !dbg !15
  %i16 = add nuw nsw i64 %i15, %i10, !dbg !16
  %i17 = getelementptr float, ptr %arg1, i64 %i16, !dbg !17
  %i18 = load float, ptr %i17, align 4, !dbg !18
  %.inv = fcmp ole float %i12, %i18, !dbg !19
  %i19 = select i1 %.inv, float %i18, float %i12, !dbg !19
  %i20 = or i64 %i16, 1, !dbg !20
  %i21 = getelementptr float, ptr %arg1, i64 %i20, !dbg !21
  %i22 = load float, ptr %i21, align 4, !dbg !22
  %.inv2 = fcmp ole float %i19, %i22, !dbg !23
  %i23 = select i1 %.inv2, float %i22, float %i19, !dbg !23
  %i24 = add nuw nsw i64 %i16, 2, !dbg !24
  %i25 = getelementptr float, ptr %arg1, i64 %i24, !dbg !25
  %i26 = load float, ptr %i25, align 4, !dbg !26
  %.inv3 = fcmp ole float %i23, %i26, !dbg !27
  %i27 = select i1 %.inv3, float %i26, float %i23, !dbg !27
  %i28 = add nuw nsw i64 %i13, 1, !dbg !28
  %i29 = icmp ult i64 %i13, 2, !dbg !29
  br i1 %i29, label %bb11, label %bb30, !dbg !13

bb30:                                             ; preds = %bb11
  %.lcssa = phi float [ %i27, %bb11 ], !dbg !27
  %i31 = getelementptr float, ptr %arg2, i64 %i7, !dbg !30
  store float %.lcssa, ptr %i31, align 4, !dbg !31
  %i32 = add nuw nsw i64 %i6, 1, !dbg !32
  %i33 = icmp ult i64 %i6, 55, !dbg !33
  br i1 %i33, label %bb5, label %bb34, !dbg !9

bb34:                                             ; preds = %bb30
  %i35 = add nuw nsw i64 %i, 1, !dbg !34
  %i36 = icmp ult i64 %i, 3, !dbg !35
  br i1 %i36, label %.preheader, label %bb37, !dbg !7

bb37:                                             ; preds = %bb34
  ret void, !dbg !36
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_3", linkageName: "forward_kernel_3", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_3_1_3_1_1_1_1_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 19, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 24, column: 5, scope: !8)
!10 = !DILocation(line: 31, column: 11, scope: !8)
!11 = !DILocation(line: 32, column: 11, scope: !8)
!12 = !DILocation(line: 33, column: 11, scope: !8)
!13 = !DILocation(line: 37, column: 5, scope: !8)
!14 = !DILocation(line: 40, column: 11, scope: !8)
!15 = !DILocation(line: 45, column: 11, scope: !8)
!16 = !DILocation(line: 47, column: 11, scope: !8)
!17 = !DILocation(line: 48, column: 11, scope: !8)
!18 = !DILocation(line: 49, column: 11, scope: !8)
!19 = !DILocation(line: 51, column: 11, scope: !8)
!20 = !DILocation(line: 61, column: 11, scope: !8)
!21 = !DILocation(line: 62, column: 11, scope: !8)
!22 = !DILocation(line: 63, column: 11, scope: !8)
!23 = !DILocation(line: 65, column: 11, scope: !8)
!24 = !DILocation(line: 75, column: 11, scope: !8)
!25 = !DILocation(line: 76, column: 11, scope: !8)
!26 = !DILocation(line: 77, column: 11, scope: !8)
!27 = !DILocation(line: 79, column: 11, scope: !8)
!28 = !DILocation(line: 80, column: 11, scope: !8)
!29 = !DILocation(line: 36, column: 11, scope: !8)
!30 = !DILocation(line: 89, column: 11, scope: !8)
!31 = !DILocation(line: 90, column: 5, scope: !8)
!32 = !DILocation(line: 91, column: 11, scope: !8)
!33 = !DILocation(line: 23, column: 11, scope: !8)
!34 = !DILocation(line: 94, column: 11, scope: !8)
!35 = !DILocation(line: 18, column: 11, scope: !8)
!36 = !DILocation(line: 97, column: 5, scope: !8)

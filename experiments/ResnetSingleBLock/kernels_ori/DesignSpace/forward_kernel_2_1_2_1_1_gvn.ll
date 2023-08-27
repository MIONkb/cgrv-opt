; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_2_1_1_opt.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %arg, ptr nocapture writeonly %arg1) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %bb18, %bb
  %i = phi i64 [ 0, %bb ], [ %i19, %bb18 ]
  %i2 = mul nuw nsw i64 %i, 112
  br label %bb3, !dbg !9

bb3:                                              ; preds = %bb3, %.preheader
  %i4 = phi i64 [ 0, %.preheader ], [ %i16, %bb3 ]
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
  %i16 = add nuw nsw i64 %i4, 2, !dbg !23
  %i17 = icmp ult i64 %i4, 110, !dbg !24
  br i1 %i17, label %bb3, label %bb18, !dbg !9

bb18:                                             ; preds = %bb3
  %i19 = add nuw nsw i64 %i, 1, !dbg !25
  %i20 = icmp ult i64 %i, 15, !dbg !26
  br i1 %i20, label %.preheader, label %bb21, !dbg !7

bb21:                                             ; preds = %bb18
  ret void, !dbg !27
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_2_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 16, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 21, column: 5, scope: !8)
!10 = !DILocation(line: 28, column: 11, scope: !8)
!11 = !DILocation(line: 29, column: 11, scope: !8)
!12 = !DILocation(line: 30, column: 11, scope: !8)
!13 = !DILocation(line: 32, column: 11, scope: !8)
!14 = !DILocation(line: 39, column: 11, scope: !8)
!15 = !DILocation(line: 40, column: 5, scope: !8)
!16 = !DILocation(line: 41, column: 11, scope: !8)
!17 = !DILocation(line: 47, column: 11, scope: !8)
!18 = !DILocation(line: 48, column: 11, scope: !8)
!19 = !DILocation(line: 49, column: 11, scope: !8)
!20 = !DILocation(line: 51, column: 11, scope: !8)
!21 = !DILocation(line: 58, column: 11, scope: !8)
!22 = !DILocation(line: 59, column: 5, scope: !8)
!23 = !DILocation(line: 60, column: 11, scope: !8)
!24 = !DILocation(line: 20, column: 11, scope: !8)
!25 = !DILocation(line: 63, column: 11, scope: !8)
!26 = !DILocation(line: 15, column: 10, scope: !8)
!27 = !DILocation(line: 66, column: 5, scope: !8)

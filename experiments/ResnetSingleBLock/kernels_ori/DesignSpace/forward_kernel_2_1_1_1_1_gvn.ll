; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_1_1_1_opt.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %arg, ptr nocapture writeonly %arg1) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %bb12, %bb
  %i = phi i64 [ 0, %bb ], [ %i13, %bb12 ]
  %i2 = mul nuw nsw i64 %i, 112
  br label %bb3, !dbg !9

bb3:                                              ; preds = %bb3, %.preheader
  %i4 = phi i64 [ 0, %.preheader ], [ %i10, %bb3 ]
  %i5 = add nuw nsw i64 %i4, %i2, !dbg !10
  %i6 = getelementptr float, ptr %arg, i64 %i5, !dbg !11
  %i7 = load float, ptr %i6, align 4, !dbg !12
  %.inv = fcmp ole float %i7, 0.000000e+00, !dbg !13
  %i8 = select i1 %.inv, float 0.000000e+00, float %i7, !dbg !13
  %i9 = getelementptr float, ptr %arg1, i64 %i5, !dbg !14
  store float %i8, ptr %i9, align 4, !dbg !15
  %i10 = add nuw nsw i64 %i4, 1, !dbg !16
  %i11 = icmp ult i64 %i4, 111, !dbg !17
  br i1 %i11, label %bb3, label %bb12, !dbg !9

bb12:                                             ; preds = %bb3
  %i13 = add nuw nsw i64 %i, 1, !dbg !18
  %i14 = icmp ult i64 %i, 15, !dbg !19
  br i1 %i14, label %.preheader, label %bb15, !dbg !7

bb15:                                             ; preds = %bb12
  ret void, !dbg !20
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_1_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 15, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 20, column: 5, scope: !8)
!10 = !DILocation(line: 27, column: 11, scope: !8)
!11 = !DILocation(line: 28, column: 11, scope: !8)
!12 = !DILocation(line: 29, column: 11, scope: !8)
!13 = !DILocation(line: 31, column: 11, scope: !8)
!14 = !DILocation(line: 38, column: 11, scope: !8)
!15 = !DILocation(line: 39, column: 5, scope: !8)
!16 = !DILocation(line: 40, column: 11, scope: !8)
!17 = !DILocation(line: 19, column: 11, scope: !8)
!18 = !DILocation(line: 43, column: 11, scope: !8)
!19 = !DILocation(line: 14, column: 10, scope: !8)
!20 = !DILocation(line: 46, column: 5, scope: !8)

; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_1_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %0, ptr nocapture writeonly %1) local_unnamed_addr #0 !dbg !3 {
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %2, %14
  %3 = phi i64 [ 0, %2 ], [ %15, %14 ]
  %4 = mul nuw nsw i64 %3, 112
  br label %5, !dbg !9

5:                                                ; preds = %.preheader, %5
  %6 = phi i64 [ 0, %.preheader ], [ %12, %5 ]
  %7 = add nuw nsw i64 %6, %4, !dbg !10
  %8 = getelementptr float, ptr %0, i64 %7, !dbg !11
  %9 = load float, ptr %8, align 4, !dbg !12
  %.inv = fcmp ole float %9, 0.000000e+00, !dbg !13
  %10 = select i1 %.inv, float 0.000000e+00, float %9, !dbg !13
  %11 = getelementptr float, ptr %1, i64 %7, !dbg !14
  store float %10, ptr %11, align 4, !dbg !15
  %12 = add nuw nsw i64 %6, 1, !dbg !16
  %13 = icmp ult i64 %6, 111, !dbg !17
  br i1 %13, label %5, label %14, !dbg !9

14:                                               ; preds = %5
  %15 = add nuw nsw i64 %3, 1, !dbg !18
  %16 = icmp ult i64 %3, 15, !dbg !19
  br i1 %16, label %.preheader, label %17, !dbg !7

17:                                               ; preds = %14
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

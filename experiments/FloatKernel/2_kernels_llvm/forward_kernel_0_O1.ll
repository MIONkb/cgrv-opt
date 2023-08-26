; ModuleID = 'forward_kernel_0.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_0(ptr nocapture readonly %0, ptr nocapture writeonly %1) local_unnamed_addr #0 !dbg !3 {
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %2, %15
  %3 = phi i64 [ 0, %2 ], [ %16, %15 ]
  %4 = mul nuw nsw i64 %3, 3
  br label %5, !dbg !9

5:                                                ; preds = %.preheader, %5
  %6 = phi i64 [ 0, %.preheader ], [ %13, %5 ]
  %7 = add nuw nsw i64 %6, %4, !dbg !10
  %8 = getelementptr float, ptr %0, i64 %7, !dbg !11
  %9 = load float, ptr %8, align 4, !dbg !12
  %10 = mul nuw nsw i64 %6, 3, !dbg !13
  %11 = add nuw nsw i64 %10, %3, !dbg !14
  %12 = getelementptr float, ptr %1, i64 %11, !dbg !15
  store float %9, ptr %12, align 4, !dbg !16
  %13 = add nuw nsw i64 %6, 1, !dbg !17
  %14 = icmp ult i64 %6, 2, !dbg !18
  br i1 %14, label %5, label %15, !dbg !9

15:                                               ; preds = %5
  %16 = add nuw nsw i64 %3, 1, !dbg !19
  %17 = icmp ult i64 %3, 2, !dbg !20
  br i1 %17, label %.preheader, label %18, !dbg !7

18:                                               ; preds = %15
  ret void, !dbg !21
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_0", linkageName: "forward_kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/forward_kernel_0_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/FloatKernel")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 37, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 42, column: 5, scope: !8)
!10 = !DILocation(line: 47, column: 11, scope: !8)
!11 = !DILocation(line: 48, column: 11, scope: !8)
!12 = !DILocation(line: 49, column: 11, scope: !8)
!13 = !DILocation(line: 52, column: 11, scope: !8)
!14 = !DILocation(line: 53, column: 11, scope: !8)
!15 = !DILocation(line: 54, column: 11, scope: !8)
!16 = !DILocation(line: 55, column: 5, scope: !8)
!17 = !DILocation(line: 56, column: 11, scope: !8)
!18 = !DILocation(line: 41, column: 11, scope: !8)
!19 = !DILocation(line: 59, column: 11, scope: !8)
!20 = !DILocation(line: 36, column: 11, scope: !8)
!21 = !DILocation(line: 62, column: 5, scope: !8)

; ModuleID = 'gemm_kernel_0.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @gemm_kernel_0(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture writeonly %2) local_unnamed_addr #0 !dbg !3 {
  br label %.preheader1, !dbg !7

.preheader1:                                      ; preds = %3, %26
  %4 = phi i64 [ 0, %3 ], [ %27, %26 ]
  %5 = shl nuw nsw i64 %4, 5
  br label %.preheader, !dbg !9

.preheader:                                       ; preds = %.preheader1, %21
  %6 = phi i64 [ 0, %.preheader1 ], [ %24, %21 ]
  br label %7, !dbg !10

7:                                                ; preds = %.preheader, %7
  %8 = phi i32 [ 0, %.preheader ], [ %18, %7 ]
  %9 = phi i64 [ 0, %.preheader ], [ %19, %7 ]
  %10 = add nuw nsw i64 %9, %5, !dbg !11
  %11 = getelementptr i32, ptr %0, i64 %10, !dbg !12
  %12 = load i32, ptr %11, align 4, !dbg !13
  %13 = shl nuw nsw i64 %9, 5, !dbg !14
  %14 = add nuw nsw i64 %13, %6, !dbg !15
  %15 = getelementptr i32, ptr %1, i64 %14, !dbg !16
  %16 = load i32, ptr %15, align 4, !dbg !17
  %17 = mul i32 %16, %12, !dbg !18
  %18 = add i32 %17, %8, !dbg !19
  %19 = add nuw nsw i64 %9, 1, !dbg !20
  %20 = icmp ult i64 %9, 31, !dbg !21
  br i1 %20, label %7, label %21, !dbg !10

21:                                               ; preds = %7
  %22 = add nuw nsw i64 %6, %5, !dbg !22
  %23 = getelementptr i32, ptr %2, i64 %22, !dbg !23
  store i32 %18, ptr %23, align 4, !dbg !24
  %24 = add nuw nsw i64 %6, 1, !dbg !25
  %25 = icmp ult i64 %6, 31, !dbg !26
  br i1 %25, label %.preheader, label %26, !dbg !9

26:                                               ; preds = %21
  %27 = add nuw nsw i64 %4, 1, !dbg !27
  %28 = icmp ult i64 %4, 31, !dbg !28
  br i1 %28, label %.preheader1, label %29, !dbg !7

29:                                               ; preds = %26
  ret void, !dbg !29
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "gemm_kernel_0", linkageName: "gemm_kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "gemm_kernel_0_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/gemm_new/kernels")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 39, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 44, column: 5, scope: !8)
!10 = !DILocation(line: 49, column: 5, scope: !8)
!11 = !DILocation(line: 52, column: 11, scope: !8)
!12 = !DILocation(line: 54, column: 11, scope: !8)
!13 = !DILocation(line: 55, column: 11, scope: !8)
!14 = !DILocation(line: 56, column: 11, scope: !8)
!15 = !DILocation(line: 57, column: 11, scope: !8)
!16 = !DILocation(line: 59, column: 11, scope: !8)
!17 = !DILocation(line: 60, column: 11, scope: !8)
!18 = !DILocation(line: 61, column: 11, scope: !8)
!19 = !DILocation(line: 62, column: 11, scope: !8)
!20 = !DILocation(line: 63, column: 11, scope: !8)
!21 = !DILocation(line: 48, column: 11, scope: !8)
!22 = !DILocation(line: 67, column: 11, scope: !8)
!23 = !DILocation(line: 69, column: 11, scope: !8)
!24 = !DILocation(line: 70, column: 5, scope: !8)
!25 = !DILocation(line: 71, column: 11, scope: !8)
!26 = !DILocation(line: 43, column: 11, scope: !8)
!27 = !DILocation(line: 74, column: 11, scope: !8)
!28 = !DILocation(line: 38, column: 11, scope: !8)
!29 = !DILocation(line: 77, column: 5, scope: !8)

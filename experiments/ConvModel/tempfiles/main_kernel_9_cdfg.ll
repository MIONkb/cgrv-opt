; ModuleID = '/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel/tempfiles/main_kernel_9_gvn.ll'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_9(ptr %0, ptr %1) !dbg !3 {
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, ptr %0, 1, !dbg !9
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 0, 2, !dbg !10
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 4, 3, 0, !dbg !11
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 8, 4, 0, !dbg !12
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0, !dbg !13
  %9 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, ptr %1, 1, !dbg !14
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, i64 0, 2, !dbg !15
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, i64 4, 3, 0, !dbg !16
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 8, 4, 0, !dbg !17
  br label %13, !dbg !18

13:                                               ; preds = %28, %2
  %14 = phi i64 [ %29, %28 ], [ 0, %2 ]
  %15 = icmp ult i64 %14, 4, !dbg !19
  br i1 %15, label %16, label %30, !dbg !20

16:                                               ; preds = %13
  %17 = mul nuw nsw i64 %14, 8
  br label %18, !dbg !21

18:                                               ; preds = %21, %16
  %19 = phi i64 [ %27, %21 ], [ 0, %16 ]
  %20 = icmp ult i64 %19, 8, !dbg !22
  br i1 %20, label %21, label %28, !dbg !23

21:                                               ; preds = %18
  %22 = add nuw nsw i64 %17, %19, !dbg !24
  %23 = getelementptr float, ptr %0, i64 %22, !dbg !25
  %24 = load float, ptr %23, align 4, !dbg !26
  %25 = fadd float %24, 0.000000e+00, !dbg !27
  %26 = getelementptr float, ptr %1, i64 %22, !dbg !28
  store float %25, ptr %26, align 4, !dbg !29
  %27 = add nuw nsw i64 %19, 1, !dbg !30
  br label %18, !dbg !31

28:                                               ; preds = %18
  %29 = add nuw nsw i64 %14, 1, !dbg !32
  br label %13, !dbg !33

30:                                               ; preds = %13
  %31 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 8, 3, 1, !dbg !34
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 8, 3, 1, !dbg !35
  %33 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, i64 1, 4, 1, !dbg !36
  %34 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, i64 1, 4, 1, !dbg !37
  ret void, !dbg !38
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_9", linkageName: "main_kernel_9", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/main_kernel_9_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 4, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 5, column: 10, scope: !8)
!10 = !DILocation(line: 7, column: 10, scope: !8)
!11 = !DILocation(line: 9, column: 10, scope: !8)
!12 = !DILocation(line: 11, column: 10, scope: !8)
!13 = !DILocation(line: 17, column: 11, scope: !8)
!14 = !DILocation(line: 18, column: 11, scope: !8)
!15 = !DILocation(line: 20, column: 11, scope: !8)
!16 = !DILocation(line: 22, column: 11, scope: !8)
!17 = !DILocation(line: 24, column: 11, scope: !8)
!18 = !DILocation(line: 36, column: 5, scope: !8)
!19 = !DILocation(line: 38, column: 11, scope: !8)
!20 = !DILocation(line: 39, column: 5, scope: !8)
!21 = !DILocation(line: 41, column: 5, scope: !8)
!22 = !DILocation(line: 43, column: 11, scope: !8)
!23 = !DILocation(line: 44, column: 5, scope: !8)
!24 = !DILocation(line: 49, column: 11, scope: !8)
!25 = !DILocation(line: 50, column: 11, scope: !8)
!26 = !DILocation(line: 51, column: 11, scope: !8)
!27 = !DILocation(line: 52, column: 11, scope: !8)
!28 = !DILocation(line: 57, column: 11, scope: !8)
!29 = !DILocation(line: 58, column: 5, scope: !8)
!30 = !DILocation(line: 59, column: 11, scope: !8)
!31 = !DILocation(line: 60, column: 5, scope: !8)
!32 = !DILocation(line: 62, column: 11, scope: !8)
!33 = !DILocation(line: 63, column: 5, scope: !8)
!34 = !DILocation(line: 13, column: 11, scope: !8)
!35 = !DILocation(line: 26, column: 11, scope: !8)
!36 = !DILocation(line: 15, column: 11, scope: !8)
!37 = !DILocation(line: 28, column: 11, scope: !8)
!38 = !DILocation(line: 65, column: 5, scope: !8)

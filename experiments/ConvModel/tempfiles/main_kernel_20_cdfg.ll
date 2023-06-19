; ModuleID = '/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel/tempfiles/main_kernel_20_gvn.ll'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_20(ptr %0, ptr %1) !dbg !3 {
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, ptr %0, 1, !dbg !9
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 0, 2, !dbg !10
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 4, 3, 0, !dbg !11
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 2, 4, 0, !dbg !12
  %8 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0, !dbg !13
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %8, ptr %1, 1, !dbg !14
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, i64 0, 2, !dbg !15
  br label %11, !dbg !16

11:                                               ; preds = %27, %2
  %12 = phi i64 [ %28, %27 ], [ 0, %2 ]
  %13 = icmp ult i64 %12, 4, !dbg !17
  br i1 %13, label %14, label %29, !dbg !18

14:                                               ; preds = %11
  %15 = mul nuw nsw i64 %12, 2
  %16 = getelementptr float, ptr %1, i64 %12
  br label %17, !dbg !19

17:                                               ; preds = %20, %14
  %18 = phi i64 [ %26, %20 ], [ 0, %14 ]
  %19 = icmp ult i64 %18, 2, !dbg !20
  br i1 %19, label %20, label %27, !dbg !21

20:                                               ; preds = %17
  %21 = add nuw nsw i64 %15, %18, !dbg !22
  %22 = getelementptr float, ptr %0, i64 %21, !dbg !23
  %23 = load float, ptr %22, align 4, !dbg !24
  %24 = load float, ptr %16, align 4, !dbg !25
  %25 = fadd float %23, %24, !dbg !26
  store float %25, ptr %16, align 4, !dbg !27
  %26 = add nuw nsw i64 %18, 1, !dbg !28
  br label %17, !dbg !29

27:                                               ; preds = %17
  %28 = add nuw nsw i64 %12, 1, !dbg !30
  br label %11, !dbg !31

29:                                               ; preds = %11
  %30 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 2, 3, 1, !dbg !32
  %31 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, i64 4, 3, 0, !dbg !33
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %30, i64 1, 4, 1, !dbg !34
  %33 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %31, i64 1, 4, 0, !dbg !35
  ret void, !dbg !36
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_20", linkageName: "main_kernel_20", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/main_kernel_20_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel")
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
!16 = !DILocation(line: 31, column: 5, scope: !8)
!17 = !DILocation(line: 33, column: 11, scope: !8)
!18 = !DILocation(line: 34, column: 5, scope: !8)
!19 = !DILocation(line: 36, column: 5, scope: !8)
!20 = !DILocation(line: 38, column: 11, scope: !8)
!21 = !DILocation(line: 39, column: 5, scope: !8)
!22 = !DILocation(line: 44, column: 11, scope: !8)
!23 = !DILocation(line: 45, column: 11, scope: !8)
!24 = !DILocation(line: 46, column: 11, scope: !8)
!25 = !DILocation(line: 49, column: 11, scope: !8)
!26 = !DILocation(line: 50, column: 11, scope: !8)
!27 = !DILocation(line: 53, column: 5, scope: !8)
!28 = !DILocation(line: 54, column: 11, scope: !8)
!29 = !DILocation(line: 55, column: 5, scope: !8)
!30 = !DILocation(line: 57, column: 11, scope: !8)
!31 = !DILocation(line: 58, column: 5, scope: !8)
!32 = !DILocation(line: 13, column: 11, scope: !8)
!33 = !DILocation(line: 22, column: 11, scope: !8)
!34 = !DILocation(line: 15, column: 11, scope: !8)
!35 = !DILocation(line: 24, column: 11, scope: !8)
!36 = !DILocation(line: 60, column: 5, scope: !8)

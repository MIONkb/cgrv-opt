; ModuleID = '/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel/tempfiles/main_kernel_22_gvn.ll'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_22(ptr %0, ptr %1, ptr %2) !dbg !3 {
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, ptr %0, 1, !dbg !9
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 0, 2, !dbg !10
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 4, 3, 0, !dbg !11
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 2, 4, 0, !dbg !12
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0, !dbg !13
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, ptr %1, 1, !dbg !14
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, i64 0, 2, !dbg !15
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %2, 0, !dbg !16
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, ptr %2, 1, !dbg !17
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 0, 2, !dbg !18
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 4, 3, 0, !dbg !19
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 2, 4, 0, !dbg !20
  br label %17, !dbg !21

17:                                               ; preds = %34, %3
  %18 = phi i64 [ %35, %34 ], [ 0, %3 ]
  %19 = icmp ult i64 %18, 4, !dbg !22
  br i1 %19, label %20, label %36, !dbg !23

20:                                               ; preds = %17
  %21 = mul nuw nsw i64 %18, 2
  %22 = getelementptr float, ptr %1, i64 %18
  br label %23, !dbg !24

23:                                               ; preds = %26, %20
  %24 = phi i64 [ %33, %26 ], [ 0, %20 ]
  %25 = icmp ult i64 %24, 2, !dbg !25
  br i1 %25, label %26, label %34, !dbg !26

26:                                               ; preds = %23
  %27 = add nuw nsw i64 %21, %24, !dbg !27
  %28 = getelementptr float, ptr %0, i64 %27, !dbg !28
  %29 = load float, ptr %28, align 4, !dbg !29
  %30 = load float, ptr %22, align 4, !dbg !30
  %31 = fmul float %29, %30, !dbg !31
  %32 = getelementptr float, ptr %2, i64 %27, !dbg !32
  store float %31, ptr %32, align 4, !dbg !33
  %33 = add nuw nsw i64 %24, 1, !dbg !34
  br label %23, !dbg !35

34:                                               ; preds = %23
  %35 = add nuw nsw i64 %18, 1, !dbg !36
  br label %17, !dbg !37

36:                                               ; preds = %17
  %37 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, i64 2, 3, 1, !dbg !38
  %38 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, i64 4, 3, 0, !dbg !39
  %39 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, i64 2, 3, 1, !dbg !40
  %40 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %37, i64 1, 4, 1, !dbg !41
  %41 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %38, i64 1, 4, 0, !dbg !42
  %42 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, i64 1, 4, 1, !dbg !43
  ret void, !dbg !44
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_22", linkageName: "main_kernel_22", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/main_kernel_22_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel")
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
!16 = !DILocation(line: 26, column: 11, scope: !8)
!17 = !DILocation(line: 27, column: 11, scope: !8)
!18 = !DILocation(line: 29, column: 11, scope: !8)
!19 = !DILocation(line: 31, column: 11, scope: !8)
!20 = !DILocation(line: 33, column: 11, scope: !8)
!21 = !DILocation(line: 44, column: 5, scope: !8)
!22 = !DILocation(line: 46, column: 11, scope: !8)
!23 = !DILocation(line: 47, column: 5, scope: !8)
!24 = !DILocation(line: 49, column: 5, scope: !8)
!25 = !DILocation(line: 51, column: 11, scope: !8)
!26 = !DILocation(line: 52, column: 5, scope: !8)
!27 = !DILocation(line: 57, column: 11, scope: !8)
!28 = !DILocation(line: 58, column: 11, scope: !8)
!29 = !DILocation(line: 59, column: 11, scope: !8)
!30 = !DILocation(line: 62, column: 11, scope: !8)
!31 = !DILocation(line: 63, column: 11, scope: !8)
!32 = !DILocation(line: 68, column: 11, scope: !8)
!33 = !DILocation(line: 69, column: 5, scope: !8)
!34 = !DILocation(line: 70, column: 11, scope: !8)
!35 = !DILocation(line: 71, column: 5, scope: !8)
!36 = !DILocation(line: 73, column: 11, scope: !8)
!37 = !DILocation(line: 74, column: 5, scope: !8)
!38 = !DILocation(line: 13, column: 11, scope: !8)
!39 = !DILocation(line: 22, column: 11, scope: !8)
!40 = !DILocation(line: 35, column: 11, scope: !8)
!41 = !DILocation(line: 15, column: 11, scope: !8)
!42 = !DILocation(line: 24, column: 11, scope: !8)
!43 = !DILocation(line: 37, column: 11, scope: !8)
!44 = !DILocation(line: 76, column: 5, scope: !8)

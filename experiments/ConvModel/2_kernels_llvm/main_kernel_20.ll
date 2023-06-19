; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_20(ptr %0, ptr %1) !dbg !3 {
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, ptr %0, 1, !dbg !9
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 0, 2, !dbg !10
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 4, 3, 0, !dbg !11
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 2, 4, 0, !dbg !12
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 2, 3, 1, !dbg !13
  %9 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, i64 1, 4, 1, !dbg !14
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0, !dbg !15
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, ptr %1, 1, !dbg !16
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, i64 0, 2, !dbg !17
  %13 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, i64 4, 3, 0, !dbg !18
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %13, i64 1, 4, 0, !dbg !19
  br label %15, !dbg !20

15:                                               ; preds = %2
  br label %16, !dbg !21

16:                                               ; preds = %36, %15
  %17 = phi i64 [ %37, %36 ], [ 0, %15 ]
  %18 = icmp slt i64 %17, 4, !dbg !22
  br i1 %18, label %19, label %38, !dbg !23

19:                                               ; preds = %16
  br label %20, !dbg !24

20:                                               ; preds = %23, %19
  %21 = phi i64 [ %35, %23 ], [ 0, %19 ]
  %22 = icmp slt i64 %21, 2, !dbg !25
  br i1 %22, label %23, label %36, !dbg !26

23:                                               ; preds = %20
  %24 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, 1, !dbg !27
  %25 = mul i64 %17, 2, !dbg !28
  %26 = add i64 %25, %21, !dbg !29
  %27 = getelementptr float, ptr %24, i64 %26, !dbg !30
  %28 = load float, ptr %27, align 4, !dbg !31
  %29 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, 1, !dbg !32
  %30 = getelementptr float, ptr %29, i64 %17, !dbg !33
  %31 = load float, ptr %30, align 4, !dbg !34
  %32 = fadd float %28, %31, !dbg !35
  %33 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, 1, !dbg !36
  %34 = getelementptr float, ptr %33, i64 %17, !dbg !37
  store float %32, ptr %34, align 4, !dbg !38
  %35 = add i64 %21, 1, !dbg !39
  br label %20, !dbg !40

36:                                               ; preds = %20
  %37 = add i64 %17, 1, !dbg !41
  br label %16, !dbg !42

38:                                               ; preds = %16
  ret void, !dbg !43
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_20", linkageName: "main_kernel_20", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "ConvModel/1_kernels_llvmmlir/main_kernel_20_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 4, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 5, column: 10, scope: !8)
!10 = !DILocation(line: 7, column: 10, scope: !8)
!11 = !DILocation(line: 9, column: 10, scope: !8)
!12 = !DILocation(line: 11, column: 10, scope: !8)
!13 = !DILocation(line: 13, column: 11, scope: !8)
!14 = !DILocation(line: 15, column: 11, scope: !8)
!15 = !DILocation(line: 17, column: 11, scope: !8)
!16 = !DILocation(line: 18, column: 11, scope: !8)
!17 = !DILocation(line: 20, column: 11, scope: !8)
!18 = !DILocation(line: 22, column: 11, scope: !8)
!19 = !DILocation(line: 24, column: 11, scope: !8)
!20 = !DILocation(line: 29, column: 5, scope: !8)
!21 = !DILocation(line: 31, column: 5, scope: !8)
!22 = !DILocation(line: 33, column: 11, scope: !8)
!23 = !DILocation(line: 34, column: 5, scope: !8)
!24 = !DILocation(line: 36, column: 5, scope: !8)
!25 = !DILocation(line: 38, column: 11, scope: !8)
!26 = !DILocation(line: 39, column: 5, scope: !8)
!27 = !DILocation(line: 41, column: 11, scope: !8)
!28 = !DILocation(line: 43, column: 11, scope: !8)
!29 = !DILocation(line: 44, column: 11, scope: !8)
!30 = !DILocation(line: 45, column: 11, scope: !8)
!31 = !DILocation(line: 46, column: 11, scope: !8)
!32 = !DILocation(line: 47, column: 11, scope: !8)
!33 = !DILocation(line: 48, column: 11, scope: !8)
!34 = !DILocation(line: 49, column: 11, scope: !8)
!35 = !DILocation(line: 50, column: 11, scope: !8)
!36 = !DILocation(line: 51, column: 11, scope: !8)
!37 = !DILocation(line: 52, column: 11, scope: !8)
!38 = !DILocation(line: 53, column: 5, scope: !8)
!39 = !DILocation(line: 54, column: 11, scope: !8)
!40 = !DILocation(line: 55, column: 5, scope: !8)
!41 = !DILocation(line: 57, column: 11, scope: !8)
!42 = !DILocation(line: 58, column: 5, scope: !8)
!43 = !DILocation(line: 60, column: 5, scope: !8)

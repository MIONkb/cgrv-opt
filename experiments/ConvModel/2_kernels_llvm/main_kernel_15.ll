; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_15(ptr %0) !dbg !3 {
  %2 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } undef, ptr %0, 0, !dbg !7
  %3 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %2, ptr %0, 1, !dbg !9
  %4 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %3, i64 0, 2, !dbg !10
  %5 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, i64 1, 3, 0, !dbg !11
  %6 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %5, i64 8, 4, 0, !dbg !12
  %7 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %6, i64 4, 3, 1, !dbg !13
  %8 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %7, i64 2, 4, 1, !dbg !14
  %9 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %8, i64 2, 3, 2, !dbg !15
  %10 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %9, i64 1, 4, 2, !dbg !16
  br label %11, !dbg !17

11:                                               ; preds = %1
  br label %12, !dbg !18

12:                                               ; preds = %33, %11
  %13 = phi i64 [ %34, %33 ], [ 0, %11 ]
  %14 = icmp slt i64 %13, 1, !dbg !19
  br i1 %14, label %15, label %35, !dbg !20

15:                                               ; preds = %12
  br label %16, !dbg !21

16:                                               ; preds = %31, %15
  %17 = phi i64 [ %32, %31 ], [ 0, %15 ]
  %18 = icmp slt i64 %17, 4, !dbg !22
  br i1 %18, label %19, label %33, !dbg !23

19:                                               ; preds = %16
  br label %20, !dbg !24

20:                                               ; preds = %23, %19
  %21 = phi i64 [ %30, %23 ], [ 0, %19 ]
  %22 = icmp slt i64 %21, 2, !dbg !25
  br i1 %22, label %23, label %31, !dbg !26

23:                                               ; preds = %20
  %24 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %10, 1, !dbg !27
  %25 = mul i64 %13, 8, !dbg !28
  %26 = mul i64 %17, 2, !dbg !29
  %27 = add i64 %25, %26, !dbg !30
  %28 = add i64 %27, %21, !dbg !31
  %29 = getelementptr float, ptr %24, i64 %28, !dbg !32
  store float 0.000000e+00, ptr %29, align 4, !dbg !33
  %30 = add i64 %21, 1, !dbg !34
  br label %20, !dbg !35

31:                                               ; preds = %20
  %32 = add i64 %17, 1, !dbg !36
  br label %16, !dbg !37

33:                                               ; preds = %16
  %34 = add i64 %13, 1, !dbg !38
  br label %12, !dbg !39

35:                                               ; preds = %12
  ret void, !dbg !40
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_15", linkageName: "main_kernel_15", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "ConvModel/1_kernels_llvmmlir/main_kernel_15_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest")
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
!16 = !DILocation(line: 19, column: 11, scope: !8)
!17 = !DILocation(line: 25, column: 5, scope: !8)
!18 = !DILocation(line: 27, column: 5, scope: !8)
!19 = !DILocation(line: 29, column: 11, scope: !8)
!20 = !DILocation(line: 30, column: 5, scope: !8)
!21 = !DILocation(line: 32, column: 5, scope: !8)
!22 = !DILocation(line: 34, column: 11, scope: !8)
!23 = !DILocation(line: 35, column: 5, scope: !8)
!24 = !DILocation(line: 37, column: 5, scope: !8)
!25 = !DILocation(line: 39, column: 11, scope: !8)
!26 = !DILocation(line: 40, column: 5, scope: !8)
!27 = !DILocation(line: 42, column: 11, scope: !8)
!28 = !DILocation(line: 44, column: 11, scope: !8)
!29 = !DILocation(line: 46, column: 11, scope: !8)
!30 = !DILocation(line: 47, column: 11, scope: !8)
!31 = !DILocation(line: 48, column: 11, scope: !8)
!32 = !DILocation(line: 49, column: 11, scope: !8)
!33 = !DILocation(line: 50, column: 5, scope: !8)
!34 = !DILocation(line: 51, column: 11, scope: !8)
!35 = !DILocation(line: 52, column: 5, scope: !8)
!36 = !DILocation(line: 54, column: 11, scope: !8)
!37 = !DILocation(line: 55, column: 5, scope: !8)
!38 = !DILocation(line: 57, column: 11, scope: !8)
!39 = !DILocation(line: 58, column: 5, scope: !8)
!40 = !DILocation(line: 60, column: 5, scope: !8)

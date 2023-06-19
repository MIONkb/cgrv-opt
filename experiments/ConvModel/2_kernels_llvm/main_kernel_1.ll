; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_1(ptr %0) !dbg !3 {
  %2 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %0, 0, !dbg !7
  %3 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %2, ptr %0, 1, !dbg !9
  %4 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %3, i64 0, 2, !dbg !10
  %5 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %4, i64 4, 3, 0, !dbg !11
  %6 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %5, i64 1225, 4, 0, !dbg !12
  %7 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %6, i64 35, 3, 1, !dbg !13
  %8 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %7, i64 35, 4, 1, !dbg !14
  %9 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %8, i64 35, 3, 2, !dbg !15
  %10 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %9, i64 1, 4, 2, !dbg !16
  %11 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %10, i64 1, 3, 3, !dbg !17
  %12 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %11, i64 1, 4, 3, !dbg !18
  br label %13, !dbg !19

13:                                               ; preds = %1
  br label %14, !dbg !20

14:                                               ; preds = %42, %13
  %15 = phi i64 [ %43, %42 ], [ 0, %13 ]
  %16 = icmp slt i64 %15, 4, !dbg !21
  br i1 %16, label %17, label %44, !dbg !22

17:                                               ; preds = %14
  br label %18, !dbg !23

18:                                               ; preds = %40, %17
  %19 = phi i64 [ %41, %40 ], [ 0, %17 ]
  %20 = icmp slt i64 %19, 35, !dbg !24
  br i1 %20, label %21, label %42, !dbg !25

21:                                               ; preds = %18
  br label %22, !dbg !26

22:                                               ; preds = %38, %21
  %23 = phi i64 [ %39, %38 ], [ 0, %21 ]
  %24 = icmp slt i64 %23, 35, !dbg !27
  br i1 %24, label %25, label %40, !dbg !28

25:                                               ; preds = %22
  br label %26, !dbg !29

26:                                               ; preds = %29, %25
  %27 = phi i64 [ %37, %29 ], [ 0, %25 ]
  %28 = icmp slt i64 %27, 1, !dbg !30
  br i1 %28, label %29, label %38, !dbg !31

29:                                               ; preds = %26
  %30 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %12, 1, !dbg !32
  %31 = mul i64 %15, 1225, !dbg !33
  %32 = mul i64 %19, 35, !dbg !34
  %33 = add i64 %31, %32, !dbg !35
  %34 = add i64 %33, %23, !dbg !36
  %35 = add i64 %34, %27, !dbg !37
  %36 = getelementptr float, ptr %30, i64 %35, !dbg !38
  store float 0.000000e+00, ptr %36, align 4, !dbg !39
  %37 = add i64 %27, 1, !dbg !40
  br label %26, !dbg !41

38:                                               ; preds = %26
  %39 = add i64 %23, 1, !dbg !42
  br label %22, !dbg !43

40:                                               ; preds = %22
  %41 = add i64 %19, 1, !dbg !44
  br label %18, !dbg !45

42:                                               ; preds = %18
  %43 = add i64 %15, 1, !dbg !46
  br label %14, !dbg !47

44:                                               ; preds = %14
  ret void, !dbg !48
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_1", linkageName: "main_kernel_1", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "ConvModel/1_kernels_llvmmlir/main_kernel_1_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest")
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
!17 = !DILocation(line: 21, column: 11, scope: !8)
!18 = !DILocation(line: 23, column: 11, scope: !8)
!19 = !DILocation(line: 29, column: 5, scope: !8)
!20 = !DILocation(line: 31, column: 5, scope: !8)
!21 = !DILocation(line: 33, column: 11, scope: !8)
!22 = !DILocation(line: 34, column: 5, scope: !8)
!23 = !DILocation(line: 36, column: 5, scope: !8)
!24 = !DILocation(line: 38, column: 11, scope: !8)
!25 = !DILocation(line: 39, column: 5, scope: !8)
!26 = !DILocation(line: 41, column: 5, scope: !8)
!27 = !DILocation(line: 43, column: 11, scope: !8)
!28 = !DILocation(line: 44, column: 5, scope: !8)
!29 = !DILocation(line: 46, column: 5, scope: !8)
!30 = !DILocation(line: 48, column: 11, scope: !8)
!31 = !DILocation(line: 49, column: 5, scope: !8)
!32 = !DILocation(line: 51, column: 11, scope: !8)
!33 = !DILocation(line: 53, column: 11, scope: !8)
!34 = !DILocation(line: 55, column: 11, scope: !8)
!35 = !DILocation(line: 56, column: 11, scope: !8)
!36 = !DILocation(line: 57, column: 11, scope: !8)
!37 = !DILocation(line: 58, column: 11, scope: !8)
!38 = !DILocation(line: 59, column: 11, scope: !8)
!39 = !DILocation(line: 60, column: 5, scope: !8)
!40 = !DILocation(line: 61, column: 11, scope: !8)
!41 = !DILocation(line: 62, column: 5, scope: !8)
!42 = !DILocation(line: 64, column: 11, scope: !8)
!43 = !DILocation(line: 65, column: 5, scope: !8)
!44 = !DILocation(line: 67, column: 11, scope: !8)
!45 = !DILocation(line: 68, column: 5, scope: !8)
!46 = !DILocation(line: 70, column: 11, scope: !8)
!47 = !DILocation(line: 71, column: 5, scope: !8)
!48 = !DILocation(line: 73, column: 5, scope: !8)

; ModuleID = '/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel/2_kernels_llvm/main_kernel_3.ll'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_3(ptr %0) !dbg !3 {
  %2 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %0, 0, !dbg !7
  %3 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %2, ptr %0, 1, !dbg !9
  %4 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %3, i64 0, 2, !dbg !10
  %5 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %4, i64 4, 3, 0, !dbg !11
  %6 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %5, i64 256, 4, 0, !dbg !12
  %7 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %6, i64 16, 3, 1, !dbg !13
  %8 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %7, i64 16, 4, 1, !dbg !14
  %9 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %8, i64 16, 3, 2, !dbg !15
  %10 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %9, i64 1, 4, 2, !dbg !16
  br label %11, !dbg !17

11:                                               ; preds = %38, %1
  %12 = phi i64 [ %39, %38 ], [ 0, %1 ]
  %13 = icmp ult i64 %12, 4, !dbg !18
  br i1 %13, label %14, label %40, !dbg !19

14:                                               ; preds = %11
  %15 = mul nuw nsw i64 %12, 256
  br label %16, !dbg !20

16:                                               ; preds = %36, %14
  %17 = phi i64 [ %37, %36 ], [ 0, %14 ]
  %18 = icmp ult i64 %17, 16, !dbg !21
  br i1 %18, label %19, label %38, !dbg !22

19:                                               ; preds = %16
  %20 = mul nuw nsw i64 %17, 16
  %21 = add nuw nsw i64 %15, %20
  br label %22, !dbg !23

22:                                               ; preds = %34, %19
  %23 = phi i64 [ %35, %34 ], [ 0, %19 ]
  %24 = icmp ult i64 %23, 16, !dbg !24
  br i1 %24, label %25, label %36, !dbg !25

25:                                               ; preds = %22
  %26 = add nuw nsw i64 %21, %23
  br label %27, !dbg !26

27:                                               ; preds = %30, %25
  %28 = phi i64 [ %33, %30 ], [ 0, %25 ]
  %29 = icmp ult i64 %28, 1, !dbg !27
  br i1 %29, label %30, label %34, !dbg !28

30:                                               ; preds = %27
  %31 = add nuw nsw i64 %26, %28, !dbg !29
  %32 = getelementptr float, ptr %0, i64 %31, !dbg !30
  store float 0.000000e+00, ptr %32, align 4, !dbg !31
  %33 = add nuw nsw i64 %28, 1, !dbg !32
  br label %27, !dbg !33

34:                                               ; preds = %27
  %35 = add nuw nsw i64 %23, 1, !dbg !34
  br label %22, !dbg !35

36:                                               ; preds = %22
  %37 = add nuw nsw i64 %17, 1, !dbg !36
  br label %16, !dbg !37

38:                                               ; preds = %16
  %39 = add nuw nsw i64 %12, 1, !dbg !38
  br label %11, !dbg !39

40:                                               ; preds = %11
  %41 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %10, i64 1, 3, 3, !dbg !40
  %42 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %41, i64 1, 4, 3, !dbg !41
  ret void, !dbg !42
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_3", linkageName: "main_kernel_3", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/main_kernel_3_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel")
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
!17 = !DILocation(line: 31, column: 5, scope: !8)
!18 = !DILocation(line: 33, column: 11, scope: !8)
!19 = !DILocation(line: 34, column: 5, scope: !8)
!20 = !DILocation(line: 36, column: 5, scope: !8)
!21 = !DILocation(line: 38, column: 11, scope: !8)
!22 = !DILocation(line: 39, column: 5, scope: !8)
!23 = !DILocation(line: 41, column: 5, scope: !8)
!24 = !DILocation(line: 43, column: 11, scope: !8)
!25 = !DILocation(line: 44, column: 5, scope: !8)
!26 = !DILocation(line: 46, column: 5, scope: !8)
!27 = !DILocation(line: 48, column: 11, scope: !8)
!28 = !DILocation(line: 49, column: 5, scope: !8)
!29 = !DILocation(line: 58, column: 11, scope: !8)
!30 = !DILocation(line: 59, column: 11, scope: !8)
!31 = !DILocation(line: 60, column: 5, scope: !8)
!32 = !DILocation(line: 61, column: 11, scope: !8)
!33 = !DILocation(line: 62, column: 5, scope: !8)
!34 = !DILocation(line: 64, column: 11, scope: !8)
!35 = !DILocation(line: 65, column: 5, scope: !8)
!36 = !DILocation(line: 67, column: 11, scope: !8)
!37 = !DILocation(line: 68, column: 5, scope: !8)
!38 = !DILocation(line: 70, column: 11, scope: !8)
!39 = !DILocation(line: 71, column: 5, scope: !8)
!40 = !DILocation(line: 21, column: 11, scope: !8)
!41 = !DILocation(line: 23, column: 11, scope: !8)
!42 = !DILocation(line: 73, column: 5, scope: !8)

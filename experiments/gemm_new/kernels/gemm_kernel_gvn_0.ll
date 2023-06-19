; ModuleID = 'gemm_kernel_0.ll'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @gemm_kernel_0(ptr %0, ptr %1, ptr %2) !dbg !3 {
  %4 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %0, 0, !dbg !7
  %5 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %4, ptr %0, 1, !dbg !9
  %6 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %5, i64 0, 2, !dbg !10
  %7 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0, !dbg !11
  %8 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %7, ptr %1, 1, !dbg !12
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %8, i64 0, 2, !dbg !13
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %2, 0, !dbg !14
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, ptr %2, 1, !dbg !15
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, i64 0, 2, !dbg !16
  br label %13, !dbg !17

13:                                               ; preds = %41, %3
  %14 = phi i64 [ %42, %41 ], [ 0, %3 ]
  %15 = icmp ult i64 %14, 32, !dbg !18
  br i1 %15, label %16, label %43, !dbg !19

16:                                               ; preds = %13
  %17 = mul nuw nsw i64 %14, 32
  %18 = mul nuw nsw i64 %14, 32
  br label %19, !dbg !20

19:                                               ; preds = %37, %16
  %20 = phi i64 [ %40, %37 ], [ 0, %16 ]
  %21 = icmp ult i64 %20, 32, !dbg !21
  br i1 %21, label %.preheader, label %41, !dbg !22

.preheader:                                       ; preds = %19
  br label %22, !dbg !23

22:                                               ; preds = %.preheader, %26
  %23 = phi i64 [ %36, %26 ], [ 0, %.preheader ]
  %24 = phi i32 [ %35, %26 ], [ 0, %.preheader ]
  %25 = icmp ult i64 %23, 32, !dbg !24
  br i1 %25, label %26, label %37, !dbg !23

26:                                               ; preds = %22
  %27 = add nuw nsw i64 %23, %17, !dbg !25
  %28 = getelementptr i32, ptr %0, i64 %27, !dbg !26
  %29 = load i32, ptr %28, align 4, !dbg !27
  %30 = mul nuw nsw i64 %23, 32, !dbg !28
  %31 = add nuw nsw i64 %20, %30, !dbg !29
  %32 = getelementptr i32, ptr %1, i64 %31, !dbg !30
  %33 = load i32, ptr %32, align 4, !dbg !31
  %34 = mul i32 %29, %33, !dbg !32
  %35 = add i32 %24, %34, !dbg !33
  %36 = add nuw nsw i64 %23, 1, !dbg !34
  br label %22, !dbg !35

37:                                               ; preds = %22
  %.lcssa = phi i32 [ %24, %22 ]
  %38 = add nuw nsw i64 %20, %18, !dbg !36
  %39 = getelementptr i32, ptr %2, i64 %38, !dbg !37
  store i32 %.lcssa, ptr %39, align 4, !dbg !38
  %40 = add nuw nsw i64 %20, 1, !dbg !39
  br label %19, !dbg !40

41:                                               ; preds = %19
  %42 = add nuw nsw i64 %14, 1, !dbg !41
  br label %13, !dbg !42

43:                                               ; preds = %13
  %44 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, i64 1024, 3, 0, !dbg !43
  %45 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, i64 1024, 3, 0, !dbg !44
  %46 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, i64 1024, 3, 0, !dbg !45
  %47 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %44, i64 1, 4, 0, !dbg !46
  %48 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %45, i64 1, 4, 0, !dbg !47
  %49 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %46, i64 1, 4, 0, !dbg !48
  ret void, !dbg !49
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "gemm_kernel_0", linkageName: "gemm_kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "gemm_kernel_0_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/gemm_new/kernels")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 4, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 5, column: 10, scope: !8)
!10 = !DILocation(line: 7, column: 10, scope: !8)
!11 = !DILocation(line: 13, column: 11, scope: !8)
!12 = !DILocation(line: 14, column: 11, scope: !8)
!13 = !DILocation(line: 16, column: 11, scope: !8)
!14 = !DILocation(line: 22, column: 11, scope: !8)
!15 = !DILocation(line: 23, column: 11, scope: !8)
!16 = !DILocation(line: 25, column: 11, scope: !8)
!17 = !DILocation(line: 36, column: 5, scope: !8)
!18 = !DILocation(line: 38, column: 11, scope: !8)
!19 = !DILocation(line: 39, column: 5, scope: !8)
!20 = !DILocation(line: 41, column: 5, scope: !8)
!21 = !DILocation(line: 43, column: 11, scope: !8)
!22 = !DILocation(line: 44, column: 5, scope: !8)
!23 = !DILocation(line: 49, column: 5, scope: !8)
!24 = !DILocation(line: 48, column: 11, scope: !8)
!25 = !DILocation(line: 52, column: 11, scope: !8)
!26 = !DILocation(line: 54, column: 11, scope: !8)
!27 = !DILocation(line: 55, column: 11, scope: !8)
!28 = !DILocation(line: 56, column: 11, scope: !8)
!29 = !DILocation(line: 57, column: 11, scope: !8)
!30 = !DILocation(line: 59, column: 11, scope: !8)
!31 = !DILocation(line: 60, column: 11, scope: !8)
!32 = !DILocation(line: 61, column: 11, scope: !8)
!33 = !DILocation(line: 62, column: 11, scope: !8)
!34 = !DILocation(line: 63, column: 11, scope: !8)
!35 = !DILocation(line: 64, column: 5, scope: !8)
!36 = !DILocation(line: 67, column: 11, scope: !8)
!37 = !DILocation(line: 69, column: 11, scope: !8)
!38 = !DILocation(line: 70, column: 5, scope: !8)
!39 = !DILocation(line: 71, column: 11, scope: !8)
!40 = !DILocation(line: 72, column: 5, scope: !8)
!41 = !DILocation(line: 74, column: 11, scope: !8)
!42 = !DILocation(line: 75, column: 5, scope: !8)
!43 = !DILocation(line: 9, column: 10, scope: !8)
!44 = !DILocation(line: 18, column: 11, scope: !8)
!45 = !DILocation(line: 27, column: 11, scope: !8)
!46 = !DILocation(line: 11, column: 10, scope: !8)
!47 = !DILocation(line: 20, column: 11, scope: !8)
!48 = !DILocation(line: 29, column: 11, scope: !8)
!49 = !DILocation(line: 77, column: 5, scope: !8)

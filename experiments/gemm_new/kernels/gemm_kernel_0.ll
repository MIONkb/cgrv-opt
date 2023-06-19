; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @gemm_kernel_0(ptr %0, ptr %1, ptr %2) !dbg !3 {
  %4 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %0, 0, !dbg !7
  %5 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %4, ptr %0, 1, !dbg !9
  %6 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %5, i64 0, 2, !dbg !10
  %7 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, i64 1024, 3, 0, !dbg !11
  %8 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %7, i64 1, 4, 0, !dbg !12
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0, !dbg !13
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, ptr %1, 1, !dbg !14
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, i64 0, 2, !dbg !15
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, i64 1024, 3, 0, !dbg !16
  %13 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, i64 1, 4, 0, !dbg !17
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %2, 0, !dbg !18
  %15 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, ptr %2, 1, !dbg !19
  %16 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %15, i64 0, 2, !dbg !20
  %17 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %16, i64 1024, 3, 0, !dbg !21
  %18 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %17, i64 1, 4, 0, !dbg !22
  br label %19, !dbg !23

19:                                               ; preds = %3
  br label %20, !dbg !24

20:                                               ; preds = %52, %19
  %21 = phi i64 [ %53, %52 ], [ 0, %19 ]
  %22 = icmp slt i64 %21, 32, !dbg !25
  br i1 %22, label %23, label %54, !dbg !26

23:                                               ; preds = %20
  br label %24, !dbg !27

24:                                               ; preds = %46, %23
  %25 = phi i64 [ %51, %46 ], [ 0, %23 ]
  %26 = icmp slt i64 %25, 32, !dbg !28
  br i1 %26, label %27, label %52, !dbg !29

27:                                               ; preds = %24
  br label %28, !dbg !30

28:                                               ; preds = %32, %27
  %29 = phi i64 [ %45, %32 ], [ 0, %27 ]
  %30 = phi i32 [ %44, %32 ], [ 0, %27 ]
  %31 = icmp slt i64 %29, 32, !dbg !31
  br i1 %31, label %32, label %46, !dbg !32

32:                                               ; preds = %28
  %33 = mul i64 %21, 32, !dbg !33
  %34 = add i64 %29, %33, !dbg !34
  %35 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %8, 1, !dbg !35
  %36 = getelementptr i32, ptr %35, i64 %34, !dbg !36
  %37 = load i32, ptr %36, align 4, !dbg !37
  %38 = mul i64 %29, 32, !dbg !38
  %39 = add i64 %25, %38, !dbg !39
  %40 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %13, 1, !dbg !40
  %41 = getelementptr i32, ptr %40, i64 %39, !dbg !41
  %42 = load i32, ptr %41, align 4, !dbg !42
  %43 = mul i32 %37, %42, !dbg !43
  %44 = add i32 %30, %43, !dbg !44
  %45 = add i64 %29, 1, !dbg !45
  br label %28, !dbg !46

46:                                               ; preds = %28
  %47 = mul i64 %21, 32, !dbg !47
  %48 = add i64 %25, %47, !dbg !48
  %49 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %18, 1, !dbg !49
  %50 = getelementptr i32, ptr %49, i64 %48, !dbg !50
  store i32 %30, ptr %50, align 4, !dbg !51
  %51 = add i64 %25, 1, !dbg !52
  br label %24, !dbg !53

52:                                               ; preds = %24
  %53 = add i64 %21, 1, !dbg !54
  br label %20, !dbg !55

54:                                               ; preds = %20
  ret void, !dbg !56
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
!11 = !DILocation(line: 9, column: 10, scope: !8)
!12 = !DILocation(line: 11, column: 10, scope: !8)
!13 = !DILocation(line: 13, column: 11, scope: !8)
!14 = !DILocation(line: 14, column: 11, scope: !8)
!15 = !DILocation(line: 16, column: 11, scope: !8)
!16 = !DILocation(line: 18, column: 11, scope: !8)
!17 = !DILocation(line: 20, column: 11, scope: !8)
!18 = !DILocation(line: 22, column: 11, scope: !8)
!19 = !DILocation(line: 23, column: 11, scope: !8)
!20 = !DILocation(line: 25, column: 11, scope: !8)
!21 = !DILocation(line: 27, column: 11, scope: !8)
!22 = !DILocation(line: 29, column: 11, scope: !8)
!23 = !DILocation(line: 34, column: 5, scope: !8)
!24 = !DILocation(line: 36, column: 5, scope: !8)
!25 = !DILocation(line: 38, column: 11, scope: !8)
!26 = !DILocation(line: 39, column: 5, scope: !8)
!27 = !DILocation(line: 41, column: 5, scope: !8)
!28 = !DILocation(line: 43, column: 11, scope: !8)
!29 = !DILocation(line: 44, column: 5, scope: !8)
!30 = !DILocation(line: 46, column: 5, scope: !8)
!31 = !DILocation(line: 48, column: 11, scope: !8)
!32 = !DILocation(line: 49, column: 5, scope: !8)
!33 = !DILocation(line: 51, column: 11, scope: !8)
!34 = !DILocation(line: 52, column: 11, scope: !8)
!35 = !DILocation(line: 53, column: 11, scope: !8)
!36 = !DILocation(line: 54, column: 11, scope: !8)
!37 = !DILocation(line: 55, column: 11, scope: !8)
!38 = !DILocation(line: 56, column: 11, scope: !8)
!39 = !DILocation(line: 57, column: 11, scope: !8)
!40 = !DILocation(line: 58, column: 11, scope: !8)
!41 = !DILocation(line: 59, column: 11, scope: !8)
!42 = !DILocation(line: 60, column: 11, scope: !8)
!43 = !DILocation(line: 61, column: 11, scope: !8)
!44 = !DILocation(line: 62, column: 11, scope: !8)
!45 = !DILocation(line: 63, column: 11, scope: !8)
!46 = !DILocation(line: 64, column: 5, scope: !8)
!47 = !DILocation(line: 66, column: 11, scope: !8)
!48 = !DILocation(line: 67, column: 11, scope: !8)
!49 = !DILocation(line: 68, column: 11, scope: !8)
!50 = !DILocation(line: 69, column: 11, scope: !8)
!51 = !DILocation(line: 70, column: 5, scope: !8)
!52 = !DILocation(line: 71, column: 11, scope: !8)
!53 = !DILocation(line: 72, column: 5, scope: !8)
!54 = !DILocation(line: 74, column: 11, scope: !8)
!55 = !DILocation(line: 75, column: 5, scope: !8)
!56 = !DILocation(line: 77, column: 5, scope: !8)

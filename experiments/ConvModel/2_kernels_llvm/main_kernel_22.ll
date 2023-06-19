; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_22(ptr %0, ptr %1, ptr %2) !dbg !3 {
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, ptr %0, 1, !dbg !9
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 0, 2, !dbg !10
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 4, 3, 0, !dbg !11
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 2, 4, 0, !dbg !12
  %9 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, i64 2, 3, 1, !dbg !13
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, i64 1, 4, 1, !dbg !14
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0, !dbg !15
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, ptr %1, 1, !dbg !16
  %13 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, i64 0, 2, !dbg !17
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %13, i64 4, 3, 0, !dbg !18
  %15 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, i64 1, 4, 0, !dbg !19
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %2, 0, !dbg !20
  %17 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, ptr %2, 1, !dbg !21
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %17, i64 0, 2, !dbg !22
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, i64 4, 3, 0, !dbg !23
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 2, 4, 0, !dbg !24
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 2, 3, 1, !dbg !25
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 1, 4, 1, !dbg !26
  br label %23, !dbg !27

23:                                               ; preds = %3
  br label %24, !dbg !28

24:                                               ; preds = %46, %23
  %25 = phi i64 [ %47, %46 ], [ 0, %23 ]
  %26 = icmp slt i64 %25, 4, !dbg !29
  br i1 %26, label %27, label %48, !dbg !30

27:                                               ; preds = %24
  br label %28, !dbg !31

28:                                               ; preds = %31, %27
  %29 = phi i64 [ %45, %31 ], [ 0, %27 ]
  %30 = icmp slt i64 %29, 2, !dbg !32
  br i1 %30, label %31, label %46, !dbg !33

31:                                               ; preds = %28
  %32 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, 1, !dbg !34
  %33 = mul i64 %25, 2, !dbg !35
  %34 = add i64 %33, %29, !dbg !36
  %35 = getelementptr float, ptr %32, i64 %34, !dbg !37
  %36 = load float, ptr %35, align 4, !dbg !38
  %37 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %15, 1, !dbg !39
  %38 = getelementptr float, ptr %37, i64 %25, !dbg !40
  %39 = load float, ptr %38, align 4, !dbg !41
  %40 = fmul float %36, %39, !dbg !42
  %41 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, 1, !dbg !43
  %42 = mul i64 %25, 2, !dbg !44
  %43 = add i64 %42, %29, !dbg !45
  %44 = getelementptr float, ptr %41, i64 %43, !dbg !46
  store float %40, ptr %44, align 4, !dbg !47
  %45 = add i64 %29, 1, !dbg !48
  br label %28, !dbg !49

46:                                               ; preds = %28
  %47 = add i64 %25, 1, !dbg !50
  br label %24, !dbg !51

48:                                               ; preds = %24
  ret void, !dbg !52
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_22", linkageName: "main_kernel_22", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "ConvModel/1_kernels_llvmmlir/main_kernel_22_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest")
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
!20 = !DILocation(line: 26, column: 11, scope: !8)
!21 = !DILocation(line: 27, column: 11, scope: !8)
!22 = !DILocation(line: 29, column: 11, scope: !8)
!23 = !DILocation(line: 31, column: 11, scope: !8)
!24 = !DILocation(line: 33, column: 11, scope: !8)
!25 = !DILocation(line: 35, column: 11, scope: !8)
!26 = !DILocation(line: 37, column: 11, scope: !8)
!27 = !DILocation(line: 42, column: 5, scope: !8)
!28 = !DILocation(line: 44, column: 5, scope: !8)
!29 = !DILocation(line: 46, column: 11, scope: !8)
!30 = !DILocation(line: 47, column: 5, scope: !8)
!31 = !DILocation(line: 49, column: 5, scope: !8)
!32 = !DILocation(line: 51, column: 11, scope: !8)
!33 = !DILocation(line: 52, column: 5, scope: !8)
!34 = !DILocation(line: 54, column: 11, scope: !8)
!35 = !DILocation(line: 56, column: 11, scope: !8)
!36 = !DILocation(line: 57, column: 11, scope: !8)
!37 = !DILocation(line: 58, column: 11, scope: !8)
!38 = !DILocation(line: 59, column: 11, scope: !8)
!39 = !DILocation(line: 60, column: 11, scope: !8)
!40 = !DILocation(line: 61, column: 11, scope: !8)
!41 = !DILocation(line: 62, column: 11, scope: !8)
!42 = !DILocation(line: 63, column: 11, scope: !8)
!43 = !DILocation(line: 64, column: 11, scope: !8)
!44 = !DILocation(line: 66, column: 11, scope: !8)
!45 = !DILocation(line: 67, column: 11, scope: !8)
!46 = !DILocation(line: 68, column: 11, scope: !8)
!47 = !DILocation(line: 69, column: 5, scope: !8)
!48 = !DILocation(line: 70, column: 11, scope: !8)
!49 = !DILocation(line: 71, column: 5, scope: !8)
!50 = !DILocation(line: 73, column: 11, scope: !8)
!51 = !DILocation(line: 74, column: 5, scope: !8)
!52 = !DILocation(line: 76, column: 5, scope: !8)

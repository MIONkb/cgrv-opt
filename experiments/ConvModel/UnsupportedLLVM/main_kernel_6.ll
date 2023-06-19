; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_6(ptr %0, ptr %1) !dbg !3 {
  %3 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %0, 0, !dbg !7
  %4 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %3, ptr %0, 1, !dbg !9
  %5 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %4, i64 0, 2, !dbg !10
  %6 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %5, i64 4, 3, 0, !dbg !11
  %7 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %6, i64 256, 4, 0, !dbg !12
  %8 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %7, i64 16, 3, 1, !dbg !13
  %9 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %8, i64 16, 4, 1, !dbg !14
  %10 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %9, i64 16, 3, 2, !dbg !15
  %11 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %10, i64 1, 4, 2, !dbg !16
  %12 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %11, i64 1, 3, 3, !dbg !17
  %13 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %12, i64 1, 4, 3, !dbg !18
  %14 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %1, 0, !dbg !19
  %15 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %14, ptr %1, 1, !dbg !20
  %16 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %15, i64 0, 2, !dbg !21
  %17 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %16, i64 4, 3, 0, !dbg !22
  %18 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %17, i64 256, 4, 0, !dbg !23
  %19 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %18, i64 16, 3, 1, !dbg !24
  %20 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %19, i64 16, 4, 1, !dbg !25
  %21 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %20, i64 16, 3, 2, !dbg !26
  %22 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %21, i64 1, 4, 2, !dbg !27
  %23 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %22, i64 1, 3, 3, !dbg !28
  %24 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %23, i64 1, 4, 3, !dbg !29
  br label %25, !dbg !30

25:                                               ; preds = %2
  br label %26, !dbg !31

26:                                               ; preds = %66, %25
  %27 = phi i64 [ %67, %66 ], [ 0, %25 ]
  %28 = icmp slt i64 %27, 4, !dbg !32
  br i1 %28, label %29, label %68, !dbg !33

29:                                               ; preds = %26
  br label %30, !dbg !34

30:                                               ; preds = %64, %29
  %31 = phi i64 [ %65, %64 ], [ 0, %29 ]
  %32 = icmp slt i64 %31, 16, !dbg !35
  br i1 %32, label %33, label %66, !dbg !36

33:                                               ; preds = %30
  br label %34, !dbg !37

34:                                               ; preds = %62, %33
  %35 = phi i64 [ %63, %62 ], [ 0, %33 ]
  %36 = icmp slt i64 %35, 16, !dbg !38
  br i1 %36, label %37, label %64, !dbg !39

37:                                               ; preds = %34
  br label %38, !dbg !40

38:                                               ; preds = %41, %37
  %39 = phi i64 [ %61, %41 ], [ 0, %37 ]
  %40 = icmp slt i64 %39, 1, !dbg !41
  br i1 %40, label %41, label %62, !dbg !42

41:                                               ; preds = %38
  %42 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %13, 1, !dbg !43
  %43 = mul i64 %27, 256, !dbg !44
  %44 = mul i64 %31, 16, !dbg !45
  %45 = add i64 %43, %44, !dbg !46
  %46 = add i64 %45, %35, !dbg !47
  %47 = add i64 %46, %39, !dbg !48
  %48 = getelementptr float, ptr %42, i64 %47, !dbg !49
  %49 = load float, ptr %48, align 4, !dbg !50
  %50 = fcmp olt float %49, 0.000000e+00, !dbg !51
  %51 = select i1 %50, float 0.000000e+00, float %49, !dbg !52
  %52 = fcmp olt float 0x47EFFFFFE0000000, %49, !dbg !53
  %53 = select i1 %52, float 0x47EFFFFFE0000000, float %51, !dbg !54
  %54 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %24, 1, !dbg !55
  %55 = mul i64 %27, 256, !dbg !56
  %56 = mul i64 %31, 16, !dbg !57
  %57 = add i64 %55, %56, !dbg !58
  %58 = add i64 %57, %35, !dbg !59
  %59 = add i64 %58, %39, !dbg !60
  %60 = getelementptr float, ptr %54, i64 %59, !dbg !61
  store float %53, ptr %60, align 4, !dbg !62
  %61 = add i64 %39, 1, !dbg !63
  br label %38, !dbg !64

62:                                               ; preds = %38
  %63 = add i64 %35, 1, !dbg !65
  br label %34, !dbg !66

64:                                               ; preds = %34
  %65 = add i64 %31, 1, !dbg !67
  br label %30, !dbg !68

66:                                               ; preds = %30
  %67 = add i64 %27, 1, !dbg !69
  br label %26, !dbg !70

68:                                               ; preds = %26
  ret void, !dbg !71
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_6", linkageName: "main_kernel_6", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/main_kernel_6_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel")
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
!19 = !DILocation(line: 25, column: 11, scope: !8)
!20 = !DILocation(line: 26, column: 11, scope: !8)
!21 = !DILocation(line: 28, column: 11, scope: !8)
!22 = !DILocation(line: 30, column: 11, scope: !8)
!23 = !DILocation(line: 32, column: 11, scope: !8)
!24 = !DILocation(line: 34, column: 11, scope: !8)
!25 = !DILocation(line: 36, column: 11, scope: !8)
!26 = !DILocation(line: 38, column: 11, scope: !8)
!27 = !DILocation(line: 40, column: 11, scope: !8)
!28 = !DILocation(line: 42, column: 11, scope: !8)
!29 = !DILocation(line: 44, column: 11, scope: !8)
!30 = !DILocation(line: 51, column: 5, scope: !8)
!31 = !DILocation(line: 53, column: 5, scope: !8)
!32 = !DILocation(line: 55, column: 11, scope: !8)
!33 = !DILocation(line: 56, column: 5, scope: !8)
!34 = !DILocation(line: 58, column: 5, scope: !8)
!35 = !DILocation(line: 60, column: 11, scope: !8)
!36 = !DILocation(line: 61, column: 5, scope: !8)
!37 = !DILocation(line: 63, column: 5, scope: !8)
!38 = !DILocation(line: 65, column: 11, scope: !8)
!39 = !DILocation(line: 66, column: 5, scope: !8)
!40 = !DILocation(line: 68, column: 5, scope: !8)
!41 = !DILocation(line: 70, column: 11, scope: !8)
!42 = !DILocation(line: 71, column: 5, scope: !8)
!43 = !DILocation(line: 73, column: 11, scope: !8)
!44 = !DILocation(line: 75, column: 11, scope: !8)
!45 = !DILocation(line: 77, column: 11, scope: !8)
!46 = !DILocation(line: 78, column: 11, scope: !8)
!47 = !DILocation(line: 79, column: 11, scope: !8)
!48 = !DILocation(line: 80, column: 11, scope: !8)
!49 = !DILocation(line: 81, column: 11, scope: !8)
!50 = !DILocation(line: 82, column: 11, scope: !8)
!51 = !DILocation(line: 83, column: 11, scope: !8)
!52 = !DILocation(line: 84, column: 11, scope: !8)
!53 = !DILocation(line: 85, column: 11, scope: !8)
!54 = !DILocation(line: 86, column: 11, scope: !8)
!55 = !DILocation(line: 87, column: 11, scope: !8)
!56 = !DILocation(line: 89, column: 11, scope: !8)
!57 = !DILocation(line: 91, column: 11, scope: !8)
!58 = !DILocation(line: 92, column: 11, scope: !8)
!59 = !DILocation(line: 93, column: 11, scope: !8)
!60 = !DILocation(line: 94, column: 11, scope: !8)
!61 = !DILocation(line: 95, column: 11, scope: !8)
!62 = !DILocation(line: 96, column: 5, scope: !8)
!63 = !DILocation(line: 97, column: 11, scope: !8)
!64 = !DILocation(line: 98, column: 5, scope: !8)
!65 = !DILocation(line: 100, column: 11, scope: !8)
!66 = !DILocation(line: 101, column: 5, scope: !8)
!67 = !DILocation(line: 103, column: 11, scope: !8)
!68 = !DILocation(line: 104, column: 5, scope: !8)
!69 = !DILocation(line: 106, column: 11, scope: !8)
!70 = !DILocation(line: 107, column: 5, scope: !8)
!71 = !DILocation(line: 109, column: 5, scope: !8)

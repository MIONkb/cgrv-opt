; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_12(ptr %0, ptr %1, ptr %2) !dbg !3 {
  %4 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } undef, ptr %0, 0, !dbg !7
  %5 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, ptr %0, 1, !dbg !9
  %6 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %5, i64 0, 2, !dbg !10
  %7 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %6, i64 1, 3, 0, !dbg !11
  %8 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %7, i64 32, 4, 0, !dbg !12
  %9 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %8, i64 4, 3, 1, !dbg !13
  %10 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %9, i64 8, 4, 1, !dbg !14
  %11 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %10, i64 8, 3, 2, !dbg !15
  %12 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %11, i64 1, 4, 2, !dbg !16
  %13 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } undef, ptr %1, 0, !dbg !17
  %14 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %13, ptr %1, 1, !dbg !18
  %15 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %14, i64 0, 2, !dbg !19
  %16 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %15, i64 1, 3, 0, !dbg !20
  %17 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %16, i64 32, 4, 0, !dbg !21
  %18 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %17, i64 8, 3, 1, !dbg !22
  %19 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %18, i64 4, 4, 1, !dbg !23
  %20 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %19, i64 4, 3, 2, !dbg !24
  %21 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %20, i64 1, 4, 2, !dbg !25
  %22 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } undef, ptr %2, 0, !dbg !26
  %23 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %22, ptr %2, 1, !dbg !27
  %24 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %23, i64 0, 2, !dbg !28
  %25 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %24, i64 1, 3, 0, !dbg !29
  %26 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %25, i64 16, 4, 0, !dbg !30
  %27 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %26, i64 4, 3, 1, !dbg !31
  %28 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %27, i64 4, 4, 1, !dbg !32
  %29 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %28, i64 4, 3, 2, !dbg !33
  %30 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %29, i64 1, 4, 2, !dbg !34
  br label %31, !dbg !35

31:                                               ; preds = %3
  br label %32, !dbg !36

32:                                               ; preds = %82, %31
  %33 = phi i64 [ %83, %82 ], [ 0, %31 ]
  %34 = icmp slt i64 %33, 1, !dbg !37
  br i1 %34, label %35, label %84, !dbg !38

35:                                               ; preds = %32
  br label %36, !dbg !39

36:                                               ; preds = %80, %35
  %37 = phi i64 [ %81, %80 ], [ 0, %35 ]
  %38 = icmp slt i64 %37, 4, !dbg !40
  br i1 %38, label %39, label %82, !dbg !41

39:                                               ; preds = %36
  br label %40, !dbg !42

40:                                               ; preds = %78, %39
  %41 = phi i64 [ %79, %78 ], [ 0, %39 ]
  %42 = icmp slt i64 %41, 4, !dbg !43
  br i1 %42, label %43, label %80, !dbg !44

43:                                               ; preds = %40
  br label %44, !dbg !45

44:                                               ; preds = %47, %43
  %45 = phi i64 [ %77, %47 ], [ 0, %43 ]
  %46 = icmp slt i64 %45, 8, !dbg !46
  br i1 %46, label %47, label %78, !dbg !47

47:                                               ; preds = %44
  %48 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %12, 1, !dbg !48
  %49 = mul i64 %33, 32, !dbg !49
  %50 = mul i64 %37, 8, !dbg !50
  %51 = add i64 %49, %50, !dbg !51
  %52 = add i64 %51, %45, !dbg !52
  %53 = getelementptr float, ptr %48, i64 %52, !dbg !53
  %54 = load float, ptr %53, align 4, !dbg !54
  %55 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %21, 1, !dbg !55
  %56 = mul i64 %33, 32, !dbg !56
  %57 = mul i64 %45, 4, !dbg !57
  %58 = add i64 %56, %57, !dbg !58
  %59 = add i64 %58, %41, !dbg !59
  %60 = getelementptr float, ptr %55, i64 %59, !dbg !60
  %61 = load float, ptr %60, align 4, !dbg !61
  %62 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %30, 1, !dbg !62
  %63 = mul i64 %33, 16, !dbg !63
  %64 = mul i64 %37, 4, !dbg !64
  %65 = add i64 %63, %64, !dbg !65
  %66 = add i64 %65, %41, !dbg !66
  %67 = getelementptr float, ptr %62, i64 %66, !dbg !67
  %68 = load float, ptr %67, align 4, !dbg !68
  %69 = fmul float %54, %61, !dbg !69
  %70 = fadd float %68, %69, !dbg !70
  %71 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %30, 1, !dbg !71
  %72 = mul i64 %33, 16, !dbg !72
  %73 = mul i64 %37, 4, !dbg !73
  %74 = add i64 %72, %73, !dbg !74
  %75 = add i64 %74, %41, !dbg !75
  %76 = getelementptr float, ptr %71, i64 %75, !dbg !76
  store float %70, ptr %76, align 4, !dbg !77
  %77 = add i64 %45, 1, !dbg !78
  br label %44, !dbg !79

78:                                               ; preds = %44
  %79 = add i64 %41, 1, !dbg !80
  br label %40, !dbg !81

80:                                               ; preds = %40
  %81 = add i64 %37, 1, !dbg !82
  br label %36, !dbg !83

82:                                               ; preds = %36
  %83 = add i64 %33, 1, !dbg !84
  br label %32, !dbg !85

84:                                               ; preds = %32
  ret void, !dbg !86
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_12", linkageName: "main_kernel_12", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "ConvModel/1_kernels_llvmmlir/main_kernel_12_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest")
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
!18 = !DILocation(line: 22, column: 11, scope: !8)
!19 = !DILocation(line: 24, column: 11, scope: !8)
!20 = !DILocation(line: 26, column: 11, scope: !8)
!21 = !DILocation(line: 28, column: 11, scope: !8)
!22 = !DILocation(line: 30, column: 11, scope: !8)
!23 = !DILocation(line: 32, column: 11, scope: !8)
!24 = !DILocation(line: 34, column: 11, scope: !8)
!25 = !DILocation(line: 36, column: 11, scope: !8)
!26 = !DILocation(line: 38, column: 11, scope: !8)
!27 = !DILocation(line: 39, column: 11, scope: !8)
!28 = !DILocation(line: 41, column: 11, scope: !8)
!29 = !DILocation(line: 43, column: 11, scope: !8)
!30 = !DILocation(line: 45, column: 11, scope: !8)
!31 = !DILocation(line: 47, column: 11, scope: !8)
!32 = !DILocation(line: 49, column: 11, scope: !8)
!33 = !DILocation(line: 51, column: 11, scope: !8)
!34 = !DILocation(line: 53, column: 11, scope: !8)
!35 = !DILocation(line: 58, column: 5, scope: !8)
!36 = !DILocation(line: 60, column: 5, scope: !8)
!37 = !DILocation(line: 62, column: 11, scope: !8)
!38 = !DILocation(line: 63, column: 5, scope: !8)
!39 = !DILocation(line: 65, column: 5, scope: !8)
!40 = !DILocation(line: 67, column: 11, scope: !8)
!41 = !DILocation(line: 68, column: 5, scope: !8)
!42 = !DILocation(line: 70, column: 5, scope: !8)
!43 = !DILocation(line: 72, column: 11, scope: !8)
!44 = !DILocation(line: 73, column: 5, scope: !8)
!45 = !DILocation(line: 75, column: 5, scope: !8)
!46 = !DILocation(line: 77, column: 11, scope: !8)
!47 = !DILocation(line: 78, column: 5, scope: !8)
!48 = !DILocation(line: 80, column: 11, scope: !8)
!49 = !DILocation(line: 82, column: 11, scope: !8)
!50 = !DILocation(line: 84, column: 11, scope: !8)
!51 = !DILocation(line: 85, column: 11, scope: !8)
!52 = !DILocation(line: 86, column: 11, scope: !8)
!53 = !DILocation(line: 87, column: 11, scope: !8)
!54 = !DILocation(line: 88, column: 11, scope: !8)
!55 = !DILocation(line: 89, column: 11, scope: !8)
!56 = !DILocation(line: 91, column: 11, scope: !8)
!57 = !DILocation(line: 93, column: 11, scope: !8)
!58 = !DILocation(line: 94, column: 11, scope: !8)
!59 = !DILocation(line: 95, column: 11, scope: !8)
!60 = !DILocation(line: 96, column: 11, scope: !8)
!61 = !DILocation(line: 97, column: 11, scope: !8)
!62 = !DILocation(line: 98, column: 11, scope: !8)
!63 = !DILocation(line: 100, column: 11, scope: !8)
!64 = !DILocation(line: 102, column: 11, scope: !8)
!65 = !DILocation(line: 103, column: 11, scope: !8)
!66 = !DILocation(line: 104, column: 11, scope: !8)
!67 = !DILocation(line: 105, column: 11, scope: !8)
!68 = !DILocation(line: 106, column: 11, scope: !8)
!69 = !DILocation(line: 107, column: 11, scope: !8)
!70 = !DILocation(line: 108, column: 11, scope: !8)
!71 = !DILocation(line: 109, column: 11, scope: !8)
!72 = !DILocation(line: 111, column: 11, scope: !8)
!73 = !DILocation(line: 113, column: 11, scope: !8)
!74 = !DILocation(line: 114, column: 11, scope: !8)
!75 = !DILocation(line: 115, column: 11, scope: !8)
!76 = !DILocation(line: 116, column: 11, scope: !8)
!77 = !DILocation(line: 117, column: 5, scope: !8)
!78 = !DILocation(line: 118, column: 12, scope: !8)
!79 = !DILocation(line: 119, column: 5, scope: !8)
!80 = !DILocation(line: 121, column: 12, scope: !8)
!81 = !DILocation(line: 122, column: 5, scope: !8)
!82 = !DILocation(line: 124, column: 12, scope: !8)
!83 = !DILocation(line: 125, column: 5, scope: !8)
!84 = !DILocation(line: 127, column: 12, scope: !8)
!85 = !DILocation(line: 128, column: 5, scope: !8)
!86 = !DILocation(line: 130, column: 5, scope: !8)

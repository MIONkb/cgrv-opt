; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_4(ptr %0, ptr %1, ptr %2) !dbg !3 {
  %4 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %0, 0, !dbg !7
  %5 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %4, ptr %0, 1, !dbg !9
  %6 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %5, i64 0, 2, !dbg !10
  %7 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %6, i64 4, 3, 0, !dbg !11
  %8 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %7, i64 1225, 4, 0, !dbg !12
  %9 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %8, i64 35, 3, 1, !dbg !13
  %10 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %9, i64 35, 4, 1, !dbg !14
  %11 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %10, i64 35, 3, 2, !dbg !15
  %12 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %11, i64 1, 4, 2, !dbg !16
  %13 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %12, i64 1, 3, 3, !dbg !17
  %14 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %13, i64 1, 4, 3, !dbg !18
  %15 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %1, 0, !dbg !19
  %16 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %15, ptr %1, 1, !dbg !20
  %17 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %16, i64 0, 2, !dbg !21
  %18 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %17, i64 5, 3, 0, !dbg !22
  %19 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %18, i64 5, 4, 0, !dbg !23
  %20 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %19, i64 5, 3, 1, !dbg !24
  %21 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %20, i64 1, 4, 1, !dbg !25
  %22 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %21, i64 1, 3, 2, !dbg !26
  %23 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %22, i64 1, 4, 2, !dbg !27
  %24 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %23, i64 1, 3, 3, !dbg !28
  %25 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %24, i64 1, 4, 3, !dbg !29
  %26 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %2, 0, !dbg !30
  %27 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %26, ptr %2, 1, !dbg !31
  %28 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %27, i64 0, 2, !dbg !32
  %29 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %28, i64 4, 3, 0, !dbg !33
  %30 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %29, i64 256, 4, 0, !dbg !34
  %31 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %30, i64 16, 3, 1, !dbg !35
  %32 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %31, i64 16, 4, 1, !dbg !36
  %33 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %32, i64 16, 3, 2, !dbg !37
  %34 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %33, i64 1, 4, 2, !dbg !38
  %35 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %34, i64 1, 3, 3, !dbg !39
  %36 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %35, i64 1, 4, 3, !dbg !40
  br label %37, !dbg !41

37:                                               ; preds = %3
  br label %38, !dbg !42

38:                                               ; preds = %113, %37
  %39 = phi i64 [ %114, %113 ], [ 0, %37 ]
  %40 = icmp slt i64 %39, 4, !dbg !43
  br i1 %40, label %41, label %115, !dbg !44

41:                                               ; preds = %38
  br label %42, !dbg !45

42:                                               ; preds = %111, %41
  %43 = phi i64 [ %112, %111 ], [ 0, %41 ]
  %44 = icmp slt i64 %43, 16, !dbg !46
  br i1 %44, label %45, label %113, !dbg !47

45:                                               ; preds = %42
  br label %46, !dbg !48

46:                                               ; preds = %109, %45
  %47 = phi i64 [ %110, %109 ], [ 0, %45 ]
  %48 = icmp slt i64 %47, 16, !dbg !49
  br i1 %48, label %49, label %111, !dbg !50

49:                                               ; preds = %46
  br label %50, !dbg !51

50:                                               ; preds = %107, %49
  %51 = phi i64 [ %108, %107 ], [ 0, %49 ]
  %52 = icmp slt i64 %51, 1, !dbg !52
  br i1 %52, label %53, label %109, !dbg !53

53:                                               ; preds = %50
  br label %54, !dbg !54

54:                                               ; preds = %105, %53
  %55 = phi i64 [ %106, %105 ], [ 0, %53 ]
  %56 = icmp slt i64 %55, 5, !dbg !55
  br i1 %56, label %57, label %107, !dbg !56

57:                                               ; preds = %54
  br label %58, !dbg !57

58:                                               ; preds = %103, %57
  %59 = phi i64 [ %104, %103 ], [ 0, %57 ]
  %60 = icmp slt i64 %59, 5, !dbg !58
  br i1 %60, label %61, label %105, !dbg !59

61:                                               ; preds = %58
  br label %62, !dbg !60

62:                                               ; preds = %65, %61
  %63 = phi i64 [ %102, %65 ], [ 0, %61 ]
  %64 = icmp slt i64 %63, 1, !dbg !61
  br i1 %64, label %65, label %103, !dbg !62

65:                                               ; preds = %62
  %66 = mul i64 %43, 2, !dbg !63
  %67 = add i64 %66, %55, !dbg !64
  %68 = mul i64 %47, 2, !dbg !65
  %69 = add i64 %68, %59, !dbg !66
  %70 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %14, 1, !dbg !67
  %71 = mul i64 %39, 1225, !dbg !68
  %72 = mul i64 %67, 35, !dbg !69
  %73 = add i64 %71, %72, !dbg !70
  %74 = add i64 %73, %69, !dbg !71
  %75 = add i64 %74, %63, !dbg !72
  %76 = getelementptr float, ptr %70, i64 %75, !dbg !73
  %77 = load float, ptr %76, align 4, !dbg !74
  %78 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %25, 1, !dbg !75
  %79 = mul i64 %55, 5, !dbg !76
  %80 = add i64 %79, %59, !dbg !77
  %81 = add i64 %80, %63, !dbg !78
  %82 = add i64 %81, %51, !dbg !79
  %83 = getelementptr float, ptr %78, i64 %82, !dbg !80
  %84 = load float, ptr %83, align 4, !dbg !81
  %85 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %36, 1, !dbg !82
  %86 = mul i64 %39, 256, !dbg !83
  %87 = mul i64 %43, 16, !dbg !84
  %88 = add i64 %86, %87, !dbg !85
  %89 = add i64 %88, %47, !dbg !86
  %90 = add i64 %89, %51, !dbg !87
  %91 = getelementptr float, ptr %85, i64 %90, !dbg !88
  %92 = load float, ptr %91, align 4, !dbg !89
  %93 = fmul float %77, %84, !dbg !90
  %94 = fadd float %92, %93, !dbg !91
  %95 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %36, 1, !dbg !92
  %96 = mul i64 %39, 256, !dbg !93
  %97 = mul i64 %43, 16, !dbg !94
  %98 = add i64 %96, %97, !dbg !95
  %99 = add i64 %98, %47, !dbg !96
  %100 = add i64 %99, %51, !dbg !97
  %101 = getelementptr float, ptr %95, i64 %100, !dbg !98
  store float %94, ptr %101, align 4, !dbg !99
  %102 = add i64 %63, 1, !dbg !100
  br label %62, !dbg !101

103:                                              ; preds = %62
  %104 = add i64 %59, 1, !dbg !102
  br label %58, !dbg !103

105:                                              ; preds = %58
  %106 = add i64 %55, 1, !dbg !104
  br label %54, !dbg !105

107:                                              ; preds = %54
  %108 = add i64 %51, 1, !dbg !106
  br label %50, !dbg !107

109:                                              ; preds = %50
  %110 = add i64 %47, 1, !dbg !108
  br label %46, !dbg !109

111:                                              ; preds = %46
  %112 = add i64 %43, 1, !dbg !110
  br label %42, !dbg !111

113:                                              ; preds = %42
  %114 = add i64 %39, 1, !dbg !112
  br label %38, !dbg !113

115:                                              ; preds = %38
  ret void, !dbg !114
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_4", linkageName: "main_kernel_4", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "ConvModel/1_kernels_llvmmlir/main_kernel_4_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest")
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
!30 = !DILocation(line: 46, column: 11, scope: !8)
!31 = !DILocation(line: 47, column: 11, scope: !8)
!32 = !DILocation(line: 49, column: 11, scope: !8)
!33 = !DILocation(line: 51, column: 11, scope: !8)
!34 = !DILocation(line: 53, column: 11, scope: !8)
!35 = !DILocation(line: 55, column: 11, scope: !8)
!36 = !DILocation(line: 57, column: 11, scope: !8)
!37 = !DILocation(line: 59, column: 11, scope: !8)
!38 = !DILocation(line: 61, column: 11, scope: !8)
!39 = !DILocation(line: 63, column: 11, scope: !8)
!40 = !DILocation(line: 65, column: 11, scope: !8)
!41 = !DILocation(line: 72, column: 5, scope: !8)
!42 = !DILocation(line: 74, column: 5, scope: !8)
!43 = !DILocation(line: 76, column: 11, scope: !8)
!44 = !DILocation(line: 77, column: 5, scope: !8)
!45 = !DILocation(line: 79, column: 5, scope: !8)
!46 = !DILocation(line: 81, column: 11, scope: !8)
!47 = !DILocation(line: 82, column: 5, scope: !8)
!48 = !DILocation(line: 84, column: 5, scope: !8)
!49 = !DILocation(line: 86, column: 11, scope: !8)
!50 = !DILocation(line: 87, column: 5, scope: !8)
!51 = !DILocation(line: 89, column: 5, scope: !8)
!52 = !DILocation(line: 91, column: 11, scope: !8)
!53 = !DILocation(line: 92, column: 5, scope: !8)
!54 = !DILocation(line: 94, column: 5, scope: !8)
!55 = !DILocation(line: 96, column: 11, scope: !8)
!56 = !DILocation(line: 97, column: 5, scope: !8)
!57 = !DILocation(line: 99, column: 5, scope: !8)
!58 = !DILocation(line: 101, column: 11, scope: !8)
!59 = !DILocation(line: 102, column: 5, scope: !8)
!60 = !DILocation(line: 104, column: 5, scope: !8)
!61 = !DILocation(line: 106, column: 11, scope: !8)
!62 = !DILocation(line: 107, column: 5, scope: !8)
!63 = !DILocation(line: 109, column: 11, scope: !8)
!64 = !DILocation(line: 110, column: 11, scope: !8)
!65 = !DILocation(line: 111, column: 11, scope: !8)
!66 = !DILocation(line: 112, column: 11, scope: !8)
!67 = !DILocation(line: 113, column: 11, scope: !8)
!68 = !DILocation(line: 115, column: 11, scope: !8)
!69 = !DILocation(line: 117, column: 11, scope: !8)
!70 = !DILocation(line: 118, column: 11, scope: !8)
!71 = !DILocation(line: 119, column: 11, scope: !8)
!72 = !DILocation(line: 120, column: 11, scope: !8)
!73 = !DILocation(line: 121, column: 11, scope: !8)
!74 = !DILocation(line: 122, column: 11, scope: !8)
!75 = !DILocation(line: 123, column: 11, scope: !8)
!76 = !DILocation(line: 125, column: 11, scope: !8)
!77 = !DILocation(line: 126, column: 12, scope: !8)
!78 = !DILocation(line: 127, column: 12, scope: !8)
!79 = !DILocation(line: 128, column: 12, scope: !8)
!80 = !DILocation(line: 129, column: 12, scope: !8)
!81 = !DILocation(line: 130, column: 12, scope: !8)
!82 = !DILocation(line: 131, column: 12, scope: !8)
!83 = !DILocation(line: 133, column: 12, scope: !8)
!84 = !DILocation(line: 135, column: 12, scope: !8)
!85 = !DILocation(line: 136, column: 12, scope: !8)
!86 = !DILocation(line: 137, column: 12, scope: !8)
!87 = !DILocation(line: 138, column: 12, scope: !8)
!88 = !DILocation(line: 139, column: 12, scope: !8)
!89 = !DILocation(line: 140, column: 12, scope: !8)
!90 = !DILocation(line: 141, column: 12, scope: !8)
!91 = !DILocation(line: 142, column: 12, scope: !8)
!92 = !DILocation(line: 143, column: 12, scope: !8)
!93 = !DILocation(line: 145, column: 12, scope: !8)
!94 = !DILocation(line: 147, column: 12, scope: !8)
!95 = !DILocation(line: 148, column: 12, scope: !8)
!96 = !DILocation(line: 149, column: 12, scope: !8)
!97 = !DILocation(line: 150, column: 12, scope: !8)
!98 = !DILocation(line: 151, column: 12, scope: !8)
!99 = !DILocation(line: 152, column: 5, scope: !8)
!100 = !DILocation(line: 153, column: 12, scope: !8)
!101 = !DILocation(line: 154, column: 5, scope: !8)
!102 = !DILocation(line: 156, column: 12, scope: !8)
!103 = !DILocation(line: 157, column: 5, scope: !8)
!104 = !DILocation(line: 159, column: 12, scope: !8)
!105 = !DILocation(line: 160, column: 5, scope: !8)
!106 = !DILocation(line: 162, column: 12, scope: !8)
!107 = !DILocation(line: 163, column: 5, scope: !8)
!108 = !DILocation(line: 165, column: 12, scope: !8)
!109 = !DILocation(line: 166, column: 5, scope: !8)
!110 = !DILocation(line: 168, column: 12, scope: !8)
!111 = !DILocation(line: 169, column: 5, scope: !8)
!112 = !DILocation(line: 171, column: 12, scope: !8)
!113 = !DILocation(line: 172, column: 5, scope: !8)
!114 = !DILocation(line: 174, column: 5, scope: !8)

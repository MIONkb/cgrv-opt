; ModuleID = '/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel/2_kernels_llvm/main_kernel_4.ll'
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
  %13 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %1, 0, !dbg !17
  %14 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %13, ptr %1, 1, !dbg !18
  %15 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %14, i64 0, 2, !dbg !19
  %16 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %15, i64 5, 3, 0, !dbg !20
  %17 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %16, i64 5, 4, 0, !dbg !21
  %18 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %17, i64 5, 3, 1, !dbg !22
  %19 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %18, i64 1, 4, 1, !dbg !23
  %20 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %19, i64 1, 3, 2, !dbg !24
  %21 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %20, i64 1, 4, 2, !dbg !25
  %22 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %2, 0, !dbg !26
  %23 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %22, ptr %2, 1, !dbg !27
  %24 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %23, i64 0, 2, !dbg !28
  %25 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %24, i64 4, 3, 0, !dbg !29
  %26 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %25, i64 256, 4, 0, !dbg !30
  %27 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %26, i64 16, 3, 1, !dbg !31
  %28 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %27, i64 16, 4, 1, !dbg !32
  %29 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %28, i64 16, 3, 2, !dbg !33
  %30 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %29, i64 1, 4, 2, !dbg !34
  br label %31, !dbg !35

31:                                               ; preds = %96, %3
  %32 = phi i64 [ %97, %96 ], [ 0, %3 ]
  %33 = icmp ult i64 %32, 4, !dbg !36
  br i1 %33, label %34, label %98, !dbg !37

34:                                               ; preds = %31
  %35 = mul nuw nsw i64 %32, 1225
  %36 = mul nuw nsw i64 %32, 256
  br label %37, !dbg !38

37:                                               ; preds = %94, %34
  %38 = phi i64 [ %95, %94 ], [ 0, %34 ]
  %39 = icmp ult i64 %38, 16, !dbg !39
  br i1 %39, label %40, label %96, !dbg !40

40:                                               ; preds = %37
  %41 = mul nuw nsw i64 %38, 2
  %42 = mul nuw nsw i64 %38, 16
  %43 = add nuw nsw i64 %36, %42
  br label %44, !dbg !41

44:                                               ; preds = %92, %40
  %45 = phi i64 [ %93, %92 ], [ 0, %40 ]
  %46 = icmp ult i64 %45, 16, !dbg !42
  br i1 %46, label %47, label %94, !dbg !43

47:                                               ; preds = %44
  %48 = mul nuw nsw i64 %45, 2
  %49 = add nuw nsw i64 %43, %45
  br label %50, !dbg !44

50:                                               ; preds = %90, %47
  %51 = phi i64 [ %91, %90 ], [ 0, %47 ]
  %52 = icmp ult i64 %51, 1, !dbg !45
  br i1 %52, label %53, label %92, !dbg !46

53:                                               ; preds = %50
  %54 = add nuw nsw i64 %49, %51
  %55 = getelementptr float, ptr %2, i64 %54
  br label %56, !dbg !47

56:                                               ; preds = %88, %53
  %57 = phi i64 [ %89, %88 ], [ 0, %53 ]
  %58 = icmp ult i64 %57, 5, !dbg !48
  br i1 %58, label %59, label %90, !dbg !49

59:                                               ; preds = %56
  %60 = add nuw nsw i64 %41, %57
  %61 = mul nuw nsw i64 %60, 35
  %62 = add nuw nsw i64 %35, %61
  %63 = mul nuw nsw i64 %57, 5
  br label %64, !dbg !50

64:                                               ; preds = %86, %59
  %65 = phi i64 [ %87, %86 ], [ 0, %59 ]
  %66 = icmp ult i64 %65, 5, !dbg !51
  br i1 %66, label %67, label %88, !dbg !52

67:                                               ; preds = %64
  %68 = add nuw nsw i64 %48, %65
  %69 = add nuw nsw i64 %62, %68
  %70 = add nuw nsw i64 %63, %65
  br label %71, !dbg !53

71:                                               ; preds = %74, %67
  %72 = phi i64 [ %85, %74 ], [ 0, %67 ]
  %73 = icmp ult i64 %72, 1, !dbg !54
  br i1 %73, label %74, label %86, !dbg !55

74:                                               ; preds = %71
  %75 = add nuw nsw i64 %69, %72, !dbg !56
  %76 = getelementptr float, ptr %0, i64 %75, !dbg !57
  %77 = load float, ptr %76, align 4, !dbg !58
  %78 = add nuw nsw i64 %70, %72, !dbg !59
  %79 = add nuw nsw i64 %78, %51, !dbg !60
  %80 = getelementptr float, ptr %1, i64 %79, !dbg !61
  %81 = load float, ptr %80, align 4, !dbg !62
  %82 = load float, ptr %55, align 4, !dbg !63
  %83 = fmul float %77, %81, !dbg !64
  %84 = fadd float %82, %83, !dbg !65
  store float %84, ptr %55, align 4, !dbg !66
  %85 = add nuw nsw i64 %72, 1, !dbg !67
  br label %71, !dbg !68

86:                                               ; preds = %71
  %87 = add nuw nsw i64 %65, 1, !dbg !69
  br label %64, !dbg !70

88:                                               ; preds = %64
  %89 = add nuw nsw i64 %57, 1, !dbg !71
  br label %56, !dbg !72

90:                                               ; preds = %56
  %91 = add nuw nsw i64 %51, 1, !dbg !73
  br label %50, !dbg !74

92:                                               ; preds = %50
  %93 = add nuw nsw i64 %45, 1, !dbg !75
  br label %44, !dbg !76

94:                                               ; preds = %44
  %95 = add nuw nsw i64 %38, 1, !dbg !77
  br label %37, !dbg !78

96:                                               ; preds = %37
  %97 = add nuw nsw i64 %32, 1, !dbg !79
  br label %31, !dbg !80

98:                                               ; preds = %31
  %99 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %12, i64 1, 3, 3, !dbg !81
  %100 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %21, i64 1, 3, 3, !dbg !82
  %101 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %30, i64 1, 3, 3, !dbg !83
  %102 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %99, i64 1, 4, 3, !dbg !84
  %103 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %100, i64 1, 4, 3, !dbg !85
  %104 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %101, i64 1, 4, 3, !dbg !86
  ret void, !dbg !87
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_4", linkageName: "main_kernel_4", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/main_kernel_4_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel")
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
!17 = !DILocation(line: 25, column: 11, scope: !8)
!18 = !DILocation(line: 26, column: 11, scope: !8)
!19 = !DILocation(line: 28, column: 11, scope: !8)
!20 = !DILocation(line: 30, column: 11, scope: !8)
!21 = !DILocation(line: 32, column: 11, scope: !8)
!22 = !DILocation(line: 34, column: 11, scope: !8)
!23 = !DILocation(line: 36, column: 11, scope: !8)
!24 = !DILocation(line: 38, column: 11, scope: !8)
!25 = !DILocation(line: 40, column: 11, scope: !8)
!26 = !DILocation(line: 46, column: 11, scope: !8)
!27 = !DILocation(line: 47, column: 11, scope: !8)
!28 = !DILocation(line: 49, column: 11, scope: !8)
!29 = !DILocation(line: 51, column: 11, scope: !8)
!30 = !DILocation(line: 53, column: 11, scope: !8)
!31 = !DILocation(line: 55, column: 11, scope: !8)
!32 = !DILocation(line: 57, column: 11, scope: !8)
!33 = !DILocation(line: 59, column: 11, scope: !8)
!34 = !DILocation(line: 61, column: 11, scope: !8)
!35 = !DILocation(line: 74, column: 5, scope: !8)
!36 = !DILocation(line: 76, column: 11, scope: !8)
!37 = !DILocation(line: 77, column: 5, scope: !8)
!38 = !DILocation(line: 79, column: 5, scope: !8)
!39 = !DILocation(line: 81, column: 11, scope: !8)
!40 = !DILocation(line: 82, column: 5, scope: !8)
!41 = !DILocation(line: 84, column: 5, scope: !8)
!42 = !DILocation(line: 86, column: 11, scope: !8)
!43 = !DILocation(line: 87, column: 5, scope: !8)
!44 = !DILocation(line: 89, column: 5, scope: !8)
!45 = !DILocation(line: 91, column: 11, scope: !8)
!46 = !DILocation(line: 92, column: 5, scope: !8)
!47 = !DILocation(line: 94, column: 5, scope: !8)
!48 = !DILocation(line: 96, column: 11, scope: !8)
!49 = !DILocation(line: 97, column: 5, scope: !8)
!50 = !DILocation(line: 99, column: 5, scope: !8)
!51 = !DILocation(line: 101, column: 11, scope: !8)
!52 = !DILocation(line: 102, column: 5, scope: !8)
!53 = !DILocation(line: 104, column: 5, scope: !8)
!54 = !DILocation(line: 106, column: 11, scope: !8)
!55 = !DILocation(line: 107, column: 5, scope: !8)
!56 = !DILocation(line: 120, column: 11, scope: !8)
!57 = !DILocation(line: 121, column: 11, scope: !8)
!58 = !DILocation(line: 122, column: 11, scope: !8)
!59 = !DILocation(line: 127, column: 12, scope: !8)
!60 = !DILocation(line: 128, column: 12, scope: !8)
!61 = !DILocation(line: 129, column: 12, scope: !8)
!62 = !DILocation(line: 130, column: 12, scope: !8)
!63 = !DILocation(line: 140, column: 12, scope: !8)
!64 = !DILocation(line: 141, column: 12, scope: !8)
!65 = !DILocation(line: 142, column: 12, scope: !8)
!66 = !DILocation(line: 152, column: 5, scope: !8)
!67 = !DILocation(line: 153, column: 12, scope: !8)
!68 = !DILocation(line: 154, column: 5, scope: !8)
!69 = !DILocation(line: 156, column: 12, scope: !8)
!70 = !DILocation(line: 157, column: 5, scope: !8)
!71 = !DILocation(line: 159, column: 12, scope: !8)
!72 = !DILocation(line: 160, column: 5, scope: !8)
!73 = !DILocation(line: 162, column: 12, scope: !8)
!74 = !DILocation(line: 163, column: 5, scope: !8)
!75 = !DILocation(line: 165, column: 12, scope: !8)
!76 = !DILocation(line: 166, column: 5, scope: !8)
!77 = !DILocation(line: 168, column: 12, scope: !8)
!78 = !DILocation(line: 169, column: 5, scope: !8)
!79 = !DILocation(line: 171, column: 12, scope: !8)
!80 = !DILocation(line: 172, column: 5, scope: !8)
!81 = !DILocation(line: 21, column: 11, scope: !8)
!82 = !DILocation(line: 42, column: 11, scope: !8)
!83 = !DILocation(line: 63, column: 11, scope: !8)
!84 = !DILocation(line: 23, column: 11, scope: !8)
!85 = !DILocation(line: 44, column: 11, scope: !8)
!86 = !DILocation(line: 65, column: 11, scope: !8)
!87 = !DILocation(line: 174, column: 5, scope: !8)

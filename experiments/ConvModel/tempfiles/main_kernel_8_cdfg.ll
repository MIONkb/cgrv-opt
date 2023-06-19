; ModuleID = '/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel/tempfiles/main_kernel_8_gvn.ll'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_8(ptr %0, ptr %1, ptr %2) !dbg !3 {
  %4 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } undef, ptr %0, 0, !dbg !7
  %5 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %4, ptr %0, 1, !dbg !9
  %6 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %5, i64 0, 2, !dbg !10
  %7 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %6, i64 1, 3, 0, !dbg !11
  %8 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %7, i64 1024, 4, 0, !dbg !12
  %9 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %8, i64 4, 3, 1, !dbg !13
  %10 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %9, i64 256, 4, 1, !dbg !14
  %11 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } undef, ptr %1, 0, !dbg !15
  %12 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %11, ptr %1, 1, !dbg !16
  %13 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %12, i64 0, 2, !dbg !17
  %14 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %13, i64 1, 3, 0, !dbg !18
  %15 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %14, i64 2048, 4, 0, !dbg !19
  %16 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %15, i64 256, 3, 1, !dbg !20
  %17 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %16, i64 8, 4, 1, !dbg !21
  %18 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } undef, ptr %2, 0, !dbg !22
  %19 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %18, ptr %2, 1, !dbg !23
  %20 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %19, i64 0, 2, !dbg !24
  %21 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %20, i64 1, 3, 0, !dbg !25
  %22 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %21, i64 32, 4, 0, !dbg !26
  %23 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %22, i64 4, 3, 1, !dbg !27
  %24 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %23, i64 8, 4, 1, !dbg !28
  br label %25, !dbg !29

25:                                               ; preds = %66, %3
  %26 = phi i64 [ %67, %66 ], [ 0, %3 ]
  %27 = icmp ult i64 %26, 1, !dbg !30
  br i1 %27, label %28, label %68, !dbg !31

28:                                               ; preds = %25
  %29 = mul nuw nsw i64 %26, 1024
  %30 = mul nuw nsw i64 %26, 2048
  %31 = mul nuw nsw i64 %26, 32
  br label %32, !dbg !32

32:                                               ; preds = %64, %28
  %33 = phi i64 [ %65, %64 ], [ 0, %28 ]
  %34 = icmp ult i64 %33, 4, !dbg !33
  br i1 %34, label %35, label %66, !dbg !34

35:                                               ; preds = %32
  %36 = mul nuw nsw i64 %33, 256
  %37 = add nuw nsw i64 %29, %36
  %38 = mul nuw nsw i64 %33, 8
  %39 = add nuw nsw i64 %31, %38
  br label %40, !dbg !35

40:                                               ; preds = %62, %35
  %41 = phi i64 [ %63, %62 ], [ 0, %35 ]
  %42 = icmp ult i64 %41, 8, !dbg !36
  br i1 %42, label %43, label %64, !dbg !37

43:                                               ; preds = %40
  %44 = add nuw nsw i64 %39, %41
  %45 = getelementptr float, ptr %2, i64 %44
  br label %46, !dbg !38

46:                                               ; preds = %49, %43
  %47 = phi i64 [ %61, %49 ], [ 0, %43 ]
  %48 = icmp ult i64 %47, 256, !dbg !39
  br i1 %48, label %49, label %62, !dbg !40

49:                                               ; preds = %46
  %50 = add nuw nsw i64 %37, %47, !dbg !41
  %51 = getelementptr float, ptr %0, i64 %50, !dbg !42
  %52 = load float, ptr %51, align 4, !dbg !43
  %53 = mul nuw nsw i64 %47, 8, !dbg !44
  %54 = add nuw nsw i64 %30, %53, !dbg !45
  %55 = add nuw nsw i64 %54, %41, !dbg !46
  %56 = getelementptr float, ptr %1, i64 %55, !dbg !47
  %57 = load float, ptr %56, align 4, !dbg !48
  %58 = load float, ptr %45, align 4, !dbg !49
  %59 = fmul float %52, %57, !dbg !50
  %60 = fadd float %58, %59, !dbg !51
  store float %60, ptr %45, align 4, !dbg !52
  %61 = add nuw nsw i64 %47, 1, !dbg !53
  br label %46, !dbg !54

62:                                               ; preds = %46
  %63 = add nuw nsw i64 %41, 1, !dbg !55
  br label %40, !dbg !56

64:                                               ; preds = %40
  %65 = add nuw nsw i64 %33, 1, !dbg !57
  br label %32, !dbg !58

66:                                               ; preds = %32
  %67 = add nuw nsw i64 %26, 1, !dbg !59
  br label %25, !dbg !60

68:                                               ; preds = %25
  %69 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %10, i64 256, 3, 2, !dbg !61
  %70 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %17, i64 8, 3, 2, !dbg !62
  %71 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %24, i64 8, 3, 2, !dbg !63
  %72 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %69, i64 1, 4, 2, !dbg !64
  %73 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %70, i64 1, 4, 2, !dbg !65
  %74 = insertvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %71, i64 1, 4, 2, !dbg !66
  ret void, !dbg !67
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_8", linkageName: "main_kernel_8", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/main_kernel_8_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel")
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
!15 = !DILocation(line: 21, column: 11, scope: !8)
!16 = !DILocation(line: 22, column: 11, scope: !8)
!17 = !DILocation(line: 24, column: 11, scope: !8)
!18 = !DILocation(line: 26, column: 11, scope: !8)
!19 = !DILocation(line: 28, column: 11, scope: !8)
!20 = !DILocation(line: 30, column: 11, scope: !8)
!21 = !DILocation(line: 32, column: 11, scope: !8)
!22 = !DILocation(line: 38, column: 11, scope: !8)
!23 = !DILocation(line: 39, column: 11, scope: !8)
!24 = !DILocation(line: 41, column: 11, scope: !8)
!25 = !DILocation(line: 43, column: 11, scope: !8)
!26 = !DILocation(line: 45, column: 11, scope: !8)
!27 = !DILocation(line: 47, column: 11, scope: !8)
!28 = !DILocation(line: 49, column: 11, scope: !8)
!29 = !DILocation(line: 61, column: 5, scope: !8)
!30 = !DILocation(line: 63, column: 11, scope: !8)
!31 = !DILocation(line: 64, column: 5, scope: !8)
!32 = !DILocation(line: 66, column: 5, scope: !8)
!33 = !DILocation(line: 68, column: 11, scope: !8)
!34 = !DILocation(line: 69, column: 5, scope: !8)
!35 = !DILocation(line: 71, column: 5, scope: !8)
!36 = !DILocation(line: 73, column: 11, scope: !8)
!37 = !DILocation(line: 74, column: 5, scope: !8)
!38 = !DILocation(line: 76, column: 5, scope: !8)
!39 = !DILocation(line: 78, column: 11, scope: !8)
!40 = !DILocation(line: 79, column: 5, scope: !8)
!41 = !DILocation(line: 87, column: 11, scope: !8)
!42 = !DILocation(line: 88, column: 11, scope: !8)
!43 = !DILocation(line: 89, column: 11, scope: !8)
!44 = !DILocation(line: 94, column: 11, scope: !8)
!45 = !DILocation(line: 95, column: 11, scope: !8)
!46 = !DILocation(line: 96, column: 11, scope: !8)
!47 = !DILocation(line: 97, column: 11, scope: !8)
!48 = !DILocation(line: 98, column: 11, scope: !8)
!49 = !DILocation(line: 107, column: 11, scope: !8)
!50 = !DILocation(line: 108, column: 11, scope: !8)
!51 = !DILocation(line: 109, column: 11, scope: !8)
!52 = !DILocation(line: 118, column: 5, scope: !8)
!53 = !DILocation(line: 119, column: 12, scope: !8)
!54 = !DILocation(line: 120, column: 5, scope: !8)
!55 = !DILocation(line: 122, column: 12, scope: !8)
!56 = !DILocation(line: 123, column: 5, scope: !8)
!57 = !DILocation(line: 125, column: 12, scope: !8)
!58 = !DILocation(line: 126, column: 5, scope: !8)
!59 = !DILocation(line: 128, column: 12, scope: !8)
!60 = !DILocation(line: 129, column: 5, scope: !8)
!61 = !DILocation(line: 17, column: 11, scope: !8)
!62 = !DILocation(line: 34, column: 11, scope: !8)
!63 = !DILocation(line: 51, column: 11, scope: !8)
!64 = !DILocation(line: 19, column: 11, scope: !8)
!65 = !DILocation(line: 36, column: 11, scope: !8)
!66 = !DILocation(line: 53, column: 11, scope: !8)
!67 = !DILocation(line: 131, column: 5, scope: !8)

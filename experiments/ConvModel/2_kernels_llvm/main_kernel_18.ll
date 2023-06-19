; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_18(ptr %0, ptr %1) !dbg !3 {
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, ptr %0, 1, !dbg !9
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 0, 2, !dbg !10
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 4, 3, 0, !dbg !11
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 2, 4, 0, !dbg !12
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 2, 3, 1, !dbg !13
  %9 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, i64 1, 4, 1, !dbg !14
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0, !dbg !15
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %1, 1, !dbg !16
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2, !dbg !17
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 4, 3, 0, !dbg !18
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 2, 4, 0, !dbg !19
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 2, 3, 1, !dbg !20
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1, !dbg !21
  br label %17, !dbg !22

17:                                               ; preds = %2
  br label %18, !dbg !23

18:                                               ; preds = %37, %17
  %19 = phi i64 [ %38, %37 ], [ 0, %17 ]
  %20 = icmp slt i64 %19, 4, !dbg !24
  br i1 %20, label %21, label %39, !dbg !25

21:                                               ; preds = %18
  br label %22, !dbg !26

22:                                               ; preds = %25, %21
  %23 = phi i64 [ %36, %25 ], [ 0, %21 ]
  %24 = icmp slt i64 %23, 2, !dbg !27
  br i1 %24, label %25, label %37, !dbg !28

25:                                               ; preds = %22
  %26 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, 1, !dbg !29
  %27 = mul i64 %19, 2, !dbg !30
  %28 = add i64 %27, %23, !dbg !31
  %29 = getelementptr float, ptr %26, i64 %28, !dbg !32
  %30 = load float, ptr %29, align 4, !dbg !33
  %31 = call float @llvm.exp.f32(float %30), !dbg !34
  %32 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !35
  %33 = mul i64 %19, 2, !dbg !36
  %34 = add i64 %33, %23, !dbg !37
  %35 = getelementptr float, ptr %32, i64 %34, !dbg !38
  store float %31, ptr %35, align 4, !dbg !39
  %36 = add i64 %23, 1, !dbg !40
  br label %22, !dbg !41

37:                                               ; preds = %22
  %38 = add i64 %19, 1, !dbg !42
  br label %18, !dbg !43

39:                                               ; preds = %18
  ret void, !dbg !44
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #0

attributes #0 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_18", linkageName: "main_kernel_18", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "ConvModel/1_kernels_llvmmlir/main_kernel_18_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest")
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
!21 = !DILocation(line: 28, column: 11, scope: !8)
!22 = !DILocation(line: 33, column: 5, scope: !8)
!23 = !DILocation(line: 35, column: 5, scope: !8)
!24 = !DILocation(line: 37, column: 11, scope: !8)
!25 = !DILocation(line: 38, column: 5, scope: !8)
!26 = !DILocation(line: 40, column: 5, scope: !8)
!27 = !DILocation(line: 42, column: 11, scope: !8)
!28 = !DILocation(line: 43, column: 5, scope: !8)
!29 = !DILocation(line: 45, column: 11, scope: !8)
!30 = !DILocation(line: 47, column: 11, scope: !8)
!31 = !DILocation(line: 48, column: 11, scope: !8)
!32 = !DILocation(line: 49, column: 11, scope: !8)
!33 = !DILocation(line: 50, column: 11, scope: !8)
!34 = !DILocation(line: 51, column: 11, scope: !8)
!35 = !DILocation(line: 52, column: 11, scope: !8)
!36 = !DILocation(line: 54, column: 11, scope: !8)
!37 = !DILocation(line: 55, column: 11, scope: !8)
!38 = !DILocation(line: 56, column: 11, scope: !8)
!39 = !DILocation(line: 57, column: 5, scope: !8)
!40 = !DILocation(line: 58, column: 11, scope: !8)
!41 = !DILocation(line: 59, column: 5, scope: !8)
!42 = !DILocation(line: 61, column: 11, scope: !8)
!43 = !DILocation(line: 62, column: 5, scope: !8)
!44 = !DILocation(line: 64, column: 5, scope: !8)

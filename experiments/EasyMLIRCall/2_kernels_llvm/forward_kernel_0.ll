; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_0(ptr %0, ptr %1, ptr %2) !dbg !3 {
  %4 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %0, 0, !dbg !7
  %5 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %4, ptr %0, 1, !dbg !9
  %6 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %5, i64 0, 2, !dbg !10
  %7 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, i64 10, 3, 0, !dbg !11
  %8 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %7, i64 1, 4, 0, !dbg !12
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0, !dbg !13
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, ptr %1, 1, !dbg !14
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, i64 0, 2, !dbg !15
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, i64 10, 3, 0, !dbg !16
  %13 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, i64 1, 4, 0, !dbg !17
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %2, 0, !dbg !18
  %15 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, ptr %2, 1, !dbg !19
  %16 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %15, i64 0, 2, !dbg !20
  %17 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %16, i64 10, 3, 0, !dbg !21
  %18 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %17, i64 1, 4, 0, !dbg !22
  br label %19, !dbg !23

19:                                               ; preds = %3
  br label %20, !dbg !24

20:                                               ; preds = %23, %19
  %21 = phi i64 [ %33, %23 ], [ 0, %19 ]
  %22 = icmp slt i64 %21, 10, !dbg !25
  br i1 %22, label %23, label %34, !dbg !26

23:                                               ; preds = %20
  %24 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %8, 1, !dbg !27
  %25 = getelementptr float, ptr %24, i64 %21, !dbg !28
  %26 = load float, ptr %25, align 4, !dbg !29
  %27 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %13, 1, !dbg !30
  %28 = getelementptr float, ptr %27, i64 %21, !dbg !31
  %29 = load float, ptr %28, align 4, !dbg !32
  %30 = fadd float %26, %29, !dbg !33
  %31 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %18, 1, !dbg !34
  %32 = getelementptr float, ptr %31, i64 %21, !dbg !35
  store float %30, ptr %32, align 4, !dbg !36
  %33 = add i64 %21, 1, !dbg !37
  br label %20, !dbg !38

34:                                               ; preds = %20
  ret void, !dbg !39
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_0", linkageName: "forward_kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/forward_kernel_0_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/EasyMLIRCall")
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
!23 = !DILocation(line: 33, column: 5, scope: !8)
!24 = !DILocation(line: 35, column: 5, scope: !8)
!25 = !DILocation(line: 37, column: 11, scope: !8)
!26 = !DILocation(line: 38, column: 5, scope: !8)
!27 = !DILocation(line: 40, column: 11, scope: !8)
!28 = !DILocation(line: 41, column: 11, scope: !8)
!29 = !DILocation(line: 42, column: 11, scope: !8)
!30 = !DILocation(line: 43, column: 11, scope: !8)
!31 = !DILocation(line: 44, column: 11, scope: !8)
!32 = !DILocation(line: 45, column: 11, scope: !8)
!33 = !DILocation(line: 46, column: 11, scope: !8)
!34 = !DILocation(line: 47, column: 11, scope: !8)
!35 = !DILocation(line: 48, column: 11, scope: !8)
!36 = !DILocation(line: 49, column: 5, scope: !8)
!37 = !DILocation(line: 50, column: 11, scope: !8)
!38 = !DILocation(line: 51, column: 5, scope: !8)
!39 = !DILocation(line: 53, column: 5, scope: !8)

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_1(ptr %0) !dbg !3 {
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %0, 1, !dbg !9
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2, !dbg !10
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 2, 3, 0, !dbg !11
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 3, 4, 0, !dbg !12
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 3, 3, 1, !dbg !13
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1, !dbg !14
  br label %9, !dbg !15

9:                                                ; preds = %1
  br label %10, !dbg !16

10:                                               ; preds = %23, %9
  %11 = phi i64 [ %24, %23 ], [ 0, %9 ]
  %12 = icmp slt i64 %11, 2, !dbg !17
  br i1 %12, label %13, label %25, !dbg !18

13:                                               ; preds = %10
  br label %14, !dbg !19

14:                                               ; preds = %17, %13
  %15 = phi i64 [ %22, %17 ], [ 0, %13 ]
  %16 = icmp slt i64 %15, 3, !dbg !20
  br i1 %16, label %17, label %23, !dbg !21

17:                                               ; preds = %14
  %18 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, 1, !dbg !22
  %19 = mul i64 %11, 3, !dbg !23
  %20 = add i64 %19, %15, !dbg !24
  %21 = getelementptr float, ptr %18, i64 %20, !dbg !25
  store float 0.000000e+00, ptr %21, align 4, !dbg !26
  %22 = add i64 %15, 1, !dbg !27
  br label %14, !dbg !28

23:                                               ; preds = %14
  %24 = add i64 %11, 1, !dbg !29
  br label %10, !dbg !30

25:                                               ; preds = %10
  ret void, !dbg !31
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_1", linkageName: "forward_kernel_1", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/forward_kernel_1_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/FloatKernel")
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
!15 = !DILocation(line: 21, column: 5, scope: !8)
!16 = !DILocation(line: 23, column: 5, scope: !8)
!17 = !DILocation(line: 25, column: 11, scope: !8)
!18 = !DILocation(line: 26, column: 5, scope: !8)
!19 = !DILocation(line: 28, column: 5, scope: !8)
!20 = !DILocation(line: 30, column: 11, scope: !8)
!21 = !DILocation(line: 31, column: 5, scope: !8)
!22 = !DILocation(line: 33, column: 11, scope: !8)
!23 = !DILocation(line: 35, column: 11, scope: !8)
!24 = !DILocation(line: 36, column: 11, scope: !8)
!25 = !DILocation(line: 37, column: 11, scope: !8)
!26 = !DILocation(line: 38, column: 5, scope: !8)
!27 = !DILocation(line: 39, column: 11, scope: !8)
!28 = !DILocation(line: 40, column: 5, scope: !8)
!29 = !DILocation(line: 42, column: 11, scope: !8)
!30 = !DILocation(line: 43, column: 5, scope: !8)
!31 = !DILocation(line: 45, column: 5, scope: !8)

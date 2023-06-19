; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_19(ptr %0) !dbg !3 {
  %2 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %0, 0, !dbg !7
  %3 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %2, ptr %0, 1, !dbg !9
  %4 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %3, i64 0, 2, !dbg !10
  %5 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %4, i64 4, 3, 0, !dbg !11
  %6 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %5, i64 1, 4, 0, !dbg !12
  br label %7, !dbg !13

7:                                                ; preds = %1
  br label %8, !dbg !14

8:                                                ; preds = %11, %7
  %9 = phi i64 [ %14, %11 ], [ 0, %7 ]
  %10 = icmp slt i64 %9, 4, !dbg !15
  br i1 %10, label %11, label %15, !dbg !16

11:                                               ; preds = %8
  %12 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, 1, !dbg !17
  %13 = getelementptr float, ptr %12, i64 %9, !dbg !18
  store float 0.000000e+00, ptr %13, align 4, !dbg !19
  %14 = add i64 %9, 1, !dbg !20
  br label %8, !dbg !21

15:                                               ; preds = %8
  ret void, !dbg !22
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_19", linkageName: "main_kernel_19", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "ConvModel/1_kernels_llvmmlir/main_kernel_19_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 4, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 5, column: 10, scope: !8)
!10 = !DILocation(line: 7, column: 10, scope: !8)
!11 = !DILocation(line: 9, column: 10, scope: !8)
!12 = !DILocation(line: 11, column: 10, scope: !8)
!13 = !DILocation(line: 16, column: 5, scope: !8)
!14 = !DILocation(line: 18, column: 5, scope: !8)
!15 = !DILocation(line: 20, column: 11, scope: !8)
!16 = !DILocation(line: 21, column: 5, scope: !8)
!17 = !DILocation(line: 23, column: 11, scope: !8)
!18 = !DILocation(line: 24, column: 11, scope: !8)
!19 = !DILocation(line: 25, column: 5, scope: !8)
!20 = !DILocation(line: 26, column: 11, scope: !8)
!21 = !DILocation(line: 27, column: 5, scope: !8)
!22 = !DILocation(line: 29, column: 5, scope: !8)

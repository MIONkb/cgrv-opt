; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_2(ptr %0, ptr %1) !dbg !3 {
  br label %3, !dbg !7

3:                                                ; preds = %2
  br label %4, !dbg !9

4:                                                ; preds = %24, %3
  %5 = phi i64 [ %25, %24 ], [ 0, %3 ]
  %6 = icmp slt i64 %5, 16, !dbg !10
  br i1 %6, label %7, label %26, !dbg !11

7:                                                ; preds = %4
  br label %8, !dbg !12

8:                                                ; preds = %11, %7
  %9 = phi i64 [ %23, %11 ], [ 0, %7 ]
  %10 = icmp slt i64 %9, 112, !dbg !13
  br i1 %10, label %11, label %24, !dbg !14

11:                                               ; preds = %8
  %12 = mul i64 %5, 112, !dbg !15
  %13 = add i64 0, %12, !dbg !16
  %14 = add i64 %13, %9, !dbg !17
  %15 = getelementptr float, ptr %0, i64 %14, !dbg !18
  %16 = load float, ptr %15, align 4, !dbg !19
  %17 = fcmp ugt float %16, 0.000000e+00, !dbg !20
  %18 = select i1 %17, float %16, float 0.000000e+00, !dbg !21
  %19 = mul i64 %5, 112, !dbg !22
  %20 = add i64 0, %19, !dbg !23
  %21 = add i64 %20, %9, !dbg !24
  %22 = getelementptr float, ptr %1, i64 %21, !dbg !25
  store float %18, ptr %22, align 4, !dbg !26
  %23 = add i64 %9, 1, !dbg !27
  br label %8, !dbg !28

24:                                               ; preds = %8
  %25 = add i64 %5, 1, !dbg !29
  br label %4, !dbg !30

26:                                               ; preds = %4
  ret void, !dbg !31
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/forward_kernel_2_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 10, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 12, column: 5, scope: !8)
!10 = !DILocation(line: 14, column: 10, scope: !8)
!11 = !DILocation(line: 15, column: 5, scope: !8)
!12 = !DILocation(line: 17, column: 5, scope: !8)
!13 = !DILocation(line: 19, column: 11, scope: !8)
!14 = !DILocation(line: 20, column: 5, scope: !8)
!15 = !DILocation(line: 25, column: 11, scope: !8)
!16 = !DILocation(line: 26, column: 11, scope: !8)
!17 = !DILocation(line: 27, column: 11, scope: !8)
!18 = !DILocation(line: 28, column: 11, scope: !8)
!19 = !DILocation(line: 29, column: 11, scope: !8)
!20 = !DILocation(line: 30, column: 11, scope: !8)
!21 = !DILocation(line: 31, column: 11, scope: !8)
!22 = !DILocation(line: 35, column: 11, scope: !8)
!23 = !DILocation(line: 36, column: 11, scope: !8)
!24 = !DILocation(line: 37, column: 11, scope: !8)
!25 = !DILocation(line: 38, column: 11, scope: !8)
!26 = !DILocation(line: 39, column: 5, scope: !8)
!27 = !DILocation(line: 40, column: 11, scope: !8)
!28 = !DILocation(line: 41, column: 5, scope: !8)
!29 = !DILocation(line: 43, column: 11, scope: !8)
!30 = !DILocation(line: 44, column: 5, scope: !8)
!31 = !DILocation(line: 46, column: 5, scope: !8)

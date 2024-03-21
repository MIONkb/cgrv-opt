; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_0(ptr %0, ptr %1, ptr %2) !dbg !3 {
  br label %4, !dbg !7

4:                                                ; preds = %3
  br label %5, !dbg !9

5:                                                ; preds = %26, %4
  %6 = phi i64 [ %27, %26 ], [ 0, %4 ]
  %7 = icmp slt i64 %6, 3, !dbg !10
  br i1 %7, label %8, label %28, !dbg !11

8:                                                ; preds = %5
  br label %9, !dbg !12

9:                                                ; preds = %12, %8
  %10 = phi i64 [ %25, %12 ], [ 0, %8 ]
  %11 = icmp slt i64 %10, 5, !dbg !13
  br i1 %11, label %12, label %26, !dbg !14

12:                                               ; preds = %9
  %13 = mul i64 %6, 5, !dbg !15
  %14 = add i64 %13, %10, !dbg !16
  %15 = getelementptr float, ptr %0, i64 %14, !dbg !17
  %16 = load float, ptr %15, align 4, !dbg !18
  %17 = mul i64 %6, 5, !dbg !19
  %18 = add i64 %17, %10, !dbg !20
  %19 = getelementptr float, ptr %1, i64 %18, !dbg !21
  %20 = load float, ptr %19, align 4, !dbg !22
  %21 = fadd float %16, %20, !dbg !23
  %22 = mul i64 %6, 5, !dbg !24
  %23 = add i64 %22, %10, !dbg !25
  %24 = getelementptr float, ptr %2, i64 %23, !dbg !26
  store float %21, ptr %24, align 4, !dbg !27
  %25 = add i64 %10, 1, !dbg !28
  br label %9, !dbg !29

26:                                               ; preds = %9
  %27 = add i64 %6, 1, !dbg !30
  br label %5, !dbg !31

28:                                               ; preds = %5
  ret void, !dbg !32
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
!7 = !DILocation(line: 7, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 9, column: 5, scope: !8)
!10 = !DILocation(line: 11, column: 10, scope: !8)
!11 = !DILocation(line: 12, column: 5, scope: !8)
!12 = !DILocation(line: 14, column: 5, scope: !8)
!13 = !DILocation(line: 16, column: 10, scope: !8)
!14 = !DILocation(line: 17, column: 5, scope: !8)
!15 = !DILocation(line: 19, column: 10, scope: !8)
!16 = !DILocation(line: 20, column: 10, scope: !8)
!17 = !DILocation(line: 21, column: 11, scope: !8)
!18 = !DILocation(line: 22, column: 11, scope: !8)
!19 = !DILocation(line: 23, column: 11, scope: !8)
!20 = !DILocation(line: 24, column: 11, scope: !8)
!21 = !DILocation(line: 25, column: 11, scope: !8)
!22 = !DILocation(line: 26, column: 11, scope: !8)
!23 = !DILocation(line: 27, column: 11, scope: !8)
!24 = !DILocation(line: 28, column: 11, scope: !8)
!25 = !DILocation(line: 29, column: 11, scope: !8)
!26 = !DILocation(line: 30, column: 11, scope: !8)
!27 = !DILocation(line: 31, column: 5, scope: !8)
!28 = !DILocation(line: 32, column: 11, scope: !8)
!29 = !DILocation(line: 33, column: 5, scope: !8)
!30 = !DILocation(line: 35, column: 11, scope: !8)
!31 = !DILocation(line: 36, column: 5, scope: !8)
!32 = !DILocation(line: 38, column: 5, scope: !8)

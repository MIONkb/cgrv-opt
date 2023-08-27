; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_2(ptr %0, ptr %1) !dbg !3 {
  br label %3, !dbg !7

3:                                                ; preds = %2
  br label %4, !dbg !9

4:                                                ; preds = %36, %3
  %5 = phi i64 [ %37, %36 ], [ 0, %3 ]
  %6 = icmp slt i64 %5, 16, !dbg !10
  br i1 %6, label %7, label %38, !dbg !11

7:                                                ; preds = %4
  br label %8, !dbg !12

8:                                                ; preds = %11, %7
  %9 = phi i64 [ %35, %11 ], [ 0, %7 ]
  %10 = icmp slt i64 %9, 112, !dbg !13
  br i1 %10, label %11, label %36, !dbg !14

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
  %24 = mul i64 %5, 112, !dbg !28
  %25 = add i64 0, %24, !dbg !29
  %26 = add i64 %25, %23, !dbg !30
  %27 = getelementptr float, ptr %0, i64 %26, !dbg !31
  %28 = load float, ptr %27, align 4, !dbg !32
  %29 = fcmp ugt float %28, 0.000000e+00, !dbg !33
  %30 = select i1 %29, float %28, float 0.000000e+00, !dbg !34
  %31 = mul i64 %5, 112, !dbg !35
  %32 = add i64 0, %31, !dbg !36
  %33 = add i64 %32, %23, !dbg !37
  %34 = getelementptr float, ptr %1, i64 %33, !dbg !38
  store float %30, ptr %34, align 4, !dbg !39
  %35 = add i64 %9, 2, !dbg !40
  br label %8, !dbg !41

36:                                               ; preds = %8
  %37 = add i64 %5, 1, !dbg !42
  br label %4, !dbg !43

38:                                               ; preds = %4
  ret void, !dbg !44
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_2_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 11, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 13, column: 5, scope: !8)
!10 = !DILocation(line: 15, column: 10, scope: !8)
!11 = !DILocation(line: 16, column: 5, scope: !8)
!12 = !DILocation(line: 18, column: 5, scope: !8)
!13 = !DILocation(line: 20, column: 11, scope: !8)
!14 = !DILocation(line: 21, column: 5, scope: !8)
!15 = !DILocation(line: 26, column: 11, scope: !8)
!16 = !DILocation(line: 27, column: 11, scope: !8)
!17 = !DILocation(line: 28, column: 11, scope: !8)
!18 = !DILocation(line: 29, column: 11, scope: !8)
!19 = !DILocation(line: 30, column: 11, scope: !8)
!20 = !DILocation(line: 31, column: 11, scope: !8)
!21 = !DILocation(line: 32, column: 11, scope: !8)
!22 = !DILocation(line: 36, column: 11, scope: !8)
!23 = !DILocation(line: 37, column: 11, scope: !8)
!24 = !DILocation(line: 38, column: 11, scope: !8)
!25 = !DILocation(line: 39, column: 11, scope: !8)
!26 = !DILocation(line: 40, column: 5, scope: !8)
!27 = !DILocation(line: 41, column: 11, scope: !8)
!28 = !DILocation(line: 45, column: 11, scope: !8)
!29 = !DILocation(line: 46, column: 11, scope: !8)
!30 = !DILocation(line: 47, column: 11, scope: !8)
!31 = !DILocation(line: 48, column: 11, scope: !8)
!32 = !DILocation(line: 49, column: 11, scope: !8)
!33 = !DILocation(line: 50, column: 11, scope: !8)
!34 = !DILocation(line: 51, column: 11, scope: !8)
!35 = !DILocation(line: 55, column: 11, scope: !8)
!36 = !DILocation(line: 56, column: 11, scope: !8)
!37 = !DILocation(line: 57, column: 11, scope: !8)
!38 = !DILocation(line: 58, column: 11, scope: !8)
!39 = !DILocation(line: 59, column: 5, scope: !8)
!40 = !DILocation(line: 60, column: 11, scope: !8)
!41 = !DILocation(line: 61, column: 5, scope: !8)
!42 = !DILocation(line: 63, column: 11, scope: !8)
!43 = !DILocation(line: 64, column: 5, scope: !8)
!44 = !DILocation(line: 66, column: 5, scope: !8)

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_3(ptr %0, ptr %1, ptr %2) !dbg !3 {
  br label %4, !dbg !7

4:                                                ; preds = %3
  br label %5, !dbg !9

5:                                                ; preds = %48, %4
  %6 = phi i64 [ %49, %48 ], [ 0, %4 ]
  %7 = icmp slt i64 %6, 4, !dbg !10
  br i1 %7, label %8, label %50, !dbg !11

8:                                                ; preds = %5
  br label %9, !dbg !12

9:                                                ; preds = %42, %8
  %10 = phi i64 [ %47, %42 ], [ 0, %8 ]
  %11 = icmp slt i64 %10, 56, !dbg !13
  br i1 %11, label %12, label %48, !dbg !14

12:                                               ; preds = %9
  %13 = mul i64 %6, 56, !dbg !15
  %14 = add i64 0, %13, !dbg !16
  %15 = add i64 %14, %10, !dbg !17
  %16 = getelementptr float, ptr %0, i64 %15, !dbg !18
  %17 = load float, ptr %16, align 4, !dbg !19
  br label %18, !dbg !20

18:                                               ; preds = %40, %12
  %19 = phi i64 [ %41, %40 ], [ 0, %12 ]
  %20 = phi float [ %25, %40 ], [ %17, %12 ]
  %21 = icmp slt i64 %19, 3, !dbg !21
  br i1 %21, label %22, label %42, !dbg !22

22:                                               ; preds = %18
  br label %23, !dbg !23

23:                                               ; preds = %27, %22
  %24 = phi i64 [ %39, %27 ], [ 0, %22 ]
  %25 = phi float [ %38, %27 ], [ %20, %22 ]
  %26 = icmp slt i64 %24, 3, !dbg !24
  br i1 %26, label %27, label %40, !dbg !25

27:                                               ; preds = %23
  %28 = mul i64 %6, 2, !dbg !26
  %29 = add i64 %28, %19, !dbg !27
  %30 = mul i64 %10, 2, !dbg !28
  %31 = add i64 %30, %24, !dbg !29
  %32 = mul i64 %29, 114, !dbg !30
  %33 = add i64 0, %32, !dbg !31
  %34 = add i64 %33, %31, !dbg !32
  %35 = getelementptr float, ptr %1, i64 %34, !dbg !33
  %36 = load float, ptr %35, align 4, !dbg !34
  %37 = fcmp ugt float %25, %36, !dbg !35
  %38 = select i1 %37, float %25, float %36, !dbg !36
  %39 = add i64 %24, 1, !dbg !37
  br label %23, !dbg !38

40:                                               ; preds = %23
  %41 = add i64 %19, 1, !dbg !39
  br label %18, !dbg !40

42:                                               ; preds = %18
  %43 = mul i64 %6, 56, !dbg !41
  %44 = add i64 0, %43, !dbg !42
  %45 = add i64 %44, %10, !dbg !43
  %46 = getelementptr float, ptr %2, i64 %45, !dbg !44
  store float %20, ptr %46, align 4, !dbg !45
  %47 = add i64 %10, 1, !dbg !46
  br label %9, !dbg !47

48:                                               ; preds = %9
  %49 = add i64 %6, 1, !dbg !48
  br label %5, !dbg !49

50:                                               ; preds = %5
  ret void, !dbg !50
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_3", linkageName: "forward_kernel_3", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/forward_kernel_3_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 14, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 16, column: 5, scope: !8)
!10 = !DILocation(line: 18, column: 11, scope: !8)
!11 = !DILocation(line: 19, column: 5, scope: !8)
!12 = !DILocation(line: 21, column: 5, scope: !8)
!13 = !DILocation(line: 23, column: 11, scope: !8)
!14 = !DILocation(line: 24, column: 5, scope: !8)
!15 = !DILocation(line: 29, column: 11, scope: !8)
!16 = !DILocation(line: 30, column: 11, scope: !8)
!17 = !DILocation(line: 31, column: 11, scope: !8)
!18 = !DILocation(line: 32, column: 11, scope: !8)
!19 = !DILocation(line: 33, column: 11, scope: !8)
!20 = !DILocation(line: 34, column: 5, scope: !8)
!21 = !DILocation(line: 36, column: 11, scope: !8)
!22 = !DILocation(line: 37, column: 5, scope: !8)
!23 = !DILocation(line: 39, column: 5, scope: !8)
!24 = !DILocation(line: 41, column: 11, scope: !8)
!25 = !DILocation(line: 42, column: 5, scope: !8)
!26 = !DILocation(line: 44, column: 11, scope: !8)
!27 = !DILocation(line: 45, column: 11, scope: !8)
!28 = !DILocation(line: 46, column: 11, scope: !8)
!29 = !DILocation(line: 47, column: 11, scope: !8)
!30 = !DILocation(line: 51, column: 11, scope: !8)
!31 = !DILocation(line: 52, column: 11, scope: !8)
!32 = !DILocation(line: 53, column: 11, scope: !8)
!33 = !DILocation(line: 54, column: 11, scope: !8)
!34 = !DILocation(line: 55, column: 11, scope: !8)
!35 = !DILocation(line: 56, column: 11, scope: !8)
!36 = !DILocation(line: 57, column: 11, scope: !8)
!37 = !DILocation(line: 58, column: 11, scope: !8)
!38 = !DILocation(line: 59, column: 5, scope: !8)
!39 = !DILocation(line: 61, column: 11, scope: !8)
!40 = !DILocation(line: 62, column: 5, scope: !8)
!41 = !DILocation(line: 67, column: 11, scope: !8)
!42 = !DILocation(line: 68, column: 11, scope: !8)
!43 = !DILocation(line: 69, column: 11, scope: !8)
!44 = !DILocation(line: 70, column: 11, scope: !8)
!45 = !DILocation(line: 71, column: 5, scope: !8)
!46 = !DILocation(line: 72, column: 11, scope: !8)
!47 = !DILocation(line: 73, column: 5, scope: !8)
!48 = !DILocation(line: 75, column: 11, scope: !8)
!49 = !DILocation(line: 76, column: 5, scope: !8)
!50 = !DILocation(line: 78, column: 5, scope: !8)

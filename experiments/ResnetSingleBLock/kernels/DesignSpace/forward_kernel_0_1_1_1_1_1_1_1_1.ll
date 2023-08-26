; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_0(ptr %0, ptr %1, ptr %2, ptr %3) !dbg !3 {
  br label %5, !dbg !7

5:                                                ; preds = %4
  br label %6, !dbg !9

6:                                                ; preds = %51, %5
  %7 = phi i64 [ %54, %51 ], [ 0, %5 ]
  %8 = icmp slt i64 %7, 8, !dbg !10
  br i1 %8, label %9, label %55, !dbg !11

9:                                                ; preds = %6
  %10 = add i64 0, %7, !dbg !12
  %11 = getelementptr float, ptr %0, i64 %10, !dbg !13
  %12 = load float, ptr %11, align 4, !dbg !14
  br label %13, !dbg !15

13:                                               ; preds = %49, %9
  %14 = phi i64 [ %50, %49 ], [ 0, %9 ]
  %15 = phi float [ %20, %49 ], [ %12, %9 ]
  %16 = icmp slt i64 %14, 3, !dbg !16
  br i1 %16, label %17, label %51, !dbg !17

17:                                               ; preds = %13
  br label %18, !dbg !18

18:                                               ; preds = %47, %17
  %19 = phi i64 [ %48, %47 ], [ 0, %17 ]
  %20 = phi float [ %25, %47 ], [ %15, %17 ]
  %21 = icmp slt i64 %19, 7, !dbg !19
  br i1 %21, label %22, label %49, !dbg !20

22:                                               ; preds = %18
  br label %23, !dbg !21

23:                                               ; preds = %27, %22
  %24 = phi i64 [ %46, %27 ], [ 0, %22 ]
  %25 = phi float [ %45, %27 ], [ %20, %22 ]
  %26 = icmp slt i64 %24, 7, !dbg !22
  br i1 %26, label %27, label %47, !dbg !23

27:                                               ; preds = %23
  %28 = mul i64 %7, 2, !dbg !24
  %29 = add i64 %28, %24, !dbg !25
  %30 = mul i64 %14, 52900, !dbg !26
  %31 = add i64 0, %30, !dbg !27
  %32 = mul i64 %19, 230, !dbg !28
  %33 = add i64 %31, %32, !dbg !29
  %34 = add i64 %33, %29, !dbg !30
  %35 = getelementptr float, ptr %1, i64 %34, !dbg !31
  %36 = load float, ptr %35, align 4, !dbg !32
  %37 = mul i64 %14, 49, !dbg !33
  %38 = add i64 0, %37, !dbg !34
  %39 = mul i64 %19, 7, !dbg !35
  %40 = add i64 %38, %39, !dbg !36
  %41 = add i64 %40, %24, !dbg !37
  %42 = getelementptr float, ptr %2, i64 %41, !dbg !38
  %43 = load float, ptr %42, align 4, !dbg !39
  %44 = fmul float %36, %43, !dbg !40
  %45 = fadd float %25, %44, !dbg !41
  %46 = add i64 %24, 1, !dbg !42
  br label %23, !dbg !43

47:                                               ; preds = %23
  %48 = add i64 %19, 1, !dbg !44
  br label %18, !dbg !45

49:                                               ; preds = %18
  %50 = add i64 %14, 1, !dbg !46
  br label %13, !dbg !47

51:                                               ; preds = %13
  %52 = add i64 0, %7, !dbg !48
  %53 = getelementptr float, ptr %3, i64 %52, !dbg !49
  store float %15, ptr %53, align 4, !dbg !50
  %54 = add i64 %7, 1, !dbg !51
  br label %6, !dbg !52

55:                                               ; preds = %6
  ret void, !dbg !53
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_0", linkageName: "forward_kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_0_1_1_1_1_1_1_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 17, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 19, column: 5, scope: !8)
!10 = !DILocation(line: 21, column: 11, scope: !8)
!11 = !DILocation(line: 22, column: 5, scope: !8)
!12 = !DILocation(line: 29, column: 11, scope: !8)
!13 = !DILocation(line: 30, column: 11, scope: !8)
!14 = !DILocation(line: 31, column: 11, scope: !8)
!15 = !DILocation(line: 32, column: 5, scope: !8)
!16 = !DILocation(line: 34, column: 11, scope: !8)
!17 = !DILocation(line: 35, column: 5, scope: !8)
!18 = !DILocation(line: 37, column: 5, scope: !8)
!19 = !DILocation(line: 39, column: 11, scope: !8)
!20 = !DILocation(line: 40, column: 5, scope: !8)
!21 = !DILocation(line: 42, column: 5, scope: !8)
!22 = !DILocation(line: 44, column: 11, scope: !8)
!23 = !DILocation(line: 45, column: 5, scope: !8)
!24 = !DILocation(line: 47, column: 11, scope: !8)
!25 = !DILocation(line: 48, column: 11, scope: !8)
!26 = !DILocation(line: 50, column: 11, scope: !8)
!27 = !DILocation(line: 51, column: 11, scope: !8)
!28 = !DILocation(line: 52, column: 11, scope: !8)
!29 = !DILocation(line: 53, column: 11, scope: !8)
!30 = !DILocation(line: 54, column: 11, scope: !8)
!31 = !DILocation(line: 55, column: 11, scope: !8)
!32 = !DILocation(line: 56, column: 11, scope: !8)
!33 = !DILocation(line: 58, column: 11, scope: !8)
!34 = !DILocation(line: 59, column: 11, scope: !8)
!35 = !DILocation(line: 60, column: 11, scope: !8)
!36 = !DILocation(line: 61, column: 11, scope: !8)
!37 = !DILocation(line: 62, column: 11, scope: !8)
!38 = !DILocation(line: 63, column: 11, scope: !8)
!39 = !DILocation(line: 64, column: 11, scope: !8)
!40 = !DILocation(line: 65, column: 11, scope: !8)
!41 = !DILocation(line: 66, column: 11, scope: !8)
!42 = !DILocation(line: 67, column: 11, scope: !8)
!43 = !DILocation(line: 68, column: 5, scope: !8)
!44 = !DILocation(line: 70, column: 11, scope: !8)
!45 = !DILocation(line: 71, column: 5, scope: !8)
!46 = !DILocation(line: 73, column: 11, scope: !8)
!47 = !DILocation(line: 74, column: 5, scope: !8)
!48 = !DILocation(line: 81, column: 11, scope: !8)
!49 = !DILocation(line: 82, column: 11, scope: !8)
!50 = !DILocation(line: 83, column: 5, scope: !8)
!51 = !DILocation(line: 84, column: 11, scope: !8)
!52 = !DILocation(line: 85, column: 5, scope: !8)
!53 = !DILocation(line: 87, column: 5, scope: !8)

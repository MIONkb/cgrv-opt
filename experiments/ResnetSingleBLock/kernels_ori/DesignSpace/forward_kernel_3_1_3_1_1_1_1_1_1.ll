; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_3(ptr %0, ptr %1, ptr %2) !dbg !3 {
  br label %4, !dbg !7

4:                                                ; preds = %3
  br label %5, !dbg !9

5:                                                ; preds = %62, %4
  %6 = phi i64 [ %63, %62 ], [ 0, %4 ]
  %7 = icmp slt i64 %6, 4, !dbg !10
  br i1 %7, label %8, label %64, !dbg !11

8:                                                ; preds = %5
  br label %9, !dbg !12

9:                                                ; preds = %56, %8
  %10 = phi i64 [ %61, %56 ], [ 0, %8 ]
  %11 = icmp slt i64 %10, 56, !dbg !13
  br i1 %11, label %12, label %62, !dbg !14

12:                                               ; preds = %9
  %13 = mul i64 %6, 56, !dbg !15
  %14 = add i64 0, %13, !dbg !16
  %15 = add i64 %14, %10, !dbg !17
  %16 = getelementptr float, ptr %0, i64 %15, !dbg !18
  %17 = load float, ptr %16, align 4, !dbg !19
  br label %18, !dbg !20

18:                                               ; preds = %22, %12
  %19 = phi i64 [ %55, %22 ], [ 0, %12 ]
  %20 = phi float [ %54, %22 ], [ %17, %12 ]
  %21 = icmp slt i64 %19, 3, !dbg !21
  br i1 %21, label %22, label %56, !dbg !22

22:                                               ; preds = %18
  %23 = mul i64 %6, 2, !dbg !23
  %24 = add i64 %23, %19, !dbg !24
  %25 = mul i64 %10, 2, !dbg !25
  %26 = mul i64 %24, 114, !dbg !26
  %27 = add i64 0, %26, !dbg !27
  %28 = add i64 %27, %25, !dbg !28
  %29 = getelementptr float, ptr %1, i64 %28, !dbg !29
  %30 = load float, ptr %29, align 4, !dbg !30
  %31 = fcmp ugt float %20, %30, !dbg !31
  %32 = select i1 %31, float %20, float %30, !dbg !32
  %33 = mul i64 %6, 2, !dbg !33
  %34 = add i64 %33, %19, !dbg !34
  %35 = mul i64 %10, 2, !dbg !35
  %36 = add i64 %35, 1, !dbg !36
  %37 = mul i64 %34, 114, !dbg !37
  %38 = add i64 0, %37, !dbg !38
  %39 = add i64 %38, %36, !dbg !39
  %40 = getelementptr float, ptr %1, i64 %39, !dbg !40
  %41 = load float, ptr %40, align 4, !dbg !41
  %42 = fcmp ugt float %32, %41, !dbg !42
  %43 = select i1 %42, float %32, float %41, !dbg !43
  %44 = mul i64 %6, 2, !dbg !44
  %45 = add i64 %44, %19, !dbg !45
  %46 = mul i64 %10, 2, !dbg !46
  %47 = add i64 %46, 2, !dbg !47
  %48 = mul i64 %45, 114, !dbg !48
  %49 = add i64 0, %48, !dbg !49
  %50 = add i64 %49, %47, !dbg !50
  %51 = getelementptr float, ptr %1, i64 %50, !dbg !51
  %52 = load float, ptr %51, align 4, !dbg !52
  %53 = fcmp ugt float %43, %52, !dbg !53
  %54 = select i1 %53, float %43, float %52, !dbg !54
  %55 = add i64 %19, 1, !dbg !55
  br label %18, !dbg !56

56:                                               ; preds = %18
  %57 = mul i64 %6, 56, !dbg !57
  %58 = add i64 0, %57, !dbg !58
  %59 = add i64 %58, %10, !dbg !59
  %60 = getelementptr float, ptr %2, i64 %59, !dbg !60
  store float %20, ptr %60, align 4, !dbg !61
  %61 = add i64 %10, 1, !dbg !62
  br label %9, !dbg !63

62:                                               ; preds = %9
  %63 = add i64 %6, 1, !dbg !64
  br label %5, !dbg !65

64:                                               ; preds = %5
  ret void, !dbg !66
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_3", linkageName: "forward_kernel_3", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_3_1_3_1_1_1_1_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
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
!23 = !DILocation(line: 39, column: 11, scope: !8)
!24 = !DILocation(line: 40, column: 11, scope: !8)
!25 = !DILocation(line: 41, column: 11, scope: !8)
!26 = !DILocation(line: 45, column: 11, scope: !8)
!27 = !DILocation(line: 46, column: 11, scope: !8)
!28 = !DILocation(line: 47, column: 11, scope: !8)
!29 = !DILocation(line: 48, column: 11, scope: !8)
!30 = !DILocation(line: 49, column: 11, scope: !8)
!31 = !DILocation(line: 50, column: 11, scope: !8)
!32 = !DILocation(line: 51, column: 11, scope: !8)
!33 = !DILocation(line: 52, column: 11, scope: !8)
!34 = !DILocation(line: 53, column: 11, scope: !8)
!35 = !DILocation(line: 54, column: 11, scope: !8)
!36 = !DILocation(line: 55, column: 11, scope: !8)
!37 = !DILocation(line: 59, column: 11, scope: !8)
!38 = !DILocation(line: 60, column: 11, scope: !8)
!39 = !DILocation(line: 61, column: 11, scope: !8)
!40 = !DILocation(line: 62, column: 11, scope: !8)
!41 = !DILocation(line: 63, column: 11, scope: !8)
!42 = !DILocation(line: 64, column: 11, scope: !8)
!43 = !DILocation(line: 65, column: 11, scope: !8)
!44 = !DILocation(line: 66, column: 11, scope: !8)
!45 = !DILocation(line: 67, column: 11, scope: !8)
!46 = !DILocation(line: 68, column: 11, scope: !8)
!47 = !DILocation(line: 69, column: 11, scope: !8)
!48 = !DILocation(line: 73, column: 11, scope: !8)
!49 = !DILocation(line: 74, column: 11, scope: !8)
!50 = !DILocation(line: 75, column: 11, scope: !8)
!51 = !DILocation(line: 76, column: 11, scope: !8)
!52 = !DILocation(line: 77, column: 11, scope: !8)
!53 = !DILocation(line: 78, column: 11, scope: !8)
!54 = !DILocation(line: 79, column: 11, scope: !8)
!55 = !DILocation(line: 80, column: 11, scope: !8)
!56 = !DILocation(line: 81, column: 5, scope: !8)
!57 = !DILocation(line: 86, column: 11, scope: !8)
!58 = !DILocation(line: 87, column: 11, scope: !8)
!59 = !DILocation(line: 88, column: 11, scope: !8)
!60 = !DILocation(line: 89, column: 11, scope: !8)
!61 = !DILocation(line: 90, column: 5, scope: !8)
!62 = !DILocation(line: 91, column: 11, scope: !8)
!63 = !DILocation(line: 92, column: 5, scope: !8)
!64 = !DILocation(line: 94, column: 11, scope: !8)
!65 = !DILocation(line: 95, column: 5, scope: !8)
!66 = !DILocation(line: 97, column: 5, scope: !8)

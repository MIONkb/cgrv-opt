; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_2(ptr %0, ptr %1) !dbg !3 {
  br label %3, !dbg !7

3:                                                ; preds = %2
  br label %4, !dbg !9

4:                                                ; preds = %60, %3
  %5 = phi i64 [ %61, %60 ], [ 0, %3 ]
  %6 = icmp slt i64 %5, 16, !dbg !10
  br i1 %6, label %7, label %62, !dbg !11

7:                                                ; preds = %4
  br label %8, !dbg !12

8:                                                ; preds = %11, %7
  %9 = phi i64 [ %59, %11 ], [ 0, %7 ]
  %10 = icmp slt i64 %9, 112, !dbg !13
  br i1 %10, label %11, label %60, !dbg !14

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
  %36 = mul i64 %5, 112, !dbg !41
  %37 = add i64 0, %36, !dbg !42
  %38 = add i64 %37, %35, !dbg !43
  %39 = getelementptr float, ptr %0, i64 %38, !dbg !44
  %40 = load float, ptr %39, align 4, !dbg !45
  %41 = fcmp ugt float %40, 0.000000e+00, !dbg !46
  %42 = select i1 %41, float %40, float 0.000000e+00, !dbg !47
  %43 = mul i64 %5, 112, !dbg !48
  %44 = add i64 0, %43, !dbg !49
  %45 = add i64 %44, %35, !dbg !50
  %46 = getelementptr float, ptr %1, i64 %45, !dbg !51
  store float %42, ptr %46, align 4, !dbg !52
  %47 = add i64 %9, 3, !dbg !53
  %48 = mul i64 %5, 112, !dbg !54
  %49 = add i64 0, %48, !dbg !55
  %50 = add i64 %49, %47, !dbg !56
  %51 = getelementptr float, ptr %0, i64 %50, !dbg !57
  %52 = load float, ptr %51, align 4, !dbg !58
  %53 = fcmp ugt float %52, 0.000000e+00, !dbg !59
  %54 = select i1 %53, float %52, float 0.000000e+00, !dbg !60
  %55 = mul i64 %5, 112, !dbg !61
  %56 = add i64 0, %55, !dbg !62
  %57 = add i64 %56, %47, !dbg !63
  %58 = getelementptr float, ptr %1, i64 %57, !dbg !64
  store float %54, ptr %58, align 4, !dbg !65
  %59 = add i64 %9, 4, !dbg !66
  br label %8, !dbg !67

60:                                               ; preds = %8
  %61 = add i64 %5, 1, !dbg !68
  br label %4, !dbg !69

62:                                               ; preds = %4
  ret void, !dbg !70
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_4_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 13, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 15, column: 5, scope: !8)
!10 = !DILocation(line: 17, column: 11, scope: !8)
!11 = !DILocation(line: 18, column: 5, scope: !8)
!12 = !DILocation(line: 20, column: 5, scope: !8)
!13 = !DILocation(line: 22, column: 11, scope: !8)
!14 = !DILocation(line: 23, column: 5, scope: !8)
!15 = !DILocation(line: 28, column: 11, scope: !8)
!16 = !DILocation(line: 29, column: 11, scope: !8)
!17 = !DILocation(line: 30, column: 11, scope: !8)
!18 = !DILocation(line: 31, column: 11, scope: !8)
!19 = !DILocation(line: 32, column: 11, scope: !8)
!20 = !DILocation(line: 33, column: 11, scope: !8)
!21 = !DILocation(line: 34, column: 11, scope: !8)
!22 = !DILocation(line: 38, column: 11, scope: !8)
!23 = !DILocation(line: 39, column: 11, scope: !8)
!24 = !DILocation(line: 40, column: 11, scope: !8)
!25 = !DILocation(line: 41, column: 11, scope: !8)
!26 = !DILocation(line: 42, column: 5, scope: !8)
!27 = !DILocation(line: 43, column: 11, scope: !8)
!28 = !DILocation(line: 47, column: 11, scope: !8)
!29 = !DILocation(line: 48, column: 11, scope: !8)
!30 = !DILocation(line: 49, column: 11, scope: !8)
!31 = !DILocation(line: 50, column: 11, scope: !8)
!32 = !DILocation(line: 51, column: 11, scope: !8)
!33 = !DILocation(line: 52, column: 11, scope: !8)
!34 = !DILocation(line: 53, column: 11, scope: !8)
!35 = !DILocation(line: 57, column: 11, scope: !8)
!36 = !DILocation(line: 58, column: 11, scope: !8)
!37 = !DILocation(line: 59, column: 11, scope: !8)
!38 = !DILocation(line: 60, column: 11, scope: !8)
!39 = !DILocation(line: 61, column: 5, scope: !8)
!40 = !DILocation(line: 62, column: 11, scope: !8)
!41 = !DILocation(line: 66, column: 11, scope: !8)
!42 = !DILocation(line: 67, column: 11, scope: !8)
!43 = !DILocation(line: 68, column: 11, scope: !8)
!44 = !DILocation(line: 69, column: 11, scope: !8)
!45 = !DILocation(line: 70, column: 11, scope: !8)
!46 = !DILocation(line: 71, column: 11, scope: !8)
!47 = !DILocation(line: 72, column: 11, scope: !8)
!48 = !DILocation(line: 76, column: 11, scope: !8)
!49 = !DILocation(line: 77, column: 11, scope: !8)
!50 = !DILocation(line: 78, column: 11, scope: !8)
!51 = !DILocation(line: 79, column: 11, scope: !8)
!52 = !DILocation(line: 80, column: 5, scope: !8)
!53 = !DILocation(line: 81, column: 11, scope: !8)
!54 = !DILocation(line: 85, column: 11, scope: !8)
!55 = !DILocation(line: 86, column: 11, scope: !8)
!56 = !DILocation(line: 87, column: 11, scope: !8)
!57 = !DILocation(line: 88, column: 11, scope: !8)
!58 = !DILocation(line: 89, column: 11, scope: !8)
!59 = !DILocation(line: 90, column: 11, scope: !8)
!60 = !DILocation(line: 91, column: 11, scope: !8)
!61 = !DILocation(line: 95, column: 11, scope: !8)
!62 = !DILocation(line: 96, column: 11, scope: !8)
!63 = !DILocation(line: 97, column: 11, scope: !8)
!64 = !DILocation(line: 98, column: 11, scope: !8)
!65 = !DILocation(line: 99, column: 5, scope: !8)
!66 = !DILocation(line: 100, column: 11, scope: !8)
!67 = !DILocation(line: 101, column: 5, scope: !8)
!68 = !DILocation(line: 103, column: 11, scope: !8)
!69 = !DILocation(line: 104, column: 5, scope: !8)
!70 = !DILocation(line: 106, column: 5, scope: !8)

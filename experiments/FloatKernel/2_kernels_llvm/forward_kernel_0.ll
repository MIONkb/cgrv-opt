; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_0(ptr %0, ptr %1, ptr %2) !dbg !3 {
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, ptr %0, 1, !dbg !9
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 0, 2, !dbg !10
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 2, 3, 0, !dbg !11
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 3, 4, 0, !dbg !12
  %9 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, i64 3, 3, 1, !dbg !13
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, i64 1, 4, 1, !dbg !14
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0, !dbg !15
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, ptr %1, 1, !dbg !16
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 0, 2, !dbg !17
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 3, 3, 0, !dbg !18
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 3, 4, 0, !dbg !19
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 3, 3, 1, !dbg !20
  %17 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, i64 1, 4, 1, !dbg !21
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %2, 0, !dbg !22
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, ptr %2, 1, !dbg !23
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 0, 2, !dbg !24
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 2, 3, 0, !dbg !25
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 3, 4, 0, !dbg !26
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 3, 3, 1, !dbg !27
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 1, 4, 1, !dbg !28
  br label %25, !dbg !29

25:                                               ; preds = %3
  br label %26, !dbg !30

26:                                               ; preds = %63, %25
  %27 = phi i64 [ %64, %63 ], [ 0, %25 ]
  %28 = icmp slt i64 %27, 2, !dbg !31
  br i1 %28, label %29, label %65, !dbg !32

29:                                               ; preds = %26
  br label %30, !dbg !33

30:                                               ; preds = %57, %29
  %31 = phi i64 [ %62, %57 ], [ 0, %29 ]
  %32 = icmp slt i64 %31, 3, !dbg !34
  br i1 %32, label %33, label %63, !dbg !35

33:                                               ; preds = %30
  %34 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !36
  %35 = mul i64 %27, 3, !dbg !37
  %36 = add i64 %35, %31, !dbg !38
  %37 = getelementptr float, ptr %34, i64 %36, !dbg !39
  %38 = load float, ptr %37, align 4, !dbg !40
  br label %39, !dbg !41

39:                                               ; preds = %43, %33
  %40 = phi i64 [ %56, %43 ], [ 0, %33 ]
  %41 = phi float [ %55, %43 ], [ %38, %33 ]
  %42 = icmp slt i64 %40, 3, !dbg !42
  br i1 %42, label %43, label %57, !dbg !43

43:                                               ; preds = %39
  %44 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, 1, !dbg !44
  %45 = mul i64 %27, 3, !dbg !45
  %46 = add i64 %45, %40, !dbg !46
  %47 = getelementptr float, ptr %44, i64 %46, !dbg !47
  %48 = load float, ptr %47, align 4, !dbg !48
  %49 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %17, 1, !dbg !49
  %50 = mul i64 %40, 3, !dbg !50
  %51 = add i64 %50, %31, !dbg !51
  %52 = getelementptr float, ptr %49, i64 %51, !dbg !52
  %53 = load float, ptr %52, align 4, !dbg !53
  %54 = fmul float %48, %53, !dbg !54
  %55 = fadd float %41, %54, !dbg !55
  %56 = add i64 %40, 1, !dbg !56
  br label %39, !dbg !57

57:                                               ; preds = %39
  %58 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !58
  %59 = mul i64 %27, 3, !dbg !59
  %60 = add i64 %59, %31, !dbg !60
  %61 = getelementptr float, ptr %58, i64 %60, !dbg !61
  store float %41, ptr %61, align 4, !dbg !62
  %62 = add i64 %31, 1, !dbg !63
  br label %30, !dbg !64

63:                                               ; preds = %30
  %64 = add i64 %27, 1, !dbg !65
  br label %26, !dbg !66

65:                                               ; preds = %26
  ret void, !dbg !67
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_0", linkageName: "forward_kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/forward_kernel_0_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/FloatKernel")
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
!15 = !DILocation(line: 17, column: 11, scope: !8)
!16 = !DILocation(line: 18, column: 11, scope: !8)
!17 = !DILocation(line: 20, column: 11, scope: !8)
!18 = !DILocation(line: 22, column: 11, scope: !8)
!19 = !DILocation(line: 24, column: 11, scope: !8)
!20 = !DILocation(line: 26, column: 11, scope: !8)
!21 = !DILocation(line: 28, column: 11, scope: !8)
!22 = !DILocation(line: 30, column: 11, scope: !8)
!23 = !DILocation(line: 31, column: 11, scope: !8)
!24 = !DILocation(line: 33, column: 11, scope: !8)
!25 = !DILocation(line: 35, column: 11, scope: !8)
!26 = !DILocation(line: 37, column: 11, scope: !8)
!27 = !DILocation(line: 39, column: 11, scope: !8)
!28 = !DILocation(line: 41, column: 11, scope: !8)
!29 = !DILocation(line: 46, column: 5, scope: !8)
!30 = !DILocation(line: 48, column: 5, scope: !8)
!31 = !DILocation(line: 50, column: 11, scope: !8)
!32 = !DILocation(line: 51, column: 5, scope: !8)
!33 = !DILocation(line: 53, column: 5, scope: !8)
!34 = !DILocation(line: 55, column: 11, scope: !8)
!35 = !DILocation(line: 56, column: 5, scope: !8)
!36 = !DILocation(line: 58, column: 11, scope: !8)
!37 = !DILocation(line: 60, column: 11, scope: !8)
!38 = !DILocation(line: 61, column: 11, scope: !8)
!39 = !DILocation(line: 62, column: 11, scope: !8)
!40 = !DILocation(line: 63, column: 11, scope: !8)
!41 = !DILocation(line: 64, column: 5, scope: !8)
!42 = !DILocation(line: 66, column: 11, scope: !8)
!43 = !DILocation(line: 67, column: 5, scope: !8)
!44 = !DILocation(line: 69, column: 11, scope: !8)
!45 = !DILocation(line: 71, column: 11, scope: !8)
!46 = !DILocation(line: 72, column: 11, scope: !8)
!47 = !DILocation(line: 73, column: 11, scope: !8)
!48 = !DILocation(line: 74, column: 11, scope: !8)
!49 = !DILocation(line: 75, column: 11, scope: !8)
!50 = !DILocation(line: 77, column: 11, scope: !8)
!51 = !DILocation(line: 78, column: 11, scope: !8)
!52 = !DILocation(line: 79, column: 11, scope: !8)
!53 = !DILocation(line: 80, column: 11, scope: !8)
!54 = !DILocation(line: 81, column: 11, scope: !8)
!55 = !DILocation(line: 82, column: 11, scope: !8)
!56 = !DILocation(line: 83, column: 11, scope: !8)
!57 = !DILocation(line: 84, column: 5, scope: !8)
!58 = !DILocation(line: 86, column: 11, scope: !8)
!59 = !DILocation(line: 88, column: 11, scope: !8)
!60 = !DILocation(line: 89, column: 11, scope: !8)
!61 = !DILocation(line: 90, column: 11, scope: !8)
!62 = !DILocation(line: 91, column: 5, scope: !8)
!63 = !DILocation(line: 92, column: 11, scope: !8)
!64 = !DILocation(line: 93, column: 5, scope: !8)
!65 = !DILocation(line: 95, column: 11, scope: !8)
!66 = !DILocation(line: 96, column: 5, scope: !8)
!67 = !DILocation(line: 98, column: 5, scope: !8)

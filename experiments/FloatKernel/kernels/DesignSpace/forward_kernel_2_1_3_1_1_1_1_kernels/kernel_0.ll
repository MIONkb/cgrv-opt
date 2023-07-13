; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @kernel_0(ptr %0, ptr %1, ptr %2) !dbg !3 {
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
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 2, 3, 0, !dbg !18
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 3, 4, 0, !dbg !19
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 3, 3, 1, !dbg !20
  %17 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, i64 1, 4, 1, !dbg !21
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %2, 0, !dbg !22
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, ptr %2, 1, !dbg !23
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 0, 2, !dbg !24
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 3, 3, 0, !dbg !25
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 3, 4, 0, !dbg !26
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 3, 3, 1, !dbg !27
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 1, 4, 1, !dbg !28
  br label %25, !dbg !29

25:                                               ; preds = %3
  br label %26, !dbg !30

26:                                               ; preds = %77, %25
  %27 = phi i64 [ %78, %77 ], [ 0, %25 ]
  %28 = icmp slt i64 %27, 2, !dbg !31
  br i1 %28, label %29, label %79, !dbg !32

29:                                               ; preds = %26
  br label %30, !dbg !33

30:                                               ; preds = %33, %29
  %31 = phi i64 [ %76, %33 ], [ 0, %29 ]
  %32 = icmp slt i64 %31, 3, !dbg !34
  br i1 %32, label %33, label %77, !dbg !35

33:                                               ; preds = %30
  %34 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, 1, !dbg !36
  %35 = mul i64 %27, 3, !dbg !37
  %36 = add i64 %35, %31, !dbg !38
  %37 = getelementptr float, ptr %34, i64 %36, !dbg !39
  %38 = load float, ptr %37, align 4, !dbg !40
  %39 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %17, 1, !dbg !41
  %40 = mul i64 %27, 3, !dbg !42
  %41 = add i64 %40, 0, !dbg !43
  %42 = getelementptr float, ptr %39, i64 %41, !dbg !44
  %43 = load float, ptr %42, align 4, !dbg !45
  %44 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !46
  %45 = add i64 0, %31, !dbg !47
  %46 = getelementptr float, ptr %44, i64 %45, !dbg !48
  %47 = load float, ptr %46, align 4, !dbg !49
  %48 = fmul float %43, %47, !dbg !50
  %49 = fadd float %38, %48, !dbg !51
  %50 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %17, 1, !dbg !52
  %51 = mul i64 %27, 3, !dbg !53
  %52 = add i64 %51, 1, !dbg !54
  %53 = getelementptr float, ptr %50, i64 %52, !dbg !55
  %54 = load float, ptr %53, align 4, !dbg !56
  %55 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !57
  %56 = add i64 3, %31, !dbg !58
  %57 = getelementptr float, ptr %55, i64 %56, !dbg !59
  %58 = load float, ptr %57, align 4, !dbg !60
  %59 = fmul float %54, %58, !dbg !61
  %60 = fadd float %49, %59, !dbg !62
  %61 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %17, 1, !dbg !63
  %62 = mul i64 %27, 3, !dbg !64
  %63 = add i64 %62, 2, !dbg !65
  %64 = getelementptr float, ptr %61, i64 %63, !dbg !66
  %65 = load float, ptr %64, align 4, !dbg !67
  %66 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, 1, !dbg !68
  %67 = add i64 6, %31, !dbg !69
  %68 = getelementptr float, ptr %66, i64 %67, !dbg !70
  %69 = load float, ptr %68, align 4, !dbg !71
  %70 = fmul float %65, %69, !dbg !72
  %71 = fadd float %60, %70, !dbg !73
  %72 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, 1, !dbg !74
  %73 = mul i64 %27, 3, !dbg !75
  %74 = add i64 %73, %31, !dbg !76
  %75 = getelementptr float, ptr %72, i64 %74, !dbg !77
  store float %71, ptr %75, align 4, !dbg !78
  %76 = add i64 %31, 1, !dbg !79
  br label %30, !dbg !80

77:                                               ; preds = %30
  %78 = add i64 %27, 1, !dbg !81
  br label %26, !dbg !82

79:                                               ; preds = %26
  ret void, !dbg !83
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "kernel_0", linkageName: "kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "kernel_0_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/FloatKernel/kernels/DesignSpace/forward_kernel_2_1_3_1_1_1_1_kernels")
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
!41 = !DILocation(line: 64, column: 11, scope: !8)
!42 = !DILocation(line: 66, column: 11, scope: !8)
!43 = !DILocation(line: 67, column: 11, scope: !8)
!44 = !DILocation(line: 68, column: 11, scope: !8)
!45 = !DILocation(line: 69, column: 11, scope: !8)
!46 = !DILocation(line: 70, column: 11, scope: !8)
!47 = !DILocation(line: 73, column: 11, scope: !8)
!48 = !DILocation(line: 74, column: 11, scope: !8)
!49 = !DILocation(line: 75, column: 11, scope: !8)
!50 = !DILocation(line: 76, column: 11, scope: !8)
!51 = !DILocation(line: 77, column: 11, scope: !8)
!52 = !DILocation(line: 78, column: 11, scope: !8)
!53 = !DILocation(line: 80, column: 11, scope: !8)
!54 = !DILocation(line: 81, column: 11, scope: !8)
!55 = !DILocation(line: 82, column: 11, scope: !8)
!56 = !DILocation(line: 83, column: 11, scope: !8)
!57 = !DILocation(line: 84, column: 11, scope: !8)
!58 = !DILocation(line: 87, column: 11, scope: !8)
!59 = !DILocation(line: 88, column: 11, scope: !8)
!60 = !DILocation(line: 89, column: 11, scope: !8)
!61 = !DILocation(line: 90, column: 11, scope: !8)
!62 = !DILocation(line: 91, column: 11, scope: !8)
!63 = !DILocation(line: 92, column: 11, scope: !8)
!64 = !DILocation(line: 94, column: 11, scope: !8)
!65 = !DILocation(line: 95, column: 11, scope: !8)
!66 = !DILocation(line: 96, column: 11, scope: !8)
!67 = !DILocation(line: 97, column: 11, scope: !8)
!68 = !DILocation(line: 98, column: 11, scope: !8)
!69 = !DILocation(line: 101, column: 11, scope: !8)
!70 = !DILocation(line: 102, column: 11, scope: !8)
!71 = !DILocation(line: 103, column: 11, scope: !8)
!72 = !DILocation(line: 104, column: 11, scope: !8)
!73 = !DILocation(line: 105, column: 11, scope: !8)
!74 = !DILocation(line: 106, column: 11, scope: !8)
!75 = !DILocation(line: 108, column: 11, scope: !8)
!76 = !DILocation(line: 109, column: 11, scope: !8)
!77 = !DILocation(line: 110, column: 11, scope: !8)
!78 = !DILocation(line: 111, column: 5, scope: !8)
!79 = !DILocation(line: 112, column: 12, scope: !8)
!80 = !DILocation(line: 113, column: 5, scope: !8)
!81 = !DILocation(line: 115, column: 12, scope: !8)
!82 = !DILocation(line: 116, column: 5, scope: !8)
!83 = !DILocation(line: 118, column: 5, scope: !8)

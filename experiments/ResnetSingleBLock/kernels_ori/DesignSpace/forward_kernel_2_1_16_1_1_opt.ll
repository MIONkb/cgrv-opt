; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_16_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %0, ptr nocapture writeonly %1) local_unnamed_addr #0 !dbg !3 {
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %2, %104
  %3 = phi i64 [ 0, %2 ], [ %105, %104 ]
  %4 = mul nuw nsw i64 %3, 112
  br label %5, !dbg !9

5:                                                ; preds = %.preheader, %5
  %6 = phi i64 [ 0, %.preheader ], [ %102, %5 ]
  %7 = add nuw nsw i64 %6, %4, !dbg !10
  %8 = getelementptr float, ptr %0, i64 %7, !dbg !11
  %9 = load float, ptr %8, align 4, !dbg !12
  %.inv = fcmp ole float %9, 0.000000e+00, !dbg !13
  %10 = select i1 %.inv, float 0.000000e+00, float %9, !dbg !13
  %11 = getelementptr float, ptr %1, i64 %7, !dbg !14
  store float %10, ptr %11, align 4, !dbg !15
  %12 = or i64 %6, 1, !dbg !16
  %13 = add nuw nsw i64 %12, %4, !dbg !17
  %14 = getelementptr float, ptr %0, i64 %13, !dbg !18
  %15 = load float, ptr %14, align 4, !dbg !19
  %.inv1 = fcmp ole float %15, 0.000000e+00, !dbg !20
  %16 = select i1 %.inv1, float 0.000000e+00, float %15, !dbg !20
  %17 = getelementptr float, ptr %1, i64 %13, !dbg !21
  store float %16, ptr %17, align 4, !dbg !22
  %18 = or i64 %6, 2, !dbg !23
  %19 = add nuw nsw i64 %18, %4, !dbg !24
  %20 = getelementptr float, ptr %0, i64 %19, !dbg !25
  %21 = load float, ptr %20, align 4, !dbg !26
  %.inv2 = fcmp ole float %21, 0.000000e+00, !dbg !27
  %22 = select i1 %.inv2, float 0.000000e+00, float %21, !dbg !27
  %23 = getelementptr float, ptr %1, i64 %19, !dbg !28
  store float %22, ptr %23, align 4, !dbg !29
  %24 = or i64 %6, 3, !dbg !30
  %25 = add nuw nsw i64 %24, %4, !dbg !31
  %26 = getelementptr float, ptr %0, i64 %25, !dbg !32
  %27 = load float, ptr %26, align 4, !dbg !33
  %.inv3 = fcmp ole float %27, 0.000000e+00, !dbg !34
  %28 = select i1 %.inv3, float 0.000000e+00, float %27, !dbg !34
  %29 = getelementptr float, ptr %1, i64 %25, !dbg !35
  store float %28, ptr %29, align 4, !dbg !36
  %30 = or i64 %6, 4, !dbg !37
  %31 = add nuw nsw i64 %30, %4, !dbg !38
  %32 = getelementptr float, ptr %0, i64 %31, !dbg !39
  %33 = load float, ptr %32, align 4, !dbg !40
  %.inv4 = fcmp ole float %33, 0.000000e+00, !dbg !41
  %34 = select i1 %.inv4, float 0.000000e+00, float %33, !dbg !41
  %35 = getelementptr float, ptr %1, i64 %31, !dbg !42
  store float %34, ptr %35, align 4, !dbg !43
  %36 = or i64 %6, 5, !dbg !44
  %37 = add nuw nsw i64 %36, %4, !dbg !45
  %38 = getelementptr float, ptr %0, i64 %37, !dbg !46
  %39 = load float, ptr %38, align 4, !dbg !47
  %.inv5 = fcmp ole float %39, 0.000000e+00, !dbg !48
  %40 = select i1 %.inv5, float 0.000000e+00, float %39, !dbg !48
  %41 = getelementptr float, ptr %1, i64 %37, !dbg !49
  store float %40, ptr %41, align 4, !dbg !50
  %42 = or i64 %6, 6, !dbg !51
  %43 = add nuw nsw i64 %42, %4, !dbg !52
  %44 = getelementptr float, ptr %0, i64 %43, !dbg !53
  %45 = load float, ptr %44, align 4, !dbg !54
  %.inv6 = fcmp ole float %45, 0.000000e+00, !dbg !55
  %46 = select i1 %.inv6, float 0.000000e+00, float %45, !dbg !55
  %47 = getelementptr float, ptr %1, i64 %43, !dbg !56
  store float %46, ptr %47, align 4, !dbg !57
  %48 = or i64 %6, 7, !dbg !58
  %49 = add nuw nsw i64 %48, %4, !dbg !59
  %50 = getelementptr float, ptr %0, i64 %49, !dbg !60
  %51 = load float, ptr %50, align 4, !dbg !61
  %.inv7 = fcmp ole float %51, 0.000000e+00, !dbg !62
  %52 = select i1 %.inv7, float 0.000000e+00, float %51, !dbg !62
  %53 = getelementptr float, ptr %1, i64 %49, !dbg !63
  store float %52, ptr %53, align 4, !dbg !64
  %54 = or i64 %6, 8, !dbg !65
  %55 = add nuw nsw i64 %54, %4, !dbg !66
  %56 = getelementptr float, ptr %0, i64 %55, !dbg !67
  %57 = load float, ptr %56, align 4, !dbg !68
  %.inv8 = fcmp ole float %57, 0.000000e+00, !dbg !69
  %58 = select i1 %.inv8, float 0.000000e+00, float %57, !dbg !69
  %59 = getelementptr float, ptr %1, i64 %55, !dbg !70
  store float %58, ptr %59, align 4, !dbg !71
  %60 = or i64 %6, 9, !dbg !72
  %61 = add nuw nsw i64 %60, %4, !dbg !73
  %62 = getelementptr float, ptr %0, i64 %61, !dbg !74
  %63 = load float, ptr %62, align 4, !dbg !75
  %.inv9 = fcmp ole float %63, 0.000000e+00, !dbg !76
  %64 = select i1 %.inv9, float 0.000000e+00, float %63, !dbg !76
  %65 = getelementptr float, ptr %1, i64 %61, !dbg !77
  store float %64, ptr %65, align 4, !dbg !78
  %66 = or i64 %6, 10, !dbg !79
  %67 = add nuw nsw i64 %66, %4, !dbg !80
  %68 = getelementptr float, ptr %0, i64 %67, !dbg !81
  %69 = load float, ptr %68, align 4, !dbg !82
  %.inv10 = fcmp ole float %69, 0.000000e+00, !dbg !83
  %70 = select i1 %.inv10, float 0.000000e+00, float %69, !dbg !83
  %71 = getelementptr float, ptr %1, i64 %67, !dbg !84
  store float %70, ptr %71, align 4, !dbg !85
  %72 = or i64 %6, 11, !dbg !86
  %73 = add nuw nsw i64 %72, %4, !dbg !87
  %74 = getelementptr float, ptr %0, i64 %73, !dbg !88
  %75 = load float, ptr %74, align 4, !dbg !89
  %.inv11 = fcmp ole float %75, 0.000000e+00, !dbg !90
  %76 = select i1 %.inv11, float 0.000000e+00, float %75, !dbg !90
  %77 = getelementptr float, ptr %1, i64 %73, !dbg !91
  store float %76, ptr %77, align 4, !dbg !92
  %78 = or i64 %6, 12, !dbg !93
  %79 = add nuw nsw i64 %78, %4, !dbg !94
  %80 = getelementptr float, ptr %0, i64 %79, !dbg !95
  %81 = load float, ptr %80, align 4, !dbg !96
  %.inv12 = fcmp ole float %81, 0.000000e+00, !dbg !97
  %82 = select i1 %.inv12, float 0.000000e+00, float %81, !dbg !97
  %83 = getelementptr float, ptr %1, i64 %79, !dbg !98
  store float %82, ptr %83, align 4, !dbg !99
  %84 = or i64 %6, 13, !dbg !100
  %85 = add nuw nsw i64 %84, %4, !dbg !101
  %86 = getelementptr float, ptr %0, i64 %85, !dbg !102
  %87 = load float, ptr %86, align 4, !dbg !103
  %.inv13 = fcmp ole float %87, 0.000000e+00, !dbg !104
  %88 = select i1 %.inv13, float 0.000000e+00, float %87, !dbg !104
  %89 = getelementptr float, ptr %1, i64 %85, !dbg !105
  store float %88, ptr %89, align 4, !dbg !106
  %90 = or i64 %6, 14, !dbg !107
  %91 = add nuw nsw i64 %90, %4, !dbg !108
  %92 = getelementptr float, ptr %0, i64 %91, !dbg !109
  %93 = load float, ptr %92, align 4, !dbg !110
  %.inv14 = fcmp ole float %93, 0.000000e+00, !dbg !111
  %94 = select i1 %.inv14, float 0.000000e+00, float %93, !dbg !111
  %95 = getelementptr float, ptr %1, i64 %91, !dbg !112
  store float %94, ptr %95, align 4, !dbg !113
  %96 = or i64 %6, 15, !dbg !114
  %97 = add nuw nsw i64 %96, %4, !dbg !115
  %98 = getelementptr float, ptr %0, i64 %97, !dbg !116
  %99 = load float, ptr %98, align 4, !dbg !117
  %.inv15 = fcmp ole float %99, 0.000000e+00, !dbg !118
  %100 = select i1 %.inv15, float 0.000000e+00, float %99, !dbg !118
  %101 = getelementptr float, ptr %1, i64 %97, !dbg !119
  store float %100, ptr %101, align 4, !dbg !120
  %102 = add nuw nsw i64 %6, 16, !dbg !121
  %103 = icmp ult i64 %6, 96, !dbg !122
  br i1 %103, label %5, label %104, !dbg !9

104:                                              ; preds = %5
  %105 = add nuw nsw i64 %3, 1, !dbg !123
  %106 = icmp ult i64 %3, 15, !dbg !124
  br i1 %106, label %.preheader, label %107, !dbg !7

107:                                              ; preds = %104
  ret void, !dbg !125
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_16_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 29, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 34, column: 5, scope: !8)
!10 = !DILocation(line: 41, column: 11, scope: !8)
!11 = !DILocation(line: 42, column: 11, scope: !8)
!12 = !DILocation(line: 43, column: 11, scope: !8)
!13 = !DILocation(line: 45, column: 11, scope: !8)
!14 = !DILocation(line: 52, column: 11, scope: !8)
!15 = !DILocation(line: 53, column: 5, scope: !8)
!16 = !DILocation(line: 54, column: 11, scope: !8)
!17 = !DILocation(line: 60, column: 11, scope: !8)
!18 = !DILocation(line: 61, column: 11, scope: !8)
!19 = !DILocation(line: 62, column: 11, scope: !8)
!20 = !DILocation(line: 64, column: 11, scope: !8)
!21 = !DILocation(line: 71, column: 11, scope: !8)
!22 = !DILocation(line: 72, column: 5, scope: !8)
!23 = !DILocation(line: 73, column: 11, scope: !8)
!24 = !DILocation(line: 79, column: 11, scope: !8)
!25 = !DILocation(line: 80, column: 11, scope: !8)
!26 = !DILocation(line: 81, column: 11, scope: !8)
!27 = !DILocation(line: 83, column: 11, scope: !8)
!28 = !DILocation(line: 90, column: 11, scope: !8)
!29 = !DILocation(line: 91, column: 5, scope: !8)
!30 = !DILocation(line: 92, column: 11, scope: !8)
!31 = !DILocation(line: 98, column: 11, scope: !8)
!32 = !DILocation(line: 99, column: 11, scope: !8)
!33 = !DILocation(line: 100, column: 11, scope: !8)
!34 = !DILocation(line: 102, column: 11, scope: !8)
!35 = !DILocation(line: 109, column: 11, scope: !8)
!36 = !DILocation(line: 110, column: 5, scope: !8)
!37 = !DILocation(line: 111, column: 11, scope: !8)
!38 = !DILocation(line: 117, column: 12, scope: !8)
!39 = !DILocation(line: 118, column: 12, scope: !8)
!40 = !DILocation(line: 119, column: 12, scope: !8)
!41 = !DILocation(line: 121, column: 12, scope: !8)
!42 = !DILocation(line: 128, column: 12, scope: !8)
!43 = !DILocation(line: 129, column: 5, scope: !8)
!44 = !DILocation(line: 130, column: 12, scope: !8)
!45 = !DILocation(line: 136, column: 12, scope: !8)
!46 = !DILocation(line: 137, column: 12, scope: !8)
!47 = !DILocation(line: 138, column: 12, scope: !8)
!48 = !DILocation(line: 140, column: 12, scope: !8)
!49 = !DILocation(line: 147, column: 12, scope: !8)
!50 = !DILocation(line: 148, column: 5, scope: !8)
!51 = !DILocation(line: 149, column: 12, scope: !8)
!52 = !DILocation(line: 155, column: 12, scope: !8)
!53 = !DILocation(line: 156, column: 12, scope: !8)
!54 = !DILocation(line: 157, column: 12, scope: !8)
!55 = !DILocation(line: 159, column: 12, scope: !8)
!56 = !DILocation(line: 166, column: 12, scope: !8)
!57 = !DILocation(line: 167, column: 5, scope: !8)
!58 = !DILocation(line: 168, column: 12, scope: !8)
!59 = !DILocation(line: 174, column: 12, scope: !8)
!60 = !DILocation(line: 175, column: 12, scope: !8)
!61 = !DILocation(line: 176, column: 12, scope: !8)
!62 = !DILocation(line: 178, column: 12, scope: !8)
!63 = !DILocation(line: 185, column: 12, scope: !8)
!64 = !DILocation(line: 186, column: 5, scope: !8)
!65 = !DILocation(line: 187, column: 12, scope: !8)
!66 = !DILocation(line: 193, column: 12, scope: !8)
!67 = !DILocation(line: 194, column: 12, scope: !8)
!68 = !DILocation(line: 195, column: 12, scope: !8)
!69 = !DILocation(line: 197, column: 12, scope: !8)
!70 = !DILocation(line: 204, column: 12, scope: !8)
!71 = !DILocation(line: 205, column: 5, scope: !8)
!72 = !DILocation(line: 206, column: 12, scope: !8)
!73 = !DILocation(line: 212, column: 12, scope: !8)
!74 = !DILocation(line: 213, column: 12, scope: !8)
!75 = !DILocation(line: 214, column: 12, scope: !8)
!76 = !DILocation(line: 216, column: 12, scope: !8)
!77 = !DILocation(line: 223, column: 12, scope: !8)
!78 = !DILocation(line: 224, column: 5, scope: !8)
!79 = !DILocation(line: 225, column: 12, scope: !8)
!80 = !DILocation(line: 231, column: 12, scope: !8)
!81 = !DILocation(line: 232, column: 12, scope: !8)
!82 = !DILocation(line: 233, column: 12, scope: !8)
!83 = !DILocation(line: 235, column: 12, scope: !8)
!84 = !DILocation(line: 242, column: 12, scope: !8)
!85 = !DILocation(line: 243, column: 5, scope: !8)
!86 = !DILocation(line: 244, column: 12, scope: !8)
!87 = !DILocation(line: 250, column: 12, scope: !8)
!88 = !DILocation(line: 251, column: 12, scope: !8)
!89 = !DILocation(line: 252, column: 12, scope: !8)
!90 = !DILocation(line: 254, column: 12, scope: !8)
!91 = !DILocation(line: 261, column: 12, scope: !8)
!92 = !DILocation(line: 262, column: 5, scope: !8)
!93 = !DILocation(line: 263, column: 12, scope: !8)
!94 = !DILocation(line: 269, column: 12, scope: !8)
!95 = !DILocation(line: 270, column: 12, scope: !8)
!96 = !DILocation(line: 271, column: 12, scope: !8)
!97 = !DILocation(line: 273, column: 12, scope: !8)
!98 = !DILocation(line: 280, column: 12, scope: !8)
!99 = !DILocation(line: 281, column: 5, scope: !8)
!100 = !DILocation(line: 282, column: 12, scope: !8)
!101 = !DILocation(line: 288, column: 12, scope: !8)
!102 = !DILocation(line: 289, column: 12, scope: !8)
!103 = !DILocation(line: 290, column: 12, scope: !8)
!104 = !DILocation(line: 292, column: 12, scope: !8)
!105 = !DILocation(line: 299, column: 12, scope: !8)
!106 = !DILocation(line: 300, column: 5, scope: !8)
!107 = !DILocation(line: 301, column: 12, scope: !8)
!108 = !DILocation(line: 307, column: 12, scope: !8)
!109 = !DILocation(line: 308, column: 12, scope: !8)
!110 = !DILocation(line: 309, column: 12, scope: !8)
!111 = !DILocation(line: 311, column: 12, scope: !8)
!112 = !DILocation(line: 318, column: 12, scope: !8)
!113 = !DILocation(line: 319, column: 5, scope: !8)
!114 = !DILocation(line: 320, column: 12, scope: !8)
!115 = !DILocation(line: 326, column: 12, scope: !8)
!116 = !DILocation(line: 327, column: 12, scope: !8)
!117 = !DILocation(line: 328, column: 12, scope: !8)
!118 = !DILocation(line: 330, column: 12, scope: !8)
!119 = !DILocation(line: 337, column: 12, scope: !8)
!120 = !DILocation(line: 338, column: 5, scope: !8)
!121 = !DILocation(line: 339, column: 12, scope: !8)
!122 = !DILocation(line: 33, column: 11, scope: !8)
!123 = !DILocation(line: 342, column: 12, scope: !8)
!124 = !DILocation(line: 28, column: 11, scope: !8)
!125 = !DILocation(line: 345, column: 5, scope: !8)

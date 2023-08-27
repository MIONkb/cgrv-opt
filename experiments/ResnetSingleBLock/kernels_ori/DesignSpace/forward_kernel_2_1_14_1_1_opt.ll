; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_14_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %0, ptr nocapture writeonly %1) local_unnamed_addr #0 !dbg !3 {
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %2, %80
  %3 = phi i64 [ 0, %2 ], [ %81, %80 ]
  %4 = mul nuw nsw i64 %3, 112
  br label %5, !dbg !9

5:                                                ; preds = %.preheader, %5
  %6 = phi i64 [ 0, %.preheader ], [ %78, %5 ]
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
  %18 = add nuw nsw i64 %7, 2, !dbg !23
  %19 = getelementptr float, ptr %0, i64 %18, !dbg !24
  %20 = load float, ptr %19, align 4, !dbg !25
  %.inv2 = fcmp ole float %20, 0.000000e+00, !dbg !26
  %21 = select i1 %.inv2, float 0.000000e+00, float %20, !dbg !26
  %22 = getelementptr float, ptr %1, i64 %18, !dbg !27
  store float %21, ptr %22, align 4, !dbg !28
  %23 = add nuw nsw i64 %7, 3, !dbg !29
  %24 = getelementptr float, ptr %0, i64 %23, !dbg !30
  %25 = load float, ptr %24, align 4, !dbg !31
  %.inv3 = fcmp ole float %25, 0.000000e+00, !dbg !32
  %26 = select i1 %.inv3, float 0.000000e+00, float %25, !dbg !32
  %27 = getelementptr float, ptr %1, i64 %23, !dbg !33
  store float %26, ptr %27, align 4, !dbg !34
  %28 = add nuw nsw i64 %7, 4, !dbg !35
  %29 = getelementptr float, ptr %0, i64 %28, !dbg !36
  %30 = load float, ptr %29, align 4, !dbg !37
  %.inv4 = fcmp ole float %30, 0.000000e+00, !dbg !38
  %31 = select i1 %.inv4, float 0.000000e+00, float %30, !dbg !38
  %32 = getelementptr float, ptr %1, i64 %28, !dbg !39
  store float %31, ptr %32, align 4, !dbg !40
  %33 = add nuw nsw i64 %7, 5, !dbg !41
  %34 = getelementptr float, ptr %0, i64 %33, !dbg !42
  %35 = load float, ptr %34, align 4, !dbg !43
  %.inv5 = fcmp ole float %35, 0.000000e+00, !dbg !44
  %36 = select i1 %.inv5, float 0.000000e+00, float %35, !dbg !44
  %37 = getelementptr float, ptr %1, i64 %33, !dbg !45
  store float %36, ptr %37, align 4, !dbg !46
  %38 = add nuw nsw i64 %7, 6, !dbg !47
  %39 = getelementptr float, ptr %0, i64 %38, !dbg !48
  %40 = load float, ptr %39, align 4, !dbg !49
  %.inv6 = fcmp ole float %40, 0.000000e+00, !dbg !50
  %41 = select i1 %.inv6, float 0.000000e+00, float %40, !dbg !50
  %42 = getelementptr float, ptr %1, i64 %38, !dbg !51
  store float %41, ptr %42, align 4, !dbg !52
  %43 = add nuw nsw i64 %7, 7, !dbg !53
  %44 = getelementptr float, ptr %0, i64 %43, !dbg !54
  %45 = load float, ptr %44, align 4, !dbg !55
  %.inv7 = fcmp ole float %45, 0.000000e+00, !dbg !56
  %46 = select i1 %.inv7, float 0.000000e+00, float %45, !dbg !56
  %47 = getelementptr float, ptr %1, i64 %43, !dbg !57
  store float %46, ptr %47, align 4, !dbg !58
  %48 = add nuw nsw i64 %7, 8, !dbg !59
  %49 = getelementptr float, ptr %0, i64 %48, !dbg !60
  %50 = load float, ptr %49, align 4, !dbg !61
  %.inv8 = fcmp ole float %50, 0.000000e+00, !dbg !62
  %51 = select i1 %.inv8, float 0.000000e+00, float %50, !dbg !62
  %52 = getelementptr float, ptr %1, i64 %48, !dbg !63
  store float %51, ptr %52, align 4, !dbg !64
  %53 = add nuw nsw i64 %7, 9, !dbg !65
  %54 = getelementptr float, ptr %0, i64 %53, !dbg !66
  %55 = load float, ptr %54, align 4, !dbg !67
  %.inv9 = fcmp ole float %55, 0.000000e+00, !dbg !68
  %56 = select i1 %.inv9, float 0.000000e+00, float %55, !dbg !68
  %57 = getelementptr float, ptr %1, i64 %53, !dbg !69
  store float %56, ptr %57, align 4, !dbg !70
  %58 = add nuw nsw i64 %7, 10, !dbg !71
  %59 = getelementptr float, ptr %0, i64 %58, !dbg !72
  %60 = load float, ptr %59, align 4, !dbg !73
  %.inv10 = fcmp ole float %60, 0.000000e+00, !dbg !74
  %61 = select i1 %.inv10, float 0.000000e+00, float %60, !dbg !74
  %62 = getelementptr float, ptr %1, i64 %58, !dbg !75
  store float %61, ptr %62, align 4, !dbg !76
  %63 = add nuw nsw i64 %7, 11, !dbg !77
  %64 = getelementptr float, ptr %0, i64 %63, !dbg !78
  %65 = load float, ptr %64, align 4, !dbg !79
  %.inv11 = fcmp ole float %65, 0.000000e+00, !dbg !80
  %66 = select i1 %.inv11, float 0.000000e+00, float %65, !dbg !80
  %67 = getelementptr float, ptr %1, i64 %63, !dbg !81
  store float %66, ptr %67, align 4, !dbg !82
  %68 = add nuw nsw i64 %7, 12, !dbg !83
  %69 = getelementptr float, ptr %0, i64 %68, !dbg !84
  %70 = load float, ptr %69, align 4, !dbg !85
  %.inv12 = fcmp ole float %70, 0.000000e+00, !dbg !86
  %71 = select i1 %.inv12, float 0.000000e+00, float %70, !dbg !86
  %72 = getelementptr float, ptr %1, i64 %68, !dbg !87
  store float %71, ptr %72, align 4, !dbg !88
  %73 = add nuw nsw i64 %7, 13, !dbg !89
  %74 = getelementptr float, ptr %0, i64 %73, !dbg !90
  %75 = load float, ptr %74, align 4, !dbg !91
  %.inv13 = fcmp ole float %75, 0.000000e+00, !dbg !92
  %76 = select i1 %.inv13, float 0.000000e+00, float %75, !dbg !92
  %77 = getelementptr float, ptr %1, i64 %73, !dbg !93
  store float %76, ptr %77, align 4, !dbg !94
  %78 = add nuw nsw i64 %6, 14, !dbg !95
  %79 = icmp ult i64 %6, 98, !dbg !96
  br i1 %79, label %5, label %80, !dbg !9

80:                                               ; preds = %5
  %81 = add nuw nsw i64 %3, 1, !dbg !97
  %82 = icmp ult i64 %3, 15, !dbg !98
  br i1 %82, label %.preheader, label %83, !dbg !7

83:                                               ; preds = %80
  ret void, !dbg !99
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_14_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 28, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 33, column: 5, scope: !8)
!10 = !DILocation(line: 40, column: 11, scope: !8)
!11 = !DILocation(line: 41, column: 11, scope: !8)
!12 = !DILocation(line: 42, column: 11, scope: !8)
!13 = !DILocation(line: 44, column: 11, scope: !8)
!14 = !DILocation(line: 51, column: 11, scope: !8)
!15 = !DILocation(line: 52, column: 5, scope: !8)
!16 = !DILocation(line: 53, column: 11, scope: !8)
!17 = !DILocation(line: 59, column: 11, scope: !8)
!18 = !DILocation(line: 60, column: 11, scope: !8)
!19 = !DILocation(line: 61, column: 11, scope: !8)
!20 = !DILocation(line: 63, column: 11, scope: !8)
!21 = !DILocation(line: 70, column: 11, scope: !8)
!22 = !DILocation(line: 71, column: 5, scope: !8)
!23 = !DILocation(line: 78, column: 11, scope: !8)
!24 = !DILocation(line: 79, column: 11, scope: !8)
!25 = !DILocation(line: 80, column: 11, scope: !8)
!26 = !DILocation(line: 82, column: 11, scope: !8)
!27 = !DILocation(line: 89, column: 11, scope: !8)
!28 = !DILocation(line: 90, column: 5, scope: !8)
!29 = !DILocation(line: 97, column: 11, scope: !8)
!30 = !DILocation(line: 98, column: 11, scope: !8)
!31 = !DILocation(line: 99, column: 11, scope: !8)
!32 = !DILocation(line: 101, column: 11, scope: !8)
!33 = !DILocation(line: 108, column: 11, scope: !8)
!34 = !DILocation(line: 109, column: 5, scope: !8)
!35 = !DILocation(line: 116, column: 12, scope: !8)
!36 = !DILocation(line: 117, column: 12, scope: !8)
!37 = !DILocation(line: 118, column: 12, scope: !8)
!38 = !DILocation(line: 120, column: 12, scope: !8)
!39 = !DILocation(line: 127, column: 12, scope: !8)
!40 = !DILocation(line: 128, column: 5, scope: !8)
!41 = !DILocation(line: 135, column: 12, scope: !8)
!42 = !DILocation(line: 136, column: 12, scope: !8)
!43 = !DILocation(line: 137, column: 12, scope: !8)
!44 = !DILocation(line: 139, column: 12, scope: !8)
!45 = !DILocation(line: 146, column: 12, scope: !8)
!46 = !DILocation(line: 147, column: 5, scope: !8)
!47 = !DILocation(line: 154, column: 12, scope: !8)
!48 = !DILocation(line: 155, column: 12, scope: !8)
!49 = !DILocation(line: 156, column: 12, scope: !8)
!50 = !DILocation(line: 158, column: 12, scope: !8)
!51 = !DILocation(line: 165, column: 12, scope: !8)
!52 = !DILocation(line: 166, column: 5, scope: !8)
!53 = !DILocation(line: 173, column: 12, scope: !8)
!54 = !DILocation(line: 174, column: 12, scope: !8)
!55 = !DILocation(line: 175, column: 12, scope: !8)
!56 = !DILocation(line: 177, column: 12, scope: !8)
!57 = !DILocation(line: 184, column: 12, scope: !8)
!58 = !DILocation(line: 185, column: 5, scope: !8)
!59 = !DILocation(line: 192, column: 12, scope: !8)
!60 = !DILocation(line: 193, column: 12, scope: !8)
!61 = !DILocation(line: 194, column: 12, scope: !8)
!62 = !DILocation(line: 196, column: 12, scope: !8)
!63 = !DILocation(line: 203, column: 12, scope: !8)
!64 = !DILocation(line: 204, column: 5, scope: !8)
!65 = !DILocation(line: 211, column: 12, scope: !8)
!66 = !DILocation(line: 212, column: 12, scope: !8)
!67 = !DILocation(line: 213, column: 12, scope: !8)
!68 = !DILocation(line: 215, column: 12, scope: !8)
!69 = !DILocation(line: 222, column: 12, scope: !8)
!70 = !DILocation(line: 223, column: 5, scope: !8)
!71 = !DILocation(line: 230, column: 12, scope: !8)
!72 = !DILocation(line: 231, column: 12, scope: !8)
!73 = !DILocation(line: 232, column: 12, scope: !8)
!74 = !DILocation(line: 234, column: 12, scope: !8)
!75 = !DILocation(line: 241, column: 12, scope: !8)
!76 = !DILocation(line: 242, column: 5, scope: !8)
!77 = !DILocation(line: 249, column: 12, scope: !8)
!78 = !DILocation(line: 250, column: 12, scope: !8)
!79 = !DILocation(line: 251, column: 12, scope: !8)
!80 = !DILocation(line: 253, column: 12, scope: !8)
!81 = !DILocation(line: 260, column: 12, scope: !8)
!82 = !DILocation(line: 261, column: 5, scope: !8)
!83 = !DILocation(line: 268, column: 12, scope: !8)
!84 = !DILocation(line: 269, column: 12, scope: !8)
!85 = !DILocation(line: 270, column: 12, scope: !8)
!86 = !DILocation(line: 272, column: 12, scope: !8)
!87 = !DILocation(line: 279, column: 12, scope: !8)
!88 = !DILocation(line: 280, column: 5, scope: !8)
!89 = !DILocation(line: 287, column: 12, scope: !8)
!90 = !DILocation(line: 288, column: 12, scope: !8)
!91 = !DILocation(line: 289, column: 12, scope: !8)
!92 = !DILocation(line: 291, column: 12, scope: !8)
!93 = !DILocation(line: 298, column: 12, scope: !8)
!94 = !DILocation(line: 299, column: 5, scope: !8)
!95 = !DILocation(line: 300, column: 12, scope: !8)
!96 = !DILocation(line: 32, column: 11, scope: !8)
!97 = !DILocation(line: 303, column: 12, scope: !8)
!98 = !DILocation(line: 27, column: 11, scope: !8)
!99 = !DILocation(line: 306, column: 5, scope: !8)

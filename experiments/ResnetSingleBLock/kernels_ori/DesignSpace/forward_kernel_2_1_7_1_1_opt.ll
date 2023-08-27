; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_7_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %0, ptr nocapture writeonly %1) local_unnamed_addr #0 !dbg !3 {
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %2, %44
  %3 = phi i64 [ 0, %2 ], [ %45, %44 ]
  %4 = mul nuw nsw i64 %3, 112
  br label %5, !dbg !9

5:                                                ; preds = %.preheader, %5
  %6 = phi i64 [ 0, %.preheader ], [ %42, %5 ]
  %7 = add nuw nsw i64 %6, %4, !dbg !10
  %8 = getelementptr float, ptr %0, i64 %7, !dbg !11
  %9 = load float, ptr %8, align 4, !dbg !12
  %.inv = fcmp ole float %9, 0.000000e+00, !dbg !13
  %10 = select i1 %.inv, float 0.000000e+00, float %9, !dbg !13
  %11 = getelementptr float, ptr %1, i64 %7, !dbg !14
  store float %10, ptr %11, align 4, !dbg !15
  %12 = add nuw nsw i64 %7, 1, !dbg !16
  %13 = getelementptr float, ptr %0, i64 %12, !dbg !17
  %14 = load float, ptr %13, align 4, !dbg !18
  %.inv1 = fcmp ole float %14, 0.000000e+00, !dbg !19
  %15 = select i1 %.inv1, float 0.000000e+00, float %14, !dbg !19
  %16 = getelementptr float, ptr %1, i64 %12, !dbg !20
  store float %15, ptr %16, align 4, !dbg !21
  %17 = add nuw nsw i64 %7, 2, !dbg !22
  %18 = getelementptr float, ptr %0, i64 %17, !dbg !23
  %19 = load float, ptr %18, align 4, !dbg !24
  %.inv2 = fcmp ole float %19, 0.000000e+00, !dbg !25
  %20 = select i1 %.inv2, float 0.000000e+00, float %19, !dbg !25
  %21 = getelementptr float, ptr %1, i64 %17, !dbg !26
  store float %20, ptr %21, align 4, !dbg !27
  %22 = add nuw nsw i64 %7, 3, !dbg !28
  %23 = getelementptr float, ptr %0, i64 %22, !dbg !29
  %24 = load float, ptr %23, align 4, !dbg !30
  %.inv3 = fcmp ole float %24, 0.000000e+00, !dbg !31
  %25 = select i1 %.inv3, float 0.000000e+00, float %24, !dbg !31
  %26 = getelementptr float, ptr %1, i64 %22, !dbg !32
  store float %25, ptr %26, align 4, !dbg !33
  %27 = add nuw nsw i64 %7, 4, !dbg !34
  %28 = getelementptr float, ptr %0, i64 %27, !dbg !35
  %29 = load float, ptr %28, align 4, !dbg !36
  %.inv4 = fcmp ole float %29, 0.000000e+00, !dbg !37
  %30 = select i1 %.inv4, float 0.000000e+00, float %29, !dbg !37
  %31 = getelementptr float, ptr %1, i64 %27, !dbg !38
  store float %30, ptr %31, align 4, !dbg !39
  %32 = add nuw nsw i64 %7, 5, !dbg !40
  %33 = getelementptr float, ptr %0, i64 %32, !dbg !41
  %34 = load float, ptr %33, align 4, !dbg !42
  %.inv5 = fcmp ole float %34, 0.000000e+00, !dbg !43
  %35 = select i1 %.inv5, float 0.000000e+00, float %34, !dbg !43
  %36 = getelementptr float, ptr %1, i64 %32, !dbg !44
  store float %35, ptr %36, align 4, !dbg !45
  %37 = add nuw nsw i64 %7, 6, !dbg !46
  %38 = getelementptr float, ptr %0, i64 %37, !dbg !47
  %39 = load float, ptr %38, align 4, !dbg !48
  %.inv6 = fcmp ole float %39, 0.000000e+00, !dbg !49
  %40 = select i1 %.inv6, float 0.000000e+00, float %39, !dbg !49
  %41 = getelementptr float, ptr %1, i64 %37, !dbg !50
  store float %40, ptr %41, align 4, !dbg !51
  %42 = add nuw nsw i64 %6, 7, !dbg !52
  %43 = icmp ult i64 %6, 105, !dbg !53
  br i1 %43, label %5, label %44, !dbg !9

44:                                               ; preds = %5
  %45 = add nuw nsw i64 %3, 1, !dbg !54
  %46 = icmp ult i64 %3, 15, !dbg !55
  br i1 %46, label %.preheader, label %47, !dbg !7

47:                                               ; preds = %44
  ret void, !dbg !56
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_7_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 21, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 26, column: 5, scope: !8)
!10 = !DILocation(line: 33, column: 11, scope: !8)
!11 = !DILocation(line: 34, column: 11, scope: !8)
!12 = !DILocation(line: 35, column: 11, scope: !8)
!13 = !DILocation(line: 37, column: 11, scope: !8)
!14 = !DILocation(line: 44, column: 11, scope: !8)
!15 = !DILocation(line: 45, column: 5, scope: !8)
!16 = !DILocation(line: 52, column: 11, scope: !8)
!17 = !DILocation(line: 53, column: 11, scope: !8)
!18 = !DILocation(line: 54, column: 11, scope: !8)
!19 = !DILocation(line: 56, column: 11, scope: !8)
!20 = !DILocation(line: 63, column: 11, scope: !8)
!21 = !DILocation(line: 64, column: 5, scope: !8)
!22 = !DILocation(line: 71, column: 11, scope: !8)
!23 = !DILocation(line: 72, column: 11, scope: !8)
!24 = !DILocation(line: 73, column: 11, scope: !8)
!25 = !DILocation(line: 75, column: 11, scope: !8)
!26 = !DILocation(line: 82, column: 11, scope: !8)
!27 = !DILocation(line: 83, column: 5, scope: !8)
!28 = !DILocation(line: 90, column: 11, scope: !8)
!29 = !DILocation(line: 91, column: 11, scope: !8)
!30 = !DILocation(line: 92, column: 11, scope: !8)
!31 = !DILocation(line: 94, column: 11, scope: !8)
!32 = !DILocation(line: 101, column: 11, scope: !8)
!33 = !DILocation(line: 102, column: 5, scope: !8)
!34 = !DILocation(line: 109, column: 11, scope: !8)
!35 = !DILocation(line: 110, column: 11, scope: !8)
!36 = !DILocation(line: 111, column: 11, scope: !8)
!37 = !DILocation(line: 113, column: 11, scope: !8)
!38 = !DILocation(line: 120, column: 12, scope: !8)
!39 = !DILocation(line: 121, column: 5, scope: !8)
!40 = !DILocation(line: 128, column: 12, scope: !8)
!41 = !DILocation(line: 129, column: 12, scope: !8)
!42 = !DILocation(line: 130, column: 12, scope: !8)
!43 = !DILocation(line: 132, column: 12, scope: !8)
!44 = !DILocation(line: 139, column: 12, scope: !8)
!45 = !DILocation(line: 140, column: 5, scope: !8)
!46 = !DILocation(line: 147, column: 12, scope: !8)
!47 = !DILocation(line: 148, column: 12, scope: !8)
!48 = !DILocation(line: 149, column: 12, scope: !8)
!49 = !DILocation(line: 151, column: 12, scope: !8)
!50 = !DILocation(line: 158, column: 12, scope: !8)
!51 = !DILocation(line: 159, column: 5, scope: !8)
!52 = !DILocation(line: 160, column: 12, scope: !8)
!53 = !DILocation(line: 25, column: 11, scope: !8)
!54 = !DILocation(line: 163, column: 12, scope: !8)
!55 = !DILocation(line: 20, column: 11, scope: !8)
!56 = !DILocation(line: 166, column: 5, scope: !8)

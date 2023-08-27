; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_4_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %0, ptr nocapture writeonly %1) local_unnamed_addr #0 !dbg !3 {
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %2, %32
  %3 = phi i64 [ 0, %2 ], [ %33, %32 ]
  %4 = mul nuw nsw i64 %3, 112
  br label %5, !dbg !9

5:                                                ; preds = %.preheader, %5
  %6 = phi i64 [ 0, %.preheader ], [ %30, %5 ]
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
  %30 = add nuw nsw i64 %6, 4, !dbg !37
  %31 = icmp ult i64 %6, 108, !dbg !38
  br i1 %31, label %5, label %32, !dbg !9

32:                                               ; preds = %5
  %33 = add nuw nsw i64 %3, 1, !dbg !39
  %34 = icmp ult i64 %3, 15, !dbg !40
  br i1 %34, label %.preheader, label %35, !dbg !7

35:                                               ; preds = %32
  ret void, !dbg !41
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_4_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 18, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 23, column: 5, scope: !8)
!10 = !DILocation(line: 30, column: 11, scope: !8)
!11 = !DILocation(line: 31, column: 11, scope: !8)
!12 = !DILocation(line: 32, column: 11, scope: !8)
!13 = !DILocation(line: 34, column: 11, scope: !8)
!14 = !DILocation(line: 41, column: 11, scope: !8)
!15 = !DILocation(line: 42, column: 5, scope: !8)
!16 = !DILocation(line: 43, column: 11, scope: !8)
!17 = !DILocation(line: 49, column: 11, scope: !8)
!18 = !DILocation(line: 50, column: 11, scope: !8)
!19 = !DILocation(line: 51, column: 11, scope: !8)
!20 = !DILocation(line: 53, column: 11, scope: !8)
!21 = !DILocation(line: 60, column: 11, scope: !8)
!22 = !DILocation(line: 61, column: 5, scope: !8)
!23 = !DILocation(line: 62, column: 11, scope: !8)
!24 = !DILocation(line: 68, column: 11, scope: !8)
!25 = !DILocation(line: 69, column: 11, scope: !8)
!26 = !DILocation(line: 70, column: 11, scope: !8)
!27 = !DILocation(line: 72, column: 11, scope: !8)
!28 = !DILocation(line: 79, column: 11, scope: !8)
!29 = !DILocation(line: 80, column: 5, scope: !8)
!30 = !DILocation(line: 81, column: 11, scope: !8)
!31 = !DILocation(line: 87, column: 11, scope: !8)
!32 = !DILocation(line: 88, column: 11, scope: !8)
!33 = !DILocation(line: 89, column: 11, scope: !8)
!34 = !DILocation(line: 91, column: 11, scope: !8)
!35 = !DILocation(line: 98, column: 11, scope: !8)
!36 = !DILocation(line: 99, column: 5, scope: !8)
!37 = !DILocation(line: 100, column: 11, scope: !8)
!38 = !DILocation(line: 22, column: 11, scope: !8)
!39 = !DILocation(line: 103, column: 11, scope: !8)
!40 = !DILocation(line: 17, column: 11, scope: !8)
!41 = !DILocation(line: 106, column: 5, scope: !8)

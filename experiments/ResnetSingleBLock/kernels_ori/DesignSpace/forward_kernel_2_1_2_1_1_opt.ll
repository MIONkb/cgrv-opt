; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_2_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %0, ptr nocapture writeonly %1) local_unnamed_addr #0 !dbg !3 {
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %2, %20
  %3 = phi i64 [ 0, %2 ], [ %21, %20 ]
  %4 = mul nuw nsw i64 %3, 112
  br label %5, !dbg !9

5:                                                ; preds = %.preheader, %5
  %6 = phi i64 [ 0, %.preheader ], [ %18, %5 ]
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
  %18 = add nuw nsw i64 %6, 2, !dbg !23
  %19 = icmp ult i64 %6, 110, !dbg !24
  br i1 %19, label %5, label %20, !dbg !9

20:                                               ; preds = %5
  %21 = add nuw nsw i64 %3, 1, !dbg !25
  %22 = icmp ult i64 %3, 15, !dbg !26
  br i1 %22, label %.preheader, label %23, !dbg !7

23:                                               ; preds = %20
  ret void, !dbg !27
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_2_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 16, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 21, column: 5, scope: !8)
!10 = !DILocation(line: 28, column: 11, scope: !8)
!11 = !DILocation(line: 29, column: 11, scope: !8)
!12 = !DILocation(line: 30, column: 11, scope: !8)
!13 = !DILocation(line: 32, column: 11, scope: !8)
!14 = !DILocation(line: 39, column: 11, scope: !8)
!15 = !DILocation(line: 40, column: 5, scope: !8)
!16 = !DILocation(line: 41, column: 11, scope: !8)
!17 = !DILocation(line: 47, column: 11, scope: !8)
!18 = !DILocation(line: 48, column: 11, scope: !8)
!19 = !DILocation(line: 49, column: 11, scope: !8)
!20 = !DILocation(line: 51, column: 11, scope: !8)
!21 = !DILocation(line: 58, column: 11, scope: !8)
!22 = !DILocation(line: 59, column: 5, scope: !8)
!23 = !DILocation(line: 60, column: 11, scope: !8)
!24 = !DILocation(line: 20, column: 11, scope: !8)
!25 = !DILocation(line: 63, column: 11, scope: !8)
!26 = !DILocation(line: 15, column: 10, scope: !8)
!27 = !DILocation(line: 66, column: 5, scope: !8)

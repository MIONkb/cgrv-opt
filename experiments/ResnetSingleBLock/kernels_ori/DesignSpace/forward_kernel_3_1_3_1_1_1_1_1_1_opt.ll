; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_3_1_3_1_1_1_1_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_3(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture writeonly %2) local_unnamed_addr #0 !dbg !3 {
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %3, %36
  %4 = phi i64 [ 0, %3 ], [ %37, %36 ]
  %5 = mul nuw nsw i64 %4, 56
  %6 = shl nuw nsw i64 %4, 1
  br label %7, !dbg !9

7:                                                ; preds = %.preheader, %32
  %8 = phi i64 [ 0, %.preheader ], [ %34, %32 ]
  %9 = add nuw nsw i64 %8, %5, !dbg !10
  %10 = getelementptr float, ptr %0, i64 %9, !dbg !11
  %11 = load float, ptr %10, align 4, !dbg !12
  %12 = shl nuw nsw i64 %8, 1
  br label %13, !dbg !13

13:                                               ; preds = %7, %13
  %14 = phi float [ %11, %7 ], [ %29, %13 ]
  %15 = phi i64 [ 0, %7 ], [ %30, %13 ]
  %16 = add nuw nsw i64 %15, %6, !dbg !14
  %17 = mul nuw nsw i64 %16, 114, !dbg !15
  %18 = add nuw nsw i64 %17, %12, !dbg !16
  %19 = getelementptr float, ptr %1, i64 %18, !dbg !17
  %20 = load float, ptr %19, align 4, !dbg !18
  %.inv = fcmp ole float %14, %20, !dbg !19
  %21 = select i1 %.inv, float %20, float %14, !dbg !19
  %22 = or i64 %18, 1, !dbg !20
  %23 = getelementptr float, ptr %1, i64 %22, !dbg !21
  %24 = load float, ptr %23, align 4, !dbg !22
  %.inv2 = fcmp ole float %21, %24, !dbg !23
  %25 = select i1 %.inv2, float %24, float %21, !dbg !23
  %26 = add nuw nsw i64 %18, 2, !dbg !24
  %27 = getelementptr float, ptr %1, i64 %26, !dbg !25
  %28 = load float, ptr %27, align 4, !dbg !26
  %.inv3 = fcmp ole float %25, %28, !dbg !27
  %29 = select i1 %.inv3, float %28, float %25, !dbg !27
  %30 = add nuw nsw i64 %15, 1, !dbg !28
  %31 = icmp ult i64 %15, 2, !dbg !29
  br i1 %31, label %13, label %32, !dbg !13

32:                                               ; preds = %13
  %33 = getelementptr float, ptr %2, i64 %9, !dbg !30
  store float %29, ptr %33, align 4, !dbg !31
  %34 = add nuw nsw i64 %8, 1, !dbg !32
  %35 = icmp ult i64 %8, 55, !dbg !33
  br i1 %35, label %7, label %36, !dbg !9

36:                                               ; preds = %32
  %37 = add nuw nsw i64 %4, 1, !dbg !34
  %38 = icmp ult i64 %4, 3, !dbg !35
  br i1 %38, label %.preheader, label %39, !dbg !7

39:                                               ; preds = %36
  ret void, !dbg !36
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_3", linkageName: "forward_kernel_3", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_3_1_3_1_1_1_1_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 19, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 24, column: 5, scope: !8)
!10 = !DILocation(line: 31, column: 11, scope: !8)
!11 = !DILocation(line: 32, column: 11, scope: !8)
!12 = !DILocation(line: 33, column: 11, scope: !8)
!13 = !DILocation(line: 37, column: 5, scope: !8)
!14 = !DILocation(line: 40, column: 11, scope: !8)
!15 = !DILocation(line: 45, column: 11, scope: !8)
!16 = !DILocation(line: 47, column: 11, scope: !8)
!17 = !DILocation(line: 48, column: 11, scope: !8)
!18 = !DILocation(line: 49, column: 11, scope: !8)
!19 = !DILocation(line: 51, column: 11, scope: !8)
!20 = !DILocation(line: 61, column: 11, scope: !8)
!21 = !DILocation(line: 62, column: 11, scope: !8)
!22 = !DILocation(line: 63, column: 11, scope: !8)
!23 = !DILocation(line: 65, column: 11, scope: !8)
!24 = !DILocation(line: 75, column: 11, scope: !8)
!25 = !DILocation(line: 76, column: 11, scope: !8)
!26 = !DILocation(line: 77, column: 11, scope: !8)
!27 = !DILocation(line: 79, column: 11, scope: !8)
!28 = !DILocation(line: 80, column: 11, scope: !8)
!29 = !DILocation(line: 36, column: 11, scope: !8)
!30 = !DILocation(line: 89, column: 11, scope: !8)
!31 = !DILocation(line: 90, column: 5, scope: !8)
!32 = !DILocation(line: 91, column: 11, scope: !8)
!33 = !DILocation(line: 23, column: 11, scope: !8)
!34 = !DILocation(line: 94, column: 11, scope: !8)
!35 = !DILocation(line: 18, column: 11, scope: !8)
!36 = !DILocation(line: 97, column: 5, scope: !8)

; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/2_kernels_llvm/forward_kernel_3.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_3(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture writeonly %2) local_unnamed_addr #0 !dbg !3 {
  br label %.preheader2, !dbg !7

.preheader2:                                      ; preds = %3, %34
  %4 = phi i64 [ 0, %3 ], [ %35, %34 ]
  %5 = mul nuw nsw i64 %4, 56
  %6 = shl nuw nsw i64 %4, 1
  br label %7, !dbg !9

7:                                                ; preds = %.preheader2, %30
  %8 = phi i64 [ 0, %.preheader2 ], [ %32, %30 ]
  %9 = add nuw nsw i64 %8, %5, !dbg !10
  %10 = getelementptr float, ptr %0, i64 %9, !dbg !11
  %11 = load float, ptr %10, align 4, !dbg !12
  %12 = shl nuw nsw i64 %8, 1
  br label %.preheader, !dbg !13

.preheader:                                       ; preds = %7, %27
  %13 = phi float [ %11, %7 ], [ %24, %27 ]
  %14 = phi i64 [ 0, %7 ], [ %28, %27 ]
  %15 = add nuw nsw i64 %14, %6
  %16 = mul nuw nsw i64 %15, 114
  %17 = add nuw nsw i64 %16, %12
  br label %18, !dbg !14

18:                                               ; preds = %.preheader, %18
  %19 = phi float [ %13, %.preheader ], [ %24, %18 ]
  %20 = phi i64 [ 0, %.preheader ], [ %25, %18 ]
  %21 = add nuw nsw i64 %17, %20, !dbg !15
  %22 = getelementptr float, ptr %1, i64 %21, !dbg !16
  %23 = load float, ptr %22, align 4, !dbg !17
  %.inv = fcmp ole float %19, %23, !dbg !18
  %24 = select i1 %.inv, float %23, float %19, !dbg !18
  %25 = add nuw nsw i64 %20, 1, !dbg !19
  %26 = icmp ult i64 %20, 2, !dbg !20
  br i1 %26, label %18, label %27, !dbg !14

27:                                               ; preds = %18
  %28 = add nuw nsw i64 %14, 1, !dbg !21
  %29 = icmp ult i64 %14, 2, !dbg !22
  br i1 %29, label %.preheader, label %30, !dbg !13

30:                                               ; preds = %27
  %31 = getelementptr float, ptr %2, i64 %9, !dbg !23
  store float %24, ptr %31, align 4, !dbg !24
  %32 = add nuw nsw i64 %8, 1, !dbg !25
  %33 = icmp ult i64 %8, 55, !dbg !26
  br i1 %33, label %7, label %34, !dbg !9

34:                                               ; preds = %30
  %35 = add nuw nsw i64 %4, 1, !dbg !27
  %36 = icmp ult i64 %4, 3, !dbg !28
  br i1 %36, label %.preheader2, label %37, !dbg !7

37:                                               ; preds = %34
  ret void, !dbg !29
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_3", linkageName: "forward_kernel_3", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/forward_kernel_3_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 19, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 24, column: 5, scope: !8)
!10 = !DILocation(line: 31, column: 11, scope: !8)
!11 = !DILocation(line: 32, column: 11, scope: !8)
!12 = !DILocation(line: 33, column: 11, scope: !8)
!13 = !DILocation(line: 37, column: 5, scope: !8)
!14 = !DILocation(line: 42, column: 5, scope: !8)
!15 = !DILocation(line: 53, column: 11, scope: !8)
!16 = !DILocation(line: 54, column: 11, scope: !8)
!17 = !DILocation(line: 55, column: 11, scope: !8)
!18 = !DILocation(line: 57, column: 11, scope: !8)
!19 = !DILocation(line: 58, column: 11, scope: !8)
!20 = !DILocation(line: 41, column: 11, scope: !8)
!21 = !DILocation(line: 61, column: 11, scope: !8)
!22 = !DILocation(line: 36, column: 11, scope: !8)
!23 = !DILocation(line: 70, column: 11, scope: !8)
!24 = !DILocation(line: 71, column: 5, scope: !8)
!25 = !DILocation(line: 72, column: 11, scope: !8)
!26 = !DILocation(line: 23, column: 11, scope: !8)
!27 = !DILocation(line: 75, column: 11, scope: !8)
!28 = !DILocation(line: 18, column: 11, scope: !8)
!29 = !DILocation(line: 78, column: 5, scope: !8)

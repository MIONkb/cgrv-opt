; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_0_1_1_1_1_1_1_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_0(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture readonly %2, ptr nocapture writeonly %3) local_unnamed_addr #0 !dbg !3 {
  br label %5, !dbg !7

5:                                                ; preds = %4, %40
  %6 = phi i64 [ 0, %4 ], [ %42, %40 ]
  %7 = getelementptr float, ptr %0, i64 %6, !dbg !9
  %8 = load float, ptr %7, align 4, !dbg !10
  %9 = shl nuw nsw i64 %6, 1
  br label %.preheader2, !dbg !11

.preheader2:                                      ; preds = %5, %37
  %10 = phi float [ %8, %5 ], [ %31, %37 ]
  %11 = phi i64 [ 0, %5 ], [ %38, %37 ]
  %12 = mul nuw nsw i64 %11, 52900
  %13 = add nuw nsw i64 %12, %9
  %14 = mul nuw nsw i64 %11, 49
  br label %.preheader, !dbg !12

.preheader:                                       ; preds = %.preheader2, %34
  %15 = phi float [ %10, %.preheader2 ], [ %31, %34 ]
  %16 = phi i64 [ 0, %.preheader2 ], [ %35, %34 ]
  %17 = mul nuw nsw i64 %16, 230
  %18 = add nuw nsw i64 %13, %17
  %19 = mul nuw nsw i64 %16, 7
  %20 = add nuw nsw i64 %19, %14
  br label %21, !dbg !13

21:                                               ; preds = %.preheader, %21
  %22 = phi float [ %15, %.preheader ], [ %31, %21 ]
  %23 = phi i64 [ 0, %.preheader ], [ %32, %21 ]
  %24 = add nuw nsw i64 %18, %23, !dbg !14
  %25 = getelementptr float, ptr %1, i64 %24, !dbg !15
  %26 = load float, ptr %25, align 4, !dbg !16
  %27 = add nuw nsw i64 %20, %23, !dbg !17
  %28 = getelementptr float, ptr %2, i64 %27, !dbg !18
  %29 = load float, ptr %28, align 4, !dbg !19
  %30 = fmul float %26, %29, !dbg !20
  %31 = fadd float %22, %30, !dbg !21
  %32 = add nuw nsw i64 %23, 1, !dbg !22
  %33 = icmp ult i64 %23, 6, !dbg !23
  br i1 %33, label %21, label %34, !dbg !13

34:                                               ; preds = %21
  %35 = add nuw nsw i64 %16, 1, !dbg !24
  %36 = icmp ult i64 %16, 6, !dbg !25
  br i1 %36, label %.preheader, label %37, !dbg !12

37:                                               ; preds = %34
  %38 = add nuw nsw i64 %11, 1, !dbg !26
  %39 = icmp ult i64 %11, 2, !dbg !27
  br i1 %39, label %.preheader2, label %40, !dbg !11

40:                                               ; preds = %37
  %41 = getelementptr float, ptr %3, i64 %6, !dbg !28
  store float %31, ptr %41, align 4, !dbg !29
  %42 = add nuw nsw i64 %6, 1, !dbg !30
  %43 = icmp ult i64 %6, 7, !dbg !31
  br i1 %43, label %5, label %44, !dbg !7

44:                                               ; preds = %40
  ret void, !dbg !32
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_0", linkageName: "forward_kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_0_1_1_1_1_1_1_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 22, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 30, column: 11, scope: !8)
!10 = !DILocation(line: 31, column: 11, scope: !8)
!11 = !DILocation(line: 35, column: 5, scope: !8)
!12 = !DILocation(line: 40, column: 5, scope: !8)
!13 = !DILocation(line: 45, column: 5, scope: !8)
!14 = !DILocation(line: 54, column: 11, scope: !8)
!15 = !DILocation(line: 55, column: 11, scope: !8)
!16 = !DILocation(line: 56, column: 11, scope: !8)
!17 = !DILocation(line: 62, column: 11, scope: !8)
!18 = !DILocation(line: 63, column: 11, scope: !8)
!19 = !DILocation(line: 64, column: 11, scope: !8)
!20 = !DILocation(line: 65, column: 11, scope: !8)
!21 = !DILocation(line: 66, column: 11, scope: !8)
!22 = !DILocation(line: 67, column: 11, scope: !8)
!23 = !DILocation(line: 44, column: 11, scope: !8)
!24 = !DILocation(line: 70, column: 11, scope: !8)
!25 = !DILocation(line: 39, column: 11, scope: !8)
!26 = !DILocation(line: 73, column: 11, scope: !8)
!27 = !DILocation(line: 34, column: 11, scope: !8)
!28 = !DILocation(line: 82, column: 11, scope: !8)
!29 = !DILocation(line: 83, column: 5, scope: !8)
!30 = !DILocation(line: 84, column: 11, scope: !8)
!31 = !DILocation(line: 21, column: 11, scope: !8)
!32 = !DILocation(line: 87, column: 5, scope: !8)

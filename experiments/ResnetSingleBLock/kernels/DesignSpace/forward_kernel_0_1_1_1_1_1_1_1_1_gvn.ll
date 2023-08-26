; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_0_1_1_1_1_1_1_1_1_opt.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_0(ptr nocapture readonly %arg, ptr nocapture readonly %arg1, ptr nocapture readonly %arg2, ptr nocapture writeonly %arg3) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %bb4, !dbg !7

bb4:                                              ; preds = %bb38, %bb
  %i = phi i64 [ 0, %bb ], [ %i40, %bb38 ]
  %i5 = getelementptr float, ptr %arg, i64 %i, !dbg !9
  %i6 = load float, ptr %i5, align 4, !dbg !10
  %i7 = shl nuw nsw i64 %i, 1
  br label %.preheader2, !dbg !11

.preheader2:                                      ; preds = %bb35, %bb4
  %i8 = phi float [ %i6, %bb4 ], [ %.lcssa.lcssa, %bb35 ]
  %i9 = phi i64 [ 0, %bb4 ], [ %i36, %bb35 ]
  %i10 = mul nuw nsw i64 %i9, 52900
  %i11 = add nuw nsw i64 %i10, %i7
  %i12 = mul nuw nsw i64 %i9, 49
  br label %.preheader, !dbg !12

.preheader:                                       ; preds = %bb32, %.preheader2
  %i13 = phi float [ %i8, %.preheader2 ], [ %.lcssa, %bb32 ]
  %i14 = phi i64 [ 0, %.preheader2 ], [ %i33, %bb32 ]
  %i15 = mul nuw nsw i64 %i14, 230
  %i16 = add nuw nsw i64 %i11, %i15
  %i17 = mul nuw nsw i64 %i14, 7
  %i18 = add nuw nsw i64 %i17, %i12
  br label %bb19, !dbg !13

bb19:                                             ; preds = %bb19, %.preheader
  %i20 = phi float [ %i13, %.preheader ], [ %i29, %bb19 ]
  %i21 = phi i64 [ 0, %.preheader ], [ %i30, %bb19 ]
  %i22 = add nuw nsw i64 %i16, %i21, !dbg !14
  %i23 = getelementptr float, ptr %arg1, i64 %i22, !dbg !15
  %i24 = load float, ptr %i23, align 4, !dbg !16
  %i25 = add nuw nsw i64 %i18, %i21, !dbg !17
  %i26 = getelementptr float, ptr %arg2, i64 %i25, !dbg !18
  %i27 = load float, ptr %i26, align 4, !dbg !19
  %i28 = fmul float %i24, %i27, !dbg !20
  %i29 = fadd float %i20, %i28, !dbg !21
  %i30 = add nuw nsw i64 %i21, 1, !dbg !22
  %i31 = icmp ult i64 %i21, 6, !dbg !23
  br i1 %i31, label %bb19, label %bb32, !dbg !13

bb32:                                             ; preds = %bb19
  %.lcssa = phi float [ %i29, %bb19 ], !dbg !21
  %i33 = add nuw nsw i64 %i14, 1, !dbg !24
  %i34 = icmp ult i64 %i14, 6, !dbg !25
  br i1 %i34, label %.preheader, label %bb35, !dbg !12

bb35:                                             ; preds = %bb32
  %.lcssa.lcssa = phi float [ %.lcssa, %bb32 ], !dbg !21
  %i36 = add nuw nsw i64 %i9, 1, !dbg !26
  %i37 = icmp ult i64 %i9, 2, !dbg !27
  br i1 %i37, label %.preheader2, label %bb38, !dbg !11

bb38:                                             ; preds = %bb35
  %.lcssa.lcssa.lcssa = phi float [ %.lcssa.lcssa, %bb35 ], !dbg !21
  %i39 = getelementptr float, ptr %arg3, i64 %i, !dbg !28
  store float %.lcssa.lcssa.lcssa, ptr %i39, align 4, !dbg !29
  %i40 = add nuw nsw i64 %i, 1, !dbg !30
  %i41 = icmp ult i64 %i, 7, !dbg !31
  br i1 %i41, label %bb4, label %bb42, !dbg !7

bb42:                                             ; preds = %bb38
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

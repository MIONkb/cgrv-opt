; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_1_1_2_1_1_opt.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_1(ptr nocapture readonly %arg, ptr nocapture readonly %arg1, ptr nocapture readonly %arg2, ptr nocapture readonly %arg3, ptr nocapture readonly %arg4, ptr nocapture writeonly %arg5) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %bb6, !dbg !7

bb6:                                              ; preds = %bb43, %bb
  %i = phi i64 [ 0, %bb ], [ %i44, %bb43 ]
  %i7 = load float, ptr %arg, align 4, !dbg !9
  %i8 = load float, ptr %arg1, align 4, !dbg !10
  %i9 = load float, ptr %arg2, align 4, !dbg !11
  %i10 = load float, ptr %arg3, align 4, !dbg !12
  %i11 = mul nuw nsw i64 %i, 112
  %i12 = fadd float %i10, 0x3EE4F8B580000000
  %i13 = fmul float %i12, 5.000000e-01
  %i14 = bitcast float %i12 to i32
  %i15 = lshr i32 %i14, 1
  %i16 = sub nsw i32 1597463007, %i15
  %i17 = bitcast i32 %i16 to float
  %i18 = fmul float %i17, %i17
  %i19 = fmul float %i13, %i18
  %i20 = fsub float 1.500000e+00, %i19
  %i21 = fmul float %i18, %i20
  br label %bb22, !dbg !13

bb22:                                             ; preds = %bb22, %bb6
  %i23 = phi i64 [ 0, %bb6 ], [ %i41, %bb22 ]
  %i24 = add nuw nsw i64 %i23, %i11, !dbg !14
  %i25 = getelementptr float, ptr %arg4, i64 %i24, !dbg !15
  %i26 = load float, ptr %i25, align 4, !dbg !16
  %i27 = fsub float %i26, %i9, !dbg !17
  %i28 = fmul float %i21, %i27, !dbg !18
  %i29 = fmul float %i7, %i28, !dbg !19
  %i30 = fadd float %i8, %i29, !dbg !20
  %i31 = getelementptr float, ptr %arg5, i64 %i24, !dbg !21
  store float %i30, ptr %i31, align 4, !dbg !22
  %i32 = or i64 %i23, 1, !dbg !23
  %i33 = add nuw nsw i64 %i32, %i11, !dbg !24
  %i34 = getelementptr float, ptr %arg4, i64 %i33, !dbg !25
  %i35 = load float, ptr %i34, align 4, !dbg !26
  %i36 = fsub float %i35, %i9, !dbg !27
  %i37 = fmul float %i21, %i36, !dbg !28
  %i38 = fmul float %i7, %i37, !dbg !29
  %i39 = fadd float %i8, %i38, !dbg !30
  %i40 = getelementptr float, ptr %arg5, i64 %i33, !dbg !31
  store float %i39, ptr %i40, align 4, !dbg !32
  %i41 = add nuw nsw i64 %i23, 2, !dbg !33
  %i42 = icmp ult i64 %i23, 110, !dbg !34
  br i1 %i42, label %bb22, label %bb43, !dbg !13

bb43:                                             ; preds = %bb22
  %i44 = add nuw nsw i64 %i, 1, !dbg !35
  %i45 = icmp ult i64 %i, 15, !dbg !36
  br i1 %i45, label %bb6, label %bb46, !dbg !7

bb46:                                             ; preds = %bb43
  ret void, !dbg !37
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_1", linkageName: "forward_kernel_1", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_1_1_2_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 20, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 22, column: 11, scope: !8)
!10 = !DILocation(line: 23, column: 11, scope: !8)
!11 = !DILocation(line: 24, column: 11, scope: !8)
!12 = !DILocation(line: 25, column: 11, scope: !8)
!13 = !DILocation(line: 29, column: 5, scope: !8)
!14 = !DILocation(line: 36, column: 11, scope: !8)
!15 = !DILocation(line: 37, column: 11, scope: !8)
!16 = !DILocation(line: 38, column: 11, scope: !8)
!17 = !DILocation(line: 50, column: 11, scope: !8)
!18 = !DILocation(line: 51, column: 11, scope: !8)
!19 = !DILocation(line: 52, column: 11, scope: !8)
!20 = !DILocation(line: 53, column: 11, scope: !8)
!21 = !DILocation(line: 60, column: 11, scope: !8)
!22 = !DILocation(line: 61, column: 5, scope: !8)
!23 = !DILocation(line: 62, column: 11, scope: !8)
!24 = !DILocation(line: 68, column: 11, scope: !8)
!25 = !DILocation(line: 69, column: 11, scope: !8)
!26 = !DILocation(line: 70, column: 11, scope: !8)
!27 = !DILocation(line: 82, column: 11, scope: !8)
!28 = !DILocation(line: 83, column: 11, scope: !8)
!29 = !DILocation(line: 84, column: 11, scope: !8)
!30 = !DILocation(line: 85, column: 11, scope: !8)
!31 = !DILocation(line: 92, column: 11, scope: !8)
!32 = !DILocation(line: 93, column: 5, scope: !8)
!33 = !DILocation(line: 94, column: 11, scope: !8)
!34 = !DILocation(line: 28, column: 11, scope: !8)
!35 = !DILocation(line: 97, column: 11, scope: !8)
!36 = !DILocation(line: 19, column: 11, scope: !8)
!37 = !DILocation(line: 100, column: 5, scope: !8)

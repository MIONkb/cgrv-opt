; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/tempfiles/forward_kernel_1_gvn.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_1(ptr nocapture readonly %arg, ptr nocapture readonly %arg1, ptr nocapture readonly %arg2, ptr nocapture readonly %arg3, ptr nocapture readonly %arg4, ptr nocapture writeonly %arg5) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %bb6, !dbg !7

bb6:                                              ; preds = %bb34, %bb
  %i = phi i64 [ 0, %bb ], [ %i35, %bb34 ]
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
  %i23 = phi i64 [ 0, %bb6 ], [ %i32, %bb22 ]
  %i24 = add nuw nsw i64 %i23, %i11, !dbg !14
  %i25 = getelementptr float, ptr %arg4, i64 %i24, !dbg !15
  %i26 = load float, ptr %i25, align 4, !dbg !16
  %i27 = fsub float %i26, %i9, !dbg !17
  %i28 = fmul float %i21, %i27, !dbg !18
  %i29 = fmul float %i7, %i28, !dbg !19
  %i30 = fadd float %i8, %i29, !dbg !20
  %i31 = getelementptr float, ptr %arg5, i64 %i24, !dbg !21
  store float %i30, ptr %i31, align 4, !dbg !22
  %i32 = add nuw nsw i64 %i23, 1, !dbg !23
  %i33 = icmp ult i64 %i23, 111, !dbg !24
  br i1 %i33, label %bb22, label %bb34, !dbg !13

bb34:                                             ; preds = %bb22
  %i35 = add nuw nsw i64 %i, 1, !dbg !25
  %i36 = icmp ult i64 %i, 15, !dbg !26
  br i1 %i36, label %bb6, label %bb37, !dbg !7

bb37:                                             ; preds = %bb34
  ret void, !dbg !27
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_1", linkageName: "forward_kernel_1", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/forward_kernel_1_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 19, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 21, column: 11, scope: !8)
!10 = !DILocation(line: 22, column: 11, scope: !8)
!11 = !DILocation(line: 23, column: 11, scope: !8)
!12 = !DILocation(line: 24, column: 11, scope: !8)
!13 = !DILocation(line: 28, column: 5, scope: !8)
!14 = !DILocation(line: 35, column: 11, scope: !8)
!15 = !DILocation(line: 36, column: 11, scope: !8)
!16 = !DILocation(line: 37, column: 11, scope: !8)
!17 = !DILocation(line: 49, column: 11, scope: !8)
!18 = !DILocation(line: 50, column: 11, scope: !8)
!19 = !DILocation(line: 51, column: 11, scope: !8)
!20 = !DILocation(line: 52, column: 11, scope: !8)
!21 = !DILocation(line: 59, column: 11, scope: !8)
!22 = !DILocation(line: 60, column: 5, scope: !8)
!23 = !DILocation(line: 61, column: 11, scope: !8)
!24 = !DILocation(line: 27, column: 11, scope: !8)
!25 = !DILocation(line: 64, column: 11, scope: !8)
!26 = !DILocation(line: 18, column: 11, scope: !8)
!27 = !DILocation(line: 67, column: 5, scope: !8)

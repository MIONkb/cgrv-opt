; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_1_1_4_1_1_opt.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_1(ptr nocapture readonly %arg, ptr nocapture readonly %arg1, ptr nocapture readonly %arg2, ptr nocapture readonly %arg3, ptr nocapture readonly %arg4, ptr nocapture writeonly %arg5) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %bb6, !dbg !7

bb6:                                              ; preds = %bb61, %bb
  %i = phi i64 [ 0, %bb ], [ %i62, %bb61 ]
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
  %i23 = phi i64 [ 0, %bb6 ], [ %i59, %bb22 ]
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
  %i41 = or i64 %i23, 2, !dbg !33
  %i42 = add nuw nsw i64 %i41, %i11, !dbg !34
  %i43 = getelementptr float, ptr %arg4, i64 %i42, !dbg !35
  %i44 = load float, ptr %i43, align 4, !dbg !36
  %i45 = fsub float %i44, %i9, !dbg !37
  %i46 = fmul float %i21, %i45, !dbg !38
  %i47 = fmul float %i7, %i46, !dbg !39
  %i48 = fadd float %i8, %i47, !dbg !40
  %i49 = getelementptr float, ptr %arg5, i64 %i42, !dbg !41
  store float %i48, ptr %i49, align 4, !dbg !42
  %i50 = or i64 %i23, 3, !dbg !43
  %i51 = add nuw nsw i64 %i50, %i11, !dbg !44
  %i52 = getelementptr float, ptr %arg4, i64 %i51, !dbg !45
  %i53 = load float, ptr %i52, align 4, !dbg !46
  %i54 = fsub float %i53, %i9, !dbg !47
  %i55 = fmul float %i21, %i54, !dbg !48
  %i56 = fmul float %i7, %i55, !dbg !49
  %i57 = fadd float %i8, %i56, !dbg !50
  %i58 = getelementptr float, ptr %arg5, i64 %i51, !dbg !51
  store float %i57, ptr %i58, align 4, !dbg !52
  %i59 = add nuw nsw i64 %i23, 4, !dbg !53
  %i60 = icmp ult i64 %i23, 108, !dbg !54
  br i1 %i60, label %bb22, label %bb61, !dbg !13

bb61:                                             ; preds = %bb22
  %i62 = add nuw nsw i64 %i, 1, !dbg !55
  %i63 = icmp ult i64 %i, 15, !dbg !56
  br i1 %i63, label %bb6, label %bb64, !dbg !7

bb64:                                             ; preds = %bb61
  ret void, !dbg !57
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_1", linkageName: "forward_kernel_1", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_1_1_4_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 22, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 24, column: 11, scope: !8)
!10 = !DILocation(line: 25, column: 11, scope: !8)
!11 = !DILocation(line: 26, column: 11, scope: !8)
!12 = !DILocation(line: 27, column: 11, scope: !8)
!13 = !DILocation(line: 31, column: 5, scope: !8)
!14 = !DILocation(line: 38, column: 11, scope: !8)
!15 = !DILocation(line: 39, column: 11, scope: !8)
!16 = !DILocation(line: 40, column: 11, scope: !8)
!17 = !DILocation(line: 52, column: 11, scope: !8)
!18 = !DILocation(line: 53, column: 11, scope: !8)
!19 = !DILocation(line: 54, column: 11, scope: !8)
!20 = !DILocation(line: 55, column: 11, scope: !8)
!21 = !DILocation(line: 62, column: 11, scope: !8)
!22 = !DILocation(line: 63, column: 5, scope: !8)
!23 = !DILocation(line: 64, column: 11, scope: !8)
!24 = !DILocation(line: 70, column: 11, scope: !8)
!25 = !DILocation(line: 71, column: 11, scope: !8)
!26 = !DILocation(line: 72, column: 11, scope: !8)
!27 = !DILocation(line: 84, column: 11, scope: !8)
!28 = !DILocation(line: 85, column: 11, scope: !8)
!29 = !DILocation(line: 86, column: 11, scope: !8)
!30 = !DILocation(line: 87, column: 11, scope: !8)
!31 = !DILocation(line: 94, column: 11, scope: !8)
!32 = !DILocation(line: 95, column: 5, scope: !8)
!33 = !DILocation(line: 96, column: 11, scope: !8)
!34 = !DILocation(line: 102, column: 11, scope: !8)
!35 = !DILocation(line: 103, column: 11, scope: !8)
!36 = !DILocation(line: 104, column: 11, scope: !8)
!37 = !DILocation(line: 116, column: 12, scope: !8)
!38 = !DILocation(line: 117, column: 12, scope: !8)
!39 = !DILocation(line: 118, column: 12, scope: !8)
!40 = !DILocation(line: 119, column: 12, scope: !8)
!41 = !DILocation(line: 126, column: 12, scope: !8)
!42 = !DILocation(line: 127, column: 5, scope: !8)
!43 = !DILocation(line: 128, column: 12, scope: !8)
!44 = !DILocation(line: 134, column: 12, scope: !8)
!45 = !DILocation(line: 135, column: 12, scope: !8)
!46 = !DILocation(line: 136, column: 12, scope: !8)
!47 = !DILocation(line: 148, column: 12, scope: !8)
!48 = !DILocation(line: 149, column: 12, scope: !8)
!49 = !DILocation(line: 150, column: 12, scope: !8)
!50 = !DILocation(line: 151, column: 12, scope: !8)
!51 = !DILocation(line: 158, column: 12, scope: !8)
!52 = !DILocation(line: 159, column: 5, scope: !8)
!53 = !DILocation(line: 160, column: 12, scope: !8)
!54 = !DILocation(line: 30, column: 11, scope: !8)
!55 = !DILocation(line: 163, column: 12, scope: !8)
!56 = !DILocation(line: 21, column: 11, scope: !8)
!57 = !DILocation(line: 166, column: 5, scope: !8)

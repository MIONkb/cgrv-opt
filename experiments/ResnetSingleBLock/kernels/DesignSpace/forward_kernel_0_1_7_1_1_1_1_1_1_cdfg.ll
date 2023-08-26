; ModuleID = 'forward_kernel_0_1_7_1_1_1_1_1_1_gvn.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_0(ptr nocapture readonly %arg, ptr nocapture readonly %arg1, ptr nocapture readonly %arg2, ptr nocapture writeonly %arg3) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %bb4, !dbg !7

bb4:                                              ; preds = %bb64, %bb
  %i = phi i64 [ 0, %bb ], [ %i66, %bb64 ]
  %i5 = getelementptr float, ptr %arg, i64 %i, !dbg !9
  %i6 = load float, ptr %i5, align 4, !dbg !10
  %i7 = shl nuw nsw i64 %i, 1
  br label %.preheader, !dbg !11

.preheader:                                       ; preds = %bb61, %bb4
  %i8 = phi float [ %i6, %bb4 ], [ %.lcssa, %bb61 ]
  %i9 = phi i64 [ 0, %bb4 ], [ %i62, %bb61 ]
  %i10 = mul nuw nsw i64 %i9, 52900
  %i11 = mul nuw nsw i64 %i9, 49
  br label %bb12, !dbg !12

bb12:                                             ; preds = %bb12, %.preheader
  %i13 = phi float [ %i8, %.preheader ], [ %i58, %bb12 ]
  %i14 = phi i64 [ 0, %.preheader ], [ %i59, %bb12 ]
  %i15 = mul nuw nsw i64 %i14, 230, !dbg !13
  %i16 = add nuw nsw i64 %i15, %i10, !dbg !14
  %i17 = add nuw nsw i64 %i16, %i7, !dbg !15
  %i18 = getelementptr float, ptr %arg1, i64 %i17, !dbg !16
  %i19 = mul nuw nsw i64 %i14, 7, !dbg !17
  %i20 = add nuw nsw i64 %i19, %i11, !dbg !18
  %i21 = getelementptr float, ptr %arg2, i64 %i20, !dbg !19
  %i22 = load <2 x float>, ptr %i18, align 4, !dbg !20
  %i23 = load <2 x float>, ptr %i21, align 4, !dbg !21
  %i24 = fmul <2 x float> %i22, %i23, !dbg !22
  %i25 = extractelement <2 x float> %i24, i64 0, !dbg !23
  %i26 = fadd float %i13, %i25, !dbg !23
  %i27 = extractelement <2 x float> %i24, i64 1, !dbg !24
  %i28 = fadd float %i26, %i27, !dbg !24
  %i29 = add nuw nsw i64 %i17, 2, !dbg !25
  %i30 = getelementptr float, ptr %arg1, i64 %i29, !dbg !26
  %i31 = add nuw nsw i64 %i20, 2, !dbg !27
  %i32 = getelementptr float, ptr %arg2, i64 %i31, !dbg !28
  %i33 = load <2 x float>, ptr %i30, align 4, !dbg !29
  %i34 = load <2 x float>, ptr %i32, align 4, !dbg !30
  %i35 = fmul <2 x float> %i33, %i34, !dbg !31
  %i36 = extractelement <2 x float> %i35, i64 0, !dbg !32
  %i37 = fadd float %i28, %i36, !dbg !32
  %i38 = extractelement <2 x float> %i35, i64 1, !dbg !33
  %i39 = fadd float %i37, %i38, !dbg !33
  %i40 = add nuw nsw i64 %i17, 4, !dbg !34
  %i41 = getelementptr float, ptr %arg1, i64 %i40, !dbg !35
  %i42 = add nuw nsw i64 %i20, 4, !dbg !36
  %i43 = getelementptr float, ptr %arg2, i64 %i42, !dbg !37
  %i44 = load <2 x float>, ptr %i41, align 4, !dbg !38
  %i45 = load <2 x float>, ptr %i43, align 4, !dbg !39
  %i46 = fmul <2 x float> %i44, %i45, !dbg !40
  %i47 = extractelement <2 x float> %i46, i64 0, !dbg !41
  %i48 = fadd float %i39, %i47, !dbg !41
  %i49 = extractelement <2 x float> %i46, i64 1, !dbg !42
  %i50 = fadd float %i48, %i49, !dbg !42
  %i51 = add nuw nsw i64 %i17, 6, !dbg !43
  %i52 = getelementptr float, ptr %arg1, i64 %i51, !dbg !44
  %i53 = load float, ptr %i52, align 4, !dbg !45
  %i54 = add nuw nsw i64 %i20, 6, !dbg !46
  %i55 = getelementptr float, ptr %arg2, i64 %i54, !dbg !47
  %i56 = load float, ptr %i55, align 4, !dbg !48
  %i57 = fmul float %i53, %i56, !dbg !49
  %i58 = fadd float %i50, %i57, !dbg !50
  %i59 = add nuw nsw i64 %i14, 1, !dbg !51
  %i60 = icmp ult i64 %i14, 6, !dbg !52
  br i1 %i60, label %bb12, label %bb61, !dbg !12

bb61:                                             ; preds = %bb12
  %.lcssa = phi float [ %i58, %bb12 ], !dbg !50
  %i62 = add nuw nsw i64 %i9, 1, !dbg !53
  %i63 = icmp ult i64 %i9, 2, !dbg !54
  br i1 %i63, label %.preheader, label %bb64, !dbg !11

bb64:                                             ; preds = %bb61
  %.lcssa.lcssa = phi float [ %.lcssa, %bb61 ], !dbg !50
  %i65 = getelementptr float, ptr %arg3, i64 %i, !dbg !55
  store float %.lcssa.lcssa, ptr %i65, align 4, !dbg !56
  %i66 = add nuw nsw i64 %i, 1, !dbg !57
  %i67 = icmp ult i64 %i, 7, !dbg !58
  br i1 %i67, label %bb4, label %bb68, !dbg !7

bb68:                                             ; preds = %bb64
  ret void, !dbg !59
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_0", linkageName: "forward_kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_0_1_7_1_1_1_1_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 25, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 33, column: 11, scope: !8)
!10 = !DILocation(line: 34, column: 11, scope: !8)
!11 = !DILocation(line: 38, column: 5, scope: !8)
!12 = !DILocation(line: 43, column: 5, scope: !8)
!13 = !DILocation(line: 49, column: 11, scope: !8)
!14 = !DILocation(line: 50, column: 11, scope: !8)
!15 = !DILocation(line: 51, column: 11, scope: !8)
!16 = !DILocation(line: 52, column: 11, scope: !8)
!17 = !DILocation(line: 57, column: 11, scope: !8)
!18 = !DILocation(line: 58, column: 11, scope: !8)
!19 = !DILocation(line: 60, column: 11, scope: !8)
!20 = !DILocation(line: 53, column: 11, scope: !8)
!21 = !DILocation(line: 61, column: 11, scope: !8)
!22 = !DILocation(line: 62, column: 11, scope: !8)
!23 = !DILocation(line: 63, column: 11, scope: !8)
!24 = !DILocation(line: 83, column: 11, scope: !8)
!25 = !DILocation(line: 91, column: 11, scope: !8)
!26 = !DILocation(line: 92, column: 11, scope: !8)
!27 = !DILocation(line: 99, column: 11, scope: !8)
!28 = !DILocation(line: 100, column: 11, scope: !8)
!29 = !DILocation(line: 93, column: 11, scope: !8)
!30 = !DILocation(line: 101, column: 11, scope: !8)
!31 = !DILocation(line: 102, column: 11, scope: !8)
!32 = !DILocation(line: 103, column: 11, scope: !8)
!33 = !DILocation(line: 123, column: 12, scope: !8)
!34 = !DILocation(line: 131, column: 12, scope: !8)
!35 = !DILocation(line: 132, column: 12, scope: !8)
!36 = !DILocation(line: 139, column: 12, scope: !8)
!37 = !DILocation(line: 140, column: 12, scope: !8)
!38 = !DILocation(line: 133, column: 12, scope: !8)
!39 = !DILocation(line: 141, column: 12, scope: !8)
!40 = !DILocation(line: 142, column: 12, scope: !8)
!41 = !DILocation(line: 143, column: 12, scope: !8)
!42 = !DILocation(line: 163, column: 12, scope: !8)
!43 = !DILocation(line: 171, column: 12, scope: !8)
!44 = !DILocation(line: 172, column: 12, scope: !8)
!45 = !DILocation(line: 173, column: 12, scope: !8)
!46 = !DILocation(line: 179, column: 12, scope: !8)
!47 = !DILocation(line: 180, column: 12, scope: !8)
!48 = !DILocation(line: 181, column: 12, scope: !8)
!49 = !DILocation(line: 182, column: 12, scope: !8)
!50 = !DILocation(line: 183, column: 12, scope: !8)
!51 = !DILocation(line: 184, column: 12, scope: !8)
!52 = !DILocation(line: 42, column: 11, scope: !8)
!53 = !DILocation(line: 187, column: 12, scope: !8)
!54 = !DILocation(line: 37, column: 11, scope: !8)
!55 = !DILocation(line: 196, column: 12, scope: !8)
!56 = !DILocation(line: 197, column: 5, scope: !8)
!57 = !DILocation(line: 198, column: 12, scope: !8)
!58 = !DILocation(line: 24, column: 11, scope: !8)
!59 = !DILocation(line: 201, column: 5, scope: !8)

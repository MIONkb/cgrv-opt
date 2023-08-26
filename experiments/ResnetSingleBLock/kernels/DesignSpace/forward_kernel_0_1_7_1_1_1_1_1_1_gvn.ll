; ModuleID = 'forward_kernel_0_1_7_1_1_1_1_1_1_opt.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_0(ptr nocapture readonly %arg, ptr nocapture readonly %arg19, ptr nocapture readonly %arg20, ptr nocapture writeonly %arg21) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %bb22, !dbg !7

bb22:                                             ; preds = %bb73, %bb
  %i = phi i64 [ 0, %bb ], [ %i75, %bb73 ]
  %i23 = getelementptr float, ptr %arg, i64 %i, !dbg !9
  %i24 = load float, ptr %i23, align 4, !dbg !10
  %i25 = shl nuw nsw i64 %i, 1
  br label %.preheader, !dbg !11

.preheader:                                       ; preds = %bb70, %bb22
  %i26 = phi float [ %i24, %bb22 ], [ %.lcssa, %bb70 ]
  %i27 = phi i64 [ 0, %bb22 ], [ %i71, %bb70 ]
  %i28 = mul nuw nsw i64 %i27, 52900
  %i29 = mul nuw nsw i64 %i27, 49
  br label %bb30, !dbg !12

bb30:                                             ; preds = %bb30, %.preheader
  %i31 = phi float [ %i26, %.preheader ], [ %i67, %bb30 ]
  %i32 = phi i64 [ 0, %.preheader ], [ %i68, %bb30 ]
  %i33 = mul nuw nsw i64 %i32, 230, !dbg !13
  %i34 = add nuw nsw i64 %i33, %i28, !dbg !14
  %i35 = add nuw nsw i64 %i34, %i25, !dbg !15
  %i36 = getelementptr float, ptr %arg19, i64 %i35, !dbg !16
  %i37 = mul nuw nsw i64 %i32, 7, !dbg !17
  %i38 = add nuw nsw i64 %i37, %i29, !dbg !18
  %i39 = getelementptr float, ptr %arg20, i64 %i38, !dbg !19
  %i40 = load <2 x float>, ptr %i36, align 4, !dbg !20
  %.i0 = extractelement <2 x float> %i40, i32 0, !dbg !21
  %.i1 = extractelement <2 x float> %i40, i32 1, !dbg !21
  %i41 = load <2 x float>, ptr %i39, align 4, !dbg !21
  %.i01 = extractelement <2 x float> %i41, i32 0, !dbg !22
  %.i02 = fmul float %.i0, %.i01, !dbg !22
  %.i13 = extractelement <2 x float> %i41, i32 1, !dbg !22
  %.i14 = fmul float %.i1, %.i13, !dbg !22
  %i42 = fadd float %i31, %.i02, !dbg !23
  %i43 = fadd float %i42, %.i14, !dbg !24
  %i44 = add nuw nsw i64 %i35, 2, !dbg !25
  %i45 = getelementptr float, ptr %arg19, i64 %i44, !dbg !26
  %i46 = add nuw nsw i64 %i38, 2, !dbg !27
  %i47 = getelementptr float, ptr %arg20, i64 %i46, !dbg !28
  %i48 = load <2 x float>, ptr %i45, align 4, !dbg !29
  %.i05 = extractelement <2 x float> %i48, i32 0, !dbg !30
  %.i18 = extractelement <2 x float> %i48, i32 1, !dbg !30
  %i49 = load <2 x float>, ptr %i47, align 4, !dbg !30
  %.i06 = extractelement <2 x float> %i49, i32 0, !dbg !31
  %.i07 = fmul float %.i05, %.i06, !dbg !31
  %.i19 = extractelement <2 x float> %i49, i32 1, !dbg !31
  %.i110 = fmul float %.i18, %.i19, !dbg !31
  %i50 = fadd float %i43, %.i07, !dbg !32
  %i51 = fadd float %i50, %.i110, !dbg !33
  %i52 = add nuw nsw i64 %i35, 4, !dbg !34
  %i53 = getelementptr float, ptr %arg19, i64 %i52, !dbg !35
  %i54 = add nuw nsw i64 %i38, 4, !dbg !36
  %i55 = getelementptr float, ptr %arg20, i64 %i54, !dbg !37
  %i56 = load <2 x float>, ptr %i53, align 4, !dbg !38
  %.i011 = extractelement <2 x float> %i56, i32 0, !dbg !39
  %.i114 = extractelement <2 x float> %i56, i32 1, !dbg !39
  %i57 = load <2 x float>, ptr %i55, align 4, !dbg !39
  %.i012 = extractelement <2 x float> %i57, i32 0, !dbg !40
  %.i013 = fmul float %.i011, %.i012, !dbg !40
  %.i115 = extractelement <2 x float> %i57, i32 1, !dbg !40
  %.i116 = fmul float %.i114, %.i115, !dbg !40
  %i58 = fadd float %i51, %.i013, !dbg !41
  %i59 = fadd float %i58, %.i116, !dbg !42
  %i60 = add nuw nsw i64 %i35, 6, !dbg !43
  %i61 = getelementptr float, ptr %arg19, i64 %i60, !dbg !44
  %i62 = load float, ptr %i61, align 4, !dbg !45
  %i63 = add nuw nsw i64 %i38, 6, !dbg !46
  %i64 = getelementptr float, ptr %arg20, i64 %i63, !dbg !47
  %i65 = load float, ptr %i64, align 4, !dbg !48
  %i66 = fmul float %i62, %i65, !dbg !49
  %i67 = fadd float %i59, %i66, !dbg !50
  %i68 = add nuw nsw i64 %i32, 1, !dbg !51
  %i69 = icmp ult i64 %i32, 6, !dbg !52
  br i1 %i69, label %bb30, label %bb70, !dbg !12

bb70:                                             ; preds = %bb30
  %.lcssa = phi float [ %i67, %bb30 ], !dbg !50
  %i71 = add nuw nsw i64 %i27, 1, !dbg !53
  %i72 = icmp ult i64 %i27, 2, !dbg !54
  br i1 %i72, label %.preheader, label %bb73, !dbg !11

bb73:                                             ; preds = %bb70
  %.lcssa.lcssa = phi float [ %.lcssa, %bb70 ], !dbg !50
  %i74 = getelementptr float, ptr %arg21, i64 %i, !dbg !55
  store float %.lcssa.lcssa, ptr %i74, align 4, !dbg !56
  %i75 = add nuw nsw i64 %i, 1, !dbg !57
  %i76 = icmp ult i64 %i, 7, !dbg !58
  br i1 %i76, label %bb22, label %bb77, !dbg !7

bb77:                                             ; preds = %bb73
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

; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_8_1_1_opt.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %arg, ptr nocapture writeonly %arg1) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %bb54, %bb
  %i = phi i64 [ 0, %bb ], [ %i55, %bb54 ]
  %i2 = mul nuw nsw i64 %i, 112
  br label %bb3, !dbg !9

bb3:                                              ; preds = %bb3, %.preheader
  %i4 = phi i64 [ 0, %.preheader ], [ %i52, %bb3 ]
  %i5 = add nuw nsw i64 %i4, %i2, !dbg !10
  %i6 = getelementptr float, ptr %arg, i64 %i5, !dbg !11
  %i7 = load float, ptr %i6, align 4, !dbg !12
  %.inv = fcmp ole float %i7, 0.000000e+00, !dbg !13
  %i8 = select i1 %.inv, float 0.000000e+00, float %i7, !dbg !13
  %i9 = getelementptr float, ptr %arg1, i64 %i5, !dbg !14
  store float %i8, ptr %i9, align 4, !dbg !15
  %i10 = or i64 %i4, 1, !dbg !16
  %i11 = add nuw nsw i64 %i10, %i2, !dbg !17
  %i12 = getelementptr float, ptr %arg, i64 %i11, !dbg !18
  %i13 = load float, ptr %i12, align 4, !dbg !19
  %.inv1 = fcmp ole float %i13, 0.000000e+00, !dbg !20
  %i14 = select i1 %.inv1, float 0.000000e+00, float %i13, !dbg !20
  %i15 = getelementptr float, ptr %arg1, i64 %i11, !dbg !21
  store float %i14, ptr %i15, align 4, !dbg !22
  %i16 = or i64 %i4, 2, !dbg !23
  %i17 = add nuw nsw i64 %i16, %i2, !dbg !24
  %i18 = getelementptr float, ptr %arg, i64 %i17, !dbg !25
  %i19 = load float, ptr %i18, align 4, !dbg !26
  %.inv2 = fcmp ole float %i19, 0.000000e+00, !dbg !27
  %i20 = select i1 %.inv2, float 0.000000e+00, float %i19, !dbg !27
  %i21 = getelementptr float, ptr %arg1, i64 %i17, !dbg !28
  store float %i20, ptr %i21, align 4, !dbg !29
  %i22 = or i64 %i4, 3, !dbg !30
  %i23 = add nuw nsw i64 %i22, %i2, !dbg !31
  %i24 = getelementptr float, ptr %arg, i64 %i23, !dbg !32
  %i25 = load float, ptr %i24, align 4, !dbg !33
  %.inv3 = fcmp ole float %i25, 0.000000e+00, !dbg !34
  %i26 = select i1 %.inv3, float 0.000000e+00, float %i25, !dbg !34
  %i27 = getelementptr float, ptr %arg1, i64 %i23, !dbg !35
  store float %i26, ptr %i27, align 4, !dbg !36
  %i28 = or i64 %i4, 4, !dbg !37
  %i29 = add nuw nsw i64 %i28, %i2, !dbg !38
  %i30 = getelementptr float, ptr %arg, i64 %i29, !dbg !39
  %i31 = load float, ptr %i30, align 4, !dbg !40
  %.inv4 = fcmp ole float %i31, 0.000000e+00, !dbg !41
  %i32 = select i1 %.inv4, float 0.000000e+00, float %i31, !dbg !41
  %i33 = getelementptr float, ptr %arg1, i64 %i29, !dbg !42
  store float %i32, ptr %i33, align 4, !dbg !43
  %i34 = or i64 %i4, 5, !dbg !44
  %i35 = add nuw nsw i64 %i34, %i2, !dbg !45
  %i36 = getelementptr float, ptr %arg, i64 %i35, !dbg !46
  %i37 = load float, ptr %i36, align 4, !dbg !47
  %.inv5 = fcmp ole float %i37, 0.000000e+00, !dbg !48
  %i38 = select i1 %.inv5, float 0.000000e+00, float %i37, !dbg !48
  %i39 = getelementptr float, ptr %arg1, i64 %i35, !dbg !49
  store float %i38, ptr %i39, align 4, !dbg !50
  %i40 = or i64 %i4, 6, !dbg !51
  %i41 = add nuw nsw i64 %i40, %i2, !dbg !52
  %i42 = getelementptr float, ptr %arg, i64 %i41, !dbg !53
  %i43 = load float, ptr %i42, align 4, !dbg !54
  %.inv6 = fcmp ole float %i43, 0.000000e+00, !dbg !55
  %i44 = select i1 %.inv6, float 0.000000e+00, float %i43, !dbg !55
  %i45 = getelementptr float, ptr %arg1, i64 %i41, !dbg !56
  store float %i44, ptr %i45, align 4, !dbg !57
  %i46 = or i64 %i4, 7, !dbg !58
  %i47 = add nuw nsw i64 %i46, %i2, !dbg !59
  %i48 = getelementptr float, ptr %arg, i64 %i47, !dbg !60
  %i49 = load float, ptr %i48, align 4, !dbg !61
  %.inv7 = fcmp ole float %i49, 0.000000e+00, !dbg !62
  %i50 = select i1 %.inv7, float 0.000000e+00, float %i49, !dbg !62
  %i51 = getelementptr float, ptr %arg1, i64 %i47, !dbg !63
  store float %i50, ptr %i51, align 4, !dbg !64
  %i52 = add nuw nsw i64 %i4, 8, !dbg !65
  %i53 = icmp ult i64 %i4, 104, !dbg !66
  br i1 %i53, label %bb3, label %bb54, !dbg !9

bb54:                                             ; preds = %bb3
  %i55 = add nuw nsw i64 %i, 1, !dbg !67
  %i56 = icmp ult i64 %i, 15, !dbg !68
  br i1 %i56, label %.preheader, label %bb57, !dbg !7

bb57:                                             ; preds = %bb54
  ret void, !dbg !69
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_2", linkageName: "forward_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_2_1_8_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 22, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 27, column: 5, scope: !8)
!10 = !DILocation(line: 34, column: 11, scope: !8)
!11 = !DILocation(line: 35, column: 11, scope: !8)
!12 = !DILocation(line: 36, column: 11, scope: !8)
!13 = !DILocation(line: 38, column: 11, scope: !8)
!14 = !DILocation(line: 45, column: 11, scope: !8)
!15 = !DILocation(line: 46, column: 5, scope: !8)
!16 = !DILocation(line: 47, column: 11, scope: !8)
!17 = !DILocation(line: 53, column: 11, scope: !8)
!18 = !DILocation(line: 54, column: 11, scope: !8)
!19 = !DILocation(line: 55, column: 11, scope: !8)
!20 = !DILocation(line: 57, column: 11, scope: !8)
!21 = !DILocation(line: 64, column: 11, scope: !8)
!22 = !DILocation(line: 65, column: 5, scope: !8)
!23 = !DILocation(line: 66, column: 11, scope: !8)
!24 = !DILocation(line: 72, column: 11, scope: !8)
!25 = !DILocation(line: 73, column: 11, scope: !8)
!26 = !DILocation(line: 74, column: 11, scope: !8)
!27 = !DILocation(line: 76, column: 11, scope: !8)
!28 = !DILocation(line: 83, column: 11, scope: !8)
!29 = !DILocation(line: 84, column: 5, scope: !8)
!30 = !DILocation(line: 85, column: 11, scope: !8)
!31 = !DILocation(line: 91, column: 11, scope: !8)
!32 = !DILocation(line: 92, column: 11, scope: !8)
!33 = !DILocation(line: 93, column: 11, scope: !8)
!34 = !DILocation(line: 95, column: 11, scope: !8)
!35 = !DILocation(line: 102, column: 11, scope: !8)
!36 = !DILocation(line: 103, column: 5, scope: !8)
!37 = !DILocation(line: 104, column: 11, scope: !8)
!38 = !DILocation(line: 110, column: 11, scope: !8)
!39 = !DILocation(line: 111, column: 11, scope: !8)
!40 = !DILocation(line: 112, column: 11, scope: !8)
!41 = !DILocation(line: 114, column: 11, scope: !8)
!42 = !DILocation(line: 121, column: 12, scope: !8)
!43 = !DILocation(line: 122, column: 5, scope: !8)
!44 = !DILocation(line: 123, column: 12, scope: !8)
!45 = !DILocation(line: 129, column: 12, scope: !8)
!46 = !DILocation(line: 130, column: 12, scope: !8)
!47 = !DILocation(line: 131, column: 12, scope: !8)
!48 = !DILocation(line: 133, column: 12, scope: !8)
!49 = !DILocation(line: 140, column: 12, scope: !8)
!50 = !DILocation(line: 141, column: 5, scope: !8)
!51 = !DILocation(line: 142, column: 12, scope: !8)
!52 = !DILocation(line: 148, column: 12, scope: !8)
!53 = !DILocation(line: 149, column: 12, scope: !8)
!54 = !DILocation(line: 150, column: 12, scope: !8)
!55 = !DILocation(line: 152, column: 12, scope: !8)
!56 = !DILocation(line: 159, column: 12, scope: !8)
!57 = !DILocation(line: 160, column: 5, scope: !8)
!58 = !DILocation(line: 161, column: 12, scope: !8)
!59 = !DILocation(line: 167, column: 12, scope: !8)
!60 = !DILocation(line: 168, column: 12, scope: !8)
!61 = !DILocation(line: 169, column: 12, scope: !8)
!62 = !DILocation(line: 171, column: 12, scope: !8)
!63 = !DILocation(line: 178, column: 12, scope: !8)
!64 = !DILocation(line: 179, column: 5, scope: !8)
!65 = !DILocation(line: 180, column: 12, scope: !8)
!66 = !DILocation(line: 26, column: 11, scope: !8)
!67 = !DILocation(line: 183, column: 12, scope: !8)
!68 = !DILocation(line: 21, column: 11, scope: !8)
!69 = !DILocation(line: 186, column: 5, scope: !8)

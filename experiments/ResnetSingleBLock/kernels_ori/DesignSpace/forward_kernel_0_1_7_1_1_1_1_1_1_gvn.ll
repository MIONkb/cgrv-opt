; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_0_1_7_1_1_1_1_1_1_opt.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_0(ptr nocapture readonly %arg, ptr nocapture readonly %arg1, ptr nocapture readonly %arg2, ptr nocapture writeonly %arg3) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %bb4, !dbg !7

bb4:                                              ; preds = %bb79, %bb
  %i = phi i64 [ 0, %bb ], [ %i81, %bb79 ]
  %i5 = getelementptr float, ptr %arg, i64 %i, !dbg !9
  %i6 = load float, ptr %i5, align 4, !dbg !10
  %i7 = shl nuw nsw i64 %i, 1
  br label %.preheader, !dbg !11

.preheader:                                       ; preds = %bb76, %bb4
  %i8 = phi float [ %i6, %bb4 ], [ %.lcssa, %bb76 ]
  %i9 = phi i64 [ 0, %bb4 ], [ %i77, %bb76 ]
  %i10 = mul nuw nsw i64 %i9, 52900
  %i11 = mul nuw nsw i64 %i9, 49
  br label %bb12, !dbg !12

bb12:                                             ; preds = %bb12, %.preheader
  %i13 = phi float [ %i8, %.preheader ], [ %i73, %bb12 ]
  %i14 = phi i64 [ 0, %.preheader ], [ %i74, %bb12 ]
  %i15 = mul nuw nsw i64 %i14, 230, !dbg !13
  %i16 = add nuw nsw i64 %i15, %i10, !dbg !14
  %i17 = add nuw nsw i64 %i16, %i7, !dbg !15
  %i18 = getelementptr float, ptr %arg1, i64 %i17, !dbg !16
  %i19 = load float, ptr %i18, align 4, !dbg !17
  %i20 = mul nuw nsw i64 %i14, 7, !dbg !18
  %i21 = add nuw nsw i64 %i20, %i11, !dbg !19
  %i22 = getelementptr float, ptr %arg2, i64 %i21, !dbg !20
  %i23 = load float, ptr %i22, align 4, !dbg !21
  %i24 = fmul float %i19, %i23, !dbg !22
  %i25 = fadd float %i13, %i24, !dbg !23
  %i26 = or i64 %i17, 1, !dbg !24
  %i27 = getelementptr float, ptr %arg1, i64 %i26, !dbg !25
  %i28 = load float, ptr %i27, align 4, !dbg !26
  %i29 = add nuw nsw i64 %i21, 1, !dbg !27
  %i30 = getelementptr float, ptr %arg2, i64 %i29, !dbg !28
  %i31 = load float, ptr %i30, align 4, !dbg !29
  %i32 = fmul float %i28, %i31, !dbg !30
  %i33 = fadd float %i25, %i32, !dbg !31
  %i34 = add nuw nsw i64 %i17, 2, !dbg !32
  %i35 = getelementptr float, ptr %arg1, i64 %i34, !dbg !33
  %i36 = load float, ptr %i35, align 4, !dbg !34
  %i37 = add nuw nsw i64 %i21, 2, !dbg !35
  %i38 = getelementptr float, ptr %arg2, i64 %i37, !dbg !36
  %i39 = load float, ptr %i38, align 4, !dbg !37
  %i40 = fmul float %i36, %i39, !dbg !38
  %i41 = fadd float %i33, %i40, !dbg !39
  %i42 = add nuw nsw i64 %i17, 3, !dbg !40
  %i43 = getelementptr float, ptr %arg1, i64 %i42, !dbg !41
  %i44 = load float, ptr %i43, align 4, !dbg !42
  %i45 = add nuw nsw i64 %i21, 3, !dbg !43
  %i46 = getelementptr float, ptr %arg2, i64 %i45, !dbg !44
  %i47 = load float, ptr %i46, align 4, !dbg !45
  %i48 = fmul float %i44, %i47, !dbg !46
  %i49 = fadd float %i41, %i48, !dbg !47
  %i50 = add nuw nsw i64 %i17, 4, !dbg !48
  %i51 = getelementptr float, ptr %arg1, i64 %i50, !dbg !49
  %i52 = load float, ptr %i51, align 4, !dbg !50
  %i53 = add nuw nsw i64 %i21, 4, !dbg !51
  %i54 = getelementptr float, ptr %arg2, i64 %i53, !dbg !52
  %i55 = load float, ptr %i54, align 4, !dbg !53
  %i56 = fmul float %i52, %i55, !dbg !54
  %i57 = fadd float %i49, %i56, !dbg !55
  %i58 = add nuw nsw i64 %i17, 5, !dbg !56
  %i59 = getelementptr float, ptr %arg1, i64 %i58, !dbg !57
  %i60 = load float, ptr %i59, align 4, !dbg !58
  %i61 = add nuw nsw i64 %i21, 5, !dbg !59
  %i62 = getelementptr float, ptr %arg2, i64 %i61, !dbg !60
  %i63 = load float, ptr %i62, align 4, !dbg !61
  %i64 = fmul float %i60, %i63, !dbg !62
  %i65 = fadd float %i57, %i64, !dbg !63
  %i66 = add nuw nsw i64 %i17, 6, !dbg !64
  %i67 = getelementptr float, ptr %arg1, i64 %i66, !dbg !65
  %i68 = load float, ptr %i67, align 4, !dbg !66
  %i69 = add nuw nsw i64 %i21, 6, !dbg !67
  %i70 = getelementptr float, ptr %arg2, i64 %i69, !dbg !68
  %i71 = load float, ptr %i70, align 4, !dbg !69
  %i72 = fmul float %i68, %i71, !dbg !70
  %i73 = fadd float %i65, %i72, !dbg !71
  %i74 = add nuw nsw i64 %i14, 1, !dbg !72
  %i75 = icmp ult i64 %i14, 6, !dbg !73
  br i1 %i75, label %bb12, label %bb76, !dbg !12

bb76:                                             ; preds = %bb12
  %.lcssa = phi float [ %i73, %bb12 ], !dbg !71
  %i77 = add nuw nsw i64 %i9, 1, !dbg !74
  %i78 = icmp ult i64 %i9, 2, !dbg !75
  br i1 %i78, label %.preheader, label %bb79, !dbg !11

bb79:                                             ; preds = %bb76
  %.lcssa.lcssa = phi float [ %.lcssa, %bb76 ], !dbg !71
  %i80 = getelementptr float, ptr %arg3, i64 %i, !dbg !76
  store float %.lcssa.lcssa, ptr %i80, align 4, !dbg !77
  %i81 = add nuw nsw i64 %i, 1, !dbg !78
  %i82 = icmp ult i64 %i, 7, !dbg !79
  br i1 %i82, label %bb4, label %bb83, !dbg !7

bb83:                                             ; preds = %bb79
  ret void, !dbg !80
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
!17 = !DILocation(line: 53, column: 11, scope: !8)
!18 = !DILocation(line: 57, column: 11, scope: !8)
!19 = !DILocation(line: 58, column: 11, scope: !8)
!20 = !DILocation(line: 60, column: 11, scope: !8)
!21 = !DILocation(line: 61, column: 11, scope: !8)
!22 = !DILocation(line: 62, column: 11, scope: !8)
!23 = !DILocation(line: 63, column: 11, scope: !8)
!24 = !DILocation(line: 71, column: 11, scope: !8)
!25 = !DILocation(line: 72, column: 11, scope: !8)
!26 = !DILocation(line: 73, column: 11, scope: !8)
!27 = !DILocation(line: 79, column: 11, scope: !8)
!28 = !DILocation(line: 80, column: 11, scope: !8)
!29 = !DILocation(line: 81, column: 11, scope: !8)
!30 = !DILocation(line: 82, column: 11, scope: !8)
!31 = !DILocation(line: 83, column: 11, scope: !8)
!32 = !DILocation(line: 91, column: 11, scope: !8)
!33 = !DILocation(line: 92, column: 11, scope: !8)
!34 = !DILocation(line: 93, column: 11, scope: !8)
!35 = !DILocation(line: 99, column: 11, scope: !8)
!36 = !DILocation(line: 100, column: 11, scope: !8)
!37 = !DILocation(line: 101, column: 11, scope: !8)
!38 = !DILocation(line: 102, column: 11, scope: !8)
!39 = !DILocation(line: 103, column: 11, scope: !8)
!40 = !DILocation(line: 111, column: 11, scope: !8)
!41 = !DILocation(line: 112, column: 12, scope: !8)
!42 = !DILocation(line: 113, column: 12, scope: !8)
!43 = !DILocation(line: 119, column: 12, scope: !8)
!44 = !DILocation(line: 120, column: 12, scope: !8)
!45 = !DILocation(line: 121, column: 12, scope: !8)
!46 = !DILocation(line: 122, column: 12, scope: !8)
!47 = !DILocation(line: 123, column: 12, scope: !8)
!48 = !DILocation(line: 131, column: 12, scope: !8)
!49 = !DILocation(line: 132, column: 12, scope: !8)
!50 = !DILocation(line: 133, column: 12, scope: !8)
!51 = !DILocation(line: 139, column: 12, scope: !8)
!52 = !DILocation(line: 140, column: 12, scope: !8)
!53 = !DILocation(line: 141, column: 12, scope: !8)
!54 = !DILocation(line: 142, column: 12, scope: !8)
!55 = !DILocation(line: 143, column: 12, scope: !8)
!56 = !DILocation(line: 151, column: 12, scope: !8)
!57 = !DILocation(line: 152, column: 12, scope: !8)
!58 = !DILocation(line: 153, column: 12, scope: !8)
!59 = !DILocation(line: 159, column: 12, scope: !8)
!60 = !DILocation(line: 160, column: 12, scope: !8)
!61 = !DILocation(line: 161, column: 12, scope: !8)
!62 = !DILocation(line: 162, column: 12, scope: !8)
!63 = !DILocation(line: 163, column: 12, scope: !8)
!64 = !DILocation(line: 171, column: 12, scope: !8)
!65 = !DILocation(line: 172, column: 12, scope: !8)
!66 = !DILocation(line: 173, column: 12, scope: !8)
!67 = !DILocation(line: 179, column: 12, scope: !8)
!68 = !DILocation(line: 180, column: 12, scope: !8)
!69 = !DILocation(line: 181, column: 12, scope: !8)
!70 = !DILocation(line: 182, column: 12, scope: !8)
!71 = !DILocation(line: 183, column: 12, scope: !8)
!72 = !DILocation(line: 184, column: 12, scope: !8)
!73 = !DILocation(line: 42, column: 11, scope: !8)
!74 = !DILocation(line: 187, column: 12, scope: !8)
!75 = !DILocation(line: 37, column: 11, scope: !8)
!76 = !DILocation(line: 196, column: 12, scope: !8)
!77 = !DILocation(line: 197, column: 5, scope: !8)
!78 = !DILocation(line: 198, column: 12, scope: !8)
!79 = !DILocation(line: 24, column: 11, scope: !8)
!80 = !DILocation(line: 201, column: 5, scope: !8)

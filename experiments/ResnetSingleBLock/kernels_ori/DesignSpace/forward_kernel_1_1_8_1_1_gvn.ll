; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_1_1_8_1_1_opt.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_1(ptr nocapture readonly %arg, ptr nocapture readonly %arg1, ptr nocapture readonly %arg2, ptr nocapture readonly %arg3, ptr nocapture readonly %arg4, ptr nocapture writeonly %arg5) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %bb6, !dbg !7

bb6:                                              ; preds = %bb97, %bb
  %i = phi i64 [ 0, %bb ], [ %i98, %bb97 ]
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
  %i23 = phi i64 [ 0, %bb6 ], [ %i95, %bb22 ]
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
  %i59 = or i64 %i23, 4, !dbg !53
  %i60 = add nuw nsw i64 %i59, %i11, !dbg !54
  %i61 = getelementptr float, ptr %arg4, i64 %i60, !dbg !55
  %i62 = load float, ptr %i61, align 4, !dbg !56
  %i63 = fsub float %i62, %i9, !dbg !57
  %i64 = fmul float %i21, %i63, !dbg !58
  %i65 = fmul float %i7, %i64, !dbg !59
  %i66 = fadd float %i8, %i65, !dbg !60
  %i67 = getelementptr float, ptr %arg5, i64 %i60, !dbg !61
  store float %i66, ptr %i67, align 4, !dbg !62
  %i68 = or i64 %i23, 5, !dbg !63
  %i69 = add nuw nsw i64 %i68, %i11, !dbg !64
  %i70 = getelementptr float, ptr %arg4, i64 %i69, !dbg !65
  %i71 = load float, ptr %i70, align 4, !dbg !66
  %i72 = fsub float %i71, %i9, !dbg !67
  %i73 = fmul float %i21, %i72, !dbg !68
  %i74 = fmul float %i7, %i73, !dbg !69
  %i75 = fadd float %i8, %i74, !dbg !70
  %i76 = getelementptr float, ptr %arg5, i64 %i69, !dbg !71
  store float %i75, ptr %i76, align 4, !dbg !72
  %i77 = or i64 %i23, 6, !dbg !73
  %i78 = add nuw nsw i64 %i77, %i11, !dbg !74
  %i79 = getelementptr float, ptr %arg4, i64 %i78, !dbg !75
  %i80 = load float, ptr %i79, align 4, !dbg !76
  %i81 = fsub float %i80, %i9, !dbg !77
  %i82 = fmul float %i21, %i81, !dbg !78
  %i83 = fmul float %i7, %i82, !dbg !79
  %i84 = fadd float %i8, %i83, !dbg !80
  %i85 = getelementptr float, ptr %arg5, i64 %i78, !dbg !81
  store float %i84, ptr %i85, align 4, !dbg !82
  %i86 = or i64 %i23, 7, !dbg !83
  %i87 = add nuw nsw i64 %i86, %i11, !dbg !84
  %i88 = getelementptr float, ptr %arg4, i64 %i87, !dbg !85
  %i89 = load float, ptr %i88, align 4, !dbg !86
  %i90 = fsub float %i89, %i9, !dbg !87
  %i91 = fmul float %i21, %i90, !dbg !88
  %i92 = fmul float %i7, %i91, !dbg !89
  %i93 = fadd float %i8, %i92, !dbg !90
  %i94 = getelementptr float, ptr %arg5, i64 %i87, !dbg !91
  store float %i93, ptr %i94, align 4, !dbg !92
  %i95 = add nuw nsw i64 %i23, 8, !dbg !93
  %i96 = icmp ult i64 %i23, 104, !dbg !94
  br i1 %i96, label %bb22, label %bb97, !dbg !13

bb97:                                             ; preds = %bb22
  %i98 = add nuw nsw i64 %i, 1, !dbg !95
  %i99 = icmp ult i64 %i, 15, !dbg !96
  br i1 %i99, label %bb6, label %bb100, !dbg !7

bb100:                                            ; preds = %bb97
  ret void, !dbg !97
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_1", linkageName: "forward_kernel_1", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_1_1_8_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 26, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 28, column: 11, scope: !8)
!10 = !DILocation(line: 29, column: 11, scope: !8)
!11 = !DILocation(line: 30, column: 11, scope: !8)
!12 = !DILocation(line: 31, column: 11, scope: !8)
!13 = !DILocation(line: 35, column: 5, scope: !8)
!14 = !DILocation(line: 42, column: 11, scope: !8)
!15 = !DILocation(line: 43, column: 11, scope: !8)
!16 = !DILocation(line: 44, column: 11, scope: !8)
!17 = !DILocation(line: 56, column: 11, scope: !8)
!18 = !DILocation(line: 57, column: 11, scope: !8)
!19 = !DILocation(line: 58, column: 11, scope: !8)
!20 = !DILocation(line: 59, column: 11, scope: !8)
!21 = !DILocation(line: 66, column: 11, scope: !8)
!22 = !DILocation(line: 67, column: 5, scope: !8)
!23 = !DILocation(line: 68, column: 11, scope: !8)
!24 = !DILocation(line: 74, column: 11, scope: !8)
!25 = !DILocation(line: 75, column: 11, scope: !8)
!26 = !DILocation(line: 76, column: 11, scope: !8)
!27 = !DILocation(line: 88, column: 11, scope: !8)
!28 = !DILocation(line: 89, column: 11, scope: !8)
!29 = !DILocation(line: 90, column: 11, scope: !8)
!30 = !DILocation(line: 91, column: 11, scope: !8)
!31 = !DILocation(line: 98, column: 11, scope: !8)
!32 = !DILocation(line: 99, column: 5, scope: !8)
!33 = !DILocation(line: 100, column: 11, scope: !8)
!34 = !DILocation(line: 106, column: 11, scope: !8)
!35 = !DILocation(line: 107, column: 11, scope: !8)
!36 = !DILocation(line: 108, column: 11, scope: !8)
!37 = !DILocation(line: 120, column: 12, scope: !8)
!38 = !DILocation(line: 121, column: 12, scope: !8)
!39 = !DILocation(line: 122, column: 12, scope: !8)
!40 = !DILocation(line: 123, column: 12, scope: !8)
!41 = !DILocation(line: 130, column: 12, scope: !8)
!42 = !DILocation(line: 131, column: 5, scope: !8)
!43 = !DILocation(line: 132, column: 12, scope: !8)
!44 = !DILocation(line: 138, column: 12, scope: !8)
!45 = !DILocation(line: 139, column: 12, scope: !8)
!46 = !DILocation(line: 140, column: 12, scope: !8)
!47 = !DILocation(line: 152, column: 12, scope: !8)
!48 = !DILocation(line: 153, column: 12, scope: !8)
!49 = !DILocation(line: 154, column: 12, scope: !8)
!50 = !DILocation(line: 155, column: 12, scope: !8)
!51 = !DILocation(line: 162, column: 12, scope: !8)
!52 = !DILocation(line: 163, column: 5, scope: !8)
!53 = !DILocation(line: 164, column: 12, scope: !8)
!54 = !DILocation(line: 170, column: 12, scope: !8)
!55 = !DILocation(line: 171, column: 12, scope: !8)
!56 = !DILocation(line: 172, column: 12, scope: !8)
!57 = !DILocation(line: 184, column: 12, scope: !8)
!58 = !DILocation(line: 185, column: 12, scope: !8)
!59 = !DILocation(line: 186, column: 12, scope: !8)
!60 = !DILocation(line: 187, column: 12, scope: !8)
!61 = !DILocation(line: 194, column: 12, scope: !8)
!62 = !DILocation(line: 195, column: 5, scope: !8)
!63 = !DILocation(line: 196, column: 12, scope: !8)
!64 = !DILocation(line: 202, column: 12, scope: !8)
!65 = !DILocation(line: 203, column: 12, scope: !8)
!66 = !DILocation(line: 204, column: 12, scope: !8)
!67 = !DILocation(line: 216, column: 12, scope: !8)
!68 = !DILocation(line: 217, column: 12, scope: !8)
!69 = !DILocation(line: 218, column: 12, scope: !8)
!70 = !DILocation(line: 219, column: 12, scope: !8)
!71 = !DILocation(line: 226, column: 12, scope: !8)
!72 = !DILocation(line: 227, column: 5, scope: !8)
!73 = !DILocation(line: 228, column: 12, scope: !8)
!74 = !DILocation(line: 234, column: 12, scope: !8)
!75 = !DILocation(line: 235, column: 12, scope: !8)
!76 = !DILocation(line: 236, column: 12, scope: !8)
!77 = !DILocation(line: 248, column: 12, scope: !8)
!78 = !DILocation(line: 249, column: 12, scope: !8)
!79 = !DILocation(line: 250, column: 12, scope: !8)
!80 = !DILocation(line: 251, column: 12, scope: !8)
!81 = !DILocation(line: 258, column: 12, scope: !8)
!82 = !DILocation(line: 259, column: 5, scope: !8)
!83 = !DILocation(line: 260, column: 12, scope: !8)
!84 = !DILocation(line: 266, column: 12, scope: !8)
!85 = !DILocation(line: 267, column: 12, scope: !8)
!86 = !DILocation(line: 268, column: 12, scope: !8)
!87 = !DILocation(line: 280, column: 12, scope: !8)
!88 = !DILocation(line: 281, column: 12, scope: !8)
!89 = !DILocation(line: 282, column: 12, scope: !8)
!90 = !DILocation(line: 283, column: 12, scope: !8)
!91 = !DILocation(line: 290, column: 12, scope: !8)
!92 = !DILocation(line: 291, column: 5, scope: !8)
!93 = !DILocation(line: 292, column: 12, scope: !8)
!94 = !DILocation(line: 34, column: 11, scope: !8)
!95 = !DILocation(line: 295, column: 12, scope: !8)
!96 = !DILocation(line: 25, column: 11, scope: !8)
!97 = !DILocation(line: 298, column: 5, scope: !8)

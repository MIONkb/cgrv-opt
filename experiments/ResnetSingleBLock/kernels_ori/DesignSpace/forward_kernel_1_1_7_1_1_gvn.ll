; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_1_1_7_1_1_opt.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_1(ptr nocapture readonly %arg, ptr nocapture readonly %arg1, ptr nocapture readonly %arg2, ptr nocapture readonly %arg3, ptr nocapture readonly %arg4, ptr nocapture writeonly %arg5) local_unnamed_addr #0 !dbg !3 {
bb:
  br label %bb6, !dbg !7

bb6:                                              ; preds = %bb82, %bb
  %i = phi i64 [ 0, %bb ], [ %i83, %bb82 ]
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
  %i23 = phi i64 [ 0, %bb6 ], [ %i80, %bb22 ]
  %i24 = add nuw nsw i64 %i23, %i11, !dbg !14
  %i25 = getelementptr float, ptr %arg4, i64 %i24, !dbg !15
  %i26 = load float, ptr %i25, align 4, !dbg !16
  %i27 = fsub float %i26, %i9, !dbg !17
  %i28 = fmul float %i21, %i27, !dbg !18
  %i29 = fmul float %i7, %i28, !dbg !19
  %i30 = fadd float %i8, %i29, !dbg !20
  %i31 = getelementptr float, ptr %arg5, i64 %i24, !dbg !21
  store float %i30, ptr %i31, align 4, !dbg !22
  %i32 = add nuw nsw i64 %i24, 1, !dbg !23
  %i33 = getelementptr float, ptr %arg4, i64 %i32, !dbg !24
  %i34 = load float, ptr %i33, align 4, !dbg !25
  %i35 = fsub float %i34, %i9, !dbg !26
  %i36 = fmul float %i21, %i35, !dbg !27
  %i37 = fmul float %i7, %i36, !dbg !28
  %i38 = fadd float %i8, %i37, !dbg !29
  %i39 = getelementptr float, ptr %arg5, i64 %i32, !dbg !30
  store float %i38, ptr %i39, align 4, !dbg !31
  %i40 = add nuw nsw i64 %i24, 2, !dbg !32
  %i41 = getelementptr float, ptr %arg4, i64 %i40, !dbg !33
  %i42 = load float, ptr %i41, align 4, !dbg !34
  %i43 = fsub float %i42, %i9, !dbg !35
  %i44 = fmul float %i21, %i43, !dbg !36
  %i45 = fmul float %i7, %i44, !dbg !37
  %i46 = fadd float %i8, %i45, !dbg !38
  %i47 = getelementptr float, ptr %arg5, i64 %i40, !dbg !39
  store float %i46, ptr %i47, align 4, !dbg !40
  %i48 = add nuw nsw i64 %i24, 3, !dbg !41
  %i49 = getelementptr float, ptr %arg4, i64 %i48, !dbg !42
  %i50 = load float, ptr %i49, align 4, !dbg !43
  %i51 = fsub float %i50, %i9, !dbg !44
  %i52 = fmul float %i21, %i51, !dbg !45
  %i53 = fmul float %i7, %i52, !dbg !46
  %i54 = fadd float %i8, %i53, !dbg !47
  %i55 = getelementptr float, ptr %arg5, i64 %i48, !dbg !48
  store float %i54, ptr %i55, align 4, !dbg !49
  %i56 = add nuw nsw i64 %i24, 4, !dbg !50
  %i57 = getelementptr float, ptr %arg4, i64 %i56, !dbg !51
  %i58 = load float, ptr %i57, align 4, !dbg !52
  %i59 = fsub float %i58, %i9, !dbg !53
  %i60 = fmul float %i21, %i59, !dbg !54
  %i61 = fmul float %i7, %i60, !dbg !55
  %i62 = fadd float %i8, %i61, !dbg !56
  %i63 = getelementptr float, ptr %arg5, i64 %i56, !dbg !57
  store float %i62, ptr %i63, align 4, !dbg !58
  %i64 = add nuw nsw i64 %i24, 5, !dbg !59
  %i65 = getelementptr float, ptr %arg4, i64 %i64, !dbg !60
  %i66 = load float, ptr %i65, align 4, !dbg !61
  %i67 = fsub float %i66, %i9, !dbg !62
  %i68 = fmul float %i21, %i67, !dbg !63
  %i69 = fmul float %i7, %i68, !dbg !64
  %i70 = fadd float %i8, %i69, !dbg !65
  %i71 = getelementptr float, ptr %arg5, i64 %i64, !dbg !66
  store float %i70, ptr %i71, align 4, !dbg !67
  %i72 = add nuw nsw i64 %i24, 6, !dbg !68
  %i73 = getelementptr float, ptr %arg4, i64 %i72, !dbg !69
  %i74 = load float, ptr %i73, align 4, !dbg !70
  %i75 = fsub float %i74, %i9, !dbg !71
  %i76 = fmul float %i21, %i75, !dbg !72
  %i77 = fmul float %i7, %i76, !dbg !73
  %i78 = fadd float %i8, %i77, !dbg !74
  %i79 = getelementptr float, ptr %arg5, i64 %i72, !dbg !75
  store float %i78, ptr %i79, align 4, !dbg !76
  %i80 = add nuw nsw i64 %i23, 7, !dbg !77
  %i81 = icmp ult i64 %i23, 105, !dbg !78
  br i1 %i81, label %bb22, label %bb82, !dbg !13

bb82:                                             ; preds = %bb22
  %i83 = add nuw nsw i64 %i, 1, !dbg !79
  %i84 = icmp ult i64 %i, 15, !dbg !80
  br i1 %i84, label %bb6, label %bb85, !dbg !7

bb85:                                             ; preds = %bb82
  ret void, !dbg !81
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_1", linkageName: "forward_kernel_1", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_1_1_7_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 25, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 27, column: 11, scope: !8)
!10 = !DILocation(line: 28, column: 11, scope: !8)
!11 = !DILocation(line: 29, column: 11, scope: !8)
!12 = !DILocation(line: 30, column: 11, scope: !8)
!13 = !DILocation(line: 34, column: 5, scope: !8)
!14 = !DILocation(line: 41, column: 11, scope: !8)
!15 = !DILocation(line: 42, column: 11, scope: !8)
!16 = !DILocation(line: 43, column: 11, scope: !8)
!17 = !DILocation(line: 55, column: 11, scope: !8)
!18 = !DILocation(line: 56, column: 11, scope: !8)
!19 = !DILocation(line: 57, column: 11, scope: !8)
!20 = !DILocation(line: 58, column: 11, scope: !8)
!21 = !DILocation(line: 65, column: 11, scope: !8)
!22 = !DILocation(line: 66, column: 5, scope: !8)
!23 = !DILocation(line: 73, column: 11, scope: !8)
!24 = !DILocation(line: 74, column: 11, scope: !8)
!25 = !DILocation(line: 75, column: 11, scope: !8)
!26 = !DILocation(line: 87, column: 11, scope: !8)
!27 = !DILocation(line: 88, column: 11, scope: !8)
!28 = !DILocation(line: 89, column: 11, scope: !8)
!29 = !DILocation(line: 90, column: 11, scope: !8)
!30 = !DILocation(line: 97, column: 11, scope: !8)
!31 = !DILocation(line: 98, column: 5, scope: !8)
!32 = !DILocation(line: 105, column: 11, scope: !8)
!33 = !DILocation(line: 106, column: 11, scope: !8)
!34 = !DILocation(line: 107, column: 11, scope: !8)
!35 = !DILocation(line: 119, column: 12, scope: !8)
!36 = !DILocation(line: 120, column: 12, scope: !8)
!37 = !DILocation(line: 121, column: 12, scope: !8)
!38 = !DILocation(line: 122, column: 12, scope: !8)
!39 = !DILocation(line: 129, column: 12, scope: !8)
!40 = !DILocation(line: 130, column: 5, scope: !8)
!41 = !DILocation(line: 137, column: 12, scope: !8)
!42 = !DILocation(line: 138, column: 12, scope: !8)
!43 = !DILocation(line: 139, column: 12, scope: !8)
!44 = !DILocation(line: 151, column: 12, scope: !8)
!45 = !DILocation(line: 152, column: 12, scope: !8)
!46 = !DILocation(line: 153, column: 12, scope: !8)
!47 = !DILocation(line: 154, column: 12, scope: !8)
!48 = !DILocation(line: 161, column: 12, scope: !8)
!49 = !DILocation(line: 162, column: 5, scope: !8)
!50 = !DILocation(line: 169, column: 12, scope: !8)
!51 = !DILocation(line: 170, column: 12, scope: !8)
!52 = !DILocation(line: 171, column: 12, scope: !8)
!53 = !DILocation(line: 183, column: 12, scope: !8)
!54 = !DILocation(line: 184, column: 12, scope: !8)
!55 = !DILocation(line: 185, column: 12, scope: !8)
!56 = !DILocation(line: 186, column: 12, scope: !8)
!57 = !DILocation(line: 193, column: 12, scope: !8)
!58 = !DILocation(line: 194, column: 5, scope: !8)
!59 = !DILocation(line: 201, column: 12, scope: !8)
!60 = !DILocation(line: 202, column: 12, scope: !8)
!61 = !DILocation(line: 203, column: 12, scope: !8)
!62 = !DILocation(line: 215, column: 12, scope: !8)
!63 = !DILocation(line: 216, column: 12, scope: !8)
!64 = !DILocation(line: 217, column: 12, scope: !8)
!65 = !DILocation(line: 218, column: 12, scope: !8)
!66 = !DILocation(line: 225, column: 12, scope: !8)
!67 = !DILocation(line: 226, column: 5, scope: !8)
!68 = !DILocation(line: 233, column: 12, scope: !8)
!69 = !DILocation(line: 234, column: 12, scope: !8)
!70 = !DILocation(line: 235, column: 12, scope: !8)
!71 = !DILocation(line: 247, column: 12, scope: !8)
!72 = !DILocation(line: 248, column: 12, scope: !8)
!73 = !DILocation(line: 249, column: 12, scope: !8)
!74 = !DILocation(line: 250, column: 12, scope: !8)
!75 = !DILocation(line: 257, column: 12, scope: !8)
!76 = !DILocation(line: 258, column: 5, scope: !8)
!77 = !DILocation(line: 259, column: 12, scope: !8)
!78 = !DILocation(line: 33, column: 11, scope: !8)
!79 = !DILocation(line: 262, column: 12, scope: !8)
!80 = !DILocation(line: 24, column: 11, scope: !8)
!81 = !DILocation(line: 265, column: 5, scope: !8)

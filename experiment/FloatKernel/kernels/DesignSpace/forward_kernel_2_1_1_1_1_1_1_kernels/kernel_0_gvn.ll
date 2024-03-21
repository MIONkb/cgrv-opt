; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/FloatKernel/kernels/DesignSpace/forward_kernel_2_1_1_1_1_1_1_kernels/kernel_0.ll'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @kernel_0(ptr %arg, ptr %arg1, ptr %arg2) !dbg !3 {
bb:
  %i = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %arg, 0, !dbg !7
  %i3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i, ptr %arg, 1, !dbg !9
  %i4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i3, i64 0, 2, !dbg !10
  %i5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i4, i64 2, 3, 0, !dbg !11
  %i6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i5, i64 3, 4, 0, !dbg !12
  %i7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %arg1, 0, !dbg !13
  %i8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i7, ptr %arg1, 1, !dbg !14
  %i9 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i8, i64 0, 2, !dbg !15
  %i10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i9, i64 2, 3, 0, !dbg !16
  %i11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i10, i64 3, 4, 0, !dbg !17
  %i12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %arg2, 0, !dbg !18
  %i13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i12, ptr %arg2, 1, !dbg !19
  %i14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i13, i64 0, 2, !dbg !20
  %i15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i14, i64 3, 3, 0, !dbg !21
  %i16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i15, i64 3, 4, 0, !dbg !22
  br label %bb17, !dbg !23

bb17:                                             ; preds = %bb, %bb42
  %i18 = phi i64 [ 0, %bb ], [ %i43, %bb42 ]
  %i19 = mul nuw nsw i64 %i18, 3
  br label %bb20, !dbg !24

bb20:                                             ; preds = %bb17, %bb39
  %i21 = phi i64 [ 0, %bb17 ], [ %i40, %bb39 ]
  %i22 = add nuw nsw i64 %i19, %i21, !dbg !25
  %i23 = getelementptr float, ptr %arg, i64 %i22, !dbg !26
  %i24 = load float, ptr %i23, align 4, !dbg !27
  br label %bb25, !dbg !28

bb25:                                             ; preds = %bb20, %bb25
  %i26 = phi float [ %i24, %bb20 ], [ %i36, %bb25 ]
  %i27 = phi i64 [ 0, %bb20 ], [ %i37, %bb25 ]
  %i28 = add nuw nsw i64 %i19, %i27, !dbg !29
  %i29 = getelementptr float, ptr %arg1, i64 %i28, !dbg !30
  %i30 = load float, ptr %i29, align 4, !dbg !31
  %i31 = mul nuw nsw i64 %i27, 3, !dbg !32
  %i32 = add nuw nsw i64 %i31, %i21, !dbg !33
  %i33 = getelementptr float, ptr %arg2, i64 %i32, !dbg !34
  %i34 = load float, ptr %i33, align 4, !dbg !35
  %i35 = fmul float %i30, %i34, !dbg !36
  %i36 = fadd float %i26, %i35, !dbg !37
  %i37 = add nuw nsw i64 %i27, 1, !dbg !38
  %i38 = icmp ult i64 %i37, 3, !dbg !39
  br i1 %i38, label %bb25, label %bb39, !dbg !28

bb39:                                             ; preds = %bb25
  %.lcssa = phi float [ %i36, %bb25 ], !dbg !37
  store float %.lcssa, ptr %i23, align 4, !dbg !40
  %i40 = add nuw nsw i64 %i21, 1, !dbg !41
  %i41 = icmp ult i64 %i40, 3, !dbg !42
  br i1 %i41, label %bb20, label %bb42, !dbg !24

bb42:                                             ; preds = %bb39
  %i43 = add nuw nsw i64 %i18, 1, !dbg !43
  %i44 = icmp ult i64 %i43, 2, !dbg !44
  br i1 %i44, label %bb17, label %bb45, !dbg !23

bb45:                                             ; preds = %bb42
  %i46 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i6, i64 3, 3, 1, !dbg !45
  %i47 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i11, i64 3, 3, 1, !dbg !46
  %i48 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i16, i64 3, 3, 1, !dbg !47
  %i49 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i46, i64 1, 4, 1, !dbg !48
  %i50 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i47, i64 1, 4, 1, !dbg !49
  %i51 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i48, i64 1, 4, 1, !dbg !50
  ret void, !dbg !51
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "kernel_0", linkageName: "kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "kernel_0_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/FloatKernel/kernels/DesignSpace/forward_kernel_2_1_1_1_1_1_1_kernels")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 4, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 5, column: 10, scope: !8)
!10 = !DILocation(line: 7, column: 10, scope: !8)
!11 = !DILocation(line: 9, column: 10, scope: !8)
!12 = !DILocation(line: 11, column: 10, scope: !8)
!13 = !DILocation(line: 17, column: 11, scope: !8)
!14 = !DILocation(line: 18, column: 11, scope: !8)
!15 = !DILocation(line: 20, column: 11, scope: !8)
!16 = !DILocation(line: 22, column: 11, scope: !8)
!17 = !DILocation(line: 24, column: 11, scope: !8)
!18 = !DILocation(line: 30, column: 11, scope: !8)
!19 = !DILocation(line: 31, column: 11, scope: !8)
!20 = !DILocation(line: 33, column: 11, scope: !8)
!21 = !DILocation(line: 35, column: 11, scope: !8)
!22 = !DILocation(line: 37, column: 11, scope: !8)
!23 = !DILocation(line: 51, column: 5, scope: !8)
!24 = !DILocation(line: 56, column: 5, scope: !8)
!25 = !DILocation(line: 61, column: 11, scope: !8)
!26 = !DILocation(line: 62, column: 11, scope: !8)
!27 = !DILocation(line: 63, column: 11, scope: !8)
!28 = !DILocation(line: 67, column: 5, scope: !8)
!29 = !DILocation(line: 72, column: 11, scope: !8)
!30 = !DILocation(line: 73, column: 11, scope: !8)
!31 = !DILocation(line: 74, column: 11, scope: !8)
!32 = !DILocation(line: 77, column: 11, scope: !8)
!33 = !DILocation(line: 78, column: 11, scope: !8)
!34 = !DILocation(line: 79, column: 11, scope: !8)
!35 = !DILocation(line: 80, column: 11, scope: !8)
!36 = !DILocation(line: 81, column: 11, scope: !8)
!37 = !DILocation(line: 82, column: 11, scope: !8)
!38 = !DILocation(line: 83, column: 11, scope: !8)
!39 = !DILocation(line: 66, column: 11, scope: !8)
!40 = !DILocation(line: 91, column: 5, scope: !8)
!41 = !DILocation(line: 92, column: 11, scope: !8)
!42 = !DILocation(line: 55, column: 11, scope: !8)
!43 = !DILocation(line: 95, column: 11, scope: !8)
!44 = !DILocation(line: 50, column: 11, scope: !8)
!45 = !DILocation(line: 13, column: 11, scope: !8)
!46 = !DILocation(line: 26, column: 11, scope: !8)
!47 = !DILocation(line: 39, column: 11, scope: !8)
!48 = !DILocation(line: 15, column: 11, scope: !8)
!49 = !DILocation(line: 28, column: 11, scope: !8)
!50 = !DILocation(line: 41, column: 11, scope: !8)
!51 = !DILocation(line: 98, column: 5, scope: !8)

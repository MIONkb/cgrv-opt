; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/FloatKernel/kernels/DesignSpace/forward_kernel_2_1_3_1_1_1_1_kernels/kernel_0_gvn.ll'
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

bb17:                                             ; preds = %bb49, %bb
  %i18 = phi i64 [ 0, %bb ], [ %i50, %bb49 ]
  %i19 = mul nuw nsw i64 %i18, 3
  %i20 = getelementptr float, ptr %arg1, i64 %i19
  %i21 = add nuw nsw i64 %i19, 1
  %i22 = getelementptr float, ptr %arg1, i64 %i21
  %i23 = add nuw nsw i64 %i19, 2
  %i24 = getelementptr float, ptr %arg1, i64 %i23
  br label %bb25, !dbg !24

bb25:                                             ; preds = %bb25, %bb17
  %i26 = phi i64 [ 0, %bb17 ], [ %i47, %bb25 ]
  %i27 = add nuw nsw i64 %i19, %i26, !dbg !25
  %i28 = getelementptr float, ptr %arg, i64 %i27, !dbg !26
  %i29 = load float, ptr %i28, align 4, !dbg !27
  %i30 = load float, ptr %i20, align 4, !dbg !28
  %i31 = getelementptr float, ptr %arg2, i64 %i26, !dbg !29
  %i32 = load float, ptr %i31, align 4, !dbg !30
  %i33 = fmul float %i30, %i32, !dbg !31
  %i34 = fadd float %i29, %i33, !dbg !32
  %i35 = load float, ptr %i22, align 4, !dbg !33
  %i36 = add nuw nsw i64 3, %i26, !dbg !34
  %i37 = getelementptr float, ptr %arg2, i64 %i36, !dbg !35
  %i38 = load float, ptr %i37, align 4, !dbg !36
  %i39 = fmul float %i35, %i38, !dbg !37
  %i40 = fadd float %i34, %i39, !dbg !38
  %i41 = load float, ptr %i24, align 4, !dbg !39
  %i42 = add nuw nsw i64 6, %i26, !dbg !40
  %i43 = getelementptr float, ptr %arg2, i64 %i42, !dbg !41
  %i44 = load float, ptr %i43, align 4, !dbg !42
  %i45 = fmul float %i41, %i44, !dbg !43
  %i46 = fadd float %i40, %i45, !dbg !44
  store float %i46, ptr %i28, align 4, !dbg !45
  %i47 = add nuw nsw i64 %i26, 1, !dbg !46
  %i48 = icmp ult i64 %i47, 3, !dbg !47
  br i1 %i48, label %bb25, label %bb49, !dbg !24

bb49:                                             ; preds = %bb25
  %i50 = add nuw nsw i64 %i18, 1, !dbg !48
  %i51 = icmp ult i64 %i50, 2, !dbg !49
  br i1 %i51, label %bb17, label %bb52, !dbg !23

bb52:                                             ; preds = %bb49
  %i53 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i6, i64 3, 3, 1, !dbg !50
  %i54 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i11, i64 3, 3, 1, !dbg !51
  %i55 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i16, i64 3, 3, 1, !dbg !52
  %i56 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i53, i64 1, 4, 1, !dbg !53
  %i57 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i54, i64 1, 4, 1, !dbg !54
  %i58 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %i55, i64 1, 4, 1, !dbg !55
  ret void, !dbg !56
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "kernel_0", linkageName: "kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "kernel_0_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/FloatKernel/kernels/DesignSpace/forward_kernel_2_1_3_1_1_1_1_kernels")
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
!28 = !DILocation(line: 69, column: 11, scope: !8)
!29 = !DILocation(line: 74, column: 11, scope: !8)
!30 = !DILocation(line: 75, column: 11, scope: !8)
!31 = !DILocation(line: 76, column: 11, scope: !8)
!32 = !DILocation(line: 77, column: 11, scope: !8)
!33 = !DILocation(line: 83, column: 11, scope: !8)
!34 = !DILocation(line: 87, column: 11, scope: !8)
!35 = !DILocation(line: 88, column: 11, scope: !8)
!36 = !DILocation(line: 89, column: 11, scope: !8)
!37 = !DILocation(line: 90, column: 11, scope: !8)
!38 = !DILocation(line: 91, column: 11, scope: !8)
!39 = !DILocation(line: 97, column: 11, scope: !8)
!40 = !DILocation(line: 101, column: 11, scope: !8)
!41 = !DILocation(line: 102, column: 11, scope: !8)
!42 = !DILocation(line: 103, column: 11, scope: !8)
!43 = !DILocation(line: 104, column: 11, scope: !8)
!44 = !DILocation(line: 105, column: 11, scope: !8)
!45 = !DILocation(line: 111, column: 5, scope: !8)
!46 = !DILocation(line: 112, column: 12, scope: !8)
!47 = !DILocation(line: 55, column: 11, scope: !8)
!48 = !DILocation(line: 115, column: 12, scope: !8)
!49 = !DILocation(line: 50, column: 11, scope: !8)
!50 = !DILocation(line: 13, column: 11, scope: !8)
!51 = !DILocation(line: 26, column: 11, scope: !8)
!52 = !DILocation(line: 39, column: 11, scope: !8)
!53 = !DILocation(line: 15, column: 11, scope: !8)
!54 = !DILocation(line: 28, column: 11, scope: !8)
!55 = !DILocation(line: 41, column: 11, scope: !8)
!56 = !DILocation(line: 118, column: 5, scope: !8)

; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_2_1_8_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_2(ptr nocapture readonly %0, ptr nocapture writeonly %1) local_unnamed_addr #0 !dbg !3 {
  br label %.preheader, !dbg !7

.preheader:                                       ; preds = %2, %56
  %3 = phi i64 [ 0, %2 ], [ %57, %56 ]
  %4 = mul nuw nsw i64 %3, 112
  br label %5, !dbg !9

5:                                                ; preds = %.preheader, %5
  %6 = phi i64 [ 0, %.preheader ], [ %54, %5 ]
  %7 = add nuw nsw i64 %6, %4, !dbg !10
  %8 = getelementptr float, ptr %0, i64 %7, !dbg !11
  %9 = load float, ptr %8, align 4, !dbg !12
  %.inv = fcmp ole float %9, 0.000000e+00, !dbg !13
  %10 = select i1 %.inv, float 0.000000e+00, float %9, !dbg !13
  %11 = getelementptr float, ptr %1, i64 %7, !dbg !14
  store float %10, ptr %11, align 4, !dbg !15
  %12 = or i64 %6, 1, !dbg !16
  %13 = add nuw nsw i64 %12, %4, !dbg !17
  %14 = getelementptr float, ptr %0, i64 %13, !dbg !18
  %15 = load float, ptr %14, align 4, !dbg !19
  %.inv1 = fcmp ole float %15, 0.000000e+00, !dbg !20
  %16 = select i1 %.inv1, float 0.000000e+00, float %15, !dbg !20
  %17 = getelementptr float, ptr %1, i64 %13, !dbg !21
  store float %16, ptr %17, align 4, !dbg !22
  %18 = or i64 %6, 2, !dbg !23
  %19 = add nuw nsw i64 %18, %4, !dbg !24
  %20 = getelementptr float, ptr %0, i64 %19, !dbg !25
  %21 = load float, ptr %20, align 4, !dbg !26
  %.inv2 = fcmp ole float %21, 0.000000e+00, !dbg !27
  %22 = select i1 %.inv2, float 0.000000e+00, float %21, !dbg !27
  %23 = getelementptr float, ptr %1, i64 %19, !dbg !28
  store float %22, ptr %23, align 4, !dbg !29
  %24 = or i64 %6, 3, !dbg !30
  %25 = add nuw nsw i64 %24, %4, !dbg !31
  %26 = getelementptr float, ptr %0, i64 %25, !dbg !32
  %27 = load float, ptr %26, align 4, !dbg !33
  %.inv3 = fcmp ole float %27, 0.000000e+00, !dbg !34
  %28 = select i1 %.inv3, float 0.000000e+00, float %27, !dbg !34
  %29 = getelementptr float, ptr %1, i64 %25, !dbg !35
  store float %28, ptr %29, align 4, !dbg !36
  %30 = or i64 %6, 4, !dbg !37
  %31 = add nuw nsw i64 %30, %4, !dbg !38
  %32 = getelementptr float, ptr %0, i64 %31, !dbg !39
  %33 = load float, ptr %32, align 4, !dbg !40
  %.inv4 = fcmp ole float %33, 0.000000e+00, !dbg !41
  %34 = select i1 %.inv4, float 0.000000e+00, float %33, !dbg !41
  %35 = getelementptr float, ptr %1, i64 %31, !dbg !42
  store float %34, ptr %35, align 4, !dbg !43
  %36 = or i64 %6, 5, !dbg !44
  %37 = add nuw nsw i64 %36, %4, !dbg !45
  %38 = getelementptr float, ptr %0, i64 %37, !dbg !46
  %39 = load float, ptr %38, align 4, !dbg !47
  %.inv5 = fcmp ole float %39, 0.000000e+00, !dbg !48
  %40 = select i1 %.inv5, float 0.000000e+00, float %39, !dbg !48
  %41 = getelementptr float, ptr %1, i64 %37, !dbg !49
  store float %40, ptr %41, align 4, !dbg !50
  %42 = or i64 %6, 6, !dbg !51
  %43 = add nuw nsw i64 %42, %4, !dbg !52
  %44 = getelementptr float, ptr %0, i64 %43, !dbg !53
  %45 = load float, ptr %44, align 4, !dbg !54
  %.inv6 = fcmp ole float %45, 0.000000e+00, !dbg !55
  %46 = select i1 %.inv6, float 0.000000e+00, float %45, !dbg !55
  %47 = getelementptr float, ptr %1, i64 %43, !dbg !56
  store float %46, ptr %47, align 4, !dbg !57
  %48 = or i64 %6, 7, !dbg !58
  %49 = add nuw nsw i64 %48, %4, !dbg !59
  %50 = getelementptr float, ptr %0, i64 %49, !dbg !60
  %51 = load float, ptr %50, align 4, !dbg !61
  %.inv7 = fcmp ole float %51, 0.000000e+00, !dbg !62
  %52 = select i1 %.inv7, float 0.000000e+00, float %51, !dbg !62
  %53 = getelementptr float, ptr %1, i64 %49, !dbg !63
  store float %52, ptr %53, align 4, !dbg !64
  %54 = add nuw nsw i64 %6, 8, !dbg !65
  %55 = icmp ult i64 %6, 104, !dbg !66
  br i1 %55, label %5, label %56, !dbg !9

56:                                               ; preds = %5
  %57 = add nuw nsw i64 %3, 1, !dbg !67
  %58 = icmp ult i64 %3, 15, !dbg !68
  br i1 %58, label %.preheader, label %59, !dbg !7

59:                                               ; preds = %56
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

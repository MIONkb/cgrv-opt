; ModuleID = 'forward_kernel_0_1_7_1_1_1_1_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_0(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture readonly %2, ptr nocapture writeonly %3) local_unnamed_addr #0 !dbg !3 {
  br label %5, !dbg !7

5:                                                ; preds = %4, %66
  %6 = phi i64 [ 0, %4 ], [ %68, %66 ]
  %7 = getelementptr float, ptr %0, i64 %6, !dbg !9
  %8 = load float, ptr %7, align 4, !dbg !10
  %9 = mul nuw nsw i64 %6, 2
  br label %.preheader, !dbg !11

.preheader:                                       ; preds = %5, %63
  %10 = phi float [ %8, %5 ], [ %.lcssa, %63 ]
  %11 = phi i64 [ 0, %5 ], [ %64, %63 ]
  %12 = mul nuw nsw i64 %11, 52900
  %13 = mul nuw nsw i64 %11, 49
  br label %14, !dbg !12

14:                                               ; preds = %.preheader, %14
  %15 = phi float [ %10, %.preheader ], [ %60, %14 ]
  %16 = phi i64 [ 0, %.preheader ], [ %61, %14 ]
  %17 = mul nuw nsw i64 %16, 230, !dbg !13
  %18 = add nuw nsw i64 %17, %12, !dbg !14
  %19 = add nuw nsw i64 %18, %9, !dbg !15
  %20 = getelementptr float, ptr %1, i64 %19, !dbg !16
  %21 = load float, ptr %20, align 4, !dbg !17
  %22 = mul nuw nsw i64 %16, 7, !dbg !18
  %23 = add nuw nsw i64 %22, %13, !dbg !19
  %24 = getelementptr float, ptr %2, i64 %23, !dbg !20
  %25 = load float, ptr %24, align 4, !dbg !21
  %26 = fmul float %21, %25, !dbg !22
  %27 = fadd float %15, %26, !dbg !23
  %28 = add nuw nsw i64 %19, 1, !dbg !24
  %29 = getelementptr float, ptr %1, i64 %28, !dbg !25
  %30 = add nuw nsw i64 %23, 1, !dbg !26
  %31 = getelementptr float, ptr %2, i64 %30, !dbg !27
  %32 = load <2 x float>, ptr %29, align 4, !dbg !28
  %33 = load <2 x float>, ptr %31, align 4, !dbg !29
  %34 = fmul <2 x float> %32, %33, !dbg !30
  %35 = extractelement <2 x float> %34, i32 0, !dbg !31
  %36 = fadd float %27, %35, !dbg !31
  %37 = extractelement <2 x float> %34, i32 1, !dbg !32
  %38 = fadd float %36, %37, !dbg !32
  %39 = add nuw nsw i64 %19, 3, !dbg !33
  %40 = getelementptr float, ptr %1, i64 %39, !dbg !34
  %41 = add nuw nsw i64 %23, 3, !dbg !35
  %42 = getelementptr float, ptr %2, i64 %41, !dbg !36
  %43 = load <2 x float>, ptr %40, align 4, !dbg !37
  %44 = load <2 x float>, ptr %42, align 4, !dbg !38
  %45 = fmul <2 x float> %43, %44, !dbg !39
  %46 = extractelement <2 x float> %45, i32 0, !dbg !40
  %47 = fadd float %38, %46, !dbg !40
  %48 = extractelement <2 x float> %45, i32 1, !dbg !41
  %49 = fadd float %47, %48, !dbg !41
  %50 = add nuw nsw i64 %19, 5, !dbg !42
  %51 = getelementptr float, ptr %1, i64 %50, !dbg !43
  %52 = add nuw nsw i64 %23, 5, !dbg !44
  %53 = getelementptr float, ptr %2, i64 %52, !dbg !45
  %54 = load <2 x float>, ptr %51, align 4, !dbg !46
  %55 = load <2 x float>, ptr %53, align 4, !dbg !47
  %56 = fmul <2 x float> %54, %55, !dbg !48
  %57 = extractelement <2 x float> %56, i32 0, !dbg !49
  %58 = fadd float %49, %57, !dbg !49
  %59 = extractelement <2 x float> %56, i32 1, !dbg !50
  %60 = fadd float %58, %59, !dbg !50
  %61 = add nuw nsw i64 %16, 1, !dbg !51
  %62 = icmp ult i64 %61, 7, !dbg !52
  br i1 %62, label %14, label %63, !dbg !12

63:                                               ; preds = %14
  %.lcssa = phi float [ %60, %14 ], !dbg !50
  %64 = add nuw nsw i64 %11, 1, !dbg !53
  %65 = icmp ult i64 %64, 3, !dbg !54
  br i1 %65, label %.preheader, label %66, !dbg !11

66:                                               ; preds = %63
  %.lcssa.lcssa = phi float [ %.lcssa, %63 ], !dbg !50
  %67 = getelementptr float, ptr %3, i64 %6, !dbg !55
  store float %.lcssa.lcssa, ptr %67, align 4, !dbg !56
  %68 = add nuw nsw i64 %6, 1, !dbg !57
  %69 = icmp ult i64 %68, 8, !dbg !58
  br i1 %69, label %5, label %70, !dbg !7

70:                                               ; preds = %66
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
!17 = !DILocation(line: 53, column: 11, scope: !8)
!18 = !DILocation(line: 57, column: 11, scope: !8)
!19 = !DILocation(line: 58, column: 11, scope: !8)
!20 = !DILocation(line: 60, column: 11, scope: !8)
!21 = !DILocation(line: 61, column: 11, scope: !8)
!22 = !DILocation(line: 62, column: 11, scope: !8)
!23 = !DILocation(line: 63, column: 11, scope: !8)
!24 = !DILocation(line: 71, column: 11, scope: !8)
!25 = !DILocation(line: 72, column: 11, scope: !8)
!26 = !DILocation(line: 79, column: 11, scope: !8)
!27 = !DILocation(line: 80, column: 11, scope: !8)
!28 = !DILocation(line: 73, column: 11, scope: !8)
!29 = !DILocation(line: 81, column: 11, scope: !8)
!30 = !DILocation(line: 82, column: 11, scope: !8)
!31 = !DILocation(line: 83, column: 11, scope: !8)
!32 = !DILocation(line: 103, column: 11, scope: !8)
!33 = !DILocation(line: 111, column: 11, scope: !8)
!34 = !DILocation(line: 112, column: 12, scope: !8)
!35 = !DILocation(line: 119, column: 12, scope: !8)
!36 = !DILocation(line: 120, column: 12, scope: !8)
!37 = !DILocation(line: 113, column: 12, scope: !8)
!38 = !DILocation(line: 121, column: 12, scope: !8)
!39 = !DILocation(line: 122, column: 12, scope: !8)
!40 = !DILocation(line: 123, column: 12, scope: !8)
!41 = !DILocation(line: 143, column: 12, scope: !8)
!42 = !DILocation(line: 151, column: 12, scope: !8)
!43 = !DILocation(line: 152, column: 12, scope: !8)
!44 = !DILocation(line: 159, column: 12, scope: !8)
!45 = !DILocation(line: 160, column: 12, scope: !8)
!46 = !DILocation(line: 153, column: 12, scope: !8)
!47 = !DILocation(line: 161, column: 12, scope: !8)
!48 = !DILocation(line: 162, column: 12, scope: !8)
!49 = !DILocation(line: 163, column: 12, scope: !8)
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

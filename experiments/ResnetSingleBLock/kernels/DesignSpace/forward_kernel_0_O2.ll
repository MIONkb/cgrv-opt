; ModuleID = 'forward_kernel_0_1_7_1_1_1_1_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_0(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture readonly %2, ptr nocapture writeonly %3) local_unnamed_addr #0 !dbg !3 {
  br label %5, !dbg !7

5:                                                ; preds = %4, %66
  %6 = phi i64 [ 0, %4 ], [ %68, %66 ]
  %7 = getelementptr float, ptr %0, i64 %6, !dbg !9
  %8 = load float, ptr %7, align 4, !dbg !10
  %9 = shl nuw nsw i64 %6, 1
  br label %.preheader, !dbg !11

.preheader:                                       ; preds = %5, %63
  %10 = phi float [ %8, %5 ], [ %60, %63 ]
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
  %21 = mul nuw nsw i64 %16, 7, !dbg !17
  %22 = add nuw nsw i64 %21, %13, !dbg !18
  %23 = getelementptr float, ptr %2, i64 %22, !dbg !19
  %24 = load <2 x float>, ptr %20, align 4, !dbg !20
  %25 = load <2 x float>, ptr %23, align 4, !dbg !21
  %26 = fmul <2 x float> %24, %25, !dbg !22
  %27 = extractelement <2 x float> %26, i64 0, !dbg !23
  %28 = fadd float %15, %27, !dbg !23
  %29 = extractelement <2 x float> %26, i64 1, !dbg !24
  %30 = fadd float %28, %29, !dbg !24
  %31 = add nuw nsw i64 %19, 2, !dbg !25
  %32 = getelementptr float, ptr %1, i64 %31, !dbg !26
  %33 = add nuw nsw i64 %22, 2, !dbg !27
  %34 = getelementptr float, ptr %2, i64 %33, !dbg !28
  %35 = load <2 x float>, ptr %32, align 4, !dbg !29
  %36 = load <2 x float>, ptr %34, align 4, !dbg !30
  %37 = fmul <2 x float> %35, %36, !dbg !31
  %38 = extractelement <2 x float> %37, i64 0, !dbg !32
  %39 = fadd float %30, %38, !dbg !32
  %40 = extractelement <2 x float> %37, i64 1, !dbg !33
  %41 = fadd float %39, %40, !dbg !33
  %42 = add nuw nsw i64 %19, 4, !dbg !34
  %43 = getelementptr float, ptr %1, i64 %42, !dbg !35
  %44 = add nuw nsw i64 %22, 4, !dbg !36
  %45 = getelementptr float, ptr %2, i64 %44, !dbg !37
  %46 = load <2 x float>, ptr %43, align 4, !dbg !38
  %47 = load <2 x float>, ptr %45, align 4, !dbg !39
  %48 = fmul <2 x float> %46, %47, !dbg !40
  %49 = extractelement <2 x float> %48, i64 0, !dbg !41
  %50 = fadd float %41, %49, !dbg !41
  %51 = extractelement <2 x float> %48, i64 1, !dbg !42
  %52 = fadd float %50, %51, !dbg !42
  %53 = add nuw nsw i64 %19, 6, !dbg !43
  %54 = getelementptr float, ptr %1, i64 %53, !dbg !44
  %55 = load float, ptr %54, align 4, !dbg !45
  %56 = add nuw nsw i64 %22, 6, !dbg !46
  %57 = getelementptr float, ptr %2, i64 %56, !dbg !47
  %58 = load float, ptr %57, align 4, !dbg !48
  %59 = fmul float %55, %58, !dbg !49
  %60 = fadd float %52, %59, !dbg !50
  %61 = add nuw nsw i64 %16, 1, !dbg !51
  %62 = icmp ult i64 %16, 6, !dbg !52
  br i1 %62, label %14, label %63, !dbg !12

63:                                               ; preds = %14
  %64 = add nuw nsw i64 %11, 1, !dbg !53
  %65 = icmp ult i64 %11, 2, !dbg !54
  br i1 %65, label %.preheader, label %66, !dbg !11

66:                                               ; preds = %63
  %67 = getelementptr float, ptr %3, i64 %6, !dbg !55
  store float %60, ptr %67, align 4, !dbg !56
  %68 = add nuw nsw i64 %6, 1, !dbg !57
  %69 = icmp ult i64 %6, 7, !dbg !58
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

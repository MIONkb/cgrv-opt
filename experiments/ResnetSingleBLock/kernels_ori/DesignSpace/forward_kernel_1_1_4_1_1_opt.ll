; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_1_1_4_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_1(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture readonly %2, ptr nocapture readonly %3, ptr nocapture readonly %4, ptr nocapture writeonly %5) local_unnamed_addr #0 !dbg !3 {
  br label %7, !dbg !7

7:                                                ; preds = %6, %63
  %8 = phi i64 [ 0, %6 ], [ %64, %63 ]
  %9 = load float, ptr %0, align 4, !dbg !9
  %10 = load float, ptr %1, align 4, !dbg !10
  %11 = load float, ptr %2, align 4, !dbg !11
  %12 = load float, ptr %3, align 4, !dbg !12
  %13 = mul nuw nsw i64 %8, 112
  %14 = fadd float %12, 0x3EE4F8B580000000
  %15 = fmul float %14, 5.000000e-01
  %16 = bitcast float %14 to i32
  %17 = lshr i32 %16, 1
  %18 = sub nsw i32 1597463007, %17
  %19 = bitcast i32 %18 to float
  %20 = fmul float %19, %19
  %21 = fmul float %15, %20
  %22 = fsub float 1.500000e+00, %21
  %23 = fmul float %20, %22
  br label %24, !dbg !13

24:                                               ; preds = %7, %24
  %25 = phi i64 [ 0, %7 ], [ %61, %24 ]
  %26 = add nuw nsw i64 %25, %13, !dbg !14
  %27 = getelementptr float, ptr %4, i64 %26, !dbg !15
  %28 = load float, ptr %27, align 4, !dbg !16
  %29 = fsub float %28, %11, !dbg !17
  %30 = fmul float %23, %29, !dbg !18
  %31 = fmul float %9, %30, !dbg !19
  %32 = fadd float %10, %31, !dbg !20
  %33 = getelementptr float, ptr %5, i64 %26, !dbg !21
  store float %32, ptr %33, align 4, !dbg !22
  %34 = or i64 %25, 1, !dbg !23
  %35 = add nuw nsw i64 %34, %13, !dbg !24
  %36 = getelementptr float, ptr %4, i64 %35, !dbg !25
  %37 = load float, ptr %36, align 4, !dbg !26
  %38 = fsub float %37, %11, !dbg !27
  %39 = fmul float %23, %38, !dbg !28
  %40 = fmul float %9, %39, !dbg !29
  %41 = fadd float %10, %40, !dbg !30
  %42 = getelementptr float, ptr %5, i64 %35, !dbg !31
  store float %41, ptr %42, align 4, !dbg !32
  %43 = or i64 %25, 2, !dbg !33
  %44 = add nuw nsw i64 %43, %13, !dbg !34
  %45 = getelementptr float, ptr %4, i64 %44, !dbg !35
  %46 = load float, ptr %45, align 4, !dbg !36
  %47 = fsub float %46, %11, !dbg !37
  %48 = fmul float %23, %47, !dbg !38
  %49 = fmul float %9, %48, !dbg !39
  %50 = fadd float %10, %49, !dbg !40
  %51 = getelementptr float, ptr %5, i64 %44, !dbg !41
  store float %50, ptr %51, align 4, !dbg !42
  %52 = or i64 %25, 3, !dbg !43
  %53 = add nuw nsw i64 %52, %13, !dbg !44
  %54 = getelementptr float, ptr %4, i64 %53, !dbg !45
  %55 = load float, ptr %54, align 4, !dbg !46
  %56 = fsub float %55, %11, !dbg !47
  %57 = fmul float %23, %56, !dbg !48
  %58 = fmul float %9, %57, !dbg !49
  %59 = fadd float %10, %58, !dbg !50
  %60 = getelementptr float, ptr %5, i64 %53, !dbg !51
  store float %59, ptr %60, align 4, !dbg !52
  %61 = add nuw nsw i64 %25, 4, !dbg !53
  %62 = icmp ult i64 %25, 108, !dbg !54
  br i1 %62, label %24, label %63, !dbg !13

63:                                               ; preds = %24
  %64 = add nuw nsw i64 %8, 1, !dbg !55
  %65 = icmp ult i64 %8, 15, !dbg !56
  br i1 %65, label %7, label %66, !dbg !7

66:                                               ; preds = %63
  ret void, !dbg !57
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_1", linkageName: "forward_kernel_1", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_1_1_4_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 22, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 24, column: 11, scope: !8)
!10 = !DILocation(line: 25, column: 11, scope: !8)
!11 = !DILocation(line: 26, column: 11, scope: !8)
!12 = !DILocation(line: 27, column: 11, scope: !8)
!13 = !DILocation(line: 31, column: 5, scope: !8)
!14 = !DILocation(line: 38, column: 11, scope: !8)
!15 = !DILocation(line: 39, column: 11, scope: !8)
!16 = !DILocation(line: 40, column: 11, scope: !8)
!17 = !DILocation(line: 52, column: 11, scope: !8)
!18 = !DILocation(line: 53, column: 11, scope: !8)
!19 = !DILocation(line: 54, column: 11, scope: !8)
!20 = !DILocation(line: 55, column: 11, scope: !8)
!21 = !DILocation(line: 62, column: 11, scope: !8)
!22 = !DILocation(line: 63, column: 5, scope: !8)
!23 = !DILocation(line: 64, column: 11, scope: !8)
!24 = !DILocation(line: 70, column: 11, scope: !8)
!25 = !DILocation(line: 71, column: 11, scope: !8)
!26 = !DILocation(line: 72, column: 11, scope: !8)
!27 = !DILocation(line: 84, column: 11, scope: !8)
!28 = !DILocation(line: 85, column: 11, scope: !8)
!29 = !DILocation(line: 86, column: 11, scope: !8)
!30 = !DILocation(line: 87, column: 11, scope: !8)
!31 = !DILocation(line: 94, column: 11, scope: !8)
!32 = !DILocation(line: 95, column: 5, scope: !8)
!33 = !DILocation(line: 96, column: 11, scope: !8)
!34 = !DILocation(line: 102, column: 11, scope: !8)
!35 = !DILocation(line: 103, column: 11, scope: !8)
!36 = !DILocation(line: 104, column: 11, scope: !8)
!37 = !DILocation(line: 116, column: 12, scope: !8)
!38 = !DILocation(line: 117, column: 12, scope: !8)
!39 = !DILocation(line: 118, column: 12, scope: !8)
!40 = !DILocation(line: 119, column: 12, scope: !8)
!41 = !DILocation(line: 126, column: 12, scope: !8)
!42 = !DILocation(line: 127, column: 5, scope: !8)
!43 = !DILocation(line: 128, column: 12, scope: !8)
!44 = !DILocation(line: 134, column: 12, scope: !8)
!45 = !DILocation(line: 135, column: 12, scope: !8)
!46 = !DILocation(line: 136, column: 12, scope: !8)
!47 = !DILocation(line: 148, column: 12, scope: !8)
!48 = !DILocation(line: 149, column: 12, scope: !8)
!49 = !DILocation(line: 150, column: 12, scope: !8)
!50 = !DILocation(line: 151, column: 12, scope: !8)
!51 = !DILocation(line: 158, column: 12, scope: !8)
!52 = !DILocation(line: 159, column: 5, scope: !8)
!53 = !DILocation(line: 160, column: 12, scope: !8)
!54 = !DILocation(line: 30, column: 11, scope: !8)
!55 = !DILocation(line: 163, column: 12, scope: !8)
!56 = !DILocation(line: 21, column: 11, scope: !8)
!57 = !DILocation(line: 166, column: 5, scope: !8)

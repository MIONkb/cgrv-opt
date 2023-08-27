; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_1_1_1_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_1(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture readonly %2, ptr nocapture readonly %3, ptr nocapture readonly %4, ptr nocapture writeonly %5) local_unnamed_addr #0 !dbg !3 {
  br label %7, !dbg !7

7:                                                ; preds = %6, %36
  %8 = phi i64 [ 0, %6 ], [ %37, %36 ]
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
  %25 = phi i64 [ 0, %7 ], [ %34, %24 ]
  %26 = add nuw nsw i64 %25, %13, !dbg !14
  %27 = getelementptr float, ptr %4, i64 %26, !dbg !15
  %28 = load float, ptr %27, align 4, !dbg !16
  %29 = fsub float %28, %11, !dbg !17
  %30 = fmul float %23, %29, !dbg !18
  %31 = fmul float %9, %30, !dbg !19
  %32 = fadd float %10, %31, !dbg !20
  %33 = getelementptr float, ptr %5, i64 %26, !dbg !21
  store float %32, ptr %33, align 4, !dbg !22
  %34 = add nuw nsw i64 %25, 1, !dbg !23
  %35 = icmp ult i64 %25, 111, !dbg !24
  br i1 %35, label %24, label %36, !dbg !13

36:                                               ; preds = %24
  %37 = add nuw nsw i64 %8, 1, !dbg !25
  %38 = icmp ult i64 %8, 15, !dbg !26
  br i1 %38, label %7, label %39, !dbg !7

39:                                               ; preds = %36
  ret void, !dbg !27
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_1", linkageName: "forward_kernel_1", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_1_1_1_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 19, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 21, column: 11, scope: !8)
!10 = !DILocation(line: 22, column: 11, scope: !8)
!11 = !DILocation(line: 23, column: 11, scope: !8)
!12 = !DILocation(line: 24, column: 11, scope: !8)
!13 = !DILocation(line: 28, column: 5, scope: !8)
!14 = !DILocation(line: 35, column: 11, scope: !8)
!15 = !DILocation(line: 36, column: 11, scope: !8)
!16 = !DILocation(line: 37, column: 11, scope: !8)
!17 = !DILocation(line: 49, column: 11, scope: !8)
!18 = !DILocation(line: 50, column: 11, scope: !8)
!19 = !DILocation(line: 51, column: 11, scope: !8)
!20 = !DILocation(line: 52, column: 11, scope: !8)
!21 = !DILocation(line: 59, column: 11, scope: !8)
!22 = !DILocation(line: 60, column: 5, scope: !8)
!23 = !DILocation(line: 61, column: 11, scope: !8)
!24 = !DILocation(line: 27, column: 11, scope: !8)
!25 = !DILocation(line: 64, column: 11, scope: !8)
!26 = !DILocation(line: 18, column: 11, scope: !8)
!27 = !DILocation(line: 67, column: 5, scope: !8)

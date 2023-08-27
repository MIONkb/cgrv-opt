; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_1_1_7_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_1(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture readonly %2, ptr nocapture readonly %3, ptr nocapture readonly %4, ptr nocapture writeonly %5) local_unnamed_addr #0 !dbg !3 {
  br label %7, !dbg !7

7:                                                ; preds = %6, %84
  %8 = phi i64 [ 0, %6 ], [ %85, %84 ]
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
  %25 = phi i64 [ 0, %7 ], [ %82, %24 ]
  %26 = add nuw nsw i64 %25, %13, !dbg !14
  %27 = getelementptr float, ptr %4, i64 %26, !dbg !15
  %28 = load float, ptr %27, align 4, !dbg !16
  %29 = fsub float %28, %11, !dbg !17
  %30 = fmul float %23, %29, !dbg !18
  %31 = fmul float %9, %30, !dbg !19
  %32 = fadd float %10, %31, !dbg !20
  %33 = getelementptr float, ptr %5, i64 %26, !dbg !21
  store float %32, ptr %33, align 4, !dbg !22
  %34 = add nuw nsw i64 %26, 1, !dbg !23
  %35 = getelementptr float, ptr %4, i64 %34, !dbg !24
  %36 = load float, ptr %35, align 4, !dbg !25
  %37 = fsub float %36, %11, !dbg !26
  %38 = fmul float %23, %37, !dbg !27
  %39 = fmul float %9, %38, !dbg !28
  %40 = fadd float %10, %39, !dbg !29
  %41 = getelementptr float, ptr %5, i64 %34, !dbg !30
  store float %40, ptr %41, align 4, !dbg !31
  %42 = add nuw nsw i64 %26, 2, !dbg !32
  %43 = getelementptr float, ptr %4, i64 %42, !dbg !33
  %44 = load float, ptr %43, align 4, !dbg !34
  %45 = fsub float %44, %11, !dbg !35
  %46 = fmul float %23, %45, !dbg !36
  %47 = fmul float %9, %46, !dbg !37
  %48 = fadd float %10, %47, !dbg !38
  %49 = getelementptr float, ptr %5, i64 %42, !dbg !39
  store float %48, ptr %49, align 4, !dbg !40
  %50 = add nuw nsw i64 %26, 3, !dbg !41
  %51 = getelementptr float, ptr %4, i64 %50, !dbg !42
  %52 = load float, ptr %51, align 4, !dbg !43
  %53 = fsub float %52, %11, !dbg !44
  %54 = fmul float %23, %53, !dbg !45
  %55 = fmul float %9, %54, !dbg !46
  %56 = fadd float %10, %55, !dbg !47
  %57 = getelementptr float, ptr %5, i64 %50, !dbg !48
  store float %56, ptr %57, align 4, !dbg !49
  %58 = add nuw nsw i64 %26, 4, !dbg !50
  %59 = getelementptr float, ptr %4, i64 %58, !dbg !51
  %60 = load float, ptr %59, align 4, !dbg !52
  %61 = fsub float %60, %11, !dbg !53
  %62 = fmul float %23, %61, !dbg !54
  %63 = fmul float %9, %62, !dbg !55
  %64 = fadd float %10, %63, !dbg !56
  %65 = getelementptr float, ptr %5, i64 %58, !dbg !57
  store float %64, ptr %65, align 4, !dbg !58
  %66 = add nuw nsw i64 %26, 5, !dbg !59
  %67 = getelementptr float, ptr %4, i64 %66, !dbg !60
  %68 = load float, ptr %67, align 4, !dbg !61
  %69 = fsub float %68, %11, !dbg !62
  %70 = fmul float %23, %69, !dbg !63
  %71 = fmul float %9, %70, !dbg !64
  %72 = fadd float %10, %71, !dbg !65
  %73 = getelementptr float, ptr %5, i64 %66, !dbg !66
  store float %72, ptr %73, align 4, !dbg !67
  %74 = add nuw nsw i64 %26, 6, !dbg !68
  %75 = getelementptr float, ptr %4, i64 %74, !dbg !69
  %76 = load float, ptr %75, align 4, !dbg !70
  %77 = fsub float %76, %11, !dbg !71
  %78 = fmul float %23, %77, !dbg !72
  %79 = fmul float %9, %78, !dbg !73
  %80 = fadd float %10, %79, !dbg !74
  %81 = getelementptr float, ptr %5, i64 %74, !dbg !75
  store float %80, ptr %81, align 4, !dbg !76
  %82 = add nuw nsw i64 %25, 7, !dbg !77
  %83 = icmp ult i64 %25, 105, !dbg !78
  br i1 %83, label %24, label %84, !dbg !13

84:                                               ; preds = %24
  %85 = add nuw nsw i64 %8, 1, !dbg !79
  %86 = icmp ult i64 %8, 15, !dbg !80
  br i1 %86, label %7, label %87, !dbg !7

87:                                               ; preds = %84
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

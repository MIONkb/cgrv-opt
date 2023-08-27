; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace/forward_kernel_1_1_8_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_1(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture readonly %2, ptr nocapture readonly %3, ptr nocapture readonly %4, ptr nocapture writeonly %5) local_unnamed_addr #0 !dbg !3 {
  br label %7, !dbg !7

7:                                                ; preds = %6, %99
  %8 = phi i64 [ 0, %6 ], [ %100, %99 ]
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
  %25 = phi i64 [ 0, %7 ], [ %97, %24 ]
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
  %61 = or i64 %25, 4, !dbg !53
  %62 = add nuw nsw i64 %61, %13, !dbg !54
  %63 = getelementptr float, ptr %4, i64 %62, !dbg !55
  %64 = load float, ptr %63, align 4, !dbg !56
  %65 = fsub float %64, %11, !dbg !57
  %66 = fmul float %23, %65, !dbg !58
  %67 = fmul float %9, %66, !dbg !59
  %68 = fadd float %10, %67, !dbg !60
  %69 = getelementptr float, ptr %5, i64 %62, !dbg !61
  store float %68, ptr %69, align 4, !dbg !62
  %70 = or i64 %25, 5, !dbg !63
  %71 = add nuw nsw i64 %70, %13, !dbg !64
  %72 = getelementptr float, ptr %4, i64 %71, !dbg !65
  %73 = load float, ptr %72, align 4, !dbg !66
  %74 = fsub float %73, %11, !dbg !67
  %75 = fmul float %23, %74, !dbg !68
  %76 = fmul float %9, %75, !dbg !69
  %77 = fadd float %10, %76, !dbg !70
  %78 = getelementptr float, ptr %5, i64 %71, !dbg !71
  store float %77, ptr %78, align 4, !dbg !72
  %79 = or i64 %25, 6, !dbg !73
  %80 = add nuw nsw i64 %79, %13, !dbg !74
  %81 = getelementptr float, ptr %4, i64 %80, !dbg !75
  %82 = load float, ptr %81, align 4, !dbg !76
  %83 = fsub float %82, %11, !dbg !77
  %84 = fmul float %23, %83, !dbg !78
  %85 = fmul float %9, %84, !dbg !79
  %86 = fadd float %10, %85, !dbg !80
  %87 = getelementptr float, ptr %5, i64 %80, !dbg !81
  store float %86, ptr %87, align 4, !dbg !82
  %88 = or i64 %25, 7, !dbg !83
  %89 = add nuw nsw i64 %88, %13, !dbg !84
  %90 = getelementptr float, ptr %4, i64 %89, !dbg !85
  %91 = load float, ptr %90, align 4, !dbg !86
  %92 = fsub float %91, %11, !dbg !87
  %93 = fmul float %23, %92, !dbg !88
  %94 = fmul float %9, %93, !dbg !89
  %95 = fadd float %10, %94, !dbg !90
  %96 = getelementptr float, ptr %5, i64 %89, !dbg !91
  store float %95, ptr %96, align 4, !dbg !92
  %97 = add nuw nsw i64 %25, 8, !dbg !93
  %98 = icmp ult i64 %25, 104, !dbg !94
  br i1 %98, label %24, label %99, !dbg !13

99:                                               ; preds = %24
  %100 = add nuw nsw i64 %8, 1, !dbg !95
  %101 = icmp ult i64 %8, 15, !dbg !96
  br i1 %101, label %7, label %102, !dbg !7

102:                                              ; preds = %99
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

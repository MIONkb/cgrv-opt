; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5) !dbg !3 {
  br label %7, !dbg !7

7:                                                ; preds = %6
  br label %8, !dbg !9

8:                                                ; preds = %116, %7
  %9 = phi i64 [ %117, %116 ], [ 0, %7 ]
  %10 = icmp slt i64 %9, 16, !dbg !10
  br i1 %10, label %11, label %118, !dbg !11

11:                                               ; preds = %8
  %12 = load float, ptr %0, align 4, !dbg !12
  %13 = load float, ptr %1, align 4, !dbg !13
  %14 = load float, ptr %2, align 4, !dbg !14
  %15 = load float, ptr %3, align 4, !dbg !15
  br label %16, !dbg !16

16:                                               ; preds = %19, %11
  %17 = phi i64 [ %115, %19 ], [ 0, %11 ]
  %18 = icmp slt i64 %17, 112, !dbg !17
  br i1 %18, label %19, label %116, !dbg !18

19:                                               ; preds = %16
  %20 = mul i64 %9, 112, !dbg !19
  %21 = add i64 0, %20, !dbg !20
  %22 = add i64 %21, %17, !dbg !21
  %23 = getelementptr float, ptr %4, i64 %22, !dbg !22
  %24 = load float, ptr %23, align 4, !dbg !23
  %25 = fadd float %15, 0x3EE4F8B580000000, !dbg !24
  %26 = fmul float %25, 5.000000e-01, !dbg !25
  %27 = bitcast float %25 to i32, !dbg !26
  %28 = lshr i32 %27, 1, !dbg !27
  %29 = sub i32 1597463007, %28, !dbg !28
  %30 = bitcast i32 %29 to float, !dbg !29
  %31 = fmul float %30, %30, !dbg !30
  %32 = fmul float %31, %26, !dbg !31
  %33 = fsub float 1.500000e+00, %32, !dbg !32
  %34 = fmul float %33, %31, !dbg !33
  %35 = fsub float %24, %14, !dbg !34
  %36 = fmul float %35, %34, !dbg !35
  %37 = fmul float %36, %12, !dbg !36
  %38 = fadd float %37, %13, !dbg !37
  %39 = mul i64 %9, 112, !dbg !38
  %40 = add i64 0, %39, !dbg !39
  %41 = add i64 %40, %17, !dbg !40
  %42 = getelementptr float, ptr %5, i64 %41, !dbg !41
  store float %38, ptr %42, align 4, !dbg !42
  %43 = add i64 %17, 1, !dbg !43
  %44 = mul i64 %9, 112, !dbg !44
  %45 = add i64 0, %44, !dbg !45
  %46 = add i64 %45, %43, !dbg !46
  %47 = getelementptr float, ptr %4, i64 %46, !dbg !47
  %48 = load float, ptr %47, align 4, !dbg !48
  %49 = fadd float %15, 0x3EE4F8B580000000, !dbg !49
  %50 = fmul float %49, 5.000000e-01, !dbg !50
  %51 = bitcast float %49 to i32, !dbg !51
  %52 = lshr i32 %51, 1, !dbg !52
  %53 = sub i32 1597463007, %52, !dbg !53
  %54 = bitcast i32 %53 to float, !dbg !54
  %55 = fmul float %54, %54, !dbg !55
  %56 = fmul float %55, %50, !dbg !56
  %57 = fsub float 1.500000e+00, %56, !dbg !57
  %58 = fmul float %57, %55, !dbg !58
  %59 = fsub float %48, %14, !dbg !59
  %60 = fmul float %59, %58, !dbg !60
  %61 = fmul float %60, %12, !dbg !61
  %62 = fadd float %61, %13, !dbg !62
  %63 = mul i64 %9, 112, !dbg !63
  %64 = add i64 0, %63, !dbg !64
  %65 = add i64 %64, %43, !dbg !65
  %66 = getelementptr float, ptr %5, i64 %65, !dbg !66
  store float %62, ptr %66, align 4, !dbg !67
  %67 = add i64 %17, 2, !dbg !68
  %68 = mul i64 %9, 112, !dbg !69
  %69 = add i64 0, %68, !dbg !70
  %70 = add i64 %69, %67, !dbg !71
  %71 = getelementptr float, ptr %4, i64 %70, !dbg !72
  %72 = load float, ptr %71, align 4, !dbg !73
  %73 = fadd float %15, 0x3EE4F8B580000000, !dbg !74
  %74 = fmul float %73, 5.000000e-01, !dbg !75
  %75 = bitcast float %73 to i32, !dbg !76
  %76 = lshr i32 %75, 1, !dbg !77
  %77 = sub i32 1597463007, %76, !dbg !78
  %78 = bitcast i32 %77 to float, !dbg !79
  %79 = fmul float %78, %78, !dbg !80
  %80 = fmul float %79, %74, !dbg !81
  %81 = fsub float 1.500000e+00, %80, !dbg !82
  %82 = fmul float %81, %79, !dbg !83
  %83 = fsub float %72, %14, !dbg !84
  %84 = fmul float %83, %82, !dbg !85
  %85 = fmul float %84, %12, !dbg !86
  %86 = fadd float %85, %13, !dbg !87
  %87 = mul i64 %9, 112, !dbg !88
  %88 = add i64 0, %87, !dbg !89
  %89 = add i64 %88, %67, !dbg !90
  %90 = getelementptr float, ptr %5, i64 %89, !dbg !91
  store float %86, ptr %90, align 4, !dbg !92
  %91 = add i64 %17, 3, !dbg !93
  %92 = mul i64 %9, 112, !dbg !94
  %93 = add i64 0, %92, !dbg !95
  %94 = add i64 %93, %91, !dbg !96
  %95 = getelementptr float, ptr %4, i64 %94, !dbg !97
  %96 = load float, ptr %95, align 4, !dbg !98
  %97 = fadd float %15, 0x3EE4F8B580000000, !dbg !99
  %98 = fmul float %97, 5.000000e-01, !dbg !100
  %99 = bitcast float %97 to i32, !dbg !101
  %100 = lshr i32 %99, 1, !dbg !102
  %101 = sub i32 1597463007, %100, !dbg !103
  %102 = bitcast i32 %101 to float, !dbg !104
  %103 = fmul float %102, %102, !dbg !105
  %104 = fmul float %103, %98, !dbg !106
  %105 = fsub float 1.500000e+00, %104, !dbg !107
  %106 = fmul float %105, %103, !dbg !108
  %107 = fsub float %96, %14, !dbg !109
  %108 = fmul float %107, %106, !dbg !110
  %109 = fmul float %108, %12, !dbg !111
  %110 = fadd float %109, %13, !dbg !112
  %111 = mul i64 %9, 112, !dbg !113
  %112 = add i64 0, %111, !dbg !114
  %113 = add i64 %112, %91, !dbg !115
  %114 = getelementptr float, ptr %5, i64 %113, !dbg !116
  store float %110, ptr %114, align 4, !dbg !117
  %115 = add i64 %17, 4, !dbg !118
  br label %16, !dbg !119

116:                                              ; preds = %16
  %117 = add i64 %9, 1, !dbg !120
  br label %8, !dbg !121

118:                                              ; preds = %8
  ret void, !dbg !122
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_1", linkageName: "forward_kernel_1", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_1_1_4_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 17, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 19, column: 5, scope: !8)
!10 = !DILocation(line: 21, column: 11, scope: !8)
!11 = !DILocation(line: 22, column: 5, scope: !8)
!12 = !DILocation(line: 24, column: 11, scope: !8)
!13 = !DILocation(line: 25, column: 11, scope: !8)
!14 = !DILocation(line: 26, column: 11, scope: !8)
!15 = !DILocation(line: 27, column: 11, scope: !8)
!16 = !DILocation(line: 28, column: 5, scope: !8)
!17 = !DILocation(line: 30, column: 11, scope: !8)
!18 = !DILocation(line: 31, column: 5, scope: !8)
!19 = !DILocation(line: 36, column: 11, scope: !8)
!20 = !DILocation(line: 37, column: 11, scope: !8)
!21 = !DILocation(line: 38, column: 11, scope: !8)
!22 = !DILocation(line: 39, column: 11, scope: !8)
!23 = !DILocation(line: 40, column: 11, scope: !8)
!24 = !DILocation(line: 42, column: 11, scope: !8)
!25 = !DILocation(line: 43, column: 11, scope: !8)
!26 = !DILocation(line: 44, column: 11, scope: !8)
!27 = !DILocation(line: 45, column: 11, scope: !8)
!28 = !DILocation(line: 46, column: 11, scope: !8)
!29 = !DILocation(line: 47, column: 11, scope: !8)
!30 = !DILocation(line: 48, column: 11, scope: !8)
!31 = !DILocation(line: 49, column: 11, scope: !8)
!32 = !DILocation(line: 50, column: 11, scope: !8)
!33 = !DILocation(line: 51, column: 11, scope: !8)
!34 = !DILocation(line: 52, column: 11, scope: !8)
!35 = !DILocation(line: 53, column: 11, scope: !8)
!36 = !DILocation(line: 54, column: 11, scope: !8)
!37 = !DILocation(line: 55, column: 11, scope: !8)
!38 = !DILocation(line: 59, column: 11, scope: !8)
!39 = !DILocation(line: 60, column: 11, scope: !8)
!40 = !DILocation(line: 61, column: 11, scope: !8)
!41 = !DILocation(line: 62, column: 11, scope: !8)
!42 = !DILocation(line: 63, column: 5, scope: !8)
!43 = !DILocation(line: 64, column: 11, scope: !8)
!44 = !DILocation(line: 68, column: 11, scope: !8)
!45 = !DILocation(line: 69, column: 11, scope: !8)
!46 = !DILocation(line: 70, column: 11, scope: !8)
!47 = !DILocation(line: 71, column: 11, scope: !8)
!48 = !DILocation(line: 72, column: 11, scope: !8)
!49 = !DILocation(line: 74, column: 11, scope: !8)
!50 = !DILocation(line: 75, column: 11, scope: !8)
!51 = !DILocation(line: 76, column: 11, scope: !8)
!52 = !DILocation(line: 77, column: 11, scope: !8)
!53 = !DILocation(line: 78, column: 11, scope: !8)
!54 = !DILocation(line: 79, column: 11, scope: !8)
!55 = !DILocation(line: 80, column: 11, scope: !8)
!56 = !DILocation(line: 81, column: 11, scope: !8)
!57 = !DILocation(line: 82, column: 11, scope: !8)
!58 = !DILocation(line: 83, column: 11, scope: !8)
!59 = !DILocation(line: 84, column: 11, scope: !8)
!60 = !DILocation(line: 85, column: 11, scope: !8)
!61 = !DILocation(line: 86, column: 11, scope: !8)
!62 = !DILocation(line: 87, column: 11, scope: !8)
!63 = !DILocation(line: 91, column: 11, scope: !8)
!64 = !DILocation(line: 92, column: 11, scope: !8)
!65 = !DILocation(line: 93, column: 11, scope: !8)
!66 = !DILocation(line: 94, column: 11, scope: !8)
!67 = !DILocation(line: 95, column: 5, scope: !8)
!68 = !DILocation(line: 96, column: 11, scope: !8)
!69 = !DILocation(line: 100, column: 11, scope: !8)
!70 = !DILocation(line: 101, column: 11, scope: !8)
!71 = !DILocation(line: 102, column: 11, scope: !8)
!72 = !DILocation(line: 103, column: 11, scope: !8)
!73 = !DILocation(line: 104, column: 11, scope: !8)
!74 = !DILocation(line: 106, column: 11, scope: !8)
!75 = !DILocation(line: 107, column: 11, scope: !8)
!76 = !DILocation(line: 108, column: 11, scope: !8)
!77 = !DILocation(line: 109, column: 11, scope: !8)
!78 = !DILocation(line: 110, column: 11, scope: !8)
!79 = !DILocation(line: 111, column: 11, scope: !8)
!80 = !DILocation(line: 112, column: 11, scope: !8)
!81 = !DILocation(line: 113, column: 12, scope: !8)
!82 = !DILocation(line: 114, column: 12, scope: !8)
!83 = !DILocation(line: 115, column: 12, scope: !8)
!84 = !DILocation(line: 116, column: 12, scope: !8)
!85 = !DILocation(line: 117, column: 12, scope: !8)
!86 = !DILocation(line: 118, column: 12, scope: !8)
!87 = !DILocation(line: 119, column: 12, scope: !8)
!88 = !DILocation(line: 123, column: 12, scope: !8)
!89 = !DILocation(line: 124, column: 12, scope: !8)
!90 = !DILocation(line: 125, column: 12, scope: !8)
!91 = !DILocation(line: 126, column: 12, scope: !8)
!92 = !DILocation(line: 127, column: 5, scope: !8)
!93 = !DILocation(line: 128, column: 12, scope: !8)
!94 = !DILocation(line: 132, column: 12, scope: !8)
!95 = !DILocation(line: 133, column: 12, scope: !8)
!96 = !DILocation(line: 134, column: 12, scope: !8)
!97 = !DILocation(line: 135, column: 12, scope: !8)
!98 = !DILocation(line: 136, column: 12, scope: !8)
!99 = !DILocation(line: 138, column: 12, scope: !8)
!100 = !DILocation(line: 139, column: 12, scope: !8)
!101 = !DILocation(line: 140, column: 12, scope: !8)
!102 = !DILocation(line: 141, column: 12, scope: !8)
!103 = !DILocation(line: 142, column: 12, scope: !8)
!104 = !DILocation(line: 143, column: 12, scope: !8)
!105 = !DILocation(line: 144, column: 12, scope: !8)
!106 = !DILocation(line: 145, column: 12, scope: !8)
!107 = !DILocation(line: 146, column: 12, scope: !8)
!108 = !DILocation(line: 147, column: 12, scope: !8)
!109 = !DILocation(line: 148, column: 12, scope: !8)
!110 = !DILocation(line: 149, column: 12, scope: !8)
!111 = !DILocation(line: 150, column: 12, scope: !8)
!112 = !DILocation(line: 151, column: 12, scope: !8)
!113 = !DILocation(line: 155, column: 12, scope: !8)
!114 = !DILocation(line: 156, column: 12, scope: !8)
!115 = !DILocation(line: 157, column: 12, scope: !8)
!116 = !DILocation(line: 158, column: 12, scope: !8)
!117 = !DILocation(line: 159, column: 5, scope: !8)
!118 = !DILocation(line: 160, column: 12, scope: !8)
!119 = !DILocation(line: 161, column: 5, scope: !8)
!120 = !DILocation(line: 163, column: 12, scope: !8)
!121 = !DILocation(line: 164, column: 5, scope: !8)
!122 = !DILocation(line: 166, column: 5, scope: !8)

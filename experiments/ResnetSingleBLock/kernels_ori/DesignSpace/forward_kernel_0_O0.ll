; ModuleID = 'forward_kernel_0_1_7_1_1_1_1_1_1.ll'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_0(ptr %0, ptr %1, ptr %2, ptr %3) !dbg !3 {
  br label %5, !dbg !7

5:                                                ; preds = %4
  br label %6, !dbg !9

6:                                                ; preds = %151, %5
  %7 = phi i64 [ %154, %151 ], [ 0, %5 ]
  %8 = icmp slt i64 %7, 8, !dbg !10
  br i1 %8, label %9, label %155, !dbg !11

9:                                                ; preds = %6
  %10 = add i64 0, %7, !dbg !12
  %11 = getelementptr float, ptr %0, i64 %10, !dbg !13
  %12 = load float, ptr %11, align 4, !dbg !14
  br label %13, !dbg !15

13:                                               ; preds = %149, %9
  %14 = phi i64 [ %150, %149 ], [ 0, %9 ]
  %15 = phi float [ %20, %149 ], [ %12, %9 ]
  %16 = icmp slt i64 %14, 3, !dbg !16
  br i1 %16, label %17, label %151, !dbg !17

17:                                               ; preds = %13
  br label %18, !dbg !18

18:                                               ; preds = %22, %17
  %19 = phi i64 [ %148, %22 ], [ 0, %17 ]
  %20 = phi float [ %147, %22 ], [ %15, %17 ]
  %21 = icmp slt i64 %19, 7, !dbg !19
  br i1 %21, label %22, label %149, !dbg !20

22:                                               ; preds = %18
  %23 = mul i64 %7, 2, !dbg !21
  %24 = mul i64 %14, 52900, !dbg !22
  %25 = add i64 0, %24, !dbg !23
  %26 = mul i64 %19, 230, !dbg !24
  %27 = add i64 %25, %26, !dbg !25
  %28 = add i64 %27, %23, !dbg !26
  %29 = getelementptr float, ptr %1, i64 %28, !dbg !27
  %30 = load float, ptr %29, align 4, !dbg !28
  %31 = mul i64 %14, 49, !dbg !29
  %32 = add i64 0, %31, !dbg !30
  %33 = mul i64 %19, 7, !dbg !31
  %34 = add i64 %32, %33, !dbg !32
  %35 = add i64 %34, 0, !dbg !33
  %36 = getelementptr float, ptr %2, i64 %35, !dbg !34
  %37 = load float, ptr %36, align 4, !dbg !35
  %38 = fmul float %30, %37, !dbg !36
  %39 = fadd float %20, %38, !dbg !37
  %40 = mul i64 %7, 2, !dbg !38
  %41 = add i64 %40, 1, !dbg !39
  %42 = mul i64 %14, 52900, !dbg !40
  %43 = add i64 0, %42, !dbg !41
  %44 = mul i64 %19, 230, !dbg !42
  %45 = add i64 %43, %44, !dbg !43
  %46 = add i64 %45, %41, !dbg !44
  %47 = getelementptr float, ptr %1, i64 %46, !dbg !45
  %48 = load float, ptr %47, align 4, !dbg !46
  %49 = mul i64 %14, 49, !dbg !47
  %50 = add i64 0, %49, !dbg !48
  %51 = mul i64 %19, 7, !dbg !49
  %52 = add i64 %50, %51, !dbg !50
  %53 = add i64 %52, 1, !dbg !51
  %54 = getelementptr float, ptr %2, i64 %53, !dbg !52
  %55 = load float, ptr %54, align 4, !dbg !53
  %56 = fmul float %48, %55, !dbg !54
  %57 = fadd float %39, %56, !dbg !55
  %58 = mul i64 %7, 2, !dbg !56
  %59 = add i64 %58, 2, !dbg !57
  %60 = mul i64 %14, 52900, !dbg !58
  %61 = add i64 0, %60, !dbg !59
  %62 = mul i64 %19, 230, !dbg !60
  %63 = add i64 %61, %62, !dbg !61
  %64 = add i64 %63, %59, !dbg !62
  %65 = getelementptr float, ptr %1, i64 %64, !dbg !63
  %66 = load float, ptr %65, align 4, !dbg !64
  %67 = mul i64 %14, 49, !dbg !65
  %68 = add i64 0, %67, !dbg !66
  %69 = mul i64 %19, 7, !dbg !67
  %70 = add i64 %68, %69, !dbg !68
  %71 = add i64 %70, 2, !dbg !69
  %72 = getelementptr float, ptr %2, i64 %71, !dbg !70
  %73 = load float, ptr %72, align 4, !dbg !71
  %74 = fmul float %66, %73, !dbg !72
  %75 = fadd float %57, %74, !dbg !73
  %76 = mul i64 %7, 2, !dbg !74
  %77 = add i64 %76, 3, !dbg !75
  %78 = mul i64 %14, 52900, !dbg !76
  %79 = add i64 0, %78, !dbg !77
  %80 = mul i64 %19, 230, !dbg !78
  %81 = add i64 %79, %80, !dbg !79
  %82 = add i64 %81, %77, !dbg !80
  %83 = getelementptr float, ptr %1, i64 %82, !dbg !81
  %84 = load float, ptr %83, align 4, !dbg !82
  %85 = mul i64 %14, 49, !dbg !83
  %86 = add i64 0, %85, !dbg !84
  %87 = mul i64 %19, 7, !dbg !85
  %88 = add i64 %86, %87, !dbg !86
  %89 = add i64 %88, 3, !dbg !87
  %90 = getelementptr float, ptr %2, i64 %89, !dbg !88
  %91 = load float, ptr %90, align 4, !dbg !89
  %92 = fmul float %84, %91, !dbg !90
  %93 = fadd float %75, %92, !dbg !91
  %94 = mul i64 %7, 2, !dbg !92
  %95 = add i64 %94, 4, !dbg !93
  %96 = mul i64 %14, 52900, !dbg !94
  %97 = add i64 0, %96, !dbg !95
  %98 = mul i64 %19, 230, !dbg !96
  %99 = add i64 %97, %98, !dbg !97
  %100 = add i64 %99, %95, !dbg !98
  %101 = getelementptr float, ptr %1, i64 %100, !dbg !99
  %102 = load float, ptr %101, align 4, !dbg !100
  %103 = mul i64 %14, 49, !dbg !101
  %104 = add i64 0, %103, !dbg !102
  %105 = mul i64 %19, 7, !dbg !103
  %106 = add i64 %104, %105, !dbg !104
  %107 = add i64 %106, 4, !dbg !105
  %108 = getelementptr float, ptr %2, i64 %107, !dbg !106
  %109 = load float, ptr %108, align 4, !dbg !107
  %110 = fmul float %102, %109, !dbg !108
  %111 = fadd float %93, %110, !dbg !109
  %112 = mul i64 %7, 2, !dbg !110
  %113 = add i64 %112, 5, !dbg !111
  %114 = mul i64 %14, 52900, !dbg !112
  %115 = add i64 0, %114, !dbg !113
  %116 = mul i64 %19, 230, !dbg !114
  %117 = add i64 %115, %116, !dbg !115
  %118 = add i64 %117, %113, !dbg !116
  %119 = getelementptr float, ptr %1, i64 %118, !dbg !117
  %120 = load float, ptr %119, align 4, !dbg !118
  %121 = mul i64 %14, 49, !dbg !119
  %122 = add i64 0, %121, !dbg !120
  %123 = mul i64 %19, 7, !dbg !121
  %124 = add i64 %122, %123, !dbg !122
  %125 = add i64 %124, 5, !dbg !123
  %126 = getelementptr float, ptr %2, i64 %125, !dbg !124
  %127 = load float, ptr %126, align 4, !dbg !125
  %128 = fmul float %120, %127, !dbg !126
  %129 = fadd float %111, %128, !dbg !127
  %130 = mul i64 %7, 2, !dbg !128
  %131 = add i64 %130, 6, !dbg !129
  %132 = mul i64 %14, 52900, !dbg !130
  %133 = add i64 0, %132, !dbg !131
  %134 = mul i64 %19, 230, !dbg !132
  %135 = add i64 %133, %134, !dbg !133
  %136 = add i64 %135, %131, !dbg !134
  %137 = getelementptr float, ptr %1, i64 %136, !dbg !135
  %138 = load float, ptr %137, align 4, !dbg !136
  %139 = mul i64 %14, 49, !dbg !137
  %140 = add i64 0, %139, !dbg !138
  %141 = mul i64 %19, 7, !dbg !139
  %142 = add i64 %140, %141, !dbg !140
  %143 = add i64 %142, 6, !dbg !141
  %144 = getelementptr float, ptr %2, i64 %143, !dbg !142
  %145 = load float, ptr %144, align 4, !dbg !143
  %146 = fmul float %138, %145, !dbg !144
  %147 = fadd float %129, %146, !dbg !145
  %148 = add i64 %19, 1, !dbg !146
  br label %18, !dbg !147

149:                                              ; preds = %18
  %150 = add i64 %14, 1, !dbg !148
  br label %13, !dbg !149

151:                                              ; preds = %13
  %152 = add i64 0, %7, !dbg !150
  %153 = getelementptr float, ptr %3, i64 %152, !dbg !151
  store float %15, ptr %153, align 4, !dbg !152
  %154 = add i64 %7, 1, !dbg !153
  br label %6, !dbg !154

155:                                              ; preds = %6
  ret void, !dbg !155
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_0", linkageName: "forward_kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_0_1_7_1_1_1_1_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 20, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 22, column: 5, scope: !8)
!10 = !DILocation(line: 24, column: 11, scope: !8)
!11 = !DILocation(line: 25, column: 5, scope: !8)
!12 = !DILocation(line: 32, column: 11, scope: !8)
!13 = !DILocation(line: 33, column: 11, scope: !8)
!14 = !DILocation(line: 34, column: 11, scope: !8)
!15 = !DILocation(line: 35, column: 5, scope: !8)
!16 = !DILocation(line: 37, column: 11, scope: !8)
!17 = !DILocation(line: 38, column: 5, scope: !8)
!18 = !DILocation(line: 40, column: 5, scope: !8)
!19 = !DILocation(line: 42, column: 11, scope: !8)
!20 = !DILocation(line: 43, column: 5, scope: !8)
!21 = !DILocation(line: 45, column: 11, scope: !8)
!22 = !DILocation(line: 47, column: 11, scope: !8)
!23 = !DILocation(line: 48, column: 11, scope: !8)
!24 = !DILocation(line: 49, column: 11, scope: !8)
!25 = !DILocation(line: 50, column: 11, scope: !8)
!26 = !DILocation(line: 51, column: 11, scope: !8)
!27 = !DILocation(line: 52, column: 11, scope: !8)
!28 = !DILocation(line: 53, column: 11, scope: !8)
!29 = !DILocation(line: 55, column: 11, scope: !8)
!30 = !DILocation(line: 56, column: 11, scope: !8)
!31 = !DILocation(line: 57, column: 11, scope: !8)
!32 = !DILocation(line: 58, column: 11, scope: !8)
!33 = !DILocation(line: 59, column: 11, scope: !8)
!34 = !DILocation(line: 60, column: 11, scope: !8)
!35 = !DILocation(line: 61, column: 11, scope: !8)
!36 = !DILocation(line: 62, column: 11, scope: !8)
!37 = !DILocation(line: 63, column: 11, scope: !8)
!38 = !DILocation(line: 64, column: 11, scope: !8)
!39 = !DILocation(line: 65, column: 11, scope: !8)
!40 = !DILocation(line: 67, column: 11, scope: !8)
!41 = !DILocation(line: 68, column: 11, scope: !8)
!42 = !DILocation(line: 69, column: 11, scope: !8)
!43 = !DILocation(line: 70, column: 11, scope: !8)
!44 = !DILocation(line: 71, column: 11, scope: !8)
!45 = !DILocation(line: 72, column: 11, scope: !8)
!46 = !DILocation(line: 73, column: 11, scope: !8)
!47 = !DILocation(line: 75, column: 11, scope: !8)
!48 = !DILocation(line: 76, column: 11, scope: !8)
!49 = !DILocation(line: 77, column: 11, scope: !8)
!50 = !DILocation(line: 78, column: 11, scope: !8)
!51 = !DILocation(line: 79, column: 11, scope: !8)
!52 = !DILocation(line: 80, column: 11, scope: !8)
!53 = !DILocation(line: 81, column: 11, scope: !8)
!54 = !DILocation(line: 82, column: 11, scope: !8)
!55 = !DILocation(line: 83, column: 11, scope: !8)
!56 = !DILocation(line: 84, column: 11, scope: !8)
!57 = !DILocation(line: 85, column: 11, scope: !8)
!58 = !DILocation(line: 87, column: 11, scope: !8)
!59 = !DILocation(line: 88, column: 11, scope: !8)
!60 = !DILocation(line: 89, column: 11, scope: !8)
!61 = !DILocation(line: 90, column: 11, scope: !8)
!62 = !DILocation(line: 91, column: 11, scope: !8)
!63 = !DILocation(line: 92, column: 11, scope: !8)
!64 = !DILocation(line: 93, column: 11, scope: !8)
!65 = !DILocation(line: 95, column: 11, scope: !8)
!66 = !DILocation(line: 96, column: 11, scope: !8)
!67 = !DILocation(line: 97, column: 11, scope: !8)
!68 = !DILocation(line: 98, column: 11, scope: !8)
!69 = !DILocation(line: 99, column: 11, scope: !8)
!70 = !DILocation(line: 100, column: 11, scope: !8)
!71 = !DILocation(line: 101, column: 11, scope: !8)
!72 = !DILocation(line: 102, column: 11, scope: !8)
!73 = !DILocation(line: 103, column: 11, scope: !8)
!74 = !DILocation(line: 104, column: 11, scope: !8)
!75 = !DILocation(line: 105, column: 11, scope: !8)
!76 = !DILocation(line: 107, column: 11, scope: !8)
!77 = !DILocation(line: 108, column: 11, scope: !8)
!78 = !DILocation(line: 109, column: 11, scope: !8)
!79 = !DILocation(line: 110, column: 11, scope: !8)
!80 = !DILocation(line: 111, column: 11, scope: !8)
!81 = !DILocation(line: 112, column: 12, scope: !8)
!82 = !DILocation(line: 113, column: 12, scope: !8)
!83 = !DILocation(line: 115, column: 12, scope: !8)
!84 = !DILocation(line: 116, column: 12, scope: !8)
!85 = !DILocation(line: 117, column: 12, scope: !8)
!86 = !DILocation(line: 118, column: 12, scope: !8)
!87 = !DILocation(line: 119, column: 12, scope: !8)
!88 = !DILocation(line: 120, column: 12, scope: !8)
!89 = !DILocation(line: 121, column: 12, scope: !8)
!90 = !DILocation(line: 122, column: 12, scope: !8)
!91 = !DILocation(line: 123, column: 12, scope: !8)
!92 = !DILocation(line: 124, column: 12, scope: !8)
!93 = !DILocation(line: 125, column: 12, scope: !8)
!94 = !DILocation(line: 127, column: 12, scope: !8)
!95 = !DILocation(line: 128, column: 12, scope: !8)
!96 = !DILocation(line: 129, column: 12, scope: !8)
!97 = !DILocation(line: 130, column: 12, scope: !8)
!98 = !DILocation(line: 131, column: 12, scope: !8)
!99 = !DILocation(line: 132, column: 12, scope: !8)
!100 = !DILocation(line: 133, column: 12, scope: !8)
!101 = !DILocation(line: 135, column: 12, scope: !8)
!102 = !DILocation(line: 136, column: 12, scope: !8)
!103 = !DILocation(line: 137, column: 12, scope: !8)
!104 = !DILocation(line: 138, column: 12, scope: !8)
!105 = !DILocation(line: 139, column: 12, scope: !8)
!106 = !DILocation(line: 140, column: 12, scope: !8)
!107 = !DILocation(line: 141, column: 12, scope: !8)
!108 = !DILocation(line: 142, column: 12, scope: !8)
!109 = !DILocation(line: 143, column: 12, scope: !8)
!110 = !DILocation(line: 144, column: 12, scope: !8)
!111 = !DILocation(line: 145, column: 12, scope: !8)
!112 = !DILocation(line: 147, column: 12, scope: !8)
!113 = !DILocation(line: 148, column: 12, scope: !8)
!114 = !DILocation(line: 149, column: 12, scope: !8)
!115 = !DILocation(line: 150, column: 12, scope: !8)
!116 = !DILocation(line: 151, column: 12, scope: !8)
!117 = !DILocation(line: 152, column: 12, scope: !8)
!118 = !DILocation(line: 153, column: 12, scope: !8)
!119 = !DILocation(line: 155, column: 12, scope: !8)
!120 = !DILocation(line: 156, column: 12, scope: !8)
!121 = !DILocation(line: 157, column: 12, scope: !8)
!122 = !DILocation(line: 158, column: 12, scope: !8)
!123 = !DILocation(line: 159, column: 12, scope: !8)
!124 = !DILocation(line: 160, column: 12, scope: !8)
!125 = !DILocation(line: 161, column: 12, scope: !8)
!126 = !DILocation(line: 162, column: 12, scope: !8)
!127 = !DILocation(line: 163, column: 12, scope: !8)
!128 = !DILocation(line: 164, column: 12, scope: !8)
!129 = !DILocation(line: 165, column: 12, scope: !8)
!130 = !DILocation(line: 167, column: 12, scope: !8)
!131 = !DILocation(line: 168, column: 12, scope: !8)
!132 = !DILocation(line: 169, column: 12, scope: !8)
!133 = !DILocation(line: 170, column: 12, scope: !8)
!134 = !DILocation(line: 171, column: 12, scope: !8)
!135 = !DILocation(line: 172, column: 12, scope: !8)
!136 = !DILocation(line: 173, column: 12, scope: !8)
!137 = !DILocation(line: 175, column: 12, scope: !8)
!138 = !DILocation(line: 176, column: 12, scope: !8)
!139 = !DILocation(line: 177, column: 12, scope: !8)
!140 = !DILocation(line: 178, column: 12, scope: !8)
!141 = !DILocation(line: 179, column: 12, scope: !8)
!142 = !DILocation(line: 180, column: 12, scope: !8)
!143 = !DILocation(line: 181, column: 12, scope: !8)
!144 = !DILocation(line: 182, column: 12, scope: !8)
!145 = !DILocation(line: 183, column: 12, scope: !8)
!146 = !DILocation(line: 184, column: 12, scope: !8)
!147 = !DILocation(line: 185, column: 5, scope: !8)
!148 = !DILocation(line: 187, column: 12, scope: !8)
!149 = !DILocation(line: 188, column: 5, scope: !8)
!150 = !DILocation(line: 195, column: 12, scope: !8)
!151 = !DILocation(line: 196, column: 12, scope: !8)
!152 = !DILocation(line: 197, column: 5, scope: !8)
!153 = !DILocation(line: 198, column: 12, scope: !8)
!154 = !DILocation(line: 199, column: 5, scope: !8)
!155 = !DILocation(line: 201, column: 5, scope: !8)
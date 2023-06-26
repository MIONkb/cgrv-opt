; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define ptr @forward(ptr %0, ptr %1) !dbg !3 {
  %3 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %0, 0, !dbg !7
  %4 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %3, ptr %0, 1, !dbg !9
  %5 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %4, i64 0, 2, !dbg !10
  %6 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %5, i64 2, 3, 0, !dbg !11
  %7 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %6, i64 1, 4, 0, !dbg !12
  %8 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0, !dbg !13
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %8, ptr %1, 1, !dbg !14
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, i64 0, 2, !dbg !15
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, i64 2, 3, 0, !dbg !16
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, i64 1, 4, 0, !dbg !17
  %13 = call ptr @malloc(i64 add (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 2) to i64), i64 64)), !dbg !18
  %14 = ptrtoint ptr %13 to i64, !dbg !19
  %15 = add i64 %14, 63, !dbg !20
  %16 = urem i64 %15, 64, !dbg !21
  %17 = sub i64 %15, %16, !dbg !22
  %18 = inttoptr i64 %17 to ptr, !dbg !23
  %19 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %13, 0, !dbg !24
  %20 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %19, ptr %18, 1, !dbg !25
  %21 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %20, i64 0, 2, !dbg !26
  %22 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %21, i64 2, 3, 0, !dbg !27
  %23 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %22, i64 1, 4, 0, !dbg !28
  %24 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %23, 1, !dbg !29
  call void @forward_kernel_0(ptr %0, ptr %1, ptr %24), !dbg !30
  %25 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %23, 1, !dbg !31
  ret ptr %25, !dbg !32
}

declare void @forward_kernel_0(ptr, ptr, ptr)

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward", linkageName: "forward", scope: null, file: !4, line: 3, type: !5, scopeLine: 3, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "3_forward_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/EasyMLIRCall")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 5, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 6, column: 10, scope: !8)
!10 = !DILocation(line: 8, column: 10, scope: !8)
!11 = !DILocation(line: 10, column: 10, scope: !8)
!12 = !DILocation(line: 12, column: 10, scope: !8)
!13 = !DILocation(line: 14, column: 11, scope: !8)
!14 = !DILocation(line: 15, column: 11, scope: !8)
!15 = !DILocation(line: 17, column: 11, scope: !8)
!16 = !DILocation(line: 19, column: 11, scope: !8)
!17 = !DILocation(line: 21, column: 11, scope: !8)
!18 = !DILocation(line: 29, column: 11, scope: !8)
!19 = !DILocation(line: 31, column: 11, scope: !8)
!20 = !DILocation(line: 34, column: 11, scope: !8)
!21 = !DILocation(line: 35, column: 11, scope: !8)
!22 = !DILocation(line: 36, column: 11, scope: !8)
!23 = !DILocation(line: 37, column: 11, scope: !8)
!24 = !DILocation(line: 39, column: 11, scope: !8)
!25 = !DILocation(line: 40, column: 11, scope: !8)
!26 = !DILocation(line: 42, column: 11, scope: !8)
!27 = !DILocation(line: 43, column: 11, scope: !8)
!28 = !DILocation(line: 44, column: 11, scope: !8)
!29 = !DILocation(line: 45, column: 11, scope: !8)
!30 = !DILocation(line: 46, column: 5, scope: !8)
!31 = !DILocation(line: 47, column: 11, scope: !8)
!32 = !DILocation(line: 48, column: 5, scope: !8)

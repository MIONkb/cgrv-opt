; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@__constant_3x3xf32 = private constant [3 x [3 x float]] [[3 x float] [float 0xBFDA9C7060000000, float 0x3FC42FBEC0000000, float 0x3FC0B92EE0000000], [3 x float] [float 0xBFDD5DF960000000, float 0xBFB82F34E0000000, float 0xBFDA2EC200000000], [3 x float] [float 0x3FC889E1C0000000, float 0xBFC1D11660000000, float 0xBFDA828E60000000]]

declare ptr @malloc(i64)

declare void @free(ptr)

define ptr @forward(ptr %0) !dbg !3 {
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %0, 1, !dbg !9
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2, !dbg !10
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 2, 3, 0, !dbg !11
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 3, 4, 0, !dbg !12
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 3, 3, 1, !dbg !13
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1, !dbg !14
  %9 = alloca float, i64 ptrtoint (ptr getelementptr (float, ptr null, i32 9) to i64), align 64, !dbg !15
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %9, 0, !dbg !16
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %9, 1, !dbg !17
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2, !dbg !18
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 3, 3, 0, !dbg !19
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 3, 3, 1, !dbg !20
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 3, 4, 0, !dbg !21
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1, !dbg !22
  %17 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !23
  call void @forward_kernel_0(ptr @__constant_3x3xf32, ptr %17), !dbg !24
  %18 = alloca float, i64 ptrtoint (ptr getelementptr (float, ptr null, i32 6) to i64), align 4, !dbg !25
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %18, 0, !dbg !26
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, ptr %18, 1, !dbg !27
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 0, 2, !dbg !28
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 2, 3, 0, !dbg !29
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 3, 3, 1, !dbg !30
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 3, 4, 0, !dbg !31
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 1, 4, 1, !dbg !32
  %26 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, 1, !dbg !33
  call void @forward_kernel_1(ptr %26), !dbg !34
  %27 = call ptr @malloc(i64 add (i64 ptrtoint (ptr getelementptr (float, ptr null, i32 6) to i64), i64 64)), !dbg !35
  %28 = ptrtoint ptr %27 to i64, !dbg !36
  %29 = add i64 %28, 63, !dbg !37
  %30 = urem i64 %29, 64, !dbg !38
  %31 = sub i64 %29, %30, !dbg !39
  %32 = inttoptr i64 %31 to ptr, !dbg !40
  %33 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %27, 0, !dbg !41
  %34 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %33, ptr %32, 1, !dbg !42
  %35 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %34, i64 0, 2, !dbg !43
  %36 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %35, i64 2, 3, 0, !dbg !44
  %37 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %36, i64 3, 3, 1, !dbg !45
  %38 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %37, i64 3, 4, 0, !dbg !46
  %39 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %38, i64 1, 4, 1, !dbg !47
  %40 = getelementptr float, ptr %18, i64 0, !dbg !48
  %41 = getelementptr float, ptr %32, i64 0, !dbg !49
  call void @llvm.memcpy.p0.p0.i64(ptr %41, ptr %40, i64 mul (i64 ptrtoint (ptr getelementptr (float, ptr null, i32 1) to i64), i64 6), i1 false), !dbg !50
  %42 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, 1, !dbg !51
  %43 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !52
  call void @forward_kernel_2(ptr %42, ptr %0, ptr %43), !dbg !53
  %44 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, 1, !dbg !54
  ret ptr %44, !dbg !55
}

declare void @forward_kernel_0(ptr, ptr)

declare void @forward_kernel_1(ptr)

declare void @forward_kernel_2(ptr, ptr, ptr)

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #0

attributes #0 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward", linkageName: "forward", scope: null, file: !4, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "3_forward_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/FloatKernel")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 6, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 7, column: 10, scope: !8)
!10 = !DILocation(line: 9, column: 10, scope: !8)
!11 = !DILocation(line: 11, column: 10, scope: !8)
!12 = !DILocation(line: 13, column: 10, scope: !8)
!13 = !DILocation(line: 15, column: 11, scope: !8)
!14 = !DILocation(line: 17, column: 11, scope: !8)
!15 = !DILocation(line: 45, column: 11, scope: !8)
!16 = !DILocation(line: 47, column: 11, scope: !8)
!17 = !DILocation(line: 48, column: 11, scope: !8)
!18 = !DILocation(line: 50, column: 11, scope: !8)
!19 = !DILocation(line: 51, column: 11, scope: !8)
!20 = !DILocation(line: 52, column: 11, scope: !8)
!21 = !DILocation(line: 53, column: 11, scope: !8)
!22 = !DILocation(line: 54, column: 11, scope: !8)
!23 = !DILocation(line: 56, column: 11, scope: !8)
!24 = !DILocation(line: 57, column: 5, scope: !8)
!25 = !DILocation(line: 65, column: 11, scope: !8)
!26 = !DILocation(line: 67, column: 11, scope: !8)
!27 = !DILocation(line: 68, column: 11, scope: !8)
!28 = !DILocation(line: 70, column: 11, scope: !8)
!29 = !DILocation(line: 71, column: 11, scope: !8)
!30 = !DILocation(line: 72, column: 11, scope: !8)
!31 = !DILocation(line: 73, column: 11, scope: !8)
!32 = !DILocation(line: 74, column: 11, scope: !8)
!33 = !DILocation(line: 75, column: 11, scope: !8)
!34 = !DILocation(line: 76, column: 5, scope: !8)
!35 = !DILocation(line: 86, column: 11, scope: !8)
!36 = !DILocation(line: 88, column: 11, scope: !8)
!37 = !DILocation(line: 91, column: 11, scope: !8)
!38 = !DILocation(line: 92, column: 11, scope: !8)
!39 = !DILocation(line: 93, column: 11, scope: !8)
!40 = !DILocation(line: 94, column: 11, scope: !8)
!41 = !DILocation(line: 96, column: 11, scope: !8)
!42 = !DILocation(line: 97, column: 11, scope: !8)
!43 = !DILocation(line: 99, column: 11, scope: !8)
!44 = !DILocation(line: 100, column: 11, scope: !8)
!45 = !DILocation(line: 101, column: 11, scope: !8)
!46 = !DILocation(line: 102, column: 11, scope: !8)
!47 = !DILocation(line: 103, column: 11, scope: !8)
!48 = !DILocation(line: 111, column: 12, scope: !8)
!49 = !DILocation(line: 112, column: 12, scope: !8)
!50 = !DILocation(line: 114, column: 5, scope: !8)
!51 = !DILocation(line: 115, column: 12, scope: !8)
!52 = !DILocation(line: 116, column: 12, scope: !8)
!53 = !DILocation(line: 117, column: 5, scope: !8)
!54 = !DILocation(line: 118, column: 12, scope: !8)
!55 = !DILocation(line: 119, column: 5, scope: !8)

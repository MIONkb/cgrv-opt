; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@__constant_3x3xf32 = private constant [3 x [3 x float]] [[3 x float] [float 0xBFE11460A0000000, float 0x3FB29B41C0000000, float 0x3FE18A6580000000], [3 x float] [float 0x3FD5BBD180000000, float 0xBFCB321A20000000, float 0x3FC0953740000000], [3 x float] [float 0x3FDB14A920000000, float 0x3FDD79D980000000, float 0xBFA22E9900000000]]

declare ptr @malloc(i64)

declare void @free(ptr)

define ptr @forward(ptr %0) !dbg !3 {
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %0, 1, !dbg !9
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2, !dbg !10
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 3, 3, 0, !dbg !11
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
  %18 = alloca float, i64 ptrtoint (ptr getelementptr (float, ptr null, i32 9) to i64), align 4, !dbg !25
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %18, 0, !dbg !26
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, ptr %18, 1, !dbg !27
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 0, 2, !dbg !28
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 3, 3, 0, !dbg !29
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 3, 3, 1, !dbg !30
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 3, 4, 0, !dbg !31
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 1, 4, 1, !dbg !32
  br label %26, !dbg !33

26:                                               ; preds = %38, %1
  %27 = phi i64 [ %39, %38 ], [ 0, %1 ]
  %28 = icmp slt i64 %27, 3, !dbg !34
  br i1 %28, label %29, label %40, !dbg !35

29:                                               ; preds = %26
  br label %30, !dbg !36

30:                                               ; preds = %33, %29
  %31 = phi i64 [ %37, %33 ], [ 0, %29 ]
  %32 = icmp slt i64 %31, 3, !dbg !37
  br i1 %32, label %33, label %38, !dbg !38

33:                                               ; preds = %30
  %34 = mul i64 %27, 3, !dbg !39
  %35 = add i64 %34, %31, !dbg !40
  %36 = getelementptr float, ptr %18, i64 %35, !dbg !41
  store float 0.000000e+00, ptr %36, align 4, !dbg !42
  %37 = add i64 %31, 1, !dbg !43
  br label %30, !dbg !44

38:                                               ; preds = %30
  %39 = add i64 %27, 1, !dbg !45
  br label %26, !dbg !46

40:                                               ; preds = %26
  %41 = call ptr @malloc(i64 add (i64 ptrtoint (ptr getelementptr (float, ptr null, i32 9) to i64), i64 64)), !dbg !47
  %42 = ptrtoint ptr %41 to i64, !dbg !48
  %43 = add i64 %42, 63, !dbg !49
  %44 = urem i64 %43, 64, !dbg !50
  %45 = sub i64 %43, %44, !dbg !51
  %46 = inttoptr i64 %45 to ptr, !dbg !52
  %47 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %41, 0, !dbg !53
  %48 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %47, ptr %46, 1, !dbg !54
  %49 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %48, i64 0, 2, !dbg !55
  %50 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %49, i64 3, 3, 0, !dbg !56
  %51 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %50, i64 3, 3, 1, !dbg !57
  %52 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %51, i64 3, 4, 0, !dbg !58
  %53 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %52, i64 1, 4, 1, !dbg !59
  %54 = getelementptr float, ptr %18, i64 0, !dbg !60
  %55 = getelementptr float, ptr %46, i64 0, !dbg !61
  call void @llvm.memcpy.p0.p0.i64(ptr %55, ptr %54, i64 mul (i64 ptrtoint (ptr getelementptr (float, ptr null, i32 1) to i64), i64 9), i1 false), !dbg !62
  %56 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %53, 1, !dbg !63
  %57 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !64
  call void @forward_kernel_1(ptr %56, ptr %0, ptr %57), !dbg !65
  %58 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %53, 1, !dbg !66
  ret ptr %58, !dbg !67
}

declare void @forward_kernel_0(ptr, ptr)

declare void @forward_kernel_1(ptr, ptr, ptr)

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
!15 = !DILocation(line: 49, column: 11, scope: !8)
!16 = !DILocation(line: 51, column: 11, scope: !8)
!17 = !DILocation(line: 52, column: 11, scope: !8)
!18 = !DILocation(line: 54, column: 11, scope: !8)
!19 = !DILocation(line: 55, column: 11, scope: !8)
!20 = !DILocation(line: 56, column: 11, scope: !8)
!21 = !DILocation(line: 57, column: 11, scope: !8)
!22 = !DILocation(line: 58, column: 11, scope: !8)
!23 = !DILocation(line: 60, column: 11, scope: !8)
!24 = !DILocation(line: 61, column: 5, scope: !8)
!25 = !DILocation(line: 69, column: 11, scope: !8)
!26 = !DILocation(line: 71, column: 11, scope: !8)
!27 = !DILocation(line: 72, column: 11, scope: !8)
!28 = !DILocation(line: 74, column: 11, scope: !8)
!29 = !DILocation(line: 75, column: 11, scope: !8)
!30 = !DILocation(line: 76, column: 11, scope: !8)
!31 = !DILocation(line: 77, column: 11, scope: !8)
!32 = !DILocation(line: 78, column: 11, scope: !8)
!33 = !DILocation(line: 79, column: 5, scope: !8)
!34 = !DILocation(line: 81, column: 11, scope: !8)
!35 = !DILocation(line: 82, column: 5, scope: !8)
!36 = !DILocation(line: 84, column: 5, scope: !8)
!37 = !DILocation(line: 86, column: 11, scope: !8)
!38 = !DILocation(line: 87, column: 5, scope: !8)
!39 = !DILocation(line: 90, column: 11, scope: !8)
!40 = !DILocation(line: 91, column: 11, scope: !8)
!41 = !DILocation(line: 92, column: 11, scope: !8)
!42 = !DILocation(line: 93, column: 5, scope: !8)
!43 = !DILocation(line: 94, column: 11, scope: !8)
!44 = !DILocation(line: 95, column: 5, scope: !8)
!45 = !DILocation(line: 97, column: 11, scope: !8)
!46 = !DILocation(line: 98, column: 5, scope: !8)
!47 = !DILocation(line: 109, column: 11, scope: !8)
!48 = !DILocation(line: 111, column: 11, scope: !8)
!49 = !DILocation(line: 114, column: 11, scope: !8)
!50 = !DILocation(line: 115, column: 11, scope: !8)
!51 = !DILocation(line: 116, column: 11, scope: !8)
!52 = !DILocation(line: 117, column: 12, scope: !8)
!53 = !DILocation(line: 119, column: 12, scope: !8)
!54 = !DILocation(line: 120, column: 12, scope: !8)
!55 = !DILocation(line: 122, column: 12, scope: !8)
!56 = !DILocation(line: 123, column: 12, scope: !8)
!57 = !DILocation(line: 124, column: 12, scope: !8)
!58 = !DILocation(line: 125, column: 12, scope: !8)
!59 = !DILocation(line: 126, column: 12, scope: !8)
!60 = !DILocation(line: 134, column: 12, scope: !8)
!61 = !DILocation(line: 135, column: 12, scope: !8)
!62 = !DILocation(line: 137, column: 5, scope: !8)
!63 = !DILocation(line: 138, column: 12, scope: !8)
!64 = !DILocation(line: 139, column: 12, scope: !8)
!65 = !DILocation(line: 140, column: 5, scope: !8)
!66 = !DILocation(line: 141, column: 12, scope: !8)
!67 = !DILocation(line: 142, column: 5, scope: !8)

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@__constant_3x3xi32 = private constant [3 x [3 x i32]] [[3 x i32] [i32 1, i32 -2, i32 3], [3 x i32] [i32 -4, i32 5, i32 -6], [3 x i32] [i32 7, i32 -8, i32 9]]

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
  %9 = alloca i32, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 9) to i64), align 64, !dbg !15
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %9, 0, !dbg !16
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %9, 1, !dbg !17
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2, !dbg !18
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 3, 3, 0, !dbg !19
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 3, 3, 1, !dbg !20
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 3, 4, 0, !dbg !21
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1, !dbg !22
  br label %17, !dbg !23

17:                                               ; preds = %33, %1
  %18 = phi i64 [ %34, %33 ], [ 0, %1 ]
  %19 = icmp slt i64 %18, 3, !dbg !24
  br i1 %19, label %20, label %35, !dbg !25

20:                                               ; preds = %17
  br label %21, !dbg !26

21:                                               ; preds = %24, %20
  %22 = phi i64 [ %32, %24 ], [ 0, %20 ]
  %23 = icmp slt i64 %22, 3, !dbg !27
  br i1 %23, label %24, label %33, !dbg !28

24:                                               ; preds = %21
  %25 = mul i64 %18, 3, !dbg !29
  %26 = add i64 %25, %22, !dbg !30
  %27 = getelementptr i32, ptr @__constant_3x3xi32, i64 %26, !dbg !31
  %28 = load i32, ptr %27, align 4, !dbg !32
  %29 = mul i64 %22, 3, !dbg !33
  %30 = add i64 %29, %18, !dbg !34
  %31 = getelementptr i32, ptr %9, i64 %30, !dbg !35
  store i32 %28, ptr %31, align 4, !dbg !36
  %32 = add i64 %22, 1, !dbg !37
  br label %21, !dbg !38

33:                                               ; preds = %21
  %34 = add i64 %18, 1, !dbg !39
  br label %17, !dbg !40

35:                                               ; preds = %17
  %36 = alloca i32, i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 6) to i64), align 4, !dbg !41
  %37 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %36, 0, !dbg !42
  %38 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %37, ptr %36, 1, !dbg !43
  %39 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %38, i64 0, 2, !dbg !44
  %40 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %39, i64 2, 3, 0, !dbg !45
  %41 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %40, i64 3, 3, 1, !dbg !46
  %42 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %41, i64 3, 4, 0, !dbg !47
  %43 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %42, i64 1, 4, 1, !dbg !48
  br label %44, !dbg !49

44:                                               ; preds = %56, %35
  %45 = phi i64 [ %57, %56 ], [ 0, %35 ]
  %46 = icmp slt i64 %45, 2, !dbg !50
  br i1 %46, label %47, label %58, !dbg !51

47:                                               ; preds = %44
  br label %48, !dbg !52

48:                                               ; preds = %51, %47
  %49 = phi i64 [ %55, %51 ], [ 0, %47 ]
  %50 = icmp slt i64 %49, 3, !dbg !53
  br i1 %50, label %51, label %56, !dbg !54

51:                                               ; preds = %48
  %52 = mul i64 %45, 3, !dbg !55
  %53 = add i64 %52, %49, !dbg !56
  %54 = getelementptr i32, ptr %36, i64 %53, !dbg !57
  store i32 0, ptr %54, align 4, !dbg !58
  %55 = add i64 %49, 1, !dbg !59
  br label %48, !dbg !60

56:                                               ; preds = %48
  %57 = add i64 %45, 1, !dbg !61
  br label %44, !dbg !62

58:                                               ; preds = %44
  %59 = call ptr @malloc(i64 add (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 6) to i64), i64 64)), !dbg !63
  %60 = ptrtoint ptr %59 to i64, !dbg !64
  %61 = add i64 %60, 63, !dbg !65
  %62 = urem i64 %61, 64, !dbg !66
  %63 = sub i64 %61, %62, !dbg !67
  %64 = inttoptr i64 %63 to ptr, !dbg !68
  %65 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %59, 0, !dbg !69
  %66 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %65, ptr %64, 1, !dbg !70
  %67 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %66, i64 0, 2, !dbg !71
  %68 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %67, i64 2, 3, 0, !dbg !72
  %69 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %68, i64 3, 3, 1, !dbg !73
  %70 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %69, i64 3, 4, 0, !dbg !74
  %71 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %70, i64 1, 4, 1, !dbg !75
  %72 = getelementptr i32, ptr %36, i64 0, !dbg !76
  %73 = getelementptr i32, ptr %64, i64 0, !dbg !77
  call void @llvm.memcpy.p0.p0.i64(ptr %73, ptr %72, i64 mul (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i64 6), i1 false), !dbg !78
  %74 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !79
  %75 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %71, 1, !dbg !80
  call void @forward_kernel_0(ptr %0, ptr %74, ptr %75), !dbg !81
  %76 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %71, 1, !dbg !82
  ret ptr %76, !dbg !83
}

declare void @forward_kernel_0(ptr, ptr, ptr)

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #0

attributes #0 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward", linkageName: "forward", scope: null, file: !4, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "3_forward_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/IntKernel")
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
!15 = !DILocation(line: 50, column: 11, scope: !8)
!16 = !DILocation(line: 52, column: 11, scope: !8)
!17 = !DILocation(line: 53, column: 11, scope: !8)
!18 = !DILocation(line: 55, column: 11, scope: !8)
!19 = !DILocation(line: 56, column: 11, scope: !8)
!20 = !DILocation(line: 57, column: 11, scope: !8)
!21 = !DILocation(line: 58, column: 11, scope: !8)
!22 = !DILocation(line: 59, column: 11, scope: !8)
!23 = !DILocation(line: 60, column: 5, scope: !8)
!24 = !DILocation(line: 62, column: 11, scope: !8)
!25 = !DILocation(line: 63, column: 5, scope: !8)
!26 = !DILocation(line: 65, column: 5, scope: !8)
!27 = !DILocation(line: 67, column: 11, scope: !8)
!28 = !DILocation(line: 68, column: 5, scope: !8)
!29 = !DILocation(line: 71, column: 11, scope: !8)
!30 = !DILocation(line: 72, column: 11, scope: !8)
!31 = !DILocation(line: 73, column: 11, scope: !8)
!32 = !DILocation(line: 74, column: 11, scope: !8)
!33 = !DILocation(line: 76, column: 11, scope: !8)
!34 = !DILocation(line: 77, column: 11, scope: !8)
!35 = !DILocation(line: 78, column: 11, scope: !8)
!36 = !DILocation(line: 79, column: 5, scope: !8)
!37 = !DILocation(line: 80, column: 11, scope: !8)
!38 = !DILocation(line: 81, column: 5, scope: !8)
!39 = !DILocation(line: 83, column: 11, scope: !8)
!40 = !DILocation(line: 84, column: 5, scope: !8)
!41 = !DILocation(line: 93, column: 11, scope: !8)
!42 = !DILocation(line: 95, column: 11, scope: !8)
!43 = !DILocation(line: 96, column: 11, scope: !8)
!44 = !DILocation(line: 98, column: 11, scope: !8)
!45 = !DILocation(line: 99, column: 11, scope: !8)
!46 = !DILocation(line: 100, column: 11, scope: !8)
!47 = !DILocation(line: 101, column: 11, scope: !8)
!48 = !DILocation(line: 102, column: 11, scope: !8)
!49 = !DILocation(line: 103, column: 5, scope: !8)
!50 = !DILocation(line: 105, column: 11, scope: !8)
!51 = !DILocation(line: 106, column: 5, scope: !8)
!52 = !DILocation(line: 108, column: 5, scope: !8)
!53 = !DILocation(line: 110, column: 11, scope: !8)
!54 = !DILocation(line: 111, column: 5, scope: !8)
!55 = !DILocation(line: 114, column: 11, scope: !8)
!56 = !DILocation(line: 115, column: 11, scope: !8)
!57 = !DILocation(line: 116, column: 11, scope: !8)
!58 = !DILocation(line: 117, column: 5, scope: !8)
!59 = !DILocation(line: 118, column: 11, scope: !8)
!60 = !DILocation(line: 119, column: 5, scope: !8)
!61 = !DILocation(line: 121, column: 11, scope: !8)
!62 = !DILocation(line: 122, column: 5, scope: !8)
!63 = !DILocation(line: 133, column: 12, scope: !8)
!64 = !DILocation(line: 135, column: 12, scope: !8)
!65 = !DILocation(line: 138, column: 12, scope: !8)
!66 = !DILocation(line: 139, column: 12, scope: !8)
!67 = !DILocation(line: 140, column: 12, scope: !8)
!68 = !DILocation(line: 141, column: 12, scope: !8)
!69 = !DILocation(line: 143, column: 12, scope: !8)
!70 = !DILocation(line: 144, column: 12, scope: !8)
!71 = !DILocation(line: 146, column: 12, scope: !8)
!72 = !DILocation(line: 147, column: 12, scope: !8)
!73 = !DILocation(line: 148, column: 12, scope: !8)
!74 = !DILocation(line: 149, column: 12, scope: !8)
!75 = !DILocation(line: 150, column: 12, scope: !8)
!76 = !DILocation(line: 158, column: 12, scope: !8)
!77 = !DILocation(line: 159, column: 12, scope: !8)
!78 = !DILocation(line: 161, column: 5, scope: !8)
!79 = !DILocation(line: 162, column: 12, scope: !8)
!80 = !DILocation(line: 163, column: 12, scope: !8)
!81 = !DILocation(line: 164, column: 5, scope: !8)
!82 = !DILocation(line: 165, column: 12, scope: !8)
!83 = !DILocation(line: 166, column: 5, scope: !8)

; ModuleID = '/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel/2_kernels_llvm/main_kernel_2.ll'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @main_kernel_2(ptr %0, ptr %1) !dbg !3 {
  %3 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %0, 0, !dbg !7
  %4 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %3, ptr %0, 1, !dbg !9
  %5 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %4, i64 0, 2, !dbg !10
  %6 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %5, i64 1, 3, 0, !dbg !11
  %7 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %6, i64 25, 4, 0, !dbg !12
  %8 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %7, i64 5, 3, 1, !dbg !13
  %9 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %8, i64 5, 4, 1, !dbg !14
  %10 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %9, i64 5, 3, 2, !dbg !15
  %11 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %10, i64 1, 4, 2, !dbg !16
  %12 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %1, 0, !dbg !17
  %13 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %12, ptr %1, 1, !dbg !18
  %14 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %13, i64 0, 2, !dbg !19
  %15 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %14, i64 5, 3, 0, !dbg !20
  %16 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %15, i64 5, 4, 0, !dbg !21
  %17 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %16, i64 5, 3, 1, !dbg !22
  %18 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %17, i64 1, 4, 1, !dbg !23
  %19 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %18, i64 1, 3, 2, !dbg !24
  %20 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %19, i64 1, 4, 2, !dbg !25
  br label %21, !dbg !26

21:                                               ; preds = %53, %2
  %22 = phi i64 [ %54, %53 ], [ 0, %2 ]
  %23 = icmp ult i64 %22, 5, !dbg !27
  br i1 %23, label %24, label %55, !dbg !28

24:                                               ; preds = %21
  %25 = mul nuw nsw i64 %22, 5
  br label %26, !dbg !29

26:                                               ; preds = %51, %24
  %27 = phi i64 [ %52, %51 ], [ 0, %24 ]
  %28 = icmp ult i64 %27, 5, !dbg !30
  br i1 %28, label %29, label %53, !dbg !31

29:                                               ; preds = %26
  %30 = add nuw nsw i64 %25, %27
  br label %31, !dbg !32

31:                                               ; preds = %49, %29
  %32 = phi i64 [ %50, %49 ], [ 0, %29 ]
  %33 = icmp ult i64 %32, 1, !dbg !33
  br i1 %33, label %34, label %51, !dbg !34

34:                                               ; preds = %31
  %35 = add nuw nsw i64 %30, %32
  br label %36, !dbg !35

36:                                               ; preds = %39, %34
  %37 = phi i64 [ %48, %39 ], [ 0, %34 ]
  %38 = icmp ult i64 %37, 1, !dbg !36
  br i1 %38, label %39, label %49, !dbg !37

39:                                               ; preds = %36
  %40 = mul nuw nsw i64 %37, 25, !dbg !38
  %41 = add nuw nsw i64 %40, %25, !dbg !39
  %42 = add nuw nsw i64 %41, %27, !dbg !40
  %43 = add nuw nsw i64 %42, %32, !dbg !41
  %44 = getelementptr float, ptr %0, i64 %43, !dbg !42
  %45 = load float, ptr %44, align 4, !dbg !43
  %46 = add nuw nsw i64 %35, %37, !dbg !44
  %47 = getelementptr float, ptr %1, i64 %46, !dbg !45
  store float %45, ptr %47, align 4, !dbg !46
  %48 = add nuw nsw i64 %37, 1, !dbg !47
  br label %36, !dbg !48

49:                                               ; preds = %36
  %50 = add nuw nsw i64 %32, 1, !dbg !49
  br label %31, !dbg !50

51:                                               ; preds = %31
  %52 = add nuw nsw i64 %27, 1, !dbg !51
  br label %26, !dbg !52

53:                                               ; preds = %26
  %54 = add nuw nsw i64 %22, 1, !dbg !53
  br label %21, !dbg !54

55:                                               ; preds = %21
  %56 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %11, i64 1, 3, 3, !dbg !55
  %57 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %20, i64 1, 3, 3, !dbg !56
  %58 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %56, i64 1, 4, 3, !dbg !57
  %59 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %57, i64 1, 4, 3, !dbg !58
  ret void, !dbg !59
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "main_kernel_2", linkageName: "main_kernel_2", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "1_kernels_llvmmlir/main_kernel_2_llvm.mlir", directory: "/home/tianyi/MLIRCGRA/CGRA-Flow/mlir-cgra/experiments/LJHtest/ConvModel")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 4, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 5, column: 10, scope: !8)
!10 = !DILocation(line: 7, column: 10, scope: !8)
!11 = !DILocation(line: 9, column: 10, scope: !8)
!12 = !DILocation(line: 11, column: 10, scope: !8)
!13 = !DILocation(line: 13, column: 11, scope: !8)
!14 = !DILocation(line: 15, column: 11, scope: !8)
!15 = !DILocation(line: 17, column: 11, scope: !8)
!16 = !DILocation(line: 19, column: 11, scope: !8)
!17 = !DILocation(line: 25, column: 11, scope: !8)
!18 = !DILocation(line: 26, column: 11, scope: !8)
!19 = !DILocation(line: 28, column: 11, scope: !8)
!20 = !DILocation(line: 30, column: 11, scope: !8)
!21 = !DILocation(line: 32, column: 11, scope: !8)
!22 = !DILocation(line: 34, column: 11, scope: !8)
!23 = !DILocation(line: 36, column: 11, scope: !8)
!24 = !DILocation(line: 38, column: 11, scope: !8)
!25 = !DILocation(line: 40, column: 11, scope: !8)
!26 = !DILocation(line: 50, column: 5, scope: !8)
!27 = !DILocation(line: 52, column: 11, scope: !8)
!28 = !DILocation(line: 53, column: 5, scope: !8)
!29 = !DILocation(line: 55, column: 5, scope: !8)
!30 = !DILocation(line: 57, column: 11, scope: !8)
!31 = !DILocation(line: 58, column: 5, scope: !8)
!32 = !DILocation(line: 60, column: 5, scope: !8)
!33 = !DILocation(line: 62, column: 11, scope: !8)
!34 = !DILocation(line: 63, column: 5, scope: !8)
!35 = !DILocation(line: 65, column: 5, scope: !8)
!36 = !DILocation(line: 67, column: 11, scope: !8)
!37 = !DILocation(line: 68, column: 5, scope: !8)
!38 = !DILocation(line: 72, column: 11, scope: !8)
!39 = !DILocation(line: 75, column: 11, scope: !8)
!40 = !DILocation(line: 76, column: 11, scope: !8)
!41 = !DILocation(line: 77, column: 11, scope: !8)
!42 = !DILocation(line: 78, column: 11, scope: !8)
!43 = !DILocation(line: 79, column: 11, scope: !8)
!44 = !DILocation(line: 85, column: 11, scope: !8)
!45 = !DILocation(line: 86, column: 11, scope: !8)
!46 = !DILocation(line: 87, column: 5, scope: !8)
!47 = !DILocation(line: 88, column: 11, scope: !8)
!48 = !DILocation(line: 89, column: 5, scope: !8)
!49 = !DILocation(line: 91, column: 11, scope: !8)
!50 = !DILocation(line: 92, column: 5, scope: !8)
!51 = !DILocation(line: 94, column: 11, scope: !8)
!52 = !DILocation(line: 95, column: 5, scope: !8)
!53 = !DILocation(line: 97, column: 11, scope: !8)
!54 = !DILocation(line: 98, column: 5, scope: !8)
!55 = !DILocation(line: 21, column: 11, scope: !8)
!56 = !DILocation(line: 42, column: 11, scope: !8)
!57 = !DILocation(line: 23, column: 11, scope: !8)
!58 = !DILocation(line: 44, column: 11, scope: !8)
!59 = !DILocation(line: 100, column: 5, scope: !8)

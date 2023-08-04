; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_7(ptr %0, ptr %1) {
  %3 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %0, 0
  %4 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %3, ptr %0, 1
  %5 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %4, i64 0, 2
  %6 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %5, i64 1, 3, 0
  %7 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %6, i64 200704, 4, 0
  %8 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %7, i64 64, 3, 1
  %9 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %8, i64 3136, 4, 1
  %10 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %9, i64 56, 3, 2
  %11 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %10, i64 56, 4, 2
  %12 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %11, i64 56, 3, 3
  %13 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %12, i64 1, 4, 3
  %14 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %1, 0
  %15 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %14, ptr %1, 1
  %16 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %15, i64 0, 2
  %17 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %16, i64 1, 3, 0
  %18 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %17, i64 831744, 4, 0
  %19 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %18, i64 64, 3, 1
  %20 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %19, i64 12996, 4, 1
  %21 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %20, i64 114, 3, 2
  %22 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %21, i64 114, 4, 2
  %23 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %22, i64 114, 3, 3
  %24 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %23, i64 1, 4, 3
  br label %25

25:                                               ; preds = %2
  br label %26

26:                                               ; preds = %95, %25
  %27 = phi i64 [ %96, %95 ], [ 0, %25 ]
  %28 = icmp slt i64 %27, 1
  br i1 %28, label %29, label %97

29:                                               ; preds = %26
  br label %30

30:                                               ; preds = %93, %29
  %31 = phi i64 [ %94, %93 ], [ 0, %29 ]
  %32 = icmp slt i64 %31, 64
  br i1 %32, label %33, label %95

33:                                               ; preds = %30
  br label %34

34:                                               ; preds = %91, %33
  %35 = phi i64 [ %92, %91 ], [ 0, %33 ]
  %36 = icmp slt i64 %35, 56
  br i1 %36, label %37, label %93

37:                                               ; preds = %34
  br label %38

38:                                               ; preds = %81, %37
  %39 = phi i64 [ %90, %81 ], [ 0, %37 ]
  %40 = icmp slt i64 %39, 56
  br i1 %40, label %41, label %91

41:                                               ; preds = %38
  %42 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %13, 1
  %43 = mul i64 %27, 200704
  %44 = mul i64 %31, 3136
  %45 = add i64 %43, %44
  %46 = mul i64 %35, 56
  %47 = add i64 %45, %46
  %48 = add i64 %47, %39
  %49 = getelementptr float, ptr %42, i64 %48
  %50 = load float, ptr %49, align 4
  br label %51

51:                                               ; preds = %79, %41
  %52 = phi i64 [ %80, %79 ], [ 0, %41 ]
  %53 = phi float [ %58, %79 ], [ %50, %41 ]
  %54 = icmp slt i64 %52, 3
  br i1 %54, label %55, label %81

55:                                               ; preds = %51
  br label %56

56:                                               ; preds = %60, %55
  %57 = phi i64 [ %78, %60 ], [ 0, %55 ]
  %58 = phi float [ %77, %60 ], [ %53, %55 ]
  %59 = icmp slt i64 %57, 3
  br i1 %59, label %60, label %79

60:                                               ; preds = %56
  %61 = mul i64 %35, 2
  %62 = add i64 %61, %52
  %63 = mul i64 %39, 2
  %64 = add i64 %63, %57
  %65 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %24, 1
  %66 = mul i64 %27, 831744
  %67 = mul i64 %31, 12996
  %68 = add i64 %66, %67
  %69 = mul i64 %62, 114
  %70 = add i64 %68, %69
  %71 = add i64 %70, %64
  %72 = getelementptr float, ptr %65, i64 %71
  %73 = load float, ptr %72, align 4
  %74 = fcmp ugt float %58, %73
  %75 = select i1 %74, float %58, float %73
  %76 = fcmp uno float %73, %73
  %77 = select i1 %76, float %73, float %75
  %78 = add i64 %57, 1
  br label %56

79:                                               ; preds = %56
  %80 = add i64 %52, 1
  br label %51

81:                                               ; preds = %51
  %82 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %13, 1
  %83 = mul i64 %27, 200704
  %84 = mul i64 %31, 3136
  %85 = add i64 %83, %84
  %86 = mul i64 %35, 56
  %87 = add i64 %85, %86
  %88 = add i64 %87, %39
  %89 = getelementptr float, ptr %82, i64 %88
  store float %53, ptr %89, align 4
  %90 = add i64 %39, 1
  br label %38

91:                                               ; preds = %38
  %92 = add i64 %35, 1
  br label %34

93:                                               ; preds = %34
  %94 = add i64 %31, 1
  br label %30

95:                                               ; preds = %30
  %96 = add i64 %27, 1
  br label %26

97:                                               ; preds = %26
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

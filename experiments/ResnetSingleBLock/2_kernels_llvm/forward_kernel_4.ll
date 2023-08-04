; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_4(ptr %0, ptr %1) {
  %3 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %0, 0
  %4 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %3, ptr %0, 1
  %5 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %4, i64 0, 2
  %6 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %5, i64 1, 3, 0
  %7 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %6, i64 802816, 4, 0
  %8 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %7, i64 64, 3, 1
  %9 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %8, i64 12544, 4, 1
  %10 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %9, i64 112, 3, 2
  %11 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %10, i64 112, 4, 2
  %12 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %11, i64 112, 3, 3
  %13 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %12, i64 1, 4, 3
  %14 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %1, 0
  %15 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %14, ptr %1, 1
  %16 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %15, i64 0, 2
  %17 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %16, i64 1, 3, 0
  %18 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %17, i64 802816, 4, 0
  %19 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %18, i64 64, 3, 1
  %20 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %19, i64 12544, 4, 1
  %21 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %20, i64 112, 3, 2
  %22 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %21, i64 112, 4, 2
  %23 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %22, i64 112, 3, 3
  %24 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %23, i64 1, 4, 3
  br label %25

25:                                               ; preds = %2
  br label %26

26:                                               ; preds = %65, %25
  %27 = phi i64 [ %66, %65 ], [ 0, %25 ]
  %28 = icmp slt i64 %27, 1
  br i1 %28, label %29, label %67

29:                                               ; preds = %26
  br label %30

30:                                               ; preds = %63, %29
  %31 = phi i64 [ %64, %63 ], [ 0, %29 ]
  %32 = icmp slt i64 %31, 64
  br i1 %32, label %33, label %65

33:                                               ; preds = %30
  br label %34

34:                                               ; preds = %61, %33
  %35 = phi i64 [ %62, %61 ], [ 0, %33 ]
  %36 = icmp slt i64 %35, 112
  br i1 %36, label %37, label %63

37:                                               ; preds = %34
  br label %38

38:                                               ; preds = %41, %37
  %39 = phi i64 [ %60, %41 ], [ 0, %37 ]
  %40 = icmp slt i64 %39, 112
  br i1 %40, label %41, label %61

41:                                               ; preds = %38
  %42 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %13, 1
  %43 = mul i64 %31, 12544
  %44 = add i64 0, %43
  %45 = mul i64 %35, 112
  %46 = add i64 %44, %45
  %47 = add i64 %46, %39
  %48 = getelementptr float, ptr %42, i64 %47
  %49 = load float, ptr %48, align 4
  %50 = fcmp ugt float %49, 0.000000e+00
  %51 = select i1 %50, float %49, float 0.000000e+00
  %52 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %24, 1
  %53 = mul i64 %27, 802816
  %54 = mul i64 %31, 12544
  %55 = add i64 %53, %54
  %56 = mul i64 %35, 112
  %57 = add i64 %55, %56
  %58 = add i64 %57, %39
  %59 = getelementptr float, ptr %52, i64 %58
  store float %51, ptr %59, align 4
  %60 = add i64 %39, 1
  br label %38

61:                                               ; preds = %38
  %62 = add i64 %35, 1
  br label %34

63:                                               ; preds = %34
  %64 = add i64 %31, 1
  br label %30

65:                                               ; preds = %30
  %66 = add i64 %27, 1
  br label %26

67:                                               ; preds = %26
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

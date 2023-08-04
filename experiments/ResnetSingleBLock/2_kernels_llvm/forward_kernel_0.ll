; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_0(ptr %0) {
  %2 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %0, 0
  %3 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %2, ptr %0, 1
  %4 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %3, i64 0, 2
  %5 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %4, i64 1, 3, 0
  %6 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %5, i64 158700, 4, 0
  %7 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %6, i64 3, 3, 1
  %8 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %7, i64 52900, 4, 1
  %9 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %8, i64 230, 3, 2
  %10 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %9, i64 230, 4, 2
  %11 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %10, i64 230, 3, 3
  %12 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %11, i64 1, 4, 3
  br label %13

13:                                               ; preds = %1
  br label %14

14:                                               ; preds = %43, %13
  %15 = phi i64 [ %44, %43 ], [ 0, %13 ]
  %16 = icmp slt i64 %15, 1
  br i1 %16, label %17, label %45

17:                                               ; preds = %14
  br label %18

18:                                               ; preds = %41, %17
  %19 = phi i64 [ %42, %41 ], [ 0, %17 ]
  %20 = icmp slt i64 %19, 3
  br i1 %20, label %21, label %43

21:                                               ; preds = %18
  br label %22

22:                                               ; preds = %39, %21
  %23 = phi i64 [ %40, %39 ], [ 0, %21 ]
  %24 = icmp slt i64 %23, 230
  br i1 %24, label %25, label %41

25:                                               ; preds = %22
  br label %26

26:                                               ; preds = %29, %25
  %27 = phi i64 [ %38, %29 ], [ 0, %25 ]
  %28 = icmp slt i64 %27, 230
  br i1 %28, label %29, label %39

29:                                               ; preds = %26
  %30 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %12, 1
  %31 = mul i64 %15, 158700
  %32 = mul i64 %19, 52900
  %33 = add i64 %31, %32
  %34 = mul i64 %23, 230
  %35 = add i64 %33, %34
  %36 = add i64 %35, %27
  %37 = getelementptr float, ptr %30, i64 %36
  store float 0.000000e+00, ptr %37, align 4
  %38 = add i64 %27, 1
  br label %26

39:                                               ; preds = %26
  %40 = add i64 %23, 1
  br label %22

41:                                               ; preds = %22
  %42 = add i64 %19, 1
  br label %18

43:                                               ; preds = %18
  %44 = add i64 %15, 1
  br label %14

45:                                               ; preds = %14
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

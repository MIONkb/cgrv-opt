; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@__constant_3x3xf32 = private constant [3 x [3 x float]] [[3 x float] [float 0xBFE11460A0000000, float 0x3FB29B41C0000000, float 0x3FE18A6580000000], [3 x float] [float 0x3FD5BBD180000000, float 0xBFCB321A20000000, float 0x3FC0953740000000], [3 x float] [float 0x3FDB14A920000000, float 0x3FDD79D980000000, float 0xBFA22E9900000000]]

declare ptr @malloc(i64)

declare void @free(ptr)

define ptr @forward(ptr %0) {
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %0, 1
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 3, 3, 0
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 3, 4, 0
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 3, 3, 1
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1
  %9 = alloca float, i64 9, align 64
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %9, 0
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %9, 1
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 3, 3, 0
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 3, 3, 1
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 3, 4, 0
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1
  %17 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1
  call void @forward_kernel_0(ptr getelementptr inbounds ([3 x [3 x float]], ptr @__constant_3x3xf32, i32 0, i64 1, i32 0), ptr %17)
  %18 = alloca float, i64 9, align 64
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %18, 0
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, ptr %18, 1
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 0, 2
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 3, 3, 0
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 3, 3, 1
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 3, 4, 0
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 1, 4, 1
  br label %26

26:                                               ; preds = %38, %1
  %27 = phi i64 [ %39, %38 ], [ 0, %1 ]
  %28 = icmp slt i64 %27, 3
  br i1 %28, label %29, label %40

29:                                               ; preds = %26
  br label %30

30:                                               ; preds = %33, %29
  %31 = phi i64 [ %37, %33 ], [ 0, %29 ]
  %32 = icmp slt i64 %31, 3
  br i1 %32, label %33, label %38

33:                                               ; preds = %30
  %34 = mul i64 %27, 3
  %35 = add i64 %34, %31
  %36 = getelementptr float, ptr %18, i64 %35
  store float 0.000000e+00, ptr %36, align 4
  %37 = add i64 %31, 1
  br label %30

38:                                               ; preds = %30
  %39 = add i64 %27, 1
  br label %26

40:                                               ; preds = %26
  %41 = call ptr @malloc(i64 add (i64 ptrtoint (ptr getelementptr (float, ptr null, i32 9) to i64), i64 64))
  %42 = ptrtoint ptr %41 to i64
  %43 = add i64 %42, 63
  %44 = urem i64 %43, 64
  %45 = sub i64 %43, %44
  %46 = inttoptr i64 %45 to ptr
  %47 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %41, 0
  %48 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %47, ptr %46, 1
  %49 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %48, i64 0, 2
  %50 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %49, i64 3, 3, 0
  %51 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %50, i64 3, 3, 1
  %52 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %51, i64 3, 4, 0
  %53 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %52, i64 1, 4, 1
  %54 = getelementptr float, ptr %18, i64 0
  %55 = getelementptr float, ptr %46, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr %55, ptr %54, i64 mul (i64 ptrtoint (ptr getelementptr (float, ptr null, i32 1) to i64), i64 9), i1 false)
  %56 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %53, 1
  %57 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1
  call void @forward_kernel_1(ptr %56, ptr %0, ptr %57)
  %58 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %53, 0
  ret ptr %58
}

define void @forward_kernel_0(ptr %0, ptr %1) {
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, ptr %0, 1
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 0, 2
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 3, 3, 0
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 3, 4, 0
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 3, 3, 1
  %9 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, i64 1, 4, 1
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %1, 1
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 3, 3, 0
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 3, 4, 0
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 3, 3, 1
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1
  br label %17

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %34, %17
  %19 = phi i64 [ %35, %34 ], [ 0, %17 ]
  %20 = icmp slt i64 %19, 3
  br i1 %20, label %21, label %36

21:                                               ; preds = %18
  br label %22

22:                                               ; preds = %25, %21
  %23 = phi i64 [ %33, %25 ], [ 0, %21 ]
  %24 = icmp slt i64 %23, 3
  br i1 %24, label %25, label %34

25:                                               ; preds = %22
  %26 = mul i64 %19, 3
  %27 = add i64 %26, %23
  %28 = getelementptr float, ptr %0, i64 %27
  %29 = load float, ptr %28, align 4
  %30 = mul i64 %23, 3
  %31 = add i64 %30, %19
  %32 = getelementptr float, ptr %1, i64 %31
  store float %29, ptr %32, align 4
  %33 = add i64 %23, 1
  br label %22

34:                                               ; preds = %22
  %35 = add i64 %19, 1
  br label %18

36:                                               ; preds = %18
  ret void
}

define void @forward_kernel_1(ptr %0, ptr %1, ptr %2) {
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, ptr %0, 1
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 0, 2
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 3, 3, 0
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 3, 4, 0
  %9 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %8, i64 3, 3, 1
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %9, i64 1, 4, 1
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %1, 0
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, ptr %1, 1
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 0, 2
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 3, 3, 0
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 3, 4, 0
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 3, 3, 1
  %17 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, i64 1, 4, 1
  %18 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %2, 0
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %18, ptr %2, 1
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, i64 0, 2
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 3, 3, 0
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 3, 4, 0
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 3, 3, 1
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 1, 4, 1
  br label %25

25:                                               ; preds = %3
  br label %26

26:                                               ; preds = %59, %25
  %27 = phi i64 [ %60, %59 ], [ 0, %25 ]
  %28 = icmp slt i64 %27, 3
  br i1 %28, label %29, label %61

29:                                               ; preds = %26
  br label %30

30:                                               ; preds = %54, %29
  %31 = phi i64 [ %58, %54 ], [ 0, %29 ]
  %32 = icmp slt i64 %31, 3
  br i1 %32, label %33, label %59

33:                                               ; preds = %30
  %34 = mul i64 %27, 3
  %35 = add i64 %34, %31
  %36 = getelementptr float, ptr %0, i64 %35
  %37 = load float, ptr %36, align 4
  br label %38

38:                                               ; preds = %42, %33
  %39 = phi i64 [ %53, %42 ], [ 0, %33 ]
  %40 = phi float [ %52, %42 ], [ %37, %33 ]
  %41 = icmp slt i64 %39, 3
  br i1 %41, label %42, label %54

42:                                               ; preds = %38
  %43 = mul i64 %27, 3
  %44 = add i64 %43, %39
  %45 = getelementptr float, ptr %1, i64 %44
  %46 = load float, ptr %45, align 4
  %47 = mul i64 %39, 3
  %48 = add i64 %47, %31
  %49 = getelementptr float, ptr %2, i64 %48
  %50 = load float, ptr %49, align 4
  %51 = fmul float %46, %50
  %52 = fadd float %40, %51
  %53 = add i64 %39, 1
  br label %38

54:                                               ; preds = %38
  %55 = mul i64 %27, 3
  %56 = add i64 %55, %31
  %57 = getelementptr float, ptr %0, i64 %56
  store float %40, ptr %57, align 4
  %58 = add i64 %31, 1
  br label %30

59:                                               ; preds = %30
  %60 = add i64 %27, 1
  br label %26

61:                                               ; preds = %26
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #0

attributes #0 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

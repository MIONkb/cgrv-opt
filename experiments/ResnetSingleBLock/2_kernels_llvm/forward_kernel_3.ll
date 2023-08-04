; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_3(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5) {
  %7 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %0, 0
  %8 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %7, ptr %0, 1
  %9 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %8, i64 0, 2
  %10 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %9, i64 64, 3, 0
  %11 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %10, i64 1, 4, 0
  %12 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %1, 0
  %13 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %12, ptr %1, 1
  %14 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %13, i64 0, 2
  %15 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %14, i64 64, 3, 0
  %16 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %15, i64 1, 4, 0
  %17 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %2, 0
  %18 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %17, ptr %2, 1
  %19 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %18, i64 0, 2
  %20 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %19, i64 64, 3, 0
  %21 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %20, i64 1, 4, 0
  %22 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } undef, ptr %3, 0
  %23 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %22, ptr %3, 1
  %24 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %23, i64 0, 2
  %25 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %24, i64 64, 3, 0
  %26 = insertvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %25, i64 1, 4, 0
  %27 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %4, 0
  %28 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %27, ptr %4, 1
  %29 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %28, i64 0, 2
  %30 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %29, i64 1, 3, 0
  %31 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %30, i64 802816, 4, 0
  %32 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %31, i64 64, 3, 1
  %33 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %32, i64 12544, 4, 1
  %34 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %33, i64 112, 3, 2
  %35 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %34, i64 112, 4, 2
  %36 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %35, i64 112, 3, 3
  %37 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %36, i64 1, 4, 3
  %38 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %5, 0
  %39 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %38, ptr %5, 1
  %40 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %39, i64 0, 2
  %41 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %40, i64 1, 3, 0
  %42 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %41, i64 802816, 4, 0
  %43 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %42, i64 64, 3, 1
  %44 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %43, i64 12544, 4, 1
  %45 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %44, i64 112, 3, 2
  %46 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %45, i64 112, 4, 2
  %47 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %46, i64 112, 3, 3
  %48 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %47, i64 1, 4, 3
  br label %49

49:                                               ; preds = %6
  br label %50

50:                                               ; preds = %107, %49
  %51 = phi i64 [ %108, %107 ], [ 0, %49 ]
  %52 = icmp slt i64 %51, 1
  br i1 %52, label %53, label %109

53:                                               ; preds = %50
  br label %54

54:                                               ; preds = %105, %53
  %55 = phi i64 [ %106, %105 ], [ 0, %53 ]
  %56 = icmp slt i64 %55, 64
  br i1 %56, label %57, label %107

57:                                               ; preds = %54
  %58 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %11, 1
  %59 = getelementptr float, ptr %58, i64 %55
  %60 = load float, ptr %59, align 4
  %61 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %16, 1
  %62 = getelementptr float, ptr %61, i64 %55
  %63 = load float, ptr %62, align 4
  %64 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %21, 1
  %65 = getelementptr float, ptr %64, i64 %55
  %66 = load float, ptr %65, align 4
  %67 = extractvalue { ptr, ptr, i64, [1 x i64], [1 x i64] } %26, 1
  %68 = getelementptr float, ptr %67, i64 %55
  %69 = load float, ptr %68, align 4
  br label %70

70:                                               ; preds = %103, %57
  %71 = phi i64 [ %104, %103 ], [ 0, %57 ]
  %72 = icmp slt i64 %71, 112
  br i1 %72, label %73, label %105

73:                                               ; preds = %70
  br label %74

74:                                               ; preds = %77, %73
  %75 = phi i64 [ %102, %77 ], [ 0, %73 ]
  %76 = icmp slt i64 %75, 112
  br i1 %76, label %77, label %103

77:                                               ; preds = %74
  %78 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %37, 1
  %79 = mul i64 %51, 802816
  %80 = mul i64 %55, 12544
  %81 = add i64 %79, %80
  %82 = mul i64 %71, 112
  %83 = add i64 %81, %82
  %84 = add i64 %83, %75
  %85 = getelementptr float, ptr %78, i64 %84
  %86 = load float, ptr %85, align 4
  %87 = fadd float %69, 0x3EE4F8B580000000
  %88 = call float @llvm.sqrt.f32(float %87)
  %89 = fdiv float 1.000000e+00, %88
  %90 = fsub float %86, %66
  %91 = fmul float %90, %89
  %92 = fmul float %91, %60
  %93 = fadd float %92, %63
  %94 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %48, 1
  %95 = mul i64 %51, 802816
  %96 = mul i64 %55, 12544
  %97 = add i64 %95, %96
  %98 = mul i64 %71, 112
  %99 = add i64 %97, %98
  %100 = add i64 %99, %75
  %101 = getelementptr float, ptr %94, i64 %100
  store float %93, ptr %101, align 4
  %102 = add i64 %75, 1
  br label %74

103:                                              ; preds = %74
  %104 = add i64 %71, 1
  br label %70

105:                                              ; preds = %70
  %106 = add i64 %55, 1
  br label %54

107:                                              ; preds = %54
  %108 = add i64 %51, 1
  br label %50

109:                                              ; preds = %50
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

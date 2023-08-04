; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define void @forward_kernel_2(ptr %0, ptr %1, ptr %2) {
  %4 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %0, 0
  %5 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %4, ptr %0, 1
  %6 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %5, i64 0, 2
  %7 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %6, i64 1, 3, 0
  %8 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %7, i64 802816, 4, 0
  %9 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %8, i64 64, 3, 1
  %10 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %9, i64 12544, 4, 1
  %11 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %10, i64 112, 3, 2
  %12 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %11, i64 112, 4, 2
  %13 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %12, i64 112, 3, 3
  %14 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %13, i64 1, 4, 3
  %15 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %1, 0
  %16 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %15, ptr %1, 1
  %17 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %16, i64 0, 2
  %18 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %17, i64 1, 3, 0
  %19 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %18, i64 158700, 4, 0
  %20 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %19, i64 3, 3, 1
  %21 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %20, i64 52900, 4, 1
  %22 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %21, i64 230, 3, 2
  %23 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %22, i64 230, 4, 2
  %24 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %23, i64 230, 3, 3
  %25 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %24, i64 1, 4, 3
  %26 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } undef, ptr %2, 0
  %27 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %26, ptr %2, 1
  %28 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %27, i64 0, 2
  %29 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %28, i64 64, 3, 0
  %30 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %29, i64 147, 4, 0
  %31 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %30, i64 3, 3, 1
  %32 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %31, i64 49, 4, 1
  %33 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %32, i64 7, 3, 2
  %34 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %33, i64 7, 4, 2
  %35 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %34, i64 7, 3, 3
  %36 = insertvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %35, i64 1, 4, 3
  br label %37

37:                                               ; preds = %3
  br label %38

38:                                               ; preds = %121, %37
  %39 = phi i64 [ %122, %121 ], [ 0, %37 ]
  %40 = icmp slt i64 %39, 1
  br i1 %40, label %41, label %123

41:                                               ; preds = %38
  br label %42

42:                                               ; preds = %119, %41
  %43 = phi i64 [ %120, %119 ], [ 0, %41 ]
  %44 = icmp slt i64 %43, 64
  br i1 %44, label %45, label %121

45:                                               ; preds = %42
  br label %46

46:                                               ; preds = %117, %45
  %47 = phi i64 [ %118, %117 ], [ 0, %45 ]
  %48 = icmp slt i64 %47, 112
  br i1 %48, label %49, label %119

49:                                               ; preds = %46
  br label %50

50:                                               ; preds = %107, %49
  %51 = phi i64 [ %116, %107 ], [ 0, %49 ]
  %52 = icmp slt i64 %51, 112
  br i1 %52, label %53, label %117

53:                                               ; preds = %50
  %54 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %14, 1
  %55 = mul i64 %39, 802816
  %56 = mul i64 %43, 12544
  %57 = add i64 %55, %56
  %58 = mul i64 %47, 112
  %59 = add i64 %57, %58
  %60 = add i64 %59, %51
  %61 = getelementptr float, ptr %54, i64 %60
  %62 = load float, ptr %61, align 4
  br label %63

63:                                               ; preds = %105, %53
  %64 = phi i64 [ %106, %105 ], [ 0, %53 ]
  %65 = phi float [ %70, %105 ], [ %62, %53 ]
  %66 = icmp slt i64 %64, 3
  br i1 %66, label %67, label %107

67:                                               ; preds = %63
  br label %68

68:                                               ; preds = %103, %67
  %69 = phi i64 [ %104, %103 ], [ 0, %67 ]
  %70 = phi float [ %75, %103 ], [ %65, %67 ]
  %71 = icmp slt i64 %69, 7
  br i1 %71, label %72, label %105

72:                                               ; preds = %68
  br label %73

73:                                               ; preds = %77, %72
  %74 = phi i64 [ %102, %77 ], [ 0, %72 ]
  %75 = phi float [ %101, %77 ], [ %70, %72 ]
  %76 = icmp slt i64 %74, 7
  br i1 %76, label %77, label %103

77:                                               ; preds = %73
  %78 = mul i64 %47, 2
  %79 = add i64 %78, %69
  %80 = mul i64 %51, 2
  %81 = add i64 %80, %74
  %82 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %25, 1
  %83 = mul i64 %39, 158700
  %84 = mul i64 %64, 52900
  %85 = add i64 %83, %84
  %86 = mul i64 %79, 230
  %87 = add i64 %85, %86
  %88 = add i64 %87, %81
  %89 = getelementptr float, ptr %82, i64 %88
  %90 = load float, ptr %89, align 4
  %91 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %36, 1
  %92 = mul i64 %43, 147
  %93 = mul i64 %64, 49
  %94 = add i64 %92, %93
  %95 = mul i64 %69, 7
  %96 = add i64 %94, %95
  %97 = add i64 %96, %74
  %98 = getelementptr float, ptr %91, i64 %97
  %99 = load float, ptr %98, align 4
  %100 = fmul float %90, %99
  %101 = fadd float %75, %100
  %102 = add i64 %74, 1
  br label %73

103:                                              ; preds = %73
  %104 = add i64 %69, 1
  br label %68

105:                                              ; preds = %68
  %106 = add i64 %64, 1
  br label %63

107:                                              ; preds = %63
  %108 = extractvalue { ptr, ptr, i64, [4 x i64], [4 x i64] } %14, 1
  %109 = mul i64 %39, 802816
  %110 = mul i64 %43, 12544
  %111 = add i64 %109, %110
  %112 = mul i64 %47, 112
  %113 = add i64 %111, %112
  %114 = add i64 %113, %51
  %115 = getelementptr float, ptr %108, i64 %114
  store float %65, ptr %115, align 4
  %116 = add i64 %51, 1
  br label %50

117:                                              ; preds = %50
  %118 = add i64 %47, 1
  br label %46

119:                                              ; preds = %46
  %120 = add i64 %43, 1
  br label %42

121:                                              ; preds = %42
  %122 = add i64 %39, 1
  br label %38

123:                                              ; preds = %38
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(8 : index) : i64
    %3 = llvm.mlir.constant(2 : index) : i64
    %4 = llvm.mlir.constant(3 : index) : i64
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.mlir.constant(5 : index) : i64
    %7 = llvm.mlir.constant(6 : index) : i64
    %8 = llvm.mlir.constant(7 : index) : i64
    %9 = llvm.mlir.constant(112 : index) : i64
    %10 = llvm.mlir.constant(12544 : index) : i64
    %11 = llvm.mlir.constant(802816 : index) : i64
    %12 = llvm.mlir.constant(1 : index) : i64
    %13 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%13 : i64)
  ^bb2(%14: i64):  // 2 preds: ^bb1, ^bb6
    %15 = llvm.icmp "slt" %14, %1 : i64
    llvm.cond_br %15, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%13 : i64)
  ^bb4(%16: i64):  // 2 preds: ^bb3, ^bb5
    %17 = llvm.icmp "slt" %16, %9 : i64
    llvm.cond_br %17, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %18 = llvm.mul %13, %11  : i64
    %19 = llvm.mul %13, %10  : i64
    %20 = llvm.add %18, %19  : i64
    %21 = llvm.mul %14, %9  : i64
    %22 = llvm.add %20, %21  : i64
    %23 = llvm.add %22, %16  : i64
    %24 = llvm.getelementptr %arg0[%23] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %25 = llvm.load %24 : !llvm.ptr -> f32
    %26 = llvm.fcmp "ugt" %25, %0 : f32
    %27 = llvm.select %26, %25, %0 : i1, f32
    %28 = llvm.mul %13, %11  : i64
    %29 = llvm.mul %13, %10  : i64
    %30 = llvm.add %28, %29  : i64
    %31 = llvm.mul %14, %9  : i64
    %32 = llvm.add %30, %31  : i64
    %33 = llvm.add %32, %16  : i64
    %34 = llvm.getelementptr %arg1[%33] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %27, %34 : f32, !llvm.ptr
    %35 = llvm.add %16, %12  : i64
    %36 = llvm.mul %13, %11  : i64
    %37 = llvm.mul %13, %10  : i64
    %38 = llvm.add %36, %37  : i64
    %39 = llvm.mul %14, %9  : i64
    %40 = llvm.add %38, %39  : i64
    %41 = llvm.add %40, %35  : i64
    %42 = llvm.getelementptr %arg0[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %43 = llvm.load %42 : !llvm.ptr -> f32
    %44 = llvm.fcmp "ugt" %43, %0 : f32
    %45 = llvm.select %44, %43, %0 : i1, f32
    %46 = llvm.mul %13, %11  : i64
    %47 = llvm.mul %13, %10  : i64
    %48 = llvm.add %46, %47  : i64
    %49 = llvm.mul %14, %9  : i64
    %50 = llvm.add %48, %49  : i64
    %51 = llvm.add %50, %35  : i64
    %52 = llvm.getelementptr %arg1[%51] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %45, %52 : f32, !llvm.ptr
    %53 = llvm.add %16, %3  : i64
    %54 = llvm.mul %13, %11  : i64
    %55 = llvm.mul %13, %10  : i64
    %56 = llvm.add %54, %55  : i64
    %57 = llvm.mul %14, %9  : i64
    %58 = llvm.add %56, %57  : i64
    %59 = llvm.add %58, %53  : i64
    %60 = llvm.getelementptr %arg0[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %61 = llvm.load %60 : !llvm.ptr -> f32
    %62 = llvm.fcmp "ugt" %61, %0 : f32
    %63 = llvm.select %62, %61, %0 : i1, f32
    %64 = llvm.mul %13, %11  : i64
    %65 = llvm.mul %13, %10  : i64
    %66 = llvm.add %64, %65  : i64
    %67 = llvm.mul %14, %9  : i64
    %68 = llvm.add %66, %67  : i64
    %69 = llvm.add %68, %53  : i64
    %70 = llvm.getelementptr %arg1[%69] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %63, %70 : f32, !llvm.ptr
    %71 = llvm.add %16, %4  : i64
    %72 = llvm.mul %13, %11  : i64
    %73 = llvm.mul %13, %10  : i64
    %74 = llvm.add %72, %73  : i64
    %75 = llvm.mul %14, %9  : i64
    %76 = llvm.add %74, %75  : i64
    %77 = llvm.add %76, %71  : i64
    %78 = llvm.getelementptr %arg0[%77] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %79 = llvm.load %78 : !llvm.ptr -> f32
    %80 = llvm.fcmp "ugt" %79, %0 : f32
    %81 = llvm.select %80, %79, %0 : i1, f32
    %82 = llvm.mul %13, %11  : i64
    %83 = llvm.mul %13, %10  : i64
    %84 = llvm.add %82, %83  : i64
    %85 = llvm.mul %14, %9  : i64
    %86 = llvm.add %84, %85  : i64
    %87 = llvm.add %86, %71  : i64
    %88 = llvm.getelementptr %arg1[%87] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %81, %88 : f32, !llvm.ptr
    %89 = llvm.add %16, %5  : i64
    %90 = llvm.mul %13, %11  : i64
    %91 = llvm.mul %13, %10  : i64
    %92 = llvm.add %90, %91  : i64
    %93 = llvm.mul %14, %9  : i64
    %94 = llvm.add %92, %93  : i64
    %95 = llvm.add %94, %89  : i64
    %96 = llvm.getelementptr %arg0[%95] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %97 = llvm.load %96 : !llvm.ptr -> f32
    %98 = llvm.fcmp "ugt" %97, %0 : f32
    %99 = llvm.select %98, %97, %0 : i1, f32
    %100 = llvm.mul %13, %11  : i64
    %101 = llvm.mul %13, %10  : i64
    %102 = llvm.add %100, %101  : i64
    %103 = llvm.mul %14, %9  : i64
    %104 = llvm.add %102, %103  : i64
    %105 = llvm.add %104, %89  : i64
    %106 = llvm.getelementptr %arg1[%105] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %99, %106 : f32, !llvm.ptr
    %107 = llvm.add %16, %6  : i64
    %108 = llvm.mul %13, %11  : i64
    %109 = llvm.mul %13, %10  : i64
    %110 = llvm.add %108, %109  : i64
    %111 = llvm.mul %14, %9  : i64
    %112 = llvm.add %110, %111  : i64
    %113 = llvm.add %112, %107  : i64
    %114 = llvm.getelementptr %arg0[%113] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %115 = llvm.load %114 : !llvm.ptr -> f32
    %116 = llvm.fcmp "ugt" %115, %0 : f32
    %117 = llvm.select %116, %115, %0 : i1, f32
    %118 = llvm.mul %13, %11  : i64
    %119 = llvm.mul %13, %10  : i64
    %120 = llvm.add %118, %119  : i64
    %121 = llvm.mul %14, %9  : i64
    %122 = llvm.add %120, %121  : i64
    %123 = llvm.add %122, %107  : i64
    %124 = llvm.getelementptr %arg1[%123] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %117, %124 : f32, !llvm.ptr
    %125 = llvm.add %16, %7  : i64
    %126 = llvm.mul %13, %11  : i64
    %127 = llvm.mul %13, %10  : i64
    %128 = llvm.add %126, %127  : i64
    %129 = llvm.mul %14, %9  : i64
    %130 = llvm.add %128, %129  : i64
    %131 = llvm.add %130, %125  : i64
    %132 = llvm.getelementptr %arg0[%131] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %133 = llvm.load %132 : !llvm.ptr -> f32
    %134 = llvm.fcmp "ugt" %133, %0 : f32
    %135 = llvm.select %134, %133, %0 : i1, f32
    %136 = llvm.mul %13, %11  : i64
    %137 = llvm.mul %13, %10  : i64
    %138 = llvm.add %136, %137  : i64
    %139 = llvm.mul %14, %9  : i64
    %140 = llvm.add %138, %139  : i64
    %141 = llvm.add %140, %125  : i64
    %142 = llvm.getelementptr %arg1[%141] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %135, %142 : f32, !llvm.ptr
    %143 = llvm.add %16, %8  : i64
    %144 = llvm.mul %13, %11  : i64
    %145 = llvm.mul %13, %10  : i64
    %146 = llvm.add %144, %145  : i64
    %147 = llvm.mul %14, %9  : i64
    %148 = llvm.add %146, %147  : i64
    %149 = llvm.add %148, %143  : i64
    %150 = llvm.getelementptr %arg0[%149] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %151 = llvm.load %150 : !llvm.ptr -> f32
    %152 = llvm.fcmp "ugt" %151, %0 : f32
    %153 = llvm.select %152, %151, %0 : i1, f32
    %154 = llvm.mul %13, %11  : i64
    %155 = llvm.mul %13, %10  : i64
    %156 = llvm.add %154, %155  : i64
    %157 = llvm.mul %14, %9  : i64
    %158 = llvm.add %156, %157  : i64
    %159 = llvm.add %158, %143  : i64
    %160 = llvm.getelementptr %arg1[%159] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %153, %160 : f32, !llvm.ptr
    %161 = llvm.add %16, %2  : i64
    llvm.br ^bb4(%161 : i64)
  ^bb6:  // pred: ^bb4
    %162 = llvm.add %14, %12  : i64
    llvm.br ^bb2(%162 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


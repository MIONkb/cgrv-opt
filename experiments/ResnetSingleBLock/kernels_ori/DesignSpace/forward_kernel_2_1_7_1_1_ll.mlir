module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(7 : index) : i64
    %3 = llvm.mlir.constant(2 : index) : i64
    %4 = llvm.mlir.constant(3 : index) : i64
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.mlir.constant(5 : index) : i64
    %7 = llvm.mlir.constant(6 : index) : i64
    %8 = llvm.mlir.constant(112 : index) : i64
    %9 = llvm.mlir.constant(12544 : index) : i64
    %10 = llvm.mlir.constant(802816 : index) : i64
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%12 : i64)
  ^bb2(%13: i64):  // 2 preds: ^bb1, ^bb6
    %14 = llvm.icmp "slt" %13, %1 : i64
    llvm.cond_br %14, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%12 : i64)
  ^bb4(%15: i64):  // 2 preds: ^bb3, ^bb5
    %16 = llvm.icmp "slt" %15, %8 : i64
    llvm.cond_br %16, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %17 = llvm.mul %12, %10  : i64
    %18 = llvm.mul %12, %9  : i64
    %19 = llvm.add %17, %18  : i64
    %20 = llvm.mul %13, %8  : i64
    %21 = llvm.add %19, %20  : i64
    %22 = llvm.add %21, %15  : i64
    %23 = llvm.getelementptr %arg0[%22] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %24 = llvm.load %23 : !llvm.ptr -> f32
    %25 = llvm.fcmp "ugt" %24, %0 : f32
    %26 = llvm.select %25, %24, %0 : i1, f32
    %27 = llvm.mul %12, %10  : i64
    %28 = llvm.mul %12, %9  : i64
    %29 = llvm.add %27, %28  : i64
    %30 = llvm.mul %13, %8  : i64
    %31 = llvm.add %29, %30  : i64
    %32 = llvm.add %31, %15  : i64
    %33 = llvm.getelementptr %arg1[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %26, %33 : f32, !llvm.ptr
    %34 = llvm.add %15, %11  : i64
    %35 = llvm.mul %12, %10  : i64
    %36 = llvm.mul %12, %9  : i64
    %37 = llvm.add %35, %36  : i64
    %38 = llvm.mul %13, %8  : i64
    %39 = llvm.add %37, %38  : i64
    %40 = llvm.add %39, %34  : i64
    %41 = llvm.getelementptr %arg0[%40] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %42 = llvm.load %41 : !llvm.ptr -> f32
    %43 = llvm.fcmp "ugt" %42, %0 : f32
    %44 = llvm.select %43, %42, %0 : i1, f32
    %45 = llvm.mul %12, %10  : i64
    %46 = llvm.mul %12, %9  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.mul %13, %8  : i64
    %49 = llvm.add %47, %48  : i64
    %50 = llvm.add %49, %34  : i64
    %51 = llvm.getelementptr %arg1[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %44, %51 : f32, !llvm.ptr
    %52 = llvm.add %15, %3  : i64
    %53 = llvm.mul %12, %10  : i64
    %54 = llvm.mul %12, %9  : i64
    %55 = llvm.add %53, %54  : i64
    %56 = llvm.mul %13, %8  : i64
    %57 = llvm.add %55, %56  : i64
    %58 = llvm.add %57, %52  : i64
    %59 = llvm.getelementptr %arg0[%58] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %60 = llvm.load %59 : !llvm.ptr -> f32
    %61 = llvm.fcmp "ugt" %60, %0 : f32
    %62 = llvm.select %61, %60, %0 : i1, f32
    %63 = llvm.mul %12, %10  : i64
    %64 = llvm.mul %12, %9  : i64
    %65 = llvm.add %63, %64  : i64
    %66 = llvm.mul %13, %8  : i64
    %67 = llvm.add %65, %66  : i64
    %68 = llvm.add %67, %52  : i64
    %69 = llvm.getelementptr %arg1[%68] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %62, %69 : f32, !llvm.ptr
    %70 = llvm.add %15, %4  : i64
    %71 = llvm.mul %12, %10  : i64
    %72 = llvm.mul %12, %9  : i64
    %73 = llvm.add %71, %72  : i64
    %74 = llvm.mul %13, %8  : i64
    %75 = llvm.add %73, %74  : i64
    %76 = llvm.add %75, %70  : i64
    %77 = llvm.getelementptr %arg0[%76] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %78 = llvm.load %77 : !llvm.ptr -> f32
    %79 = llvm.fcmp "ugt" %78, %0 : f32
    %80 = llvm.select %79, %78, %0 : i1, f32
    %81 = llvm.mul %12, %10  : i64
    %82 = llvm.mul %12, %9  : i64
    %83 = llvm.add %81, %82  : i64
    %84 = llvm.mul %13, %8  : i64
    %85 = llvm.add %83, %84  : i64
    %86 = llvm.add %85, %70  : i64
    %87 = llvm.getelementptr %arg1[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %80, %87 : f32, !llvm.ptr
    %88 = llvm.add %15, %5  : i64
    %89 = llvm.mul %12, %10  : i64
    %90 = llvm.mul %12, %9  : i64
    %91 = llvm.add %89, %90  : i64
    %92 = llvm.mul %13, %8  : i64
    %93 = llvm.add %91, %92  : i64
    %94 = llvm.add %93, %88  : i64
    %95 = llvm.getelementptr %arg0[%94] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %96 = llvm.load %95 : !llvm.ptr -> f32
    %97 = llvm.fcmp "ugt" %96, %0 : f32
    %98 = llvm.select %97, %96, %0 : i1, f32
    %99 = llvm.mul %12, %10  : i64
    %100 = llvm.mul %12, %9  : i64
    %101 = llvm.add %99, %100  : i64
    %102 = llvm.mul %13, %8  : i64
    %103 = llvm.add %101, %102  : i64
    %104 = llvm.add %103, %88  : i64
    %105 = llvm.getelementptr %arg1[%104] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %98, %105 : f32, !llvm.ptr
    %106 = llvm.add %15, %6  : i64
    %107 = llvm.mul %12, %10  : i64
    %108 = llvm.mul %12, %9  : i64
    %109 = llvm.add %107, %108  : i64
    %110 = llvm.mul %13, %8  : i64
    %111 = llvm.add %109, %110  : i64
    %112 = llvm.add %111, %106  : i64
    %113 = llvm.getelementptr %arg0[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = llvm.fcmp "ugt" %114, %0 : f32
    %116 = llvm.select %115, %114, %0 : i1, f32
    %117 = llvm.mul %12, %10  : i64
    %118 = llvm.mul %12, %9  : i64
    %119 = llvm.add %117, %118  : i64
    %120 = llvm.mul %13, %8  : i64
    %121 = llvm.add %119, %120  : i64
    %122 = llvm.add %121, %106  : i64
    %123 = llvm.getelementptr %arg1[%122] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %116, %123 : f32, !llvm.ptr
    %124 = llvm.add %15, %7  : i64
    %125 = llvm.mul %12, %10  : i64
    %126 = llvm.mul %12, %9  : i64
    %127 = llvm.add %125, %126  : i64
    %128 = llvm.mul %13, %8  : i64
    %129 = llvm.add %127, %128  : i64
    %130 = llvm.add %129, %124  : i64
    %131 = llvm.getelementptr %arg0[%130] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %132 = llvm.load %131 : !llvm.ptr -> f32
    %133 = llvm.fcmp "ugt" %132, %0 : f32
    %134 = llvm.select %133, %132, %0 : i1, f32
    %135 = llvm.mul %12, %10  : i64
    %136 = llvm.mul %12, %9  : i64
    %137 = llvm.add %135, %136  : i64
    %138 = llvm.mul %13, %8  : i64
    %139 = llvm.add %137, %138  : i64
    %140 = llvm.add %139, %124  : i64
    %141 = llvm.getelementptr %arg1[%140] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %134, %141 : f32, !llvm.ptr
    %142 = llvm.add %15, %2  : i64
    llvm.br ^bb4(%142 : i64)
  ^bb6:  // pred: ^bb4
    %143 = llvm.add %13, %11  : i64
    llvm.br ^bb2(%143 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


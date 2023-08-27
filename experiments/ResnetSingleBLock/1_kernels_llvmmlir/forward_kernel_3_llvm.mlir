module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_3(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_3} {
    %0 = llvm.mlir.constant(4 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(114 : index) : i64
    %3 = llvm.mlir.constant(12996 : index) : i64
    %4 = llvm.mlir.constant(831744 : index) : i64
    %5 = llvm.mlir.constant(56 : index) : i64
    %6 = llvm.mlir.constant(3136 : index) : i64
    %7 = llvm.mlir.constant(200704 : index) : i64
    %8 = llvm.mlir.constant(1 : index) : i64
    %9 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%9 : i64)
  ^bb2(%10: i64):  // 2 preds: ^bb1, ^bb6
    %11 = llvm.icmp "slt" %10, %0 : i64
    llvm.cond_br %11, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%9 : i64)
  ^bb4(%12: i64):  // 2 preds: ^bb3, ^bb5
    %13 = llvm.icmp "slt" %12, %5 : i64
    llvm.cond_br %13, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %14 = llvm.mul %9, %7  : i64
    %15 = llvm.mul %9, %6  : i64
    %16 = llvm.add %14, %15  : i64
    %17 = llvm.mul %10, %5  : i64
    %18 = llvm.add %16, %17  : i64
    %19 = llvm.add %18, %12  : i64
    %20 = llvm.getelementptr %arg0[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    %22 = llvm.mul %10, %1  : i64
    %23 = llvm.mul %12, %1  : i64
    %24 = llvm.mul %9, %4  : i64
    %25 = llvm.mul %9, %3  : i64
    %26 = llvm.add %24, %25  : i64
    %27 = llvm.mul %22, %2  : i64
    %28 = llvm.add %26, %27  : i64
    %29 = llvm.add %28, %23  : i64
    %30 = llvm.getelementptr %arg1[%29] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %31 = llvm.load %30 : !llvm.ptr -> f32
    %32 = llvm.fcmp "ugt" %21, %31 : f32
    %33 = llvm.select %32, %21, %31 : i1, f32
    %34 = llvm.mul %10, %1  : i64
    %35 = llvm.mul %12, %1  : i64
    %36 = llvm.add %35, %8  : i64
    %37 = llvm.mul %9, %4  : i64
    %38 = llvm.mul %9, %3  : i64
    %39 = llvm.add %37, %38  : i64
    %40 = llvm.mul %34, %2  : i64
    %41 = llvm.add %39, %40  : i64
    %42 = llvm.add %41, %36  : i64
    %43 = llvm.getelementptr %arg1[%42] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %44 = llvm.load %43 : !llvm.ptr -> f32
    %45 = llvm.fcmp "ugt" %33, %44 : f32
    %46 = llvm.select %45, %33, %44 : i1, f32
    %47 = llvm.mul %10, %1  : i64
    %48 = llvm.mul %12, %1  : i64
    %49 = llvm.add %48, %1  : i64
    %50 = llvm.mul %9, %4  : i64
    %51 = llvm.mul %9, %3  : i64
    %52 = llvm.add %50, %51  : i64
    %53 = llvm.mul %47, %2  : i64
    %54 = llvm.add %52, %53  : i64
    %55 = llvm.add %54, %49  : i64
    %56 = llvm.getelementptr %arg1[%55] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %57 = llvm.load %56 : !llvm.ptr -> f32
    %58 = llvm.fcmp "ugt" %46, %57 : f32
    %59 = llvm.select %58, %46, %57 : i1, f32
    %60 = llvm.mul %10, %1  : i64
    %61 = llvm.add %60, %8  : i64
    %62 = llvm.mul %12, %1  : i64
    %63 = llvm.mul %9, %4  : i64
    %64 = llvm.mul %9, %3  : i64
    %65 = llvm.add %63, %64  : i64
    %66 = llvm.mul %61, %2  : i64
    %67 = llvm.add %65, %66  : i64
    %68 = llvm.add %67, %62  : i64
    %69 = llvm.getelementptr %arg1[%68] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %70 = llvm.load %69 : !llvm.ptr -> f32
    %71 = llvm.fcmp "ugt" %59, %70 : f32
    %72 = llvm.select %71, %59, %70 : i1, f32
    %73 = llvm.mul %10, %1  : i64
    %74 = llvm.add %73, %8  : i64
    %75 = llvm.mul %12, %1  : i64
    %76 = llvm.add %75, %8  : i64
    %77 = llvm.mul %9, %4  : i64
    %78 = llvm.mul %9, %3  : i64
    %79 = llvm.add %77, %78  : i64
    %80 = llvm.mul %74, %2  : i64
    %81 = llvm.add %79, %80  : i64
    %82 = llvm.add %81, %76  : i64
    %83 = llvm.getelementptr %arg1[%82] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %84 = llvm.load %83 : !llvm.ptr -> f32
    %85 = llvm.fcmp "ugt" %72, %84 : f32
    %86 = llvm.select %85, %72, %84 : i1, f32
    %87 = llvm.mul %10, %1  : i64
    %88 = llvm.add %87, %8  : i64
    %89 = llvm.mul %12, %1  : i64
    %90 = llvm.add %89, %1  : i64
    %91 = llvm.mul %9, %4  : i64
    %92 = llvm.mul %9, %3  : i64
    %93 = llvm.add %91, %92  : i64
    %94 = llvm.mul %88, %2  : i64
    %95 = llvm.add %93, %94  : i64
    %96 = llvm.add %95, %90  : i64
    %97 = llvm.getelementptr %arg1[%96] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %98 = llvm.load %97 : !llvm.ptr -> f32
    %99 = llvm.fcmp "ugt" %86, %98 : f32
    %100 = llvm.select %99, %86, %98 : i1, f32
    %101 = llvm.mul %10, %1  : i64
    %102 = llvm.add %101, %1  : i64
    %103 = llvm.mul %12, %1  : i64
    %104 = llvm.mul %9, %4  : i64
    %105 = llvm.mul %9, %3  : i64
    %106 = llvm.add %104, %105  : i64
    %107 = llvm.mul %102, %2  : i64
    %108 = llvm.add %106, %107  : i64
    %109 = llvm.add %108, %103  : i64
    %110 = llvm.getelementptr %arg1[%109] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %111 = llvm.load %110 : !llvm.ptr -> f32
    %112 = llvm.fcmp "ugt" %100, %111 : f32
    %113 = llvm.select %112, %100, %111 : i1, f32
    %114 = llvm.mul %10, %1  : i64
    %115 = llvm.add %114, %1  : i64
    %116 = llvm.mul %12, %1  : i64
    %117 = llvm.add %116, %8  : i64
    %118 = llvm.mul %9, %4  : i64
    %119 = llvm.mul %9, %3  : i64
    %120 = llvm.add %118, %119  : i64
    %121 = llvm.mul %115, %2  : i64
    %122 = llvm.add %120, %121  : i64
    %123 = llvm.add %122, %117  : i64
    %124 = llvm.getelementptr %arg1[%123] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %125 = llvm.load %124 : !llvm.ptr -> f32
    %126 = llvm.fcmp "ugt" %113, %125 : f32
    %127 = llvm.select %126, %113, %125 : i1, f32
    %128 = llvm.mul %10, %1  : i64
    %129 = llvm.add %128, %1  : i64
    %130 = llvm.mul %12, %1  : i64
    %131 = llvm.add %130, %1  : i64
    %132 = llvm.mul %9, %4  : i64
    %133 = llvm.mul %9, %3  : i64
    %134 = llvm.add %132, %133  : i64
    %135 = llvm.mul %129, %2  : i64
    %136 = llvm.add %134, %135  : i64
    %137 = llvm.add %136, %131  : i64
    %138 = llvm.getelementptr %arg1[%137] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %139 = llvm.load %138 : !llvm.ptr -> f32
    %140 = llvm.fcmp "ugt" %127, %139 : f32
    %141 = llvm.select %140, %127, %139 : i1, f32
    %142 = llvm.mul %9, %7  : i64
    %143 = llvm.mul %9, %6  : i64
    %144 = llvm.add %142, %143  : i64
    %145 = llvm.mul %10, %5  : i64
    %146 = llvm.add %144, %145  : i64
    %147 = llvm.add %146, %12  : i64
    %148 = llvm.getelementptr %arg2[%147] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %141, %148 : f32, !llvm.ptr
    %149 = llvm.add %12, %8  : i64
    llvm.br ^bb4(%149 : i64)
  ^bb6:  // pred: ^bb4
    %150 = llvm.add %10, %8  : i64
    llvm.br ^bb2(%150 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


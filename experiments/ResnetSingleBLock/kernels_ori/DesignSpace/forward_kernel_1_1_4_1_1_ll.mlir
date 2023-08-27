module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_1(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr) attributes {Kernel, forward_kernel_1} {
    %0 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(4 : index) : i64
    %3 = llvm.mlir.constant(5.000000e-01 : f32) : f32
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.mlir.constant(1597463007 : i32) : i32
    %6 = llvm.mlir.constant(1.500000e+00 : f32) : f32
    %7 = llvm.mlir.constant(2 : index) : i64
    %8 = llvm.mlir.constant(3 : index) : i64
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
    %16 = llvm.load %arg0 : !llvm.ptr -> f32
    %17 = llvm.load %arg1 : !llvm.ptr -> f32
    %18 = llvm.load %arg2 : !llvm.ptr -> f32
    %19 = llvm.load %arg3 : !llvm.ptr -> f32
    llvm.br ^bb4(%13 : i64)
  ^bb4(%20: i64):  // 2 preds: ^bb3, ^bb5
    %21 = llvm.icmp "slt" %20, %9 : i64
    llvm.cond_br %21, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %22 = llvm.mul %13, %11  : i64
    %23 = llvm.mul %13, %10  : i64
    %24 = llvm.add %22, %23  : i64
    %25 = llvm.mul %14, %9  : i64
    %26 = llvm.add %24, %25  : i64
    %27 = llvm.add %26, %20  : i64
    %28 = llvm.getelementptr %arg4[%27] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %29 = llvm.load %28 : !llvm.ptr -> f32
    %30 = llvm.fptrunc %0 : f64 to f32
    %31 = llvm.fadd %19, %30  : f32
    %32 = llvm.fmul %31, %3  : f32
    %33 = llvm.bitcast %31 : f32 to i32
    %34 = llvm.lshr %33, %4  : i32
    %35 = llvm.sub %5, %34  : i32
    %36 = llvm.bitcast %35 : i32 to f32
    %37 = llvm.fmul %36, %36  : f32
    %38 = llvm.fmul %37, %32  : f32
    %39 = llvm.fsub %6, %38  : f32
    %40 = llvm.fmul %39, %37  : f32
    %41 = llvm.fsub %29, %18  : f32
    %42 = llvm.fmul %41, %40  : f32
    %43 = llvm.fmul %42, %16  : f32
    %44 = llvm.fadd %43, %17  : f32
    %45 = llvm.mul %13, %11  : i64
    %46 = llvm.mul %13, %10  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.mul %14, %9  : i64
    %49 = llvm.add %47, %48  : i64
    %50 = llvm.add %49, %20  : i64
    %51 = llvm.getelementptr %arg5[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %44, %51 : f32, !llvm.ptr
    %52 = llvm.add %20, %12  : i64
    %53 = llvm.mul %13, %11  : i64
    %54 = llvm.mul %13, %10  : i64
    %55 = llvm.add %53, %54  : i64
    %56 = llvm.mul %14, %9  : i64
    %57 = llvm.add %55, %56  : i64
    %58 = llvm.add %57, %52  : i64
    %59 = llvm.getelementptr %arg4[%58] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %60 = llvm.load %59 : !llvm.ptr -> f32
    %61 = llvm.fptrunc %0 : f64 to f32
    %62 = llvm.fadd %19, %61  : f32
    %63 = llvm.fmul %62, %3  : f32
    %64 = llvm.bitcast %62 : f32 to i32
    %65 = llvm.lshr %64, %4  : i32
    %66 = llvm.sub %5, %65  : i32
    %67 = llvm.bitcast %66 : i32 to f32
    %68 = llvm.fmul %67, %67  : f32
    %69 = llvm.fmul %68, %63  : f32
    %70 = llvm.fsub %6, %69  : f32
    %71 = llvm.fmul %70, %68  : f32
    %72 = llvm.fsub %60, %18  : f32
    %73 = llvm.fmul %72, %71  : f32
    %74 = llvm.fmul %73, %16  : f32
    %75 = llvm.fadd %74, %17  : f32
    %76 = llvm.mul %13, %11  : i64
    %77 = llvm.mul %13, %10  : i64
    %78 = llvm.add %76, %77  : i64
    %79 = llvm.mul %14, %9  : i64
    %80 = llvm.add %78, %79  : i64
    %81 = llvm.add %80, %52  : i64
    %82 = llvm.getelementptr %arg5[%81] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %75, %82 : f32, !llvm.ptr
    %83 = llvm.add %20, %7  : i64
    %84 = llvm.mul %13, %11  : i64
    %85 = llvm.mul %13, %10  : i64
    %86 = llvm.add %84, %85  : i64
    %87 = llvm.mul %14, %9  : i64
    %88 = llvm.add %86, %87  : i64
    %89 = llvm.add %88, %83  : i64
    %90 = llvm.getelementptr %arg4[%89] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %91 = llvm.load %90 : !llvm.ptr -> f32
    %92 = llvm.fptrunc %0 : f64 to f32
    %93 = llvm.fadd %19, %92  : f32
    %94 = llvm.fmul %93, %3  : f32
    %95 = llvm.bitcast %93 : f32 to i32
    %96 = llvm.lshr %95, %4  : i32
    %97 = llvm.sub %5, %96  : i32
    %98 = llvm.bitcast %97 : i32 to f32
    %99 = llvm.fmul %98, %98  : f32
    %100 = llvm.fmul %99, %94  : f32
    %101 = llvm.fsub %6, %100  : f32
    %102 = llvm.fmul %101, %99  : f32
    %103 = llvm.fsub %91, %18  : f32
    %104 = llvm.fmul %103, %102  : f32
    %105 = llvm.fmul %104, %16  : f32
    %106 = llvm.fadd %105, %17  : f32
    %107 = llvm.mul %13, %11  : i64
    %108 = llvm.mul %13, %10  : i64
    %109 = llvm.add %107, %108  : i64
    %110 = llvm.mul %14, %9  : i64
    %111 = llvm.add %109, %110  : i64
    %112 = llvm.add %111, %83  : i64
    %113 = llvm.getelementptr %arg5[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %106, %113 : f32, !llvm.ptr
    %114 = llvm.add %20, %8  : i64
    %115 = llvm.mul %13, %11  : i64
    %116 = llvm.mul %13, %10  : i64
    %117 = llvm.add %115, %116  : i64
    %118 = llvm.mul %14, %9  : i64
    %119 = llvm.add %117, %118  : i64
    %120 = llvm.add %119, %114  : i64
    %121 = llvm.getelementptr %arg4[%120] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %122 = llvm.load %121 : !llvm.ptr -> f32
    %123 = llvm.fptrunc %0 : f64 to f32
    %124 = llvm.fadd %19, %123  : f32
    %125 = llvm.fmul %124, %3  : f32
    %126 = llvm.bitcast %124 : f32 to i32
    %127 = llvm.lshr %126, %4  : i32
    %128 = llvm.sub %5, %127  : i32
    %129 = llvm.bitcast %128 : i32 to f32
    %130 = llvm.fmul %129, %129  : f32
    %131 = llvm.fmul %130, %125  : f32
    %132 = llvm.fsub %6, %131  : f32
    %133 = llvm.fmul %132, %130  : f32
    %134 = llvm.fsub %122, %18  : f32
    %135 = llvm.fmul %134, %133  : f32
    %136 = llvm.fmul %135, %16  : f32
    %137 = llvm.fadd %136, %17  : f32
    %138 = llvm.mul %13, %11  : i64
    %139 = llvm.mul %13, %10  : i64
    %140 = llvm.add %138, %139  : i64
    %141 = llvm.mul %14, %9  : i64
    %142 = llvm.add %140, %141  : i64
    %143 = llvm.add %142, %114  : i64
    %144 = llvm.getelementptr %arg5[%143] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %137, %144 : f32, !llvm.ptr
    %145 = llvm.add %20, %2  : i64
    llvm.br ^bb4(%145 : i64)
  ^bb6:  // pred: ^bb4
    %146 = llvm.add %14, %12  : i64
    llvm.br ^bb2(%146 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


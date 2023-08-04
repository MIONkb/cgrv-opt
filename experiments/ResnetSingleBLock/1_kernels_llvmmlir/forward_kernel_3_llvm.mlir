module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_3(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: !llvm.ptr) attributes {Kernel, forward_kernel_3} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.mlir.constant(64 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %10 = llvm.insertvalue %arg1, %9[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg1, %10[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(64 : index) : i64
    %15 = llvm.insertvalue %14, %13[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.insertvalue %16, %15[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %19 = llvm.insertvalue %arg2, %18[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.insertvalue %arg2, %19[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.mlir.constant(0 : index) : i64
    %22 = llvm.insertvalue %21, %20[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.mlir.constant(64 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %28 = llvm.insertvalue %arg3, %27[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %29 = llvm.insertvalue %arg3, %28[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %30 = llvm.mlir.constant(0 : index) : i64
    %31 = llvm.insertvalue %30, %29[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %32 = llvm.mlir.constant(64 : index) : i64
    %33 = llvm.insertvalue %32, %31[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %34 = llvm.mlir.constant(1 : index) : i64
    %35 = llvm.insertvalue %34, %33[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %37 = llvm.insertvalue %arg4, %36[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.insertvalue %arg4, %37[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %39 = llvm.mlir.constant(0 : index) : i64
    %40 = llvm.insertvalue %39, %38[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %41 = llvm.mlir.constant(1 : index) : i64
    %42 = llvm.insertvalue %41, %40[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %43 = llvm.mlir.constant(802816 : index) : i64
    %44 = llvm.insertvalue %43, %42[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %45 = llvm.mlir.constant(64 : index) : i64
    %46 = llvm.insertvalue %45, %44[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(12544 : index) : i64
    %48 = llvm.insertvalue %47, %46[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(112 : index) : i64
    %50 = llvm.insertvalue %49, %48[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(112 : index) : i64
    %52 = llvm.insertvalue %51, %50[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(112 : index) : i64
    %54 = llvm.insertvalue %53, %52[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(1 : index) : i64
    %56 = llvm.insertvalue %55, %54[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %58 = llvm.insertvalue %arg5, %57[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.insertvalue %arg5, %58[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %60 = llvm.mlir.constant(0 : index) : i64
    %61 = llvm.insertvalue %60, %59[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %62 = llvm.mlir.constant(1 : index) : i64
    %63 = llvm.insertvalue %62, %61[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %64 = llvm.mlir.constant(802816 : index) : i64
    %65 = llvm.insertvalue %64, %63[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(64 : index) : i64
    %67 = llvm.insertvalue %66, %65[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %68 = llvm.mlir.constant(12544 : index) : i64
    %69 = llvm.insertvalue %68, %67[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %70 = llvm.mlir.constant(112 : index) : i64
    %71 = llvm.insertvalue %70, %69[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %72 = llvm.mlir.constant(112 : index) : i64
    %73 = llvm.insertvalue %72, %71[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %74 = llvm.mlir.constant(112 : index) : i64
    %75 = llvm.insertvalue %74, %73[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %76 = llvm.mlir.constant(1 : index) : i64
    %77 = llvm.insertvalue %76, %75[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %78 = llvm.mlir.constant(112 : index) : i64
    %79 = llvm.mlir.constant(64 : index) : i64
    %80 = llvm.mlir.constant(1 : index) : i64
    %81 = llvm.mlir.constant(0 : index) : i64
    %82 = llvm.mlir.constant(1.000000e-05 : f64) : f64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%81 : i64)
  ^bb2(%83: i64):  // 2 preds: ^bb1, ^bb12
    %84 = llvm.icmp "slt" %83, %80 : i64
    llvm.cond_br %84, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%81 : i64)
  ^bb4(%85: i64):  // 2 preds: ^bb3, ^bb11
    %86 = llvm.icmp "slt" %85, %79 : i64
    llvm.cond_br %86, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    %87 = llvm.extractvalue %8[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %88 = llvm.getelementptr %87[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %89 = llvm.load %88 : !llvm.ptr -> f32
    %90 = llvm.extractvalue %17[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %91 = llvm.getelementptr %90[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %92 = llvm.load %91 : !llvm.ptr -> f32
    %93 = llvm.extractvalue %26[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %94 = llvm.getelementptr %93[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %95 = llvm.load %94 : !llvm.ptr -> f32
    %96 = llvm.extractvalue %35[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %97 = llvm.getelementptr %96[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %98 = llvm.load %97 : !llvm.ptr -> f32
    llvm.br ^bb6(%81 : i64)
  ^bb6(%99: i64):  // 2 preds: ^bb5, ^bb10
    %100 = llvm.icmp "slt" %99, %78 : i64
    llvm.cond_br %100, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%81 : i64)
  ^bb8(%101: i64):  // 2 preds: ^bb7, ^bb9
    %102 = llvm.icmp "slt" %101, %78 : i64
    llvm.cond_br %102, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %103 = llvm.extractvalue %56[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %104 = llvm.mlir.constant(802816 : index) : i64
    %105 = llvm.mul %83, %104  : i64
    %106 = llvm.mlir.constant(12544 : index) : i64
    %107 = llvm.mul %85, %106  : i64
    %108 = llvm.add %105, %107  : i64
    %109 = llvm.mlir.constant(112 : index) : i64
    %110 = llvm.mul %99, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.add %111, %101  : i64
    %113 = llvm.getelementptr %103[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = llvm.fptrunc %82 : f64 to f32
    %116 = llvm.fadd %98, %115  : f32
    %117 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %118 = llvm.intr.sqrt(%116)  : (f32) -> f32
    %119 = llvm.fdiv %117, %118  : f32
    %120 = llvm.fsub %114, %95  : f32
    %121 = llvm.fmul %120, %119  : f32
    %122 = llvm.fmul %121, %89  : f32
    %123 = llvm.fadd %122, %92  : f32
    %124 = llvm.extractvalue %77[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %125 = llvm.mlir.constant(802816 : index) : i64
    %126 = llvm.mul %83, %125  : i64
    %127 = llvm.mlir.constant(12544 : index) : i64
    %128 = llvm.mul %85, %127  : i64
    %129 = llvm.add %126, %128  : i64
    %130 = llvm.mlir.constant(112 : index) : i64
    %131 = llvm.mul %99, %130  : i64
    %132 = llvm.add %129, %131  : i64
    %133 = llvm.add %132, %101  : i64
    %134 = llvm.getelementptr %124[%133] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %123, %134 : f32, !llvm.ptr
    %135 = llvm.add %101, %80  : i64
    llvm.br ^bb8(%135 : i64)
  ^bb10:  // pred: ^bb8
    %136 = llvm.add %99, %80  : i64
    llvm.br ^bb6(%136 : i64)
  ^bb11:  // pred: ^bb6
    %137 = llvm.add %85, %80  : i64
    llvm.br ^bb4(%137 : i64)
  ^bb12:  // pred: ^bb4
    %138 = llvm.add %83, %80  : i64
    llvm.br ^bb2(%138 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}


module attributes {llvm.data_layout = ""} {
  llvm.func @main_kernel_4(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>, %arg2: !llvm.ptr<f32>) attributes {main_kernel_4} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(1225 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(35 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(35 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(35 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(1 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)>
    %22 = llvm.insertvalue %arg1, %21[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %23 = llvm.insertvalue %arg1, %22[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.insertvalue %24, %23[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %26 = llvm.mlir.constant(5 : index) : i64
    %27 = llvm.insertvalue %26, %25[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %28 = llvm.mlir.constant(5 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(5 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(1 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(1 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(1 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(1 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)>
    %43 = llvm.insertvalue %arg2, %42[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %44 = llvm.insertvalue %arg2, %43[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.insertvalue %45, %44[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(4 : index) : i64
    %48 = llvm.insertvalue %47, %46[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(256 : index) : i64
    %50 = llvm.insertvalue %49, %48[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(16 : index) : i64
    %52 = llvm.insertvalue %51, %50[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(16 : index) : i64
    %54 = llvm.insertvalue %53, %52[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(16 : index) : i64
    %56 = llvm.insertvalue %55, %54[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(1 : index) : i64
    %58 = llvm.insertvalue %57, %56[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(1 : index) : i64
    %60 = llvm.insertvalue %59, %58[3, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %61 = llvm.mlir.constant(1 : index) : i64
    %62 = llvm.insertvalue %61, %60[4, 3] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %63 = llvm.mlir.constant(2 : index) : i64
    %64 = llvm.mlir.constant(5 : index) : i64
    %65 = llvm.mlir.constant(16 : index) : i64
    %66 = llvm.mlir.constant(1 : index) : i64
    %67 = llvm.mlir.constant(4 : index) : i64
    %68 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%68 : i64)
  ^bb2(%69: i64):  // 2 preds: ^bb1, ^bb21
    %70 = llvm.icmp "slt" %69, %67 : i64
    llvm.cond_br %70, ^bb3, ^bb22
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%68 : i64)
  ^bb4(%71: i64):  // 2 preds: ^bb3, ^bb20
    %72 = llvm.icmp "slt" %71, %65 : i64
    llvm.cond_br %72, ^bb5, ^bb21
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%68 : i64)
  ^bb6(%73: i64):  // 2 preds: ^bb5, ^bb19
    %74 = llvm.icmp "slt" %73, %65 : i64
    llvm.cond_br %74, ^bb7, ^bb20
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%68 : i64)
  ^bb8(%75: i64):  // 2 preds: ^bb7, ^bb18
    %76 = llvm.icmp "slt" %75, %66 : i64
    llvm.cond_br %76, ^bb9, ^bb19
  ^bb9:  // pred: ^bb8
    llvm.br ^bb10(%68 : i64)
  ^bb10(%77: i64):  // 2 preds: ^bb9, ^bb17
    %78 = llvm.icmp "slt" %77, %64 : i64
    llvm.cond_br %78, ^bb11, ^bb18
  ^bb11:  // pred: ^bb10
    llvm.br ^bb12(%68 : i64)
  ^bb12(%79: i64):  // 2 preds: ^bb11, ^bb16
    %80 = llvm.icmp "slt" %79, %64 : i64
    llvm.cond_br %80, ^bb13, ^bb17
  ^bb13:  // pred: ^bb12
    llvm.br ^bb14(%68 : i64)
  ^bb14(%81: i64):  // 2 preds: ^bb13, ^bb15
    %82 = llvm.icmp "slt" %81, %66 : i64
    llvm.cond_br %82, ^bb15, ^bb16
  ^bb15:  // pred: ^bb14
    %83 = llvm.mul %71, %63  : i64
    %84 = llvm.add %83, %77  : i64
    %85 = llvm.mul %73, %63  : i64
    %86 = llvm.add %85, %79  : i64
    %87 = llvm.extractvalue %20[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %88 = llvm.mlir.constant(1225 : index) : i64
    %89 = llvm.mul %69, %88  : i64
    %90 = llvm.mlir.constant(35 : index) : i64
    %91 = llvm.mul %84, %90  : i64
    %92 = llvm.add %89, %91  : i64
    %93 = llvm.add %92, %86  : i64
    %94 = llvm.add %93, %81  : i64
    %95 = llvm.getelementptr %87[%94] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %96 = llvm.load %95 : !llvm.ptr<f32>
    %97 = llvm.extractvalue %41[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %98 = llvm.mlir.constant(5 : index) : i64
    %99 = llvm.mul %77, %98  : i64
    %100 = llvm.add %99, %79  : i64
    %101 = llvm.add %100, %81  : i64
    %102 = llvm.add %101, %75  : i64
    %103 = llvm.getelementptr %97[%102] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %104 = llvm.load %103 : !llvm.ptr<f32>
    %105 = llvm.extractvalue %62[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %106 = llvm.mlir.constant(256 : index) : i64
    %107 = llvm.mul %69, %106  : i64
    %108 = llvm.mlir.constant(16 : index) : i64
    %109 = llvm.mul %71, %108  : i64
    %110 = llvm.add %107, %109  : i64
    %111 = llvm.add %110, %73  : i64
    %112 = llvm.add %111, %75  : i64
    %113 = llvm.getelementptr %105[%112] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %114 = llvm.load %113 : !llvm.ptr<f32>
    %115 = llvm.fmul %96, %104  : f32
    %116 = llvm.fadd %114, %115  : f32
    %117 = llvm.extractvalue %62[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<4 x i64>, array<4 x i64>)> 
    %118 = llvm.mlir.constant(256 : index) : i64
    %119 = llvm.mul %69, %118  : i64
    %120 = llvm.mlir.constant(16 : index) : i64
    %121 = llvm.mul %71, %120  : i64
    %122 = llvm.add %119, %121  : i64
    %123 = llvm.add %122, %73  : i64
    %124 = llvm.add %123, %75  : i64
    %125 = llvm.getelementptr %117[%124] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %116, %125 : !llvm.ptr<f32>
    %126 = llvm.add %81, %66  : i64
    llvm.br ^bb14(%126 : i64)
  ^bb16:  // pred: ^bb14
    %127 = llvm.add %79, %66  : i64
    llvm.br ^bb12(%127 : i64)
  ^bb17:  // pred: ^bb12
    %128 = llvm.add %77, %66  : i64
    llvm.br ^bb10(%128 : i64)
  ^bb18:  // pred: ^bb10
    %129 = llvm.add %75, %66  : i64
    llvm.br ^bb8(%129 : i64)
  ^bb19:  // pred: ^bb8
    %130 = llvm.add %73, %66  : i64
    llvm.br ^bb6(%130 : i64)
  ^bb20:  // pred: ^bb6
    %131 = llvm.add %71, %66  : i64
    llvm.br ^bb4(%131 : i64)
  ^bb21:  // pred: ^bb4
    %132 = llvm.add %69, %66  : i64
    llvm.br ^bb2(%132 : i64)
  ^bb22:  // pred: ^bb2
    llvm.return
  }
}


module attributes {llvm.data_layout = ""} {
  llvm.func @main_kernel_16(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>, %arg2: !llvm.ptr<f32>) attributes {main_kernel_16} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %7 = llvm.mlir.constant(16 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %9 = llvm.mlir.constant(4 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %11 = llvm.mlir.constant(4 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %13 = llvm.mlir.constant(4 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %17 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)>
    %18 = llvm.insertvalue %arg1, %17[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %19 = llvm.insertvalue %arg1, %18[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %20 = llvm.mlir.constant(0 : index) : i64
    %21 = llvm.insertvalue %20, %19[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %22 = llvm.mlir.constant(1 : index) : i64
    %23 = llvm.insertvalue %22, %21[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %24 = llvm.mlir.constant(8 : index) : i64
    %25 = llvm.insertvalue %24, %23[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %26 = llvm.mlir.constant(4 : index) : i64
    %27 = llvm.insertvalue %26, %25[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %28 = llvm.mlir.constant(2 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %30 = llvm.mlir.constant(2 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %32 = llvm.mlir.constant(1 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %34 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)>
    %35 = llvm.insertvalue %arg2, %34[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %36 = llvm.insertvalue %arg2, %35[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %37 = llvm.mlir.constant(0 : index) : i64
    %38 = llvm.insertvalue %37, %36[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.insertvalue %39, %38[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %41 = llvm.mlir.constant(8 : index) : i64
    %42 = llvm.insertvalue %41, %40[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %43 = llvm.mlir.constant(4 : index) : i64
    %44 = llvm.insertvalue %43, %42[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %45 = llvm.mlir.constant(2 : index) : i64
    %46 = llvm.insertvalue %45, %44[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %47 = llvm.mlir.constant(2 : index) : i64
    %48 = llvm.insertvalue %47, %46[3, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %49 = llvm.mlir.constant(1 : index) : i64
    %50 = llvm.insertvalue %49, %48[4, 2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %51 = llvm.mlir.constant(2 : index) : i64
    %52 = llvm.mlir.constant(4 : index) : i64
    %53 = llvm.mlir.constant(1 : index) : i64
    %54 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%54 : i64)
  ^bb2(%55: i64):  // 2 preds: ^bb1, ^bb12
    %56 = llvm.icmp "slt" %55, %53 : i64
    llvm.cond_br %56, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%54 : i64)
  ^bb4(%57: i64):  // 2 preds: ^bb3, ^bb11
    %58 = llvm.icmp "slt" %57, %52 : i64
    llvm.cond_br %58, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%54 : i64)
  ^bb6(%59: i64):  // 2 preds: ^bb5, ^bb10
    %60 = llvm.icmp "slt" %59, %51 : i64
    llvm.cond_br %60, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%54 : i64)
  ^bb8(%61: i64):  // 2 preds: ^bb7, ^bb9
    %62 = llvm.icmp "slt" %61, %52 : i64
    llvm.cond_br %62, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %63 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %64 = llvm.mlir.constant(16 : index) : i64
    %65 = llvm.mul %55, %64  : i64
    %66 = llvm.mlir.constant(4 : index) : i64
    %67 = llvm.mul %57, %66  : i64
    %68 = llvm.add %65, %67  : i64
    %69 = llvm.add %68, %61  : i64
    %70 = llvm.getelementptr %63[%69] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %71 = llvm.load %70 : !llvm.ptr<f32>
    %72 = llvm.extractvalue %33[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %73 = llvm.mlir.constant(8 : index) : i64
    %74 = llvm.mul %55, %73  : i64
    %75 = llvm.mlir.constant(2 : index) : i64
    %76 = llvm.mul %61, %75  : i64
    %77 = llvm.add %74, %76  : i64
    %78 = llvm.add %77, %59  : i64
    %79 = llvm.getelementptr %72[%78] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %80 = llvm.load %79 : !llvm.ptr<f32>
    %81 = llvm.extractvalue %50[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %82 = llvm.mlir.constant(8 : index) : i64
    %83 = llvm.mul %55, %82  : i64
    %84 = llvm.mlir.constant(2 : index) : i64
    %85 = llvm.mul %57, %84  : i64
    %86 = llvm.add %83, %85  : i64
    %87 = llvm.add %86, %59  : i64
    %88 = llvm.getelementptr %81[%87] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %89 = llvm.load %88 : !llvm.ptr<f32>
    %90 = llvm.fmul %71, %80  : f32
    %91 = llvm.fadd %89, %90  : f32
    %92 = llvm.extractvalue %50[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<3 x i64>, array<3 x i64>)> 
    %93 = llvm.mlir.constant(8 : index) : i64
    %94 = llvm.mul %55, %93  : i64
    %95 = llvm.mlir.constant(2 : index) : i64
    %96 = llvm.mul %57, %95  : i64
    %97 = llvm.add %94, %96  : i64
    %98 = llvm.add %97, %59  : i64
    %99 = llvm.getelementptr %92[%98] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %91, %99 : !llvm.ptr<f32>
    %100 = llvm.add %61, %53  : i64
    llvm.br ^bb8(%100 : i64)
  ^bb10:  // pred: ^bb8
    %101 = llvm.add %59, %53  : i64
    llvm.br ^bb6(%101 : i64)
  ^bb11:  // pred: ^bb6
    %102 = llvm.add %57, %53  : i64
    llvm.br ^bb4(%102 : i64)
  ^bb12:  // pred: ^bb4
    %103 = llvm.add %55, %53  : i64
    llvm.br ^bb2(%103 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}


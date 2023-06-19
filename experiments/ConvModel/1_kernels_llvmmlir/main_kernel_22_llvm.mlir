module attributes {llvm.data_layout = ""} {
  llvm.func @main_kernel_22(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>, %arg2: !llvm.ptr<f32>) attributes {main_kernel_22} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(2 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(2 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)>
    %14 = llvm.insertvalue %arg1, %13[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %15 = llvm.insertvalue %arg1, %14[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.insertvalue %16, %15[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.mlir.constant(4 : index) : i64
    %19 = llvm.insertvalue %18, %17[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.mlir.constant(1 : index) : i64
    %21 = llvm.insertvalue %20, %19[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %23 = llvm.insertvalue %arg2, %22[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.insertvalue %arg2, %23[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %25 = llvm.mlir.constant(0 : index) : i64
    %26 = llvm.insertvalue %25, %24[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.mlir.constant(4 : index) : i64
    %28 = llvm.insertvalue %27, %26[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.mlir.constant(2 : index) : i64
    %30 = llvm.insertvalue %29, %28[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(2 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(1 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(2 : index) : i64
    %36 = llvm.mlir.constant(1 : index) : i64
    %37 = llvm.mlir.constant(4 : index) : i64
    %38 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%38 : i64)
  ^bb2(%39: i64):  // 2 preds: ^bb1, ^bb6
    %40 = llvm.icmp "slt" %39, %37 : i64
    llvm.cond_br %40, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%38 : i64)
  ^bb4(%41: i64):  // 2 preds: ^bb3, ^bb5
    %42 = llvm.icmp "slt" %41, %35 : i64
    llvm.cond_br %42, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %43 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %44 = llvm.mlir.constant(2 : index) : i64
    %45 = llvm.mul %39, %44  : i64
    %46 = llvm.add %45, %41  : i64
    %47 = llvm.getelementptr %43[%46] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %48 = llvm.load %47 : !llvm.ptr<f32>
    %49 = llvm.extractvalue %21[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<1 x i64>, array<1 x i64>)> 
    %50 = llvm.getelementptr %49[%39] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %51 = llvm.load %50 : !llvm.ptr<f32>
    %52 = llvm.fmul %48, %51  : f32
    %53 = llvm.extractvalue %34[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.mlir.constant(2 : index) : i64
    %55 = llvm.mul %39, %54  : i64
    %56 = llvm.add %55, %41  : i64
    %57 = llvm.getelementptr %53[%56] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %52, %57 : !llvm.ptr<f32>
    %58 = llvm.add %41, %36  : i64
    llvm.br ^bb4(%58 : i64)
  ^bb6:  // pred: ^bb4
    %59 = llvm.add %39, %36  : i64
    llvm.br ^bb2(%59 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


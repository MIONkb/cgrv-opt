module attributes {llvm.data_layout = ""} {
  llvm.func @gemm_kernel_0(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>, %arg2: !llvm.ptr<i32>) attributes {gemm_kernel_0} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.mlir.constant(1024 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %10 = llvm.insertvalue %arg1, %9[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg1, %10[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(1024 : index) : i64
    %15 = llvm.insertvalue %14, %13[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.insertvalue %16, %15[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %19 = llvm.insertvalue %arg2, %18[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.insertvalue %arg2, %19[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.mlir.constant(0 : index) : i64
    %22 = llvm.insertvalue %21, %20[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.mlir.constant(1024 : index) : i64
    %24 = llvm.insertvalue %23, %22[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.mlir.constant(1 : index) : i64
    %26 = llvm.insertvalue %25, %24[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.mlir.constant(32 : index) : i64
    %29 = llvm.mlir.constant(0 : index) : i64
    %30 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%29 : i64)
  ^bb2(%31: i64):  // 2 preds: ^bb1, ^bb9
    %32 = llvm.icmp "slt" %31, %28 : i64
    llvm.cond_br %32, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%29 : i64)
  ^bb4(%33: i64):  // 2 preds: ^bb3, ^bb8
    %34 = llvm.icmp "slt" %33, %28 : i64
    llvm.cond_br %34, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%29, %30 : i64, i32)
  ^bb6(%35: i64, %36: i32):  // 2 preds: ^bb5, ^bb7
    %37 = llvm.icmp "slt" %35, %28 : i64
    llvm.cond_br %37, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %38 = llvm.mul %31, %28  : i64
    %39 = llvm.add %35, %38  : i64
    %40 = llvm.extractvalue %8[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %41 = llvm.getelementptr %40[%39] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %42 = llvm.load %41 : !llvm.ptr<i32>
    %43 = llvm.mul %35, %28  : i64
    %44 = llvm.add %33, %43  : i64
    %45 = llvm.extractvalue %17[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %46 = llvm.getelementptr %45[%44] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %47 = llvm.load %46 : !llvm.ptr<i32>
    %48 = llvm.mul %42, %47  : i32
    %49 = llvm.add %36, %48  : i32
    %50 = llvm.add %35, %27  : i64
    llvm.br ^bb6(%50, %49 : i64, i32)
  ^bb8:  // pred: ^bb6
    %51 = llvm.mul %31, %28  : i64
    %52 = llvm.add %33, %51  : i64
    %53 = llvm.extractvalue %26[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %54 = llvm.getelementptr %53[%52] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %36, %54 : !llvm.ptr<i32>
    %55 = llvm.add %33, %27  : i64
    llvm.br ^bb4(%55 : i64)
  ^bb9:  // pred: ^bb4
    %56 = llvm.add %31, %27  : i64
    llvm.br ^bb2(%56 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}


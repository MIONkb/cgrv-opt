module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>, %arg2: !llvm.ptr<i32>) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg1, %13[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg1, %14[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.insertvalue %16, %15[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.insertvalue %18, %17[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.constant(3 : index) : i64
    %21 = llvm.insertvalue %20, %19[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.mlir.constant(3 : index) : i64
    %23 = llvm.insertvalue %22, %21[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(1 : index) : i64
    %25 = llvm.insertvalue %24, %23[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %27 = llvm.insertvalue %arg2, %26[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.insertvalue %arg2, %27[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.mlir.constant(0 : index) : i64
    %30 = llvm.insertvalue %29, %28[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(2 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(1 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.mlir.constant(3 : index) : i64
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.mlir.constant(2 : index) : i64
    %42 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%42 : i64)
  ^bb2(%43: i64):  // 2 preds: ^bb1, ^bb9
    %44 = llvm.icmp "slt" %43, %41 : i64
    llvm.cond_br %44, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%42 : i64)
  ^bb4(%45: i64):  // 2 preds: ^bb3, ^bb8
    %46 = llvm.icmp "slt" %45, %39 : i64
    llvm.cond_br %46, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    %47 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.mlir.constant(3 : index) : i64
    %49 = llvm.mul %43, %48  : i64
    %50 = llvm.add %49, %45  : i64
    %51 = llvm.getelementptr %47[%50] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %52 = llvm.load %51 : !llvm.ptr<i32>
    llvm.br ^bb6(%42, %52 : i64, i32)
  ^bb6(%53: i64, %54: i32):  // 2 preds: ^bb5, ^bb7
    %55 = llvm.icmp "slt" %53, %39 : i64
    llvm.cond_br %55, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %56 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %57 = llvm.mlir.constant(3 : index) : i64
    %58 = llvm.mul %43, %57  : i64
    %59 = llvm.add %58, %53  : i64
    %60 = llvm.getelementptr %56[%59] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %61 = llvm.load %60 : !llvm.ptr<i32>
    %62 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %63 = llvm.mlir.constant(3 : index) : i64
    %64 = llvm.mul %53, %63  : i64
    %65 = llvm.add %64, %45  : i64
    %66 = llvm.getelementptr %62[%65] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %67 = llvm.load %66 : !llvm.ptr<i32>
    %68 = llvm.mul %61, %67  : i32
    %69 = llvm.add %54, %68  : i32
    %70 = llvm.add %53, %40  : i64
    llvm.br ^bb6(%70, %69 : i64, i32)
  ^bb8:  // pred: ^bb6
    %71 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %72 = llvm.mlir.constant(3 : index) : i64
    %73 = llvm.mul %43, %72  : i64
    %74 = llvm.add %73, %45  : i64
    %75 = llvm.getelementptr %71[%74] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %54, %75 : !llvm.ptr<i32>
    %76 = llvm.add %45, %40  : i64
    llvm.br ^bb4(%76 : i64)
  ^bb9:  // pred: ^bb4
    %77 = llvm.add %43, %40  : i64
    llvm.br ^bb2(%77 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}


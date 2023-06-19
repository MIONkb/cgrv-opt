module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr<f32>, %arg1: !llvm.ptr<f32>, %arg2: !llvm.ptr<f32>) attributes {forward_kernel_2} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %14 = llvm.insertvalue %arg1, %13[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.insertvalue %arg1, %14[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.insertvalue %16, %15[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.insertvalue %18, %17[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.mlir.constant(3 : index) : i64
    %21 = llvm.insertvalue %20, %19[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.mlir.constant(3 : index) : i64
    %23 = llvm.insertvalue %22, %21[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.mlir.constant(1 : index) : i64
    %25 = llvm.insertvalue %24, %23[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %27 = llvm.insertvalue %arg2, %26[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.insertvalue %arg2, %27[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.mlir.constant(0 : index) : i64
    %30 = llvm.insertvalue %29, %28[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(4 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.mlir.constant(3 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(1 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %39 = llvm.mlir.constant(3 : index) : i64
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.mlir.constant(4 : index) : i64
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
    llvm.br ^bb6(%42 : i64)
  ^bb6(%47: i64):  // 2 preds: ^bb5, ^bb7
    %48 = llvm.icmp "slt" %47, %39 : i64
    llvm.cond_br %48, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %49 = llvm.extractvalue %12[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.mlir.constant(3 : index) : i64
    %51 = llvm.mul %43, %50  : i64
    %52 = llvm.add %51, %47  : i64
    %53 = llvm.getelementptr %49[%52] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %54 = llvm.load %53 : !llvm.ptr<f32>
    %55 = llvm.extractvalue %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %56 = llvm.mlir.constant(3 : index) : i64
    %57 = llvm.mul %47, %56  : i64
    %58 = llvm.add %57, %45  : i64
    %59 = llvm.getelementptr %55[%58] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %60 = llvm.load %59 : !llvm.ptr<f32>
    %61 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %62 = llvm.mlir.constant(3 : index) : i64
    %63 = llvm.mul %43, %62  : i64
    %64 = llvm.add %63, %45  : i64
    %65 = llvm.getelementptr %61[%64] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %66 = llvm.load %65 : !llvm.ptr<f32>
    %67 = llvm.fmul %54, %60  : f32
    %68 = llvm.fadd %66, %67  : f32
    %69 = llvm.extractvalue %38[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %70 = llvm.mlir.constant(3 : index) : i64
    %71 = llvm.mul %43, %70  : i64
    %72 = llvm.add %71, %45  : i64
    %73 = llvm.getelementptr %69[%72] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %68, %73 : !llvm.ptr<f32>
    %74 = llvm.add %47, %40  : i64
    llvm.br ^bb6(%74 : i64)
  ^bb8:  // pred: ^bb6
    %75 = llvm.add %45, %40  : i64
    llvm.br ^bb4(%75 : i64)
  ^bb9:  // pred: ^bb4
    %76 = llvm.add %43, %40  : i64
    llvm.br ^bb2(%76 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}


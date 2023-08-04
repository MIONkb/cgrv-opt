module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_4(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_4} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(802816 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(12544 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(112 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(112 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %22 = llvm.insertvalue %arg1, %21[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %23 = llvm.insertvalue %arg1, %22[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.insertvalue %24, %23[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %26 = llvm.mlir.constant(1 : index) : i64
    %27 = llvm.insertvalue %26, %25[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %28 = llvm.mlir.constant(802816 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(64 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(12544 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(112 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(112 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(112 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.constant(112 : index) : i64
    %43 = llvm.mlir.constant(64 : index) : i64
    %44 = llvm.mlir.constant(1 : index) : i64
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%45 : i64)
  ^bb2(%47: i64):  // 2 preds: ^bb1, ^bb12
    %48 = llvm.icmp "slt" %47, %44 : i64
    llvm.cond_br %48, ^bb3, ^bb13
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%45 : i64)
  ^bb4(%49: i64):  // 2 preds: ^bb3, ^bb11
    %50 = llvm.icmp "slt" %49, %43 : i64
    llvm.cond_br %50, ^bb5, ^bb12
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%45 : i64)
  ^bb6(%51: i64):  // 2 preds: ^bb5, ^bb10
    %52 = llvm.icmp "slt" %51, %42 : i64
    llvm.cond_br %52, ^bb7, ^bb11
  ^bb7:  // pred: ^bb6
    llvm.br ^bb8(%45 : i64)
  ^bb8(%53: i64):  // 2 preds: ^bb7, ^bb9
    %54 = llvm.icmp "slt" %53, %42 : i64
    llvm.cond_br %54, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    %55 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %56 = llvm.mlir.constant(802816 : index) : i64
    %57 = llvm.mul %45, %56  : i64
    %58 = llvm.mlir.constant(12544 : index) : i64
    %59 = llvm.mul %49, %58  : i64
    %60 = llvm.add %57, %59  : i64
    %61 = llvm.mlir.constant(112 : index) : i64
    %62 = llvm.mul %51, %61  : i64
    %63 = llvm.add %60, %62  : i64
    %64 = llvm.add %63, %53  : i64
    %65 = llvm.getelementptr %55[%64] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %66 = llvm.load %65 : !llvm.ptr -> f32
    %67 = llvm.fcmp "ugt" %66, %46 : f32
    %68 = llvm.select %67, %66, %46 : i1, f32
    %69 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %70 = llvm.mlir.constant(802816 : index) : i64
    %71 = llvm.mul %47, %70  : i64
    %72 = llvm.mlir.constant(12544 : index) : i64
    %73 = llvm.mul %49, %72  : i64
    %74 = llvm.add %71, %73  : i64
    %75 = llvm.mlir.constant(112 : index) : i64
    %76 = llvm.mul %51, %75  : i64
    %77 = llvm.add %74, %76  : i64
    %78 = llvm.add %77, %53  : i64
    %79 = llvm.getelementptr %69[%78] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %68, %79 : f32, !llvm.ptr
    %80 = llvm.add %53, %44  : i64
    llvm.br ^bb8(%80 : i64)
  ^bb10:  // pred: ^bb8
    %81 = llvm.add %51, %44  : i64
    llvm.br ^bb6(%81 : i64)
  ^bb11:  // pred: ^bb6
    %82 = llvm.add %49, %44  : i64
    llvm.br ^bb4(%82 : i64)
  ^bb12:  // pred: ^bb4
    %83 = llvm.add %47, %44  : i64
    llvm.br ^bb2(%83 : i64)
  ^bb13:  // pred: ^bb2
    llvm.return
  }
}


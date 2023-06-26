module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.func @forward(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>) -> !llvm.ptr<i32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %5 = llvm.mlir.constant(2 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %10 = llvm.insertvalue %arg1, %9[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %11 = llvm.insertvalue %arg1, %10[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %12 = llvm.mlir.constant(0 : index) : i64
    %13 = llvm.insertvalue %12, %11[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.mlir.constant(2 : index) : i64
    %15 = llvm.insertvalue %14, %13[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.mlir.constant(1 : index) : i64
    %17 = llvm.insertvalue %16, %15[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.mlir.constant(1 : index) : i64
    %19 = llvm.mlir.constant(2 : index) : i64
    %20 = llvm.mlir.constant(0 : index) : i64
    %21 = llvm.mlir.constant(2 : index) : i64
    %22 = llvm.mlir.constant(1 : index) : i64
    %23 = llvm.mlir.null : !llvm.ptr<i32>
    %24 = llvm.getelementptr %23[2] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %25 = llvm.ptrtoint %24 : !llvm.ptr<i32> to i64
    %26 = llvm.mlir.constant(64 : index) : i64
    %27 = llvm.add %25, %26  : i64
    %28 = llvm.call @malloc(%27) : (i64) -> !llvm.ptr<i8>
    %29 = llvm.bitcast %28 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %30 = llvm.ptrtoint %29 : !llvm.ptr<i32> to i64
    %31 = llvm.mlir.constant(1 : index) : i64
    %32 = llvm.sub %26, %31  : i64
    %33 = llvm.add %30, %32  : i64
    %34 = llvm.urem %33, %26  : i64
    %35 = llvm.sub %33, %34  : i64
    %36 = llvm.inttoptr %35 : i64 to !llvm.ptr<i32>
    %37 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)>
    %38 = llvm.insertvalue %29, %37[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %39 = llvm.insertvalue %36, %38[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %40 = llvm.mlir.constant(0 : index) : i64
    %41 = llvm.insertvalue %40, %39[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %42 = llvm.insertvalue %21, %41[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    %43 = llvm.insertvalue %22, %42[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%20 : i64)
  ^bb1(%44: i64):  // 2 preds: ^bb0, ^bb2
    %45 = llvm.icmp "slt" %44, %19 : i64
    llvm.cond_br %45, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %46 = llvm.getelementptr %arg0[%44] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %47 = llvm.load %46 : !llvm.ptr<i32>
    %48 = llvm.getelementptr %arg1[%44] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %49 = llvm.load %48 : !llvm.ptr<i32>
    %50 = llvm.add %47, %49  : i32
    %51 = llvm.getelementptr %36[%44] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %50, %51 : !llvm.ptr<i32>
    %52 = llvm.add %44, %18  : i64
    llvm.br ^bb1(%52 : i64)
  ^bb3:  // pred: ^bb1
    %53 = llvm.extractvalue %43[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.return %53 : !llvm.ptr<i32>
  }
}


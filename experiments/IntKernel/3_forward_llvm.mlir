module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_3x3xi32(dense<[[1, -2, 3], [-4, 5, -6], [7, -8, 9]]> : tensor<3x3xi32>) : !llvm.array<3 x array<3 x i32>>
  llvm.func @forward(%arg0: !llvm.ptr<i32>) -> !llvm.ptr<i32> {
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
    %13 = llvm.mlir.constant(2 : index) : i64
    %14 = llvm.mlir.constant(1 : index) : i64
    %15 = llvm.mlir.constant(3 : index) : i64
    %16 = llvm.mlir.constant(0 : index) : i64
    %17 = llvm.mlir.constant(0 : i32) : i32
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.mlir.constant(3 : index) : i64
    %20 = llvm.mlir.constant(1 : index) : i64
    %21 = llvm.mlir.constant(9 : index) : i64
    %22 = llvm.mlir.null : !llvm.ptr<i32>
    %23 = llvm.getelementptr %22[9] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %24 = llvm.ptrtoint %23 : !llvm.ptr<i32> to i64
    %25 = llvm.mlir.addressof @__constant_3x3xi32 : !llvm.ptr<array<3 x array<3 x i32>>>
    %26 = llvm.getelementptr %25[0, 0, 0] : (!llvm.ptr<array<3 x array<3 x i32>>>) -> !llvm.ptr<i32>
    %27 = llvm.mlir.constant(3735928559 : index) : i64
    %28 = llvm.inttoptr %27 : i64 to !llvm.ptr<i32>
    %29 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %30 = llvm.insertvalue %28, %29[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %26, %30[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.mlir.constant(0 : index) : i64
    %33 = llvm.insertvalue %32, %31[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %18, %33[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %19, %34[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %19, %35[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.insertvalue %20, %36[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %38 = llvm.mlir.constant(3 : index) : i64
    %39 = llvm.mlir.constant(3 : index) : i64
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.mlir.constant(9 : index) : i64
    %42 = llvm.mlir.null : !llvm.ptr<i32>
    %43 = llvm.getelementptr %42[9] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %44 = llvm.ptrtoint %43 : !llvm.ptr<i32> to i64
    %45 = llvm.alloca %44 x i32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<i32>
    %46 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %47 = llvm.insertvalue %45, %46[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %45, %47[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.mlir.constant(0 : index) : i64
    %50 = llvm.insertvalue %49, %48[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %38, %50[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %39, %51[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %39, %52[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.insertvalue %40, %53[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%16 : i64)
  ^bb1(%55: i64):  // 2 preds: ^bb0, ^bb5
    %56 = llvm.icmp "slt" %55, %15 : i64
    llvm.cond_br %56, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%16 : i64)
  ^bb3(%57: i64):  // 2 preds: ^bb2, ^bb4
    %58 = llvm.icmp "slt" %57, %15 : i64
    llvm.cond_br %58, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %59 = llvm.mlir.constant(3 : index) : i64
    %60 = llvm.mul %55, %59  : i64
    %61 = llvm.add %60, %57  : i64
    %62 = llvm.getelementptr %26[%61] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %63 = llvm.load %62 : !llvm.ptr<i32>
    %64 = llvm.mlir.constant(3 : index) : i64
    %65 = llvm.mul %57, %64  : i64
    %66 = llvm.add %65, %55  : i64
    %67 = llvm.getelementptr %45[%66] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %63, %67 : !llvm.ptr<i32>
    %68 = llvm.add %57, %14  : i64
    llvm.br ^bb3(%68 : i64)
  ^bb5:  // pred: ^bb3
    %69 = llvm.add %55, %14  : i64
    llvm.br ^bb1(%69 : i64)
  ^bb6:  // pred: ^bb1
    %70 = llvm.mlir.constant(2 : index) : i64
    %71 = llvm.mlir.constant(3 : index) : i64
    %72 = llvm.mlir.constant(1 : index) : i64
    %73 = llvm.mlir.constant(6 : index) : i64
    %74 = llvm.mlir.null : !llvm.ptr<i32>
    %75 = llvm.getelementptr %74[6] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %76 = llvm.ptrtoint %75 : !llvm.ptr<i32> to i64
    %77 = llvm.alloca %76 x i32 : (i64) -> !llvm.ptr<i32>
    %78 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %79 = llvm.insertvalue %77, %78[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %80 = llvm.insertvalue %77, %79[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %81 = llvm.mlir.constant(0 : index) : i64
    %82 = llvm.insertvalue %81, %80[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %83 = llvm.insertvalue %70, %82[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %84 = llvm.insertvalue %71, %83[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %85 = llvm.insertvalue %71, %84[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %86 = llvm.insertvalue %72, %85[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb7(%16 : i64)
  ^bb7(%87: i64):  // 2 preds: ^bb6, ^bb11
    %88 = llvm.icmp "slt" %87, %13 : i64
    llvm.cond_br %88, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%16 : i64)
  ^bb9(%89: i64):  // 2 preds: ^bb8, ^bb10
    %90 = llvm.icmp "slt" %89, %15 : i64
    llvm.cond_br %90, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %91 = llvm.mlir.constant(3 : index) : i64
    %92 = llvm.mul %87, %91  : i64
    %93 = llvm.add %92, %89  : i64
    %94 = llvm.getelementptr %77[%93] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %17, %94 : !llvm.ptr<i32>
    %95 = llvm.add %89, %14  : i64
    llvm.br ^bb9(%95 : i64)
  ^bb11:  // pred: ^bb9
    %96 = llvm.add %87, %14  : i64
    llvm.br ^bb7(%96 : i64)
  ^bb12:  // pred: ^bb7
    %97 = llvm.mlir.constant(2 : index) : i64
    %98 = llvm.mlir.constant(3 : index) : i64
    %99 = llvm.mlir.constant(1 : index) : i64
    %100 = llvm.mlir.constant(6 : index) : i64
    %101 = llvm.mlir.null : !llvm.ptr<i32>
    %102 = llvm.getelementptr %101[6] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %103 = llvm.ptrtoint %102 : !llvm.ptr<i32> to i64
    %104 = llvm.mlir.constant(64 : index) : i64
    %105 = llvm.add %103, %104  : i64
    %106 = llvm.call @malloc(%105) : (i64) -> !llvm.ptr<i8>
    %107 = llvm.bitcast %106 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %108 = llvm.ptrtoint %107 : !llvm.ptr<i32> to i64
    %109 = llvm.mlir.constant(1 : index) : i64
    %110 = llvm.sub %104, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.urem %111, %104  : i64
    %113 = llvm.sub %111, %112  : i64
    %114 = llvm.inttoptr %113 : i64 to !llvm.ptr<i32>
    %115 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %116 = llvm.insertvalue %107, %115[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %117 = llvm.insertvalue %114, %116[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %118 = llvm.mlir.constant(0 : index) : i64
    %119 = llvm.insertvalue %118, %117[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %120 = llvm.insertvalue %97, %119[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %121 = llvm.insertvalue %98, %120[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %122 = llvm.insertvalue %98, %121[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %123 = llvm.insertvalue %99, %122[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %124 = llvm.mlir.constant(1 : index) : i64
    %125 = llvm.mul %124, %70  : i64
    %126 = llvm.mul %125, %71  : i64
    %127 = llvm.mlir.null : !llvm.ptr<i32>
    %128 = llvm.getelementptr %127[1] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %129 = llvm.ptrtoint %128 : !llvm.ptr<i32> to i64
    %130 = llvm.mul %126, %129  : i64
    %131 = llvm.getelementptr %77[%81] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %132 = llvm.getelementptr %114[%118] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %133 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%132, %131, %130, %133) : (!llvm.ptr<i32>, !llvm.ptr<i32>, i64, i1) -> ()
    %134 = llvm.extractvalue %54[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %135 = llvm.extractvalue %123[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%arg0, %134, %135) : (!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) -> ()
    %136 = llvm.extractvalue %123[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %136 : !llvm.ptr<i32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<i32>, !llvm.ptr<i32>, !llvm.ptr<i32>) attributes {Kernel, forward_kernel_0}
}


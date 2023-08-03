module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_3x3xf32(dense<[[-0.533737481, 0.0726815313, 0.548144102], [0.339588523, -0.212466493, 0.129553705], [0.423136026, 0.46056211, -0.0355117619]]> : tensor<3x3xf32>) : !llvm.array<3 x array<3 x f32>>
  llvm.func @forward(%arg0: !llvm.ptr<f32>) -> !llvm.ptr<f32> {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.mlir.constant(3 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.mlir.constant(3 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.mlir.constant(1 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(0 : index) : i64
    %16 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %17 = llvm.mlir.constant(3 : index) : i64
    %18 = llvm.mlir.constant(3 : index) : i64
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.mlir.constant(9 : index) : i64
    %21 = llvm.mlir.null : !llvm.ptr<f32>
    %22 = llvm.getelementptr %21[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %23 = llvm.ptrtoint %22 : !llvm.ptr<f32> to i64
    %24 = llvm.mlir.addressof @__constant_3x3xf32 : !llvm.ptr<array<3 x array<3 x f32>>>
    %25 = llvm.getelementptr %24[0, 0, 0] : (!llvm.ptr<array<3 x array<3 x f32>>>) -> !llvm.ptr<f32>
    %26 = llvm.mlir.constant(3735928559 : index) : i64
    %27 = llvm.inttoptr %26 : i64 to !llvm.ptr<f32>
    %28 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %29 = llvm.insertvalue %27, %28[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %25, %29[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.mlir.constant(0 : index) : i64
    %32 = llvm.insertvalue %31, %30[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.insertvalue %17, %32[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %34 = llvm.insertvalue %18, %33[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %35 = llvm.insertvalue %18, %34[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %36 = llvm.insertvalue %19, %35[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %37 = llvm.mlir.constant(3 : index) : i64
    %38 = llvm.mlir.constant(3 : index) : i64
    %39 = llvm.mlir.constant(1 : index) : i64
    %40 = llvm.mlir.constant(9 : index) : i64
    %41 = llvm.mlir.null : !llvm.ptr<f32>
    %42 = llvm.getelementptr %41[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %43 = llvm.ptrtoint %42 : !llvm.ptr<f32> to i64
    %44 = llvm.alloca %43 x f32 {alignment = 64 : i64} : (i64) -> !llvm.ptr<f32>
    %45 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %46 = llvm.insertvalue %44, %45[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %44, %46[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.mlir.constant(0 : index) : i64
    %49 = llvm.insertvalue %48, %47[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.insertvalue %37, %49[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.insertvalue %38, %50[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %52 = llvm.insertvalue %38, %51[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %53 = llvm.insertvalue %39, %52[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %54 = llvm.extractvalue %36[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %55 = llvm.extractvalue %53[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%54, %55) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %56 = llvm.mlir.constant(3 : index) : i64
    %57 = llvm.mlir.constant(3 : index) : i64
    %58 = llvm.mlir.constant(1 : index) : i64
    %59 = llvm.mlir.constant(9 : index) : i64
    %60 = llvm.mlir.null : !llvm.ptr<f32>
    %61 = llvm.getelementptr %60[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %62 = llvm.ptrtoint %61 : !llvm.ptr<f32> to i64
    %63 = llvm.alloca %62 x f32 : (i64) -> !llvm.ptr<f32>
    %64 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %65 = llvm.insertvalue %63, %64[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.insertvalue %63, %65[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %67 = llvm.mlir.constant(0 : index) : i64
    %68 = llvm.insertvalue %67, %66[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %69 = llvm.insertvalue %56, %68[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %70 = llvm.insertvalue %57, %69[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %71 = llvm.insertvalue %57, %70[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %72 = llvm.insertvalue %58, %71[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb1(%15 : i64)
  ^bb1(%73: i64):  // 2 preds: ^bb0, ^bb5
    %74 = llvm.icmp "slt" %73, %14 : i64
    llvm.cond_br %74, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%15 : i64)
  ^bb3(%75: i64):  // 2 preds: ^bb2, ^bb4
    %76 = llvm.icmp "slt" %75, %14 : i64
    llvm.cond_br %76, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %77 = llvm.mlir.constant(3 : index) : i64
    %78 = llvm.mul %73, %77  : i64
    %79 = llvm.add %78, %75  : i64
    %80 = llvm.getelementptr %63[%79] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    llvm.store %16, %80 : !llvm.ptr<f32>
    %81 = llvm.add %75, %13  : i64
    llvm.br ^bb3(%81 : i64)
  ^bb5:  // pred: ^bb3
    %82 = llvm.add %73, %13  : i64
    llvm.br ^bb1(%82 : i64)
  ^bb6:  // pred: ^bb1
    %83 = llvm.mlir.constant(3 : index) : i64
    %84 = llvm.mlir.constant(3 : index) : i64
    %85 = llvm.mlir.constant(1 : index) : i64
    %86 = llvm.mlir.constant(9 : index) : i64
    %87 = llvm.mlir.null : !llvm.ptr<f32>
    %88 = llvm.getelementptr %87[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %89 = llvm.ptrtoint %88 : !llvm.ptr<f32> to i64
    %90 = llvm.mlir.constant(64 : index) : i64
    %91 = llvm.add %89, %90  : i64
    %92 = llvm.call @malloc(%91) : (i64) -> !llvm.ptr<i8>
    %93 = llvm.bitcast %92 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %94 = llvm.ptrtoint %93 : !llvm.ptr<f32> to i64
    %95 = llvm.mlir.constant(1 : index) : i64
    %96 = llvm.sub %90, %95  : i64
    %97 = llvm.add %94, %96  : i64
    %98 = llvm.urem %97, %90  : i64
    %99 = llvm.sub %97, %98  : i64
    %100 = llvm.inttoptr %99 : i64 to !llvm.ptr<f32>
    %101 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %102 = llvm.insertvalue %93, %101[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %103 = llvm.insertvalue %100, %102[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %104 = llvm.mlir.constant(0 : index) : i64
    %105 = llvm.insertvalue %104, %103[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %106 = llvm.insertvalue %83, %105[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %107 = llvm.insertvalue %84, %106[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %108 = llvm.insertvalue %84, %107[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %109 = llvm.insertvalue %85, %108[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %110 = llvm.mlir.constant(1 : index) : i64
    %111 = llvm.mul %110, %56  : i64
    %112 = llvm.mul %111, %57  : i64
    %113 = llvm.mlir.null : !llvm.ptr<f32>
    %114 = llvm.getelementptr %113[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %115 = llvm.ptrtoint %114 : !llvm.ptr<f32> to i64
    %116 = llvm.mul %112, %115  : i64
    %117 = llvm.getelementptr %63[%67] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %118 = llvm.getelementptr %100[%104] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %119 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%118, %117, %116, %119) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %120 = llvm.extractvalue %109[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %121 = llvm.extractvalue %53[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%120, %arg0, %121) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %122 = llvm.extractvalue %109[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %122 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
}


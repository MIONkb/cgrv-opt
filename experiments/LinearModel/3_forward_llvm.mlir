module attributes {llvm.data_layout = "", torch.debug_module_name = "L"} {
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.mlir.global private constant @__constant_3x3xf32(dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]> : tensor<3x3xf32>) : !llvm.array<3 x array<3 x f32>>
  llvm.func @forward(%arg0: !llvm.ptr<f32>) -> !llvm.ptr<f32> {
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
    %13 = llvm.mlir.constant(3 : index) : i64
    %14 = llvm.mlir.constant(3 : index) : i64
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.mlir.constant(9 : index) : i64
    %17 = llvm.mlir.null : !llvm.ptr<f32>
    %18 = llvm.getelementptr %17[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %19 = llvm.ptrtoint %18 : !llvm.ptr<f32> to i64
    %20 = llvm.mlir.addressof @__constant_3x3xf32 : !llvm.ptr<array<3 x array<3 x f32>>>
    %21 = llvm.getelementptr %20[0, 0, 0] : (!llvm.ptr<array<3 x array<3 x f32>>>) -> !llvm.ptr<f32>
    %22 = llvm.mlir.constant(3735928559 : index) : i64
    %23 = llvm.inttoptr %22 : i64 to !llvm.ptr<f32>
    %24 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %25 = llvm.insertvalue %23, %24[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.insertvalue %21, %25[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.mlir.constant(0 : index) : i64
    %28 = llvm.insertvalue %27, %26[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.insertvalue %13, %28[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.insertvalue %14, %29[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.insertvalue %14, %30[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %32 = llvm.insertvalue %15, %31[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %33 = llvm.mlir.constant(3 : index) : i64
    %34 = llvm.mlir.constant(3 : index) : i64
    %35 = llvm.mlir.constant(1 : index) : i64
    %36 = llvm.mlir.constant(9 : index) : i64
    %37 = llvm.mlir.null : !llvm.ptr<f32>
    %38 = llvm.getelementptr %37[9] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %39 = llvm.ptrtoint %38 : !llvm.ptr<f32> to i64
    %40 = llvm.alloca %39 x f32 : (i64) -> !llvm.ptr<f32>
    %41 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %42 = llvm.insertvalue %40, %41[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %43 = llvm.insertvalue %40, %42[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %44 = llvm.mlir.constant(0 : index) : i64
    %45 = llvm.insertvalue %44, %43[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %46 = llvm.insertvalue %33, %45[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %47 = llvm.insertvalue %34, %46[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %48 = llvm.insertvalue %34, %47[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %49 = llvm.insertvalue %35, %48[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %50 = llvm.extractvalue %32[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %51 = llvm.extractvalue %49[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_0(%50, %51) : (!llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %52 = llvm.mlir.constant(4 : index) : i64
    %53 = llvm.mlir.constant(3 : index) : i64
    %54 = llvm.mlir.constant(1 : index) : i64
    %55 = llvm.mlir.constant(12 : index) : i64
    %56 = llvm.mlir.null : !llvm.ptr<f32>
    %57 = llvm.getelementptr %56[12] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %58 = llvm.ptrtoint %57 : !llvm.ptr<f32> to i64
    %59 = llvm.alloca %58 x f32 : (i64) -> !llvm.ptr<f32>
    %60 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %61 = llvm.insertvalue %59, %60[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %62 = llvm.insertvalue %59, %61[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %63 = llvm.mlir.constant(0 : index) : i64
    %64 = llvm.insertvalue %63, %62[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %65 = llvm.insertvalue %52, %64[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %66 = llvm.insertvalue %53, %65[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %67 = llvm.insertvalue %53, %66[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %68 = llvm.insertvalue %54, %67[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %69 = llvm.extractvalue %68[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_1(%69) : (!llvm.ptr<f32>) -> ()
    %70 = llvm.mlir.constant(4 : index) : i64
    %71 = llvm.mlir.constant(3 : index) : i64
    %72 = llvm.mlir.constant(1 : index) : i64
    %73 = llvm.mlir.constant(12 : index) : i64
    %74 = llvm.mlir.null : !llvm.ptr<f32>
    %75 = llvm.getelementptr %74[12] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %76 = llvm.ptrtoint %75 : !llvm.ptr<f32> to i64
    %77 = llvm.mlir.constant(64 : index) : i64
    %78 = llvm.add %76, %77  : i64
    %79 = llvm.call @malloc(%78) : (i64) -> !llvm.ptr<i8>
    %80 = llvm.bitcast %79 : !llvm.ptr<i8> to !llvm.ptr<f32>
    %81 = llvm.ptrtoint %80 : !llvm.ptr<f32> to i64
    %82 = llvm.mlir.constant(1 : index) : i64
    %83 = llvm.sub %77, %82  : i64
    %84 = llvm.add %81, %83  : i64
    %85 = llvm.urem %84, %77  : i64
    %86 = llvm.sub %84, %85  : i64
    %87 = llvm.inttoptr %86 : i64 to !llvm.ptr<f32>
    %88 = llvm.mlir.undef : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)>
    %89 = llvm.insertvalue %80, %88[0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %90 = llvm.insertvalue %87, %89[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %91 = llvm.mlir.constant(0 : index) : i64
    %92 = llvm.insertvalue %91, %90[2] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %93 = llvm.insertvalue %70, %92[3, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %94 = llvm.insertvalue %71, %93[3, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %95 = llvm.insertvalue %71, %94[4, 0] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %96 = llvm.insertvalue %72, %95[4, 1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %97 = llvm.mlir.constant(1 : index) : i64
    %98 = llvm.mul %97, %52  : i64
    %99 = llvm.mul %98, %53  : i64
    %100 = llvm.mlir.null : !llvm.ptr<f32>
    %101 = llvm.getelementptr %100[1] : (!llvm.ptr<f32>) -> !llvm.ptr<f32>
    %102 = llvm.ptrtoint %101 : !llvm.ptr<f32> to i64
    %103 = llvm.mul %99, %102  : i64
    %104 = llvm.getelementptr %59[%63] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %105 = llvm.getelementptr %87[%91] : (!llvm.ptr<f32>, i64) -> !llvm.ptr<f32>
    %106 = llvm.mlir.constant(false) : i1
    "llvm.intr.memcpy"(%105, %104, %103, %106) : (!llvm.ptr<f32>, !llvm.ptr<f32>, i64, i1) -> ()
    %107 = llvm.extractvalue %49[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    %108 = llvm.extractvalue %96[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward_kernel_2(%arg0, %107, %108) : (!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) -> ()
    %109 = llvm.extractvalue %96[1] : !llvm.struct<(ptr<f32>, ptr<f32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.return %109 : !llvm.ptr<f32>
  }
  llvm.func @forward_kernel_0(!llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_0}
  llvm.func @forward_kernel_1(!llvm.ptr<f32>) attributes {Kernel, forward_kernel_1}
  llvm.func @forward_kernel_2(!llvm.ptr<f32>, !llvm.ptr<f32>, !llvm.ptr<f32>) attributes {Kernel, forward_kernel_2}
}


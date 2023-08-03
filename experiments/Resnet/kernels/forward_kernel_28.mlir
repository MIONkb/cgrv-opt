"func.func"() ({
^bb0(%arg0: memref<128xf32>, %arg1: memref<128xf32>, %arg2: memref<128xf32>, %arg3: memref<128xf32>, %arg4: memref<1x128x28x28xf32>, %arg5: memref<1x128x28x28xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() {value = 1.000000e-05 : f64} : () -> f64
  "affine.for"() ({
  ^bb0(%arg6: index):
    "affine.for"() ({
    ^bb0(%arg7: index):
      %1 = "affine.load"(%arg0, %arg7) {map = affine_map<(d0) -> (d0)>} : (memref<128xf32>, index) -> f32
      %2 = "affine.load"(%arg1, %arg7) {map = affine_map<(d0) -> (d0)>} : (memref<128xf32>, index) -> f32
      %3 = "affine.load"(%arg2, %arg7) {map = affine_map<(d0) -> (d0)>} : (memref<128xf32>, index) -> f32
      %4 = "affine.load"(%arg3, %arg7) {map = affine_map<(d0) -> (d0)>} : (memref<128xf32>, index) -> f32
      "affine.for"() ({
      ^bb0(%arg8: index):
        "affine.for"() ({
        ^bb0(%arg9: index):
          %5 = "affine.load"(%arg4, %arg6, %arg7, %arg8, %arg9) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (memref<1x128x28x28xf32>, index, index, index, index) -> f32
          %6 = "arith.truncf"(%0) : (f64) -> f32
          %7 = "arith.addf"(%4, %6) : (f32, f32) -> f32
          %8 = "math.rsqrt"(%7) : (f32) -> f32
          %9 = "arith.subf"(%5, %3) : (f32, f32) -> f32
          %10 = "arith.mulf"(%9, %8) : (f32, f32) -> f32
          %11 = "arith.mulf"(%10, %1) : (f32, f32) -> f32
          %12 = "arith.addf"(%11, %2) : (f32, f32) -> f32
          "affine.store"(%12, %arg5, %arg6, %arg7, %arg8, %arg9) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<1x128x28x28xf32>, index, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (28)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (28)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (128)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_28, function_type = (memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<128xf32>, memref<1x128x28x28xf32>, memref<1x128x28x28xf32>) -> (), sym_name = "forward_kernel_28"} : () -> ()
"func.func"() ({
^bb0(%arg0: memref<1x4x4xf32>, %arg1: memref<1x4x2xf32>, %arg2: memref<1x4x2xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  "affine.for"() ({
  ^bb0(%arg3: index):
    "affine.for"() ({
    ^bb0(%arg4: index):
      "affine.for"() ({
      ^bb0(%arg5: index):
        "affine.for"() ({
        ^bb0(%arg6: index):
          %0 = "affine.load"(%arg0, %arg3, %arg4, %arg6) {map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>} : (memref<1x4x4xf32>, index, index, index) -> f32
          %1 = "affine.load"(%arg1, %arg3, %arg6, %arg5) {map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>} : (memref<1x4x2xf32>, index, index, index) -> f32
          %2 = "affine.load"(%arg2, %arg3, %arg4, %arg5) {map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>} : (memref<1x4x2xf32>, index, index, index) -> f32
          %3 = "arith.mulf"(%0, %1) : (f32, f32) -> f32
          %4 = "arith.addf"(%2, %3) : (f32, f32) -> f32
          "affine.store"(%4, %arg2, %arg3, %arg4, %arg5) {map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>} : (f32, memref<1x4x2xf32>, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
        "affine.yield"() : () -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (2)>} : () -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
  "func.return"() : () -> ()
}) {function_type = (memref<1x4x4xf32>, memref<1x4x2xf32>, memref<1x4x2xf32>) -> (), main_kernel_16, sym_name = "main_kernel_16"} : () -> ()
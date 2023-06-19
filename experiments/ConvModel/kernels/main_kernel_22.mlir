"func.func"() ({
^bb0(%arg0: memref<4x2xf32>, %arg1: memref<4xf32>, %arg2: memref<4x2xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  "affine.for"() ({
  ^bb0(%arg3: index):
    "affine.for"() ({
    ^bb0(%arg4: index):
      %0 = "affine.load"(%arg0, %arg3, %arg4) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<4x2xf32>, index, index) -> f32
      %1 = "affine.load"(%arg1, %arg3) {map = affine_map<(d0) -> (d0)>} : (memref<4xf32>, index) -> f32
      %2 = "arith.mulf"(%0, %1) : (f32, f32) -> f32
      "affine.store"(%2, %arg2, %arg3, %arg4) {map = affine_map<(d0, d1) -> (d0, d1)>} : (f32, memref<4x2xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (2)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
  "func.return"() : () -> ()
}) {function_type = (memref<4x2xf32>, memref<4xf32>, memref<4x2xf32>) -> (), main_kernel_22, sym_name = "main_kernel_22"} : () -> ()
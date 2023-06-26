"func.func"() ({
^bb0(%arg0: memref<4x4xf32>, %arg1: memref<4x4xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() {value = 0.000000e+00 : f32} : () -> f32
  "affine.for"() ({
  ^bb0(%arg2: index):
    "affine.for"() ({
    ^bb0(%arg3: index):
      %1 = "affine.load"(%arg0, %arg2, %arg3) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<4x4xf32>, index, index) -> f32
      %2 = "arith.addf"(%1, %0) : (f32, f32) -> f32
      "affine.store"(%2, %arg1, %arg2, %arg3) {map = affine_map<(d0, d1) -> (d0, d1)>} : (f32, memref<4x4xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (4)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, function_type = (memref<4x4xf32>, memref<4x4xf32>) -> (), main_kernel_13, sym_name = "main_kernel_13"} : () -> ()
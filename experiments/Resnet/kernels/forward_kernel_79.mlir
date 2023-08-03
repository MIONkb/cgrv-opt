"func.func"() ({
^bb0(%arg0: memref<1x1000xf32>, %arg1: memref<1000xf32>, %arg2: memref<1x1000xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  "affine.for"() ({
  ^bb0(%arg3: index):
    "affine.for"() ({
    ^bb0(%arg4: index):
      %0 = "affine.load"(%arg0, %arg4) {map = affine_map<(d0) -> (0, d0)>} : (memref<1x1000xf32>, index) -> f32
      %1 = "affine.load"(%arg1, %arg4) {map = affine_map<(d0) -> (d0)>} : (memref<1000xf32>, index) -> f32
      %2 = "arith.addf"(%0, %1) : (f32, f32) -> f32
      "affine.store"(%2, %arg2, %arg3, %arg4) {map = affine_map<(d0, d1) -> (d0, d1)>} : (f32, memref<1x1000xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1000)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_79, function_type = (memref<1x1000xf32>, memref<1000xf32>, memref<1x1000xf32>) -> (), sym_name = "forward_kernel_79"} : () -> ()
"func.func"() <{function_type = (memref<1x64x112x112xf32>, index, index, index) -> (), sym_name = "forward_kernel_1"}> ({
^bb0(%arg0: memref<1x64x112x112xf32>, %arg1: index, %arg2: index, %arg3: index):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
  "affine.for"(%arg3, %arg3) ({
  ^bb0(%arg4: index):
    "affine.for"() ({
    ^bb0(%arg5: index):
      "affine.store"(%0, %arg0, %arg1, %arg2, %arg4, %arg5) {map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>} : (f32, memref<1x64x112x112xf32>, index, index, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (112)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<(d0) -> (d0)>, step = 1 : index, upper_bound = affine_map<(d0) -> (d0 + 16)>} : (index, index) -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_1} : () -> ()
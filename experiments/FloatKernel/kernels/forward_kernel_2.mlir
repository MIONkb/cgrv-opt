"func.func"() ({
^bb0(%arg0: memref<2x3xf32>, %arg1: memref<2x3xf32>, %arg2: memref<3x3xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  "affine.for"() ({
  ^bb0(%arg3: index):
    "affine.for"() ({
    ^bb0(%arg4: index):
      %0 = "affine.load"(%arg0, %arg3, %arg4) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<2x3xf32>, index, index) -> f32
      %1 = "affine.for"(%0) ({
      ^bb0(%arg5: index, %arg6: f32):
        %2 = "affine.load"(%arg1, %arg3, %arg5) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<2x3xf32>, index, index) -> f32
        %3 = "affine.load"(%arg2, %arg5, %arg4) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<3x3xf32>, index, index) -> f32
        %4 = "arith.mulf"(%2, %3) : (f32, f32) -> f32
        %5 = "arith.addf"(%arg6, %4) : (f32, f32) -> f32
        "affine.yield"(%5) : (f32) -> ()
      }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : (f32) -> f32
      "affine.store"(%1, %arg0, %arg3, %arg4) {map = affine_map<(d0, d1) -> (d0, d1)>} : (f32, memref<2x3xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (2)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_2, function_type = (memref<2x3xf32>, memref<2x3xf32>, memref<3x3xf32>) -> (), sym_name = "forward_kernel_2"} : () -> ()
"func.func"() ({
^bb0(%arg0: memref<1000x512xf32>, %arg1: memref<512x1000xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  "affine.for"() ({
  ^bb0(%arg2: index):
    "affine.for"() ({
    ^bb0(%arg3: index):
      %0 = "affine.load"(%arg0, %arg2, %arg3) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<1000x512xf32>, index, index) -> f32
      "affine.store"(%0, %arg1, %arg3, %arg2) {map = affine_map<(d0, d1) -> (d0, d1)>} : (f32, memref<512x1000xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (512)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (1000)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, forward_kernel_76, function_type = (memref<1000x512xf32>, memref<512x1000xf32>) -> (), sym_name = "forward_kernel_76"} : () -> ()
"func.func"() ({
^bb0(%arg0: memref<2x3xf32>, %arg1: memref<2x3xf32>, %arg2: memref<3x3xf32>):
  "cf.br"()[^bb1] : () -> ()
^bb1:  // pred: ^bb0
  %0 = "arith.constant"() {value = 0 : index} : () -> index
  "affine.for"() ({
  ^bb0(%arg3: index):
    "affine.for"() ({
    ^bb0(%arg4: index):
      %1 = "affine.load"(%arg0, %arg3, %arg4) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<2x3xf32>, index, index) -> f32
      %2 = "affine.load"(%arg1, %arg3, %0) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<2x3xf32>, index, index) -> f32
      %3 = "affine.load"(%arg2, %0, %arg4) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<3x3xf32>, index, index) -> f32
      %4 = "arith.mulf"(%2, %3) : (f32, f32) -> f32
      %5 = "arith.addf"(%1, %4) : (f32, f32) -> f32
      %6 = "affine.apply"(%0) {map = affine_map<(d0) -> (d0 + 1)>} : (index) -> index
      %7 = "affine.load"(%arg1, %arg3, %6) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<2x3xf32>, index, index) -> f32
      %8 = "affine.load"(%arg2, %6, %arg4) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<3x3xf32>, index, index) -> f32
      %9 = "arith.mulf"(%7, %8) : (f32, f32) -> f32
      %10 = "arith.addf"(%5, %9) : (f32, f32) -> f32
      %11 = "affine.apply"(%0) {map = affine_map<(d0) -> (d0 + 2)>} : (index) -> index
      %12 = "affine.load"(%arg1, %arg3, %11) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<2x3xf32>, index, index) -> f32
      %13 = "affine.load"(%arg2, %11, %arg4) {map = affine_map<(d0, d1) -> (d0, d1)>} : (memref<3x3xf32>, index, index) -> f32
      %14 = "arith.mulf"(%12, %13) : (f32, f32) -> f32
      %15 = "arith.addf"(%10, %14) : (f32, f32) -> f32
      "affine.store"(%15, %arg0, %arg3, %arg4) {map = affine_map<(d0, d1) -> (d0, d1)>} : (f32, memref<2x3xf32>, index, index) -> ()
      "affine.yield"() : () -> ()
    }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (3)>} : () -> ()
    "affine.yield"() : () -> ()
  }) {lower_bound = affine_map<() -> (0)>, step = 1 : index, upper_bound = affine_map<() -> (2)>} : () -> ()
  "func.return"() : () -> ()
}) {Kernel, function_type = (memref<2x3xf32>, memref<2x3xf32>, memref<3x3xf32>) -> (), kernel_0, sym_name = "kernel_0"} : () -> ()
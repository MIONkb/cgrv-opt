// -----// IR Dump After EmptyTensorToAllocTensor (empty-tensor-to-alloc-tensor) //----- //
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %c3 = arith.constant 3 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]> : tensor<3x3xf32>
    %0 = bufferization.alloc_tensor() : tensor<3x3xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst_0 : tensor<3x3xf32>) outs(%0 : tensor<3x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x3xf32>
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %2 = bufferization.alloc_tensor(%c4, %c3) : tensor<?x?xf32>
    %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = linalg.matmul ins(%arg0, %1 : tensor<4x3xf32>, tensor<3x3xf32>) outs(%3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %cast = tensor.cast %4 : tensor<?x?xf32> to tensor<4x3xf32>
    return %cast : tensor<4x3xf32>
  }
}


// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]> : tensor<3x3xf32>
  %0 = bufferization.alloc_tensor() : tensor<3x3xf32>
  %1 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%cst_0 : tensor<3x3xf32>) outs(%0 : tensor<3x3xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<3x3xf32>
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %2 = bufferization.alloc_tensor(%c4, %c3) : tensor<?x?xf32>
  %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %4 = linalg.matmul ins(%arg0, %1 : tensor<4x3xf32>, tensor<3x3xf32>) outs(%3 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %cast = tensor.cast %4 : tensor<?x?xf32> to tensor<4x3xf32>
  return %cast : tensor<4x3xf32>
}

// -----// IR Dump After LinalgBufferize (linalg-bufferize) //----- //
func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
  %0 = bufferization.to_memref %arg0 : memref<4x3xf32>
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]> : tensor<3x3xf32>
  %1 = bufferization.to_memref %cst_0 : memref<3x3xf32>
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%1 : memref<3x3xf32>) outs(%alloc : memref<3x3xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_1 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst : f32) outs(%alloc_1 : memref<?x?xf32>)
  %c0 = arith.constant 0 : index
  %dim = memref.dim %alloc_1, %c0 : memref<?x?xf32>
  %c1 = arith.constant 1 : index
  %dim_2 = memref.dim %alloc_1, %c1 : memref<?x?xf32>
  %alloc_3 = memref.alloc(%dim, %dim_2) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_1, %alloc_3 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%0, %alloc : memref<4x3xf32>, memref<3x3xf32>) outs(%alloc_3 : memref<?x?xf32>)
  %2 = bufferization.to_tensor %alloc_3 : memref<?x?xf32>
  %cast = tensor.cast %2 : tensor<?x?xf32> to tensor<4x3xf32>
  return %cast : tensor<4x3xf32>
}

// -----// IR Dump After TensorBufferize (tensor-bufferize) //----- //
func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
  %0 = bufferization.to_memref %arg0 : memref<4x3xf32>
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]> : tensor<3x3xf32>
  %1 = bufferization.to_memref %cst_0 : memref<3x3xf32>
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%1 : memref<3x3xf32>) outs(%alloc : memref<3x3xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_1 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst : f32) outs(%alloc_1 : memref<?x?xf32>)
  %c0 = arith.constant 0 : index
  %dim = memref.dim %alloc_1, %c0 : memref<?x?xf32>
  %c1 = arith.constant 1 : index
  %dim_2 = memref.dim %alloc_1, %c1 : memref<?x?xf32>
  %alloc_3 = memref.alloc(%dim, %dim_2) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_1, %alloc_3 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%0, %alloc : memref<4x3xf32>, memref<3x3xf32>) outs(%alloc_3 : memref<?x?xf32>)
  %cast = memref.cast %alloc_3 : memref<?x?xf32> to memref<4x3xf32>
  %2 = bufferization.to_tensor %cast : memref<4x3xf32>
  return %2 : tensor<4x3xf32>
}

// -----// IR Dump After FuncBufferize (func-bufferize) //----- //
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %0 = bufferization.to_tensor %arg0 : memref<4x3xf32>
    %1 = bufferization.to_memref %0 : memref<4x3xf32>
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %c3 = arith.constant 3 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]> : tensor<3x3xf32>
    %2 = bufferization.to_memref %cst_0 : memref<3x3xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%2 : memref<3x3xf32>) outs(%alloc : memref<3x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %alloc_1 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_1 : memref<?x?xf32>)
    %c0 = arith.constant 0 : index
    %dim = memref.dim %alloc_1, %c0 : memref<?x?xf32>
    %c1 = arith.constant 1 : index
    %dim_2 = memref.dim %alloc_1, %c1 : memref<?x?xf32>
    %alloc_3 = memref.alloc(%dim, %dim_2) {alignment = 64 : i64} : memref<?x?xf32>
    memref.copy %alloc_1, %alloc_3 : memref<?x?xf32> to memref<?x?xf32>
    linalg.matmul ins(%1, %alloc : memref<4x3xf32>, memref<3x3xf32>) outs(%alloc_3 : memref<?x?xf32>)
    %cast = memref.cast %alloc_3 : memref<?x?xf32> to memref<4x3xf32>
    %3 = bufferization.to_tensor %cast : memref<4x3xf32>
    %4 = bufferization.to_memref %3 : memref<4x3xf32>
    return %4 : memref<4x3xf32>
  }
}


// -----// IR Dump After ArithBufferize (arith-bufferize) //----- //
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %c3 = arith.constant 3 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%0 : memref<3x3xf32>) outs(%alloc : memref<3x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %alloc_0 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_0 : memref<?x?xf32>)
    %c0 = arith.constant 0 : index
    %dim = memref.dim %alloc_0, %c0 : memref<?x?xf32>
    %c1 = arith.constant 1 : index
    %dim_1 = memref.dim %alloc_0, %c1 : memref<?x?xf32>
    %alloc_2 = memref.alloc(%dim, %dim_1) {alignment = 64 : i64} : memref<?x?xf32>
    memref.copy %alloc_0, %alloc_2 : memref<?x?xf32> to memref<?x?xf32>
    linalg.matmul ins(%arg0, %alloc : memref<4x3xf32>, memref<3x3xf32>) outs(%alloc_2 : memref<?x?xf32>)
    %cast = memref.cast %alloc_2 : memref<?x?xf32> to memref<4x3xf32>
    return %cast : memref<4x3xf32>
  }
}


// -----// IR Dump After BufferizationBufferize (bufferization-bufferize) //----- //
func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%0 : memref<3x3xf32>) outs(%alloc : memref<3x3xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_0 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst : f32) outs(%alloc_0 : memref<?x?xf32>)
  %c0 = arith.constant 0 : index
  %dim = memref.dim %alloc_0, %c0 : memref<?x?xf32>
  %c1 = arith.constant 1 : index
  %dim_1 = memref.dim %alloc_0, %c1 : memref<?x?xf32>
  %alloc_2 = memref.alloc(%dim, %dim_1) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_0, %alloc_2 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%arg0, %alloc : memref<4x3xf32>, memref<3x3xf32>) outs(%alloc_2 : memref<?x?xf32>)
  %cast = memref.cast %alloc_2 : memref<?x?xf32> to memref<4x3xf32>
  return %cast : memref<4x3xf32>
}

// -----// IR Dump After LinalgLowerToAffineLoops (convert-linalg-to-affine-loops) //----- //
func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
  affine.for %arg1 = 0 to 3 {
    affine.for %arg2 = 0 to 3 {
      %1 = affine.load %0[%arg1, %arg2] : memref<3x3xf32>
      affine.store %1, %alloc[%arg2, %arg1] : memref<3x3xf32>
    }
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_0 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 3 {
      affine.store %cst, %alloc_0[%arg1, %arg2] : memref<?x?xf32>
    }
  }
  %alloc_1 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_0, %alloc_1 : memref<?x?xf32> to memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 3 {
        %1 = affine.load %arg0[%arg1, %arg3] : memref<4x3xf32>
        %2 = affine.load %alloc[%arg3, %arg2] : memref<3x3xf32>
        %3 = affine.load %alloc_1[%arg1, %arg2] : memref<?x?xf32>
        %4 = arith.mulf %1, %2 : f32
        %5 = arith.addf %3, %4 : f32
        affine.store %5, %alloc_1[%arg1, %arg2] : memref<?x?xf32>
      }
    }
  }
  %cast = memref.cast %alloc_1 : memref<?x?xf32> to memref<4x3xf32>
  return %cast : memref<4x3xf32>
}

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
  %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
  affine.for %arg1 = 0 to 3 {
    affine.for %arg2 = 0 to 3 {
      %1 = affine.load %0[%arg1, %arg2] : memref<3x3xf32>
      affine.store %1, %alloca[%arg2, %arg1] : memref<3x3xf32>
    }
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 3 {
      affine.store %cst, %alloc[%arg1, %arg2] : memref<?x?xf32>
    }
  }
  %alloc_0 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc, %alloc_0 : memref<?x?xf32> to memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 3 {
        %1 = affine.load %arg0[%arg1, %arg3] : memref<4x3xf32>
        %2 = affine.load %alloca[%arg3, %arg2] : memref<3x3xf32>
        %3 = affine.load %alloc_0[%arg1, %arg2] : memref<?x?xf32>
        %4 = arith.mulf %1, %2 : f32
        %5 = arith.addf %3, %4 : f32
        affine.store %5, %alloc_0[%arg1, %arg2] : memref<?x?xf32>
      }
    }
  }
  %cast = memref.cast %alloc_0 : memref<?x?xf32> to memref<4x3xf32>
  return %cast : memref<4x3xf32>
}

// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[0.569071651, -0.473457456, 0.519209445], [-0.231614307, -0.085622929, 5.772530e-01], [-0.09853556, -0.0144386981, 0.368846387]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        %1 = affine.load %0[%arg1, %arg2] : memref<3x3xf32>
        affine.store %1, %alloca[%arg2, %arg1] : memref<3x3xf32>
      }
    }
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %alloc[%arg1, %arg2] : memref<4x3xf32>
      }
    }
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %alloc, %alloc_0 : memref<4x3xf32> to memref<4x3xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 3 {
        affine.for %arg3 = 0 to 3 {
          %1 = affine.load %arg0[%arg1, %arg3] : memref<4x3xf32>
          %2 = affine.load %alloca[%arg3, %arg2] : memref<3x3xf32>
          %3 = affine.load %alloc_0[%arg1, %arg2] : memref<4x3xf32>
          %4 = arith.mulf %1, %2 : f32
          %5 = arith.addf %3, %4 : f32
          affine.store %5, %alloc_0[%arg1, %arg2] : memref<4x3xf32>
        }
      }
    }
    return %alloc_0 : memref<4x3xf32>
  }
}



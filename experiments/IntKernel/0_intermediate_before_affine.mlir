// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward(%arg0: tensor<2x3xf32>) -> tensor<2x3xf32> {
  %c0_i64 = arith.constant 0 : i64
  %c1_i64 = arith.constant 1 : i64
  %cst = arith.constant dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]> : tensor<3x3xf32>
  %c0 = arith.constant 0 : index
  %c3 = arith.constant 3 : index
  %c1 = arith.constant 1 : index
  %c3_0 = arith.constant 3 : index
  %0 = tensor.empty() : tensor<3x3xf32>
  %1 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<3x3xf32>) outs(%0 : tensor<3x3xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<3x3xf32>
  %cast = tensor.cast %1 : tensor<3x3xf32> to tensor<3x3xf32>
  %c0_1 = arith.constant 0 : index
  %dim = tensor.dim %arg0, %c0_1 : tensor<2x3xf32>
  %c1_2 = arith.constant 1 : index
  %dim_3 = tensor.dim %arg0, %c1_2 : tensor<2x3xf32>
  %c0_4 = arith.constant 0 : index
  %dim_5 = tensor.dim %cast, %c0_4 : tensor<3x3xf32>
  %c1_6 = arith.constant 1 : index
  %dim_7 = tensor.dim %cast, %c1_6 : tensor<3x3xf32>
  %2 = arith.cmpi eq, %dim_3, %dim_5 : index
  cf.assert %2, "mismatching contracting dimension for torch.aten.mm"
  %3 = tensor.empty(%dim, %dim_7) : tensor<?x?xf32>
  %cst_8 = arith.constant 0.000000e+00 : f32
  %4 = linalg.fill ins(%cst_8 : f32) outs(%3 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %5 = linalg.matmul ins(%arg0, %cast : tensor<2x3xf32>, tensor<3x3xf32>) outs(%4 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %cast_9 = tensor.cast %5 : tensor<?x?xf32> to tensor<2x3xf32>
  return %cast_9 : tensor<2x3xf32>
}

// -----// IR Dump After LinalgBufferize (linalg-bufferize) //----- //
func.func @forward(%arg0: tensor<2x3xf32>) -> tensor<2x3xf32> {
  %0 = bufferization.to_memref %arg0 : memref<2x3xf32>
  %c0_i64 = arith.constant 0 : i64
  %c1_i64 = arith.constant 1 : i64
  %cst = arith.constant dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]> : tensor<3x3xf32>
  %1 = bufferization.to_memref %cst : memref<3x3xf32>
  %c0 = arith.constant 0 : index
  %c3 = arith.constant 3 : index
  %c1 = arith.constant 1 : index
  %c3_0 = arith.constant 3 : index
  %2 = tensor.empty() : tensor<3x3xf32>
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%1 : memref<3x3xf32>) outs(%alloc : memref<3x3xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  %3 = bufferization.to_tensor %alloc : memref<3x3xf32>
  %cast = tensor.cast %3 : tensor<3x3xf32> to tensor<3x3xf32>
  %4 = bufferization.to_memref %cast : memref<3x3xf32>
  %c0_1 = arith.constant 0 : index
  %dim = tensor.dim %arg0, %c0_1 : tensor<2x3xf32>
  %c1_2 = arith.constant 1 : index
  %dim_3 = tensor.dim %arg0, %c1_2 : tensor<2x3xf32>
  %c0_4 = arith.constant 0 : index
  %dim_5 = tensor.dim %cast, %c0_4 : tensor<3x3xf32>
  %c1_6 = arith.constant 1 : index
  %dim_7 = tensor.dim %cast, %c1_6 : tensor<3x3xf32>
  %5 = arith.cmpi eq, %dim_3, %dim_5 : index
  cf.assert %5, "mismatching contracting dimension for torch.aten.mm"
  %6 = tensor.empty(%dim, %dim_7) : tensor<?x?xf32>
  %cst_8 = arith.constant 0.000000e+00 : f32
  %alloc_9 = memref.alloc(%dim, %dim_7) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst_8 : f32) outs(%alloc_9 : memref<?x?xf32>)
  %c0_10 = arith.constant 0 : index
  %dim_11 = memref.dim %alloc_9, %c0_10 : memref<?x?xf32>
  %c1_12 = arith.constant 1 : index
  %dim_13 = memref.dim %alloc_9, %c1_12 : memref<?x?xf32>
  %alloc_14 = memref.alloc(%dim_11, %dim_13) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_9, %alloc_14 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%0, %4 : memref<2x3xf32>, memref<3x3xf32>) outs(%alloc_14 : memref<?x?xf32>)
  %7 = bufferization.to_tensor %alloc_14 : memref<?x?xf32>
  %cast_15 = tensor.cast %7 : tensor<?x?xf32> to tensor<2x3xf32>
  return %cast_15 : tensor<2x3xf32>
}

// -----// IR Dump After EmptyTensorToAllocTensor (empty-tensor-to-alloc-tensor) //----- //
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<2x3xf32>) -> tensor<2x3xf32> {
    %c2 = arith.constant 2 : index
    %true = arith.constant true
    %c3 = arith.constant 3 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]> : tensor<3x3xf32>
    %0 = bufferization.to_memref %arg0 : memref<2x3xf32>
    %1 = bufferization.to_memref %cst_0 : memref<3x3xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%1 : memref<3x3xf32>) outs(%alloc : memref<3x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %alloc_1 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_1 : memref<?x?xf32>)
    %alloc_2 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    memref.copy %alloc_1, %alloc_2 : memref<?x?xf32> to memref<?x?xf32>
    linalg.matmul ins(%0, %alloc : memref<2x3xf32>, memref<3x3xf32>) outs(%alloc_2 : memref<?x?xf32>)
    %2 = bufferization.to_tensor %alloc_2 : memref<?x?xf32>
    %cast = tensor.cast %2 : tensor<?x?xf32> to tensor<2x3xf32>
    return %cast : tensor<2x3xf32>
  }
}


// -----// IR Dump After TensorBufferize (tensor-bufferize) //----- //
func.func @forward(%arg0: tensor<2x3xf32>) -> tensor<2x3xf32> {
  %c2 = arith.constant 2 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]> : tensor<3x3xf32>
  %0 = bufferization.to_memref %arg0 : memref<2x3xf32>
  %1 = bufferization.to_memref %cst_0 : memref<3x3xf32>
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%1 : memref<3x3xf32>) outs(%alloc : memref<3x3xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_1 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst : f32) outs(%alloc_1 : memref<?x?xf32>)
  %alloc_2 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_1, %alloc_2 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%0, %alloc : memref<2x3xf32>, memref<3x3xf32>) outs(%alloc_2 : memref<?x?xf32>)
  %cast = memref.cast %alloc_2 : memref<?x?xf32> to memref<2x3xf32>
  %2 = bufferization.to_tensor %cast : memref<2x3xf32>
  return %2 : tensor<2x3xf32>
}

// -----// IR Dump After FuncBufferize (func-bufferize) //----- //
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: memref<2x3xf32>) -> memref<2x3xf32> {
    %0 = bufferization.to_tensor %arg0 : memref<2x3xf32>
    %c2 = arith.constant 2 : index
    %true = arith.constant true
    %c3 = arith.constant 3 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]> : tensor<3x3xf32>
    %1 = bufferization.to_memref %0 : memref<2x3xf32>
    %2 = bufferization.to_memref %cst_0 : memref<3x3xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x3xf32>
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%2 : memref<3x3xf32>) outs(%alloc : memref<3x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %alloc_1 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_1 : memref<?x?xf32>)
    %alloc_2 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    memref.copy %alloc_1, %alloc_2 : memref<?x?xf32> to memref<?x?xf32>
    linalg.matmul ins(%1, %alloc : memref<2x3xf32>, memref<3x3xf32>) outs(%alloc_2 : memref<?x?xf32>)
    %cast = memref.cast %alloc_2 : memref<?x?xf32> to memref<2x3xf32>
    %3 = bufferization.to_tensor %cast : memref<2x3xf32>
    %4 = bufferization.to_memref %3 : memref<2x3xf32>
    return %4 : memref<2x3xf32>
  }
}


// -----// IR Dump After ArithBufferize (arith-bufferize) //----- //
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]>
  func.func @forward(%arg0: memref<2x3xf32>) -> memref<2x3xf32> {
    %c2 = arith.constant 2 : index
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
    %alloc_0 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_0 : memref<?x?xf32>)
    %alloc_1 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    memref.copy %alloc_0, %alloc_1 : memref<?x?xf32> to memref<?x?xf32>
    linalg.matmul ins(%arg0, %alloc : memref<2x3xf32>, memref<3x3xf32>) outs(%alloc_1 : memref<?x?xf32>)
    %cast = memref.cast %alloc_1 : memref<?x?xf32> to memref<2x3xf32>
    return %cast : memref<2x3xf32>
  }
}


// -----// IR Dump After BufferizationBufferize (bufferization-bufferize) //----- //
func.func @forward(%arg0: memref<2x3xf32>) -> memref<2x3xf32> {
  %c2 = arith.constant 2 : index
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
  %alloc_0 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst : f32) outs(%alloc_0 : memref<?x?xf32>)
  %alloc_1 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_0, %alloc_1 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%arg0, %alloc : memref<2x3xf32>, memref<3x3xf32>) outs(%alloc_1 : memref<?x?xf32>)
  %cast = memref.cast %alloc_1 : memref<?x?xf32> to memref<2x3xf32>
  return %cast : memref<2x3xf32>
}

// -----// IR Dump After LinalgLowerToAffineLoops (convert-linalg-to-affine-loops) //----- //
func.func @forward(%arg0: memref<2x3xf32>) -> memref<2x3xf32> {
  %c2 = arith.constant 2 : index
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
  %alloc_0 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  affine.for %arg1 = 0 to 2 {
    affine.for %arg2 = 0 to 3 {
      affine.store %cst, %alloc_0[%arg1, %arg2] : memref<?x?xf32>
    }
  }
  %alloc_1 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_0, %alloc_1 : memref<?x?xf32> to memref<?x?xf32>
  affine.for %arg1 = 0 to 2 {
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 3 {
        %1 = affine.load %arg0[%arg1, %arg3] : memref<2x3xf32>
        %2 = affine.load %alloc[%arg3, %arg2] : memref<3x3xf32>
        %3 = affine.load %alloc_1[%arg1, %arg2] : memref<?x?xf32>
        %4 = arith.mulf %1, %2 : f32
        %5 = arith.addf %3, %4 : f32
        affine.store %5, %alloc_1[%arg1, %arg2] : memref<?x?xf32>
      }
    }
  }
  %cast = memref.cast %alloc_1 : memref<?x?xf32> to memref<2x3xf32>
  return %cast : memref<2x3xf32>
}

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward(%arg0: memref<2x3xf32>) -> memref<2x3xf32> {
  %c2 = arith.constant 2 : index
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
  %alloc = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  affine.for %arg1 = 0 to 2 {
    affine.for %arg2 = 0 to 3 {
      affine.store %cst, %alloc[%arg1, %arg2] : memref<?x?xf32>
    }
  }
  %alloc_0 = memref.alloc(%c2, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc, %alloc_0 : memref<?x?xf32> to memref<?x?xf32>
  affine.for %arg1 = 0 to 2 {
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 3 {
        %1 = affine.load %arg0[%arg1, %arg3] : memref<2x3xf32>
        %2 = affine.load %alloca[%arg3, %arg2] : memref<3x3xf32>
        %3 = affine.load %alloc_0[%arg1, %arg2] : memref<?x?xf32>
        %4 = arith.mulf %1, %2 : f32
        %5 = arith.addf %3, %4 : f32
        affine.store %5, %alloc_0[%arg1, %arg2] : memref<?x?xf32>
      }
    }
  }
  %cast = memref.cast %alloc_0 : memref<?x?xf32> to memref<2x3xf32>
  return %cast : memref<2x3xf32>
}

// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_3x3xf32 : memref<3x3xf32> = dense<[[-0.415798277, 0.157707065, 0.13065134], [-0.458860725, -0.0944703146, -0.40910387], [0.19170782, -0.139193341, -0.414218515]]>
  func.func @forward(%arg0: memref<2x3xf32>) -> memref<2x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x3xf32 : memref<3x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x3xf32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 3 {
        %1 = affine.load %0[%arg1, %arg2] : memref<3x3xf32>
        affine.store %1, %alloca[%arg2, %arg1] : memref<3x3xf32>
      }
    }
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<2x3xf32>
    affine.for %arg1 = 0 to 2 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %alloc[%arg1, %arg2] : memref<2x3xf32>
      }
    }
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<2x3xf32>
    memref.copy %alloc, %alloc_0 : memref<2x3xf32> to memref<2x3xf32>
    affine.for %arg1 = 0 to 2 {
      affine.for %arg2 = 0 to 3 {
        affine.for %arg3 = 0 to 3 {
          %1 = affine.load %arg0[%arg1, %arg3] : memref<2x3xf32>
          %2 = affine.load %alloca[%arg3, %arg2] : memref<3x3xf32>
          %3 = affine.load %alloc_0[%arg1, %arg2] : memref<2x3xf32>
          %4 = arith.mulf %1, %2 : f32
          %5 = arith.addf %3, %4 : f32
          affine.store %5, %alloc_0[%arg1, %arg2] : memref<2x3xf32>
        }
      }
    }
    return %alloc_0 : memref<2x3xf32>
  }
}



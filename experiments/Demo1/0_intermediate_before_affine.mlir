// -----// IR Dump After EmptyTensorToAllocTensor (empty-tensor-to-alloc-tensor) //----- //
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %c3 = arith.constant 3 : index
    %c12 = arith.constant 12 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[-0.0757213831, -0.114497334, -0.127711043, -0.117315672, 0.202118784, -0.25997752, -0.178096369, -0.140102699, -0.118545718, -0.251658499, -0.10871245, -0.26336953], [0.228148803, 0.233722836, 0.27056843, 0.101991534, -0.103726208, 0.00336164469, -0.0788406953, 0.233368948, 0.0752476901, 0.191837281, -0.273358136, -0.281090826], [-0.0345517844, 0.242331296, -0.184581935, 0.266173184, -0.142459035, -0.231992438, -0.237851128, 0.227577239, 0.245558485, -0.042840682, 0.137139797, 0.094666332]]> : tensor<3x12xf32>
    %cst_1 = arith.constant dense<[[0.27852425, 0.428360164, 0.127971411], [-0.224476889, 0.417616963, 0.542268753], [-0.56569916, -0.483246773, -0.363143295], [-0.233854845, -0.383786887, 0.0384527445], [0.089038536, -0.285620868, 0.48163715], [0.192216307, -0.148962632, 0.418001354], [-0.0734101906, -0.302333951, 0.338895798], [-0.469630271, -0.0872598066, -0.323459685], [0.528689742, -0.533850551, 0.0165391155], [-0.234667405, -0.123299189, 0.291907042], [-0.147872105, -0.502636909, -0.412599385], [-0.166963682, 0.0951236709, -0.0930589064]]> : tensor<12x3xf32>
    %0 = bufferization.alloc_tensor() : tensor<3x12xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst_1 : tensor<12x3xf32>) outs(%0 : tensor<3x12xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x12xf32>
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %2 = bufferization.alloc_tensor(%c4, %c12) : tensor<?x?xf32>
    %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = linalg.matmul ins(%arg0, %1 : tensor<4x3xf32>, tensor<3x12xf32>) outs(%3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %cast = tensor.cast %4 : tensor<?x?xf32> to tensor<4x12xf32>
    %5 = bufferization.alloc_tensor() : tensor<12x3xf32>
    %6 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst_0 : tensor<3x12xf32>) outs(%5 : tensor<12x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<12x3xf32>
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %7 = bufferization.alloc_tensor(%c4, %c3) : tensor<?x?xf32>
    %8 = linalg.fill ins(%cst : f32) outs(%7 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %9 = linalg.matmul ins(%cast, %6 : tensor<4x12xf32>, tensor<12x3xf32>) outs(%8 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %cast_2 = tensor.cast %9 : tensor<?x?xf32> to tensor<4x3xf32>
    return %cast_2 : tensor<4x3xf32>
  }
}


// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %c12 = arith.constant 12 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant dense<[[-0.0757213831, -0.114497334, -0.127711043, -0.117315672, 0.202118784, -0.25997752, -0.178096369, -0.140102699, -0.118545718, -0.251658499, -0.10871245, -0.26336953], [0.228148803, 0.233722836, 0.27056843, 0.101991534, -0.103726208, 0.00336164469, -0.0788406953, 0.233368948, 0.0752476901, 0.191837281, -0.273358136, -0.281090826], [-0.0345517844, 0.242331296, -0.184581935, 0.266173184, -0.142459035, -0.231992438, -0.237851128, 0.227577239, 0.245558485, -0.042840682, 0.137139797, 0.094666332]]> : tensor<3x12xf32>
  %cst_1 = arith.constant dense<[[0.27852425, 0.428360164, 0.127971411], [-0.224476889, 0.417616963, 0.542268753], [-0.56569916, -0.483246773, -0.363143295], [-0.233854845, -0.383786887, 0.0384527445], [0.089038536, -0.285620868, 0.48163715], [0.192216307, -0.148962632, 0.418001354], [-0.0734101906, -0.302333951, 0.338895798], [-0.469630271, -0.0872598066, -0.323459685], [0.528689742, -0.533850551, 0.0165391155], [-0.234667405, -0.123299189, 0.291907042], [-0.147872105, -0.502636909, -0.412599385], [-0.166963682, 0.0951236709, -0.0930589064]]> : tensor<12x3xf32>
  %0 = bufferization.alloc_tensor() : tensor<3x12xf32>
  %1 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%cst_1 : tensor<12x3xf32>) outs(%0 : tensor<3x12xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<3x12xf32>
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %2 = bufferization.alloc_tensor(%c4, %c12) : tensor<?x?xf32>
  %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %4 = linalg.matmul ins(%arg0, %1 : tensor<4x3xf32>, tensor<3x12xf32>) outs(%3 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %cast = tensor.cast %4 : tensor<?x?xf32> to tensor<4x12xf32>
  %5 = bufferization.alloc_tensor() : tensor<12x3xf32>
  %6 = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%cst_0 : tensor<3x12xf32>) outs(%5 : tensor<12x3xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<12x3xf32>
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %7 = bufferization.alloc_tensor(%c4, %c3) : tensor<?x?xf32>
  %8 = linalg.fill ins(%cst : f32) outs(%7 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %9 = linalg.matmul ins(%cast, %6 : tensor<4x12xf32>, tensor<12x3xf32>) outs(%8 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %cast_2 = tensor.cast %9 : tensor<?x?xf32> to tensor<4x3xf32>
  return %cast_2 : tensor<4x3xf32>
}

// -----// IR Dump After LinalgBufferize (linalg-bufferize) //----- //
func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
  %0 = bufferization.to_memref %arg0 : memref<4x3xf32>
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %c12 = arith.constant 12 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant dense<[[-0.0757213831, -0.114497334, -0.127711043, -0.117315672, 0.202118784, -0.25997752, -0.178096369, -0.140102699, -0.118545718, -0.251658499, -0.10871245, -0.26336953], [0.228148803, 0.233722836, 0.27056843, 0.101991534, -0.103726208, 0.00336164469, -0.0788406953, 0.233368948, 0.0752476901, 0.191837281, -0.273358136, -0.281090826], [-0.0345517844, 0.242331296, -0.184581935, 0.266173184, -0.142459035, -0.231992438, -0.237851128, 0.227577239, 0.245558485, -0.042840682, 0.137139797, 0.094666332]]> : tensor<3x12xf32>
  %1 = bufferization.to_memref %cst_0 : memref<3x12xf32>
  %cst_1 = arith.constant dense<[[0.27852425, 0.428360164, 0.127971411], [-0.224476889, 0.417616963, 0.542268753], [-0.56569916, -0.483246773, -0.363143295], [-0.233854845, -0.383786887, 0.0384527445], [0.089038536, -0.285620868, 0.48163715], [0.192216307, -0.148962632, 0.418001354], [-0.0734101906, -0.302333951, 0.338895798], [-0.469630271, -0.0872598066, -0.323459685], [0.528689742, -0.533850551, 0.0165391155], [-0.234667405, -0.123299189, 0.291907042], [-0.147872105, -0.502636909, -0.412599385], [-0.166963682, 0.0951236709, -0.0930589064]]> : tensor<12x3xf32>
  %2 = bufferization.to_memref %cst_1 : memref<12x3xf32>
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x12xf32>
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%2 : memref<12x3xf32>) outs(%alloc : memref<3x12xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_2 = memref.alloc(%c4, %c12) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst : f32) outs(%alloc_2 : memref<?x?xf32>)
  %c0 = arith.constant 0 : index
  %dim = memref.dim %alloc_2, %c0 : memref<?x?xf32>
  %c1 = arith.constant 1 : index
  %dim_3 = memref.dim %alloc_2, %c1 : memref<?x?xf32>
  %alloc_4 = memref.alloc(%dim, %dim_3) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_2, %alloc_4 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%0, %alloc : memref<4x3xf32>, memref<3x12xf32>) outs(%alloc_4 : memref<?x?xf32>)
  %3 = bufferization.to_tensor %alloc_4 : memref<?x?xf32>
  %cast = tensor.cast %3 : tensor<?x?xf32> to tensor<4x12xf32>
  %4 = bufferization.to_memref %cast : memref<4x12xf32>
  %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<12x3xf32>
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%1 : memref<3x12xf32>) outs(%alloc_5 : memref<12x3xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_6 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst : f32) outs(%alloc_6 : memref<?x?xf32>)
  %c0_7 = arith.constant 0 : index
  %dim_8 = memref.dim %alloc_6, %c0_7 : memref<?x?xf32>
  %c1_9 = arith.constant 1 : index
  %dim_10 = memref.dim %alloc_6, %c1_9 : memref<?x?xf32>
  %alloc_11 = memref.alloc(%dim_8, %dim_10) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_6, %alloc_11 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%4, %alloc_5 : memref<4x12xf32>, memref<12x3xf32>) outs(%alloc_11 : memref<?x?xf32>)
  %5 = bufferization.to_tensor %alloc_11 : memref<?x?xf32>
  %cast_12 = tensor.cast %5 : tensor<?x?xf32> to tensor<4x3xf32>
  return %cast_12 : tensor<4x3xf32>
}

// -----// IR Dump After TensorBufferize (tensor-bufferize) //----- //
func.func @forward(%arg0: tensor<4x3xf32>) -> tensor<4x3xf32> {
  %0 = bufferization.to_memref %arg0 : memref<4x3xf32>
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %c12 = arith.constant 12 : index
  %cst = arith.constant 0.000000e+00 : f32
  %cst_0 = arith.constant dense<[[-0.0757213831, -0.114497334, -0.127711043, -0.117315672, 0.202118784, -0.25997752, -0.178096369, -0.140102699, -0.118545718, -0.251658499, -0.10871245, -0.26336953], [0.228148803, 0.233722836, 0.27056843, 0.101991534, -0.103726208, 0.00336164469, -0.0788406953, 0.233368948, 0.0752476901, 0.191837281, -0.273358136, -0.281090826], [-0.0345517844, 0.242331296, -0.184581935, 0.266173184, -0.142459035, -0.231992438, -0.237851128, 0.227577239, 0.245558485, -0.042840682, 0.137139797, 0.094666332]]> : tensor<3x12xf32>
  %1 = bufferization.to_memref %cst_0 : memref<3x12xf32>
  %cst_1 = arith.constant dense<[[0.27852425, 0.428360164, 0.127971411], [-0.224476889, 0.417616963, 0.542268753], [-0.56569916, -0.483246773, -0.363143295], [-0.233854845, -0.383786887, 0.0384527445], [0.089038536, -0.285620868, 0.48163715], [0.192216307, -0.148962632, 0.418001354], [-0.0734101906, -0.302333951, 0.338895798], [-0.469630271, -0.0872598066, -0.323459685], [0.528689742, -0.533850551, 0.0165391155], [-0.234667405, -0.123299189, 0.291907042], [-0.147872105, -0.502636909, -0.412599385], [-0.166963682, 0.0951236709, -0.0930589064]]> : tensor<12x3xf32>
  %2 = bufferization.to_memref %cst_1 : memref<12x3xf32>
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x12xf32>
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%2 : memref<12x3xf32>) outs(%alloc : memref<3x12xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_2 = memref.alloc(%c4, %c12) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst : f32) outs(%alloc_2 : memref<?x?xf32>)
  %c0 = arith.constant 0 : index
  %dim = memref.dim %alloc_2, %c0 : memref<?x?xf32>
  %c1 = arith.constant 1 : index
  %dim_3 = memref.dim %alloc_2, %c1 : memref<?x?xf32>
  %alloc_4 = memref.alloc(%dim, %dim_3) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_2, %alloc_4 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%0, %alloc : memref<4x3xf32>, memref<3x12xf32>) outs(%alloc_4 : memref<?x?xf32>)
  %cast = memref.cast %alloc_4 : memref<?x?xf32> to memref<4x12xf32>
  %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<12x3xf32>
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%1 : memref<3x12xf32>) outs(%alloc_5 : memref<12x3xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_6 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst : f32) outs(%alloc_6 : memref<?x?xf32>)
  %c0_7 = arith.constant 0 : index
  %dim_8 = memref.dim %alloc_6, %c0_7 : memref<?x?xf32>
  %c1_9 = arith.constant 1 : index
  %dim_10 = memref.dim %alloc_6, %c1_9 : memref<?x?xf32>
  %alloc_11 = memref.alloc(%dim_8, %dim_10) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_6, %alloc_11 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%cast, %alloc_5 : memref<4x12xf32>, memref<12x3xf32>) outs(%alloc_11 : memref<?x?xf32>)
  %cast_12 = memref.cast %alloc_11 : memref<?x?xf32> to memref<4x3xf32>
  %3 = bufferization.to_tensor %cast_12 : memref<4x3xf32>
  return %3 : tensor<4x3xf32>
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
    %c12 = arith.constant 12 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[-0.0757213831, -0.114497334, -0.127711043, -0.117315672, 0.202118784, -0.25997752, -0.178096369, -0.140102699, -0.118545718, -0.251658499, -0.10871245, -0.26336953], [0.228148803, 0.233722836, 0.27056843, 0.101991534, -0.103726208, 0.00336164469, -0.0788406953, 0.233368948, 0.0752476901, 0.191837281, -0.273358136, -0.281090826], [-0.0345517844, 0.242331296, -0.184581935, 0.266173184, -0.142459035, -0.231992438, -0.237851128, 0.227577239, 0.245558485, -0.042840682, 0.137139797, 0.094666332]]> : tensor<3x12xf32>
    %2 = bufferization.to_memref %cst_0 : memref<3x12xf32>
    %cst_1 = arith.constant dense<[[0.27852425, 0.428360164, 0.127971411], [-0.224476889, 0.417616963, 0.542268753], [-0.56569916, -0.483246773, -0.363143295], [-0.233854845, -0.383786887, 0.0384527445], [0.089038536, -0.285620868, 0.48163715], [0.192216307, -0.148962632, 0.418001354], [-0.0734101906, -0.302333951, 0.338895798], [-0.469630271, -0.0872598066, -0.323459685], [0.528689742, -0.533850551, 0.0165391155], [-0.234667405, -0.123299189, 0.291907042], [-0.147872105, -0.502636909, -0.412599385], [-0.166963682, 0.0951236709, -0.0930589064]]> : tensor<12x3xf32>
    %3 = bufferization.to_memref %cst_1 : memref<12x3xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x12xf32>
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%3 : memref<12x3xf32>) outs(%alloc : memref<3x12xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %alloc_2 = memref.alloc(%c4, %c12) {alignment = 64 : i64} : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_2 : memref<?x?xf32>)
    %c0 = arith.constant 0 : index
    %dim = memref.dim %alloc_2, %c0 : memref<?x?xf32>
    %c1 = arith.constant 1 : index
    %dim_3 = memref.dim %alloc_2, %c1 : memref<?x?xf32>
    %alloc_4 = memref.alloc(%dim, %dim_3) {alignment = 64 : i64} : memref<?x?xf32>
    memref.copy %alloc_2, %alloc_4 : memref<?x?xf32> to memref<?x?xf32>
    linalg.matmul ins(%1, %alloc : memref<4x3xf32>, memref<3x12xf32>) outs(%alloc_4 : memref<?x?xf32>)
    %cast = memref.cast %alloc_4 : memref<?x?xf32> to memref<4x12xf32>
    %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<12x3xf32>
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%2 : memref<3x12xf32>) outs(%alloc_5 : memref<12x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %alloc_6 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_6 : memref<?x?xf32>)
    %c0_7 = arith.constant 0 : index
    %dim_8 = memref.dim %alloc_6, %c0_7 : memref<?x?xf32>
    %c1_9 = arith.constant 1 : index
    %dim_10 = memref.dim %alloc_6, %c1_9 : memref<?x?xf32>
    %alloc_11 = memref.alloc(%dim_8, %dim_10) {alignment = 64 : i64} : memref<?x?xf32>
    memref.copy %alloc_6, %alloc_11 : memref<?x?xf32> to memref<?x?xf32>
    linalg.matmul ins(%cast, %alloc_5 : memref<4x12xf32>, memref<12x3xf32>) outs(%alloc_11 : memref<?x?xf32>)
    %cast_12 = memref.cast %alloc_11 : memref<?x?xf32> to memref<4x3xf32>
    %4 = bufferization.to_tensor %cast_12 : memref<4x3xf32>
    %5 = bufferization.to_memref %4 : memref<4x3xf32>
    return %5 : memref<4x3xf32>
  }
}


// -----// IR Dump After ArithBufferize (arith-bufferize) //----- //
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[0.27852425, 0.428360164, 0.127971411], [-0.224476889, 0.417616963, 0.542268753], [-0.56569916, -0.483246773, -0.363143295], [-0.233854845, -0.383786887, 0.0384527445], [0.089038536, -0.285620868, 0.48163715], [0.192216307, -0.148962632, 0.418001354], [-0.0734101906, -0.302333951, 0.338895798], [-0.469630271, -0.0872598066, -0.323459685], [0.528689742, -0.533850551, 0.0165391155], [-0.234667405, -0.123299189, 0.291907042], [-0.147872105, -0.502636909, -0.412599385], [-0.166963682, 0.0951236709, -0.0930589064]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[-0.0757213831, -0.114497334, -0.127711043, -0.117315672, 0.202118784, -0.25997752, -0.178096369, -0.140102699, -0.118545718, -0.251658499, -0.10871245, -0.26336953], [0.228148803, 0.233722836, 0.27056843, 0.101991534, -0.103726208, 0.00336164469, -0.0788406953, 0.233368948, 0.0752476901, 0.191837281, -0.273358136, -0.281090826], [-0.0345517844, 0.242331296, -0.184581935, 0.266173184, -0.142459035, -0.231992438, -0.237851128, 0.227577239, 0.245558485, -0.042840682, 0.137139797, 0.094666332]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %c3 = arith.constant 3 : index
    %c12 = arith.constant 12 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x12xf32>
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%1 : memref<12x3xf32>) outs(%alloc : memref<3x12xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %alloc_0 = memref.alloc(%c4, %c12) {alignment = 64 : i64} : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_0 : memref<?x?xf32>)
    %c0 = arith.constant 0 : index
    %dim = memref.dim %alloc_0, %c0 : memref<?x?xf32>
    %c1 = arith.constant 1 : index
    %dim_1 = memref.dim %alloc_0, %c1 : memref<?x?xf32>
    %alloc_2 = memref.alloc(%dim, %dim_1) {alignment = 64 : i64} : memref<?x?xf32>
    memref.copy %alloc_0, %alloc_2 : memref<?x?xf32> to memref<?x?xf32>
    linalg.matmul ins(%arg0, %alloc : memref<4x3xf32>, memref<3x12xf32>) outs(%alloc_2 : memref<?x?xf32>)
    %cast = memref.cast %alloc_2 : memref<?x?xf32> to memref<4x12xf32>
    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<12x3xf32>
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%0 : memref<3x12xf32>) outs(%alloc_3 : memref<12x3xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
    %alloc_4 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
    linalg.fill ins(%cst : f32) outs(%alloc_4 : memref<?x?xf32>)
    %c0_5 = arith.constant 0 : index
    %dim_6 = memref.dim %alloc_4, %c0_5 : memref<?x?xf32>
    %c1_7 = arith.constant 1 : index
    %dim_8 = memref.dim %alloc_4, %c1_7 : memref<?x?xf32>
    %alloc_9 = memref.alloc(%dim_6, %dim_8) {alignment = 64 : i64} : memref<?x?xf32>
    memref.copy %alloc_4, %alloc_9 : memref<?x?xf32> to memref<?x?xf32>
    linalg.matmul ins(%cast, %alloc_3 : memref<4x12xf32>, memref<12x3xf32>) outs(%alloc_9 : memref<?x?xf32>)
    %cast_10 = memref.cast %alloc_9 : memref<?x?xf32> to memref<4x3xf32>
    return %cast_10 : memref<4x3xf32>
  }
}


// -----// IR Dump After BufferizationBufferize (bufferization-bufferize) //----- //
func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %c12 = arith.constant 12 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
  %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x12xf32>
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%1 : memref<12x3xf32>) outs(%alloc : memref<3x12xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_0 = memref.alloc(%c4, %c12) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst : f32) outs(%alloc_0 : memref<?x?xf32>)
  %c0 = arith.constant 0 : index
  %dim = memref.dim %alloc_0, %c0 : memref<?x?xf32>
  %c1 = arith.constant 1 : index
  %dim_1 = memref.dim %alloc_0, %c1 : memref<?x?xf32>
  %alloc_2 = memref.alloc(%dim, %dim_1) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_0, %alloc_2 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%arg0, %alloc : memref<4x3xf32>, memref<3x12xf32>) outs(%alloc_2 : memref<?x?xf32>)
  %cast = memref.cast %alloc_2 : memref<?x?xf32> to memref<4x12xf32>
  %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<12x3xf32>
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>], iterator_types = ["parallel", "parallel"]} ins(%0 : memref<3x12xf32>) outs(%alloc_3 : memref<12x3xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in : f32
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_4 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  linalg.fill ins(%cst : f32) outs(%alloc_4 : memref<?x?xf32>)
  %c0_5 = arith.constant 0 : index
  %dim_6 = memref.dim %alloc_4, %c0_5 : memref<?x?xf32>
  %c1_7 = arith.constant 1 : index
  %dim_8 = memref.dim %alloc_4, %c1_7 : memref<?x?xf32>
  %alloc_9 = memref.alloc(%dim_6, %dim_8) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_4, %alloc_9 : memref<?x?xf32> to memref<?x?xf32>
  linalg.matmul ins(%cast, %alloc_3 : memref<4x12xf32>, memref<12x3xf32>) outs(%alloc_9 : memref<?x?xf32>)
  %cast_10 = memref.cast %alloc_9 : memref<?x?xf32> to memref<4x3xf32>
  return %cast_10 : memref<4x3xf32>
}

// -----// IR Dump After LinalgLowerToAffineLoops (convert-linalg-to-affine-loops) //----- //
func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %c12 = arith.constant 12 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
  %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<3x12xf32>
  affine.for %arg1 = 0 to 12 {
    affine.for %arg2 = 0 to 3 {
      %2 = affine.load %1[%arg1, %arg2] : memref<12x3xf32>
      affine.store %2, %alloc[%arg2, %arg1] : memref<3x12xf32>
    }
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_0 = memref.alloc(%c4, %c12) {alignment = 64 : i64} : memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 12 {
      affine.store %cst, %alloc_0[%arg1, %arg2] : memref<?x?xf32>
    }
  }
  %alloc_1 = memref.alloc(%c4, %c12) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_0, %alloc_1 : memref<?x?xf32> to memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 12 {
      affine.for %arg3 = 0 to 3 {
        %2 = affine.load %arg0[%arg1, %arg3] : memref<4x3xf32>
        %3 = affine.load %alloc[%arg3, %arg2] : memref<3x12xf32>
        %4 = affine.load %alloc_1[%arg1, %arg2] : memref<?x?xf32>
        %5 = arith.mulf %2, %3 : f32
        %6 = arith.addf %4, %5 : f32
        affine.store %6, %alloc_1[%arg1, %arg2] : memref<?x?xf32>
      }
    }
  }
  %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<12x3xf32>
  affine.for %arg1 = 0 to 3 {
    affine.for %arg2 = 0 to 12 {
      %2 = affine.load %0[%arg1, %arg2] : memref<3x12xf32>
      affine.store %2, %alloc_2[%arg2, %arg1] : memref<12x3xf32>
    }
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_3 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 3 {
      affine.store %cst, %alloc_3[%arg1, %arg2] : memref<?x?xf32>
    }
  }
  %alloc_4 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_3, %alloc_4 : memref<?x?xf32> to memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 12 {
        %2 = affine.load %alloc_1[%arg1, %arg3] : memref<?x?xf32>
        %3 = affine.load %alloc_2[%arg3, %arg2] : memref<12x3xf32>
        %4 = affine.load %alloc_4[%arg1, %arg2] : memref<?x?xf32>
        %5 = arith.mulf %2, %3 : f32
        %6 = arith.addf %4, %5 : f32
        affine.store %6, %alloc_4[%arg1, %arg2] : memref<?x?xf32>
      }
    }
  }
  %cast = memref.cast %alloc_4 : memref<?x?xf32> to memref<4x3xf32>
  return %cast : memref<4x3xf32>
}

// -----// IR Dump After PromoteBuffersToStack (promote-buffers-to-stack) //----- //
func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
  %c4 = arith.constant 4 : index
  %true = arith.constant true
  %c3 = arith.constant 3 : index
  %c12 = arith.constant 12 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
  %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
  %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
  affine.for %arg1 = 0 to 12 {
    affine.for %arg2 = 0 to 3 {
      %2 = affine.load %1[%arg1, %arg2] : memref<12x3xf32>
      affine.store %2, %alloca[%arg2, %arg1] : memref<3x12xf32>
    }
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc = memref.alloc(%c4, %c12) {alignment = 64 : i64} : memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 12 {
      affine.store %cst, %alloc[%arg1, %arg2] : memref<?x?xf32>
    }
  }
  %alloc_0 = memref.alloc(%c4, %c12) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc, %alloc_0 : memref<?x?xf32> to memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 12 {
      affine.for %arg3 = 0 to 3 {
        %2 = affine.load %arg0[%arg1, %arg3] : memref<4x3xf32>
        %3 = affine.load %alloca[%arg3, %arg2] : memref<3x12xf32>
        %4 = affine.load %alloc_0[%arg1, %arg2] : memref<?x?xf32>
        %5 = arith.mulf %2, %3 : f32
        %6 = arith.addf %4, %5 : f32
        affine.store %6, %alloc_0[%arg1, %arg2] : memref<?x?xf32>
      }
    }
  }
  %alloca_1 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
  affine.for %arg1 = 0 to 3 {
    affine.for %arg2 = 0 to 12 {
      %2 = affine.load %0[%arg1, %arg2] : memref<3x12xf32>
      affine.store %2, %alloca_1[%arg2, %arg1] : memref<12x3xf32>
    }
  }
  cf.assert %true, "mismatching contracting dimension for torch.aten.mm"
  %alloc_2 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 3 {
      affine.store %cst, %alloc_2[%arg1, %arg2] : memref<?x?xf32>
    }
  }
  %alloc_3 = memref.alloc(%c4, %c3) {alignment = 64 : i64} : memref<?x?xf32>
  memref.copy %alloc_2, %alloc_3 : memref<?x?xf32> to memref<?x?xf32>
  affine.for %arg1 = 0 to 4 {
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 12 {
        %2 = affine.load %alloc_0[%arg1, %arg3] : memref<?x?xf32>
        %3 = affine.load %alloca_1[%arg3, %arg2] : memref<12x3xf32>
        %4 = affine.load %alloc_3[%arg1, %arg2] : memref<?x?xf32>
        %5 = arith.mulf %2, %3 : f32
        %6 = arith.addf %4, %5 : f32
        affine.store %6, %alloc_3[%arg1, %arg2] : memref<?x?xf32>
      }
    }
  }
  %cast = memref.cast %alloc_3 : memref<?x?xf32> to memref<4x3xf32>
  return %cast : memref<4x3xf32>
}

// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[0.27852425, 0.428360164, 0.127971411], [-0.224476889, 0.417616963, 0.542268753], [-0.56569916, -0.483246773, -0.363143295], [-0.233854845, -0.383786887, 0.0384527445], [0.089038536, -0.285620868, 0.48163715], [0.192216307, -0.148962632, 0.418001354], [-0.0734101906, -0.302333951, 0.338895798], [-0.469630271, -0.0872598066, -0.323459685], [0.528689742, -0.533850551, 0.0165391155], [-0.234667405, -0.123299189, 0.291907042], [-0.147872105, -0.502636909, -0.412599385], [-0.166963682, 0.0951236709, -0.0930589064]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[-0.0757213831, -0.114497334, -0.127711043, -0.117315672, 0.202118784, -0.25997752, -0.178096369, -0.140102699, -0.118545718, -0.251658499, -0.10871245, -0.26336953], [0.228148803, 0.233722836, 0.27056843, 0.101991534, -0.103726208, 0.00336164469, -0.0788406953, 0.233368948, 0.0752476901, 0.191837281, -0.273358136, -0.281090826], [-0.0345517844, 0.242331296, -0.184581935, 0.266173184, -0.142459035, -0.231992438, -0.237851128, 0.227577239, 0.245558485, -0.042840682, 0.137139797, 0.094666332]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    affine.for %arg1 = 0 to 12 {
      affine.for %arg2 = 0 to 3 {
        %2 = affine.load %1[%arg1, %arg2] : memref<12x3xf32>
        affine.store %2, %alloca[%arg2, %arg1] : memref<3x12xf32>
      }
    }
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<4x12xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 12 {
        affine.store %cst, %alloc[%arg1, %arg2] : memref<4x12xf32>
      }
    }
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<4x12xf32>
    memref.copy %alloc, %alloc_0 : memref<4x12xf32> to memref<4x12xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 12 {
        affine.for %arg3 = 0 to 3 {
          %2 = affine.load %arg0[%arg1, %arg3] : memref<4x3xf32>
          %3 = affine.load %alloca[%arg3, %arg2] : memref<3x12xf32>
          %4 = affine.load %alloc_0[%arg1, %arg2] : memref<4x12xf32>
          %5 = arith.mulf %2, %3 : f32
          %6 = arith.addf %4, %5 : f32
          affine.store %6, %alloc_0[%arg1, %arg2] : memref<4x12xf32>
        }
      }
    }
    %alloca_1 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    affine.for %arg1 = 0 to 3 {
      affine.for %arg2 = 0 to 12 {
        %2 = affine.load %0[%arg1, %arg2] : memref<3x12xf32>
        affine.store %2, %alloca_1[%arg2, %arg1] : memref<12x3xf32>
      }
    }
    %alloc_2 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %alloc_2[%arg1, %arg2] : memref<4x3xf32>
      }
    }
    %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %alloc_2, %alloc_3 : memref<4x3xf32> to memref<4x3xf32>
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 3 {
        affine.for %arg3 = 0 to 12 {
          %2 = affine.load %alloc_0[%arg1, %arg3] : memref<4x12xf32>
          %3 = affine.load %alloca_1[%arg3, %arg2] : memref<12x3xf32>
          %4 = affine.load %alloc_3[%arg1, %arg2] : memref<4x3xf32>
          %5 = arith.mulf %2, %3 : f32
          %6 = arith.addf %4, %5 : f32
          affine.store %6, %alloc_3[%arg1, %arg2] : memref<4x3xf32>
        }
      }
    }
    return %alloc_3 : memref<4x3xf32>
  }
}



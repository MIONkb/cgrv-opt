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
    %cst_0 = arith.constant dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]> : tensor<3x12xf32>
    %cst_1 = arith.constant dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]> : tensor<12x3xf32>
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
  %cst_0 = arith.constant dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]> : tensor<3x12xf32>
  %cst_1 = arith.constant dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]> : tensor<12x3xf32>
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
  %cst_0 = arith.constant dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]> : tensor<3x12xf32>
  %1 = bufferization.to_memref %cst_0 : memref<3x12xf32>
  %cst_1 = arith.constant dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]> : tensor<12x3xf32>
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
  %cst_0 = arith.constant dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]> : tensor<3x12xf32>
  %1 = bufferization.to_memref %cst_0 : memref<3x12xf32>
  %cst_1 = arith.constant dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]> : tensor<12x3xf32>
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
    %cst_0 = arith.constant dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]> : tensor<3x12xf32>
    %2 = bufferization.to_memref %cst_0 : memref<3x12xf32>
    %cst_1 = arith.constant dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]> : tensor<12x3xf32>
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
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
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
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[-0.259240121, -0.234688252, 0.510510147], [0.233562827, -0.0331445783, 0.384852856], [-0.508802652, 0.173100084, -0.456325561], [0.334649473, 0.101393677, -0.0848175361], [0.415013522, 0.548246503, -0.0517567173], [0.558391511, -0.239463642, -0.212957352], [0.0163944438, -0.32234925, 0.205953121], [-0.284711599, 0.075589411, 0.142221317], [-5.766300e-01, -0.231847823, -0.161687583], [-0.538891375, 0.341592878, -0.576503336], [0.443732411, -0.319553018, -0.167551935], [0.142661244, 0.165032223, -0.576377869]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[0.161275461, 0.0990483835, 0.140225306, 0.0738267228, -0.0230169389, -0.191564813, 0.1457607, 0.197757319, -0.0972366183, 0.126508623, 0.139206693, -0.0688978806], [-0.176147208, -0.213960767, -0.198053509, -0.0384910479, -0.245581821, 0.139692709, -2.673340e-01, -0.223085925, -0.196028829, -0.226647332, -0.0104687046, 0.127765238], [0.0994836315, -0.128047019, -0.0917707682, 0.115462713, 0.0437031351, -0.0613443516, 0.0145246265, 0.240862086, 0.133553818, -0.0305191949, -0.286686301, -0.204464972]]>
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



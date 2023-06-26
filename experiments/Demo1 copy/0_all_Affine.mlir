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


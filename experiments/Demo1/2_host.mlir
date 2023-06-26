module attributes {torch.debug_module_name = "L"} {
  memref.global "private" constant @__constant_12x3xf32 : memref<12x3xf32> = dense<[[0.27852425, 0.428360164, 0.127971411], [-0.224476889, 0.417616963, 0.542268753], [-0.56569916, -0.483246773, -0.363143295], [-0.233854845, -0.383786887, 0.0384527445], [0.089038536, -0.285620868, 0.48163715], [0.192216307, -0.148962632, 0.418001354], [-0.0734101906, -0.302333951, 0.338895798], [-0.469630271, -0.0872598066, -0.323459685], [0.528689742, -0.533850551, 0.0165391155], [-0.234667405, -0.123299189, 0.291907042], [-0.147872105, -0.502636909, -0.412599385], [-0.166963682, 0.0951236709, -0.0930589064]]>
  memref.global "private" constant @__constant_3x12xf32 : memref<3x12xf32> = dense<[[-0.0757213831, -0.114497334, -0.127711043, -0.117315672, 0.202118784, -0.25997752, -0.178096369, -0.140102699, -0.118545718, -0.251658499, -0.10871245, -0.26336953], [0.228148803, 0.233722836, 0.27056843, 0.101991534, -0.103726208, 0.00336164469, -0.0788406953, 0.233368948, 0.0752476901, 0.191837281, -0.273358136, -0.281090826], [-0.0345517844, 0.242331296, -0.184581935, 0.266173184, -0.142459035, -0.231992438, -0.237851128, 0.227577239, 0.245558485, -0.042840682, 0.137139797, 0.094666332]]>
  func.func @forward(%arg0: memref<4x3xf32>) -> memref<4x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = memref.get_global @__constant_3x12xf32 : memref<3x12xf32>
    %1 = memref.get_global @__constant_12x3xf32 : memref<12x3xf32>
    %2 = memref.alloca() {alignment = 64 : i64} : memref<3x12xf32>
    FDRA.KernelCall @forward_kernel_0(%1, %2) : (memref<12x3xf32>, memref<3x12xf32>) -> ()
    %3 = memref.alloc() {alignment = 64 : i64} : memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_1(%3) : (memref<4x12xf32>) -> ()
    %4 = memref.alloc() {alignment = 64 : i64} : memref<4x12xf32>
    memref.copy %3, %4 : memref<4x12xf32> to memref<4x12xf32>
    FDRA.KernelCall @forward_kernel_2(%arg0, %2, %4) : (memref<4x3xf32>, memref<3x12xf32>, memref<4x12xf32>) -> ()
    %5 = memref.alloca() {alignment = 64 : i64} : memref<12x3xf32>
    FDRA.KernelCall @forward_kernel_3(%0, %5) : (memref<3x12xf32>, memref<12x3xf32>) -> ()
    %6 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_4(%6) : (memref<4x3xf32>) -> ()
    %7 = memref.alloc() {alignment = 64 : i64} : memref<4x3xf32>
    memref.copy %6, %7 : memref<4x3xf32> to memref<4x3xf32>
    FDRA.KernelCall @forward_kernel_5(%4, %5, %7) : (memref<4x12xf32>, memref<12x3xf32>, memref<4x3xf32>) -> ()
    return %7 : memref<4x3xf32>
  }
  func.func @forward_kernel_0(%arg0: memref<12x3xf32>, %arg1: memref<3x12xf32>) attributes {Kernel, forward_kernel_0} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg2 = 0 to 12 {
      affine.for %arg3 = 0 to 3 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<12x3xf32>
        affine.store %0, %arg1[%arg3, %arg2] : memref<3x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_1(%arg0: memref<4x12xf32>) attributes {Kernel, forward_kernel_1} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 12 {
        affine.store %cst, %arg0[%arg1, %arg2] : memref<4x12xf32>
      }
    }
    return
  }
  func.func @forward_kernel_2(%arg0: memref<4x3xf32>, %arg1: memref<3x12xf32>, %arg2: memref<4x12xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 12 {
        affine.for %arg5 = 0 to 3 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<4x3xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<3x12xf32>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<4x12xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<4x12xf32>
        }
      }
    }
    return
  }
  func.func @forward_kernel_3(%arg0: memref<3x12xf32>, %arg1: memref<12x3xf32>) attributes {Kernel, forward_kernel_3} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg2 = 0 to 3 {
      affine.for %arg3 = 0 to 12 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<3x12xf32>
        affine.store %0, %arg1[%arg3, %arg2] : memref<12x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_4(%arg0: memref<4x3xf32>) attributes {Kernel, forward_kernel_4} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to 3 {
        affine.store %cst, %arg0[%arg1, %arg2] : memref<4x3xf32>
      }
    }
    return
  }
  func.func @forward_kernel_5(%arg0: memref<4x12xf32>, %arg1: memref<12x3xf32>, %arg2: memref<4x3xf32>) attributes {Kernel, forward_kernel_5} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 3 {
        affine.for %arg5 = 0 to 12 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<4x12xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<12x3xf32>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<4x3xf32>
          %3 = arith.mulf %0, %1 : f32
          %4 = arith.addf %2, %3 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<4x3xf32>
        }
      }
    }
    return
  }
}


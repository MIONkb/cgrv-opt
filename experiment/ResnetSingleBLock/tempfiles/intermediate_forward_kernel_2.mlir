// -----// IR Dump After ArithExpandOps (arith-expand) //----- //
#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
#map2 = affine_map<(d0) -> (d0 + 3)>
#map3 = affine_map<(d0) -> (d0 + 4)>
#map4 = affine_map<(d0) -> (d0 + 5)>
#map5 = affine_map<(d0) -> (d0 + 6)>
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 112 step 7 {
        %0 = affine.load %arg0[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
        %1 = arith.cmpf ugt, %0, %cst : f32
        %2 = arith.select %1, %0, %cst : f32
        affine.store %2, %arg1[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
        %3 = affine.apply #map(%arg3)
        %4 = affine.load %arg0[0, 0, %arg2, %3] : memref<1x64x112x112xf32>
        %5 = arith.cmpf ugt, %4, %cst : f32
        %6 = arith.select %5, %4, %cst : f32
        affine.store %6, %arg1[0, 0, %arg2, %3] : memref<1x64x112x112xf32>
        %7 = affine.apply #map1(%arg3)
        %8 = affine.load %arg0[0, 0, %arg2, %7] : memref<1x64x112x112xf32>
        %9 = arith.cmpf ugt, %8, %cst : f32
        %10 = arith.select %9, %8, %cst : f32
        affine.store %10, %arg1[0, 0, %arg2, %7] : memref<1x64x112x112xf32>
        %11 = affine.apply #map2(%arg3)
        %12 = affine.load %arg0[0, 0, %arg2, %11] : memref<1x64x112x112xf32>
        %13 = arith.cmpf ugt, %12, %cst : f32
        %14 = arith.select %13, %12, %cst : f32
        affine.store %14, %arg1[0, 0, %arg2, %11] : memref<1x64x112x112xf32>
        %15 = affine.apply #map3(%arg3)
        %16 = affine.load %arg0[0, 0, %arg2, %15] : memref<1x64x112x112xf32>
        %17 = arith.cmpf ugt, %16, %cst : f32
        %18 = arith.select %17, %16, %cst : f32
        affine.store %18, %arg1[0, 0, %arg2, %15] : memref<1x64x112x112xf32>
        %19 = affine.apply #map4(%arg3)
        %20 = affine.load %arg0[0, 0, %arg2, %19] : memref<1x64x112x112xf32>
        %21 = arith.cmpf ugt, %20, %cst : f32
        %22 = arith.select %21, %20, %cst : f32
        affine.store %22, %arg1[0, 0, %arg2, %19] : memref<1x64x112x112xf32>
        %23 = affine.apply #map5(%arg3)
        %24 = affine.load %arg0[0, 0, %arg2, %23] : memref<1x64x112x112xf32>
        %25 = arith.cmpf ugt, %24, %cst : f32
        %26 = arith.select %25, %24, %cst : f32
        affine.store %26, %arg1[0, 0, %arg2, %23] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After ExpandOps (memref-expand) //----- //
#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
#map2 = affine_map<(d0) -> (d0 + 3)>
#map3 = affine_map<(d0) -> (d0 + 4)>
#map4 = affine_map<(d0) -> (d0 + 5)>
#map5 = affine_map<(d0) -> (d0 + 6)>
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 112 step 7 {
        %0 = affine.load %arg0[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
        %1 = arith.cmpf ugt, %0, %cst : f32
        %2 = arith.select %1, %0, %cst : f32
        affine.store %2, %arg1[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
        %3 = affine.apply #map(%arg3)
        %4 = affine.load %arg0[0, 0, %arg2, %3] : memref<1x64x112x112xf32>
        %5 = arith.cmpf ugt, %4, %cst : f32
        %6 = arith.select %5, %4, %cst : f32
        affine.store %6, %arg1[0, 0, %arg2, %3] : memref<1x64x112x112xf32>
        %7 = affine.apply #map1(%arg3)
        %8 = affine.load %arg0[0, 0, %arg2, %7] : memref<1x64x112x112xf32>
        %9 = arith.cmpf ugt, %8, %cst : f32
        %10 = arith.select %9, %8, %cst : f32
        affine.store %10, %arg1[0, 0, %arg2, %7] : memref<1x64x112x112xf32>
        %11 = affine.apply #map2(%arg3)
        %12 = affine.load %arg0[0, 0, %arg2, %11] : memref<1x64x112x112xf32>
        %13 = arith.cmpf ugt, %12, %cst : f32
        %14 = arith.select %13, %12, %cst : f32
        affine.store %14, %arg1[0, 0, %arg2, %11] : memref<1x64x112x112xf32>
        %15 = affine.apply #map3(%arg3)
        %16 = affine.load %arg0[0, 0, %arg2, %15] : memref<1x64x112x112xf32>
        %17 = arith.cmpf ugt, %16, %cst : f32
        %18 = arith.select %17, %16, %cst : f32
        affine.store %18, %arg1[0, 0, %arg2, %15] : memref<1x64x112x112xf32>
        %19 = affine.apply #map4(%arg3)
        %20 = affine.load %arg0[0, 0, %arg2, %19] : memref<1x64x112x112xf32>
        %21 = arith.cmpf ugt, %20, %cst : f32
        %22 = arith.select %21, %20, %cst : f32
        affine.store %22, %arg1[0, 0, %arg2, %19] : memref<1x64x112x112xf32>
        %23 = affine.apply #map5(%arg3)
        %24 = affine.load %arg0[0, 0, %arg2, %23] : memref<1x64x112x112xf32>
        %25 = arith.cmpf ugt, %24, %cst : f32
        %26 = arith.select %25, %24, %cst : f32
        affine.store %26, %arg1[0, 0, %arg2, %23] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %cst = arith.constant 0.000000e+00 : f32
  affine.for %arg2 = 0 to 16 {
    affine.for %arg3 = 0 to 112 step 7 {
      %0 = affine.load %arg0[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
      %1 = arith.cmpf ugt, %0, %cst : f32
      %2 = arith.select %1, %0, %cst : f32
      affine.store %2, %arg1[0, 0, %arg2, %arg3] : memref<1x64x112x112xf32>
      %3 = affine.apply affine_map<(d0) -> (d0 + 1)>(%arg3)
      %4 = affine.load %arg0[0, 0, %arg2, %3] : memref<1x64x112x112xf32>
      %5 = arith.cmpf ugt, %4, %cst : f32
      %6 = arith.select %5, %4, %cst : f32
      affine.store %6, %arg1[0, 0, %arg2, %3] : memref<1x64x112x112xf32>
      %7 = affine.apply affine_map<(d0) -> (d0 + 2)>(%arg3)
      %8 = affine.load %arg0[0, 0, %arg2, %7] : memref<1x64x112x112xf32>
      %9 = arith.cmpf ugt, %8, %cst : f32
      %10 = arith.select %9, %8, %cst : f32
      affine.store %10, %arg1[0, 0, %arg2, %7] : memref<1x64x112x112xf32>
      %11 = affine.apply affine_map<(d0) -> (d0 + 3)>(%arg3)
      %12 = affine.load %arg0[0, 0, %arg2, %11] : memref<1x64x112x112xf32>
      %13 = arith.cmpf ugt, %12, %cst : f32
      %14 = arith.select %13, %12, %cst : f32
      affine.store %14, %arg1[0, 0, %arg2, %11] : memref<1x64x112x112xf32>
      %15 = affine.apply affine_map<(d0) -> (d0 + 4)>(%arg3)
      %16 = affine.load %arg0[0, 0, %arg2, %15] : memref<1x64x112x112xf32>
      %17 = arith.cmpf ugt, %16, %cst : f32
      %18 = arith.select %17, %16, %cst : f32
      affine.store %18, %arg1[0, 0, %arg2, %15] : memref<1x64x112x112xf32>
      %19 = affine.apply affine_map<(d0) -> (d0 + 5)>(%arg3)
      %20 = affine.load %arg0[0, 0, %arg2, %19] : memref<1x64x112x112xf32>
      %21 = arith.cmpf ugt, %20, %cst : f32
      %22 = arith.select %21, %20, %cst : f32
      affine.store %22, %arg1[0, 0, %arg2, %19] : memref<1x64x112x112xf32>
      %23 = affine.apply affine_map<(d0) -> (d0 + 6)>(%arg3)
      %24 = affine.load %arg0[0, 0, %arg2, %23] : memref<1x64x112x112xf32>
      %25 = arith.cmpf ugt, %24, %cst : f32
      %26 = arith.select %25, %24, %cst : f32
      affine.store %26, %arg1[0, 0, %arg2, %23] : memref<1x64x112x112xf32>
    }
  }
  return
}

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    scf.for %arg2 = %c0 to %c16 step %c1 {
      %c0_0 = arith.constant 0 : index
      %c112 = arith.constant 112 : index
      %c7 = arith.constant 7 : index
      scf.for %arg3 = %c0_0 to %c112 step %c7 {
        %c0_1 = arith.constant 0 : index
        %c0_2 = arith.constant 0 : index
        %0 = memref.load %arg0[%c0_1, %c0_2, %arg2, %arg3] : memref<1x64x112x112xf32>
        %1 = arith.cmpf ugt, %0, %cst : f32
        %2 = arith.select %1, %0, %cst : f32
        %c0_3 = arith.constant 0 : index
        %c0_4 = arith.constant 0 : index
        memref.store %2, %arg1[%c0_3, %c0_4, %arg2, %arg3] : memref<1x64x112x112xf32>
        %c1_5 = arith.constant 1 : index
        %3 = arith.addi %arg3, %c1_5 : index
        %c0_6 = arith.constant 0 : index
        %c0_7 = arith.constant 0 : index
        %4 = memref.load %arg0[%c0_6, %c0_7, %arg2, %3] : memref<1x64x112x112xf32>
        %5 = arith.cmpf ugt, %4, %cst : f32
        %6 = arith.select %5, %4, %cst : f32
        %c0_8 = arith.constant 0 : index
        %c0_9 = arith.constant 0 : index
        memref.store %6, %arg1[%c0_8, %c0_9, %arg2, %3] : memref<1x64x112x112xf32>
        %c2 = arith.constant 2 : index
        %7 = arith.addi %arg3, %c2 : index
        %c0_10 = arith.constant 0 : index
        %c0_11 = arith.constant 0 : index
        %8 = memref.load %arg0[%c0_10, %c0_11, %arg2, %7] : memref<1x64x112x112xf32>
        %9 = arith.cmpf ugt, %8, %cst : f32
        %10 = arith.select %9, %8, %cst : f32
        %c0_12 = arith.constant 0 : index
        %c0_13 = arith.constant 0 : index
        memref.store %10, %arg1[%c0_12, %c0_13, %arg2, %7] : memref<1x64x112x112xf32>
        %c3 = arith.constant 3 : index
        %11 = arith.addi %arg3, %c3 : index
        %c0_14 = arith.constant 0 : index
        %c0_15 = arith.constant 0 : index
        %12 = memref.load %arg0[%c0_14, %c0_15, %arg2, %11] : memref<1x64x112x112xf32>
        %13 = arith.cmpf ugt, %12, %cst : f32
        %14 = arith.select %13, %12, %cst : f32
        %c0_16 = arith.constant 0 : index
        %c0_17 = arith.constant 0 : index
        memref.store %14, %arg1[%c0_16, %c0_17, %arg2, %11] : memref<1x64x112x112xf32>
        %c4 = arith.constant 4 : index
        %15 = arith.addi %arg3, %c4 : index
        %c0_18 = arith.constant 0 : index
        %c0_19 = arith.constant 0 : index
        %16 = memref.load %arg0[%c0_18, %c0_19, %arg2, %15] : memref<1x64x112x112xf32>
        %17 = arith.cmpf ugt, %16, %cst : f32
        %18 = arith.select %17, %16, %cst : f32
        %c0_20 = arith.constant 0 : index
        %c0_21 = arith.constant 0 : index
        memref.store %18, %arg1[%c0_20, %c0_21, %arg2, %15] : memref<1x64x112x112xf32>
        %c5 = arith.constant 5 : index
        %19 = arith.addi %arg3, %c5 : index
        %c0_22 = arith.constant 0 : index
        %c0_23 = arith.constant 0 : index
        %20 = memref.load %arg0[%c0_22, %c0_23, %arg2, %19] : memref<1x64x112x112xf32>
        %21 = arith.cmpf ugt, %20, %cst : f32
        %22 = arith.select %21, %20, %cst : f32
        %c0_24 = arith.constant 0 : index
        %c0_25 = arith.constant 0 : index
        memref.store %22, %arg1[%c0_24, %c0_25, %arg2, %19] : memref<1x64x112x112xf32>
        %c6 = arith.constant 6 : index
        %23 = arith.addi %arg3, %c6 : index
        %c0_26 = arith.constant 0 : index
        %c0_27 = arith.constant 0 : index
        %24 = memref.load %arg0[%c0_26, %c0_27, %arg2, %23] : memref<1x64x112x112xf32>
        %25 = arith.cmpf ugt, %24, %cst : f32
        %26 = arith.select %25, %24, %cst : f32
        %c0_28 = arith.constant 0 : index
        %c0_29 = arith.constant 0 : index
        memref.store %26, %arg1[%c0_28, %c0_29, %arg2, %23] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %c6 = arith.constant 6 : index
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg2 = %c0 to %c16 step %c1 {
      scf.for %arg3 = %c0 to %c112 step %c7 {
        %0 = memref.load %arg0[%c0, %c0, %arg2, %arg3] : memref<1x64x112x112xf32>
        %1 = arith.cmpf ugt, %0, %cst : f32
        %2 = arith.select %1, %0, %cst : f32
        memref.store %2, %arg1[%c0, %c0, %arg2, %arg3] : memref<1x64x112x112xf32>
        %3 = arith.addi %arg3, %c1 : index
        %4 = memref.load %arg0[%c0, %c0, %arg2, %3] : memref<1x64x112x112xf32>
        %5 = arith.cmpf ugt, %4, %cst : f32
        %6 = arith.select %5, %4, %cst : f32
        memref.store %6, %arg1[%c0, %c0, %arg2, %3] : memref<1x64x112x112xf32>
        %7 = arith.addi %arg3, %c2 : index
        %8 = memref.load %arg0[%c0, %c0, %arg2, %7] : memref<1x64x112x112xf32>
        %9 = arith.cmpf ugt, %8, %cst : f32
        %10 = arith.select %9, %8, %cst : f32
        memref.store %10, %arg1[%c0, %c0, %arg2, %7] : memref<1x64x112x112xf32>
        %11 = arith.addi %arg3, %c3 : index
        %12 = memref.load %arg0[%c0, %c0, %arg2, %11] : memref<1x64x112x112xf32>
        %13 = arith.cmpf ugt, %12, %cst : f32
        %14 = arith.select %13, %12, %cst : f32
        memref.store %14, %arg1[%c0, %c0, %arg2, %11] : memref<1x64x112x112xf32>
        %15 = arith.addi %arg3, %c4 : index
        %16 = memref.load %arg0[%c0, %c0, %arg2, %15] : memref<1x64x112x112xf32>
        %17 = arith.cmpf ugt, %16, %cst : f32
        %18 = arith.select %17, %16, %cst : f32
        memref.store %18, %arg1[%c0, %c0, %arg2, %15] : memref<1x64x112x112xf32>
        %19 = arith.addi %arg3, %c5 : index
        %20 = memref.load %arg0[%c0, %c0, %arg2, %19] : memref<1x64x112x112xf32>
        %21 = arith.cmpf ugt, %20, %cst : f32
        %22 = arith.select %21, %20, %cst : f32
        memref.store %22, %arg1[%c0, %c0, %arg2, %19] : memref<1x64x112x112xf32>
        %23 = arith.addi %arg3, %c6 : index
        %24 = memref.load %arg0[%c0, %c0, %arg2, %23] : memref<1x64x112x112xf32>
        %25 = arith.cmpf ugt, %24, %cst : f32
        %26 = arith.select %25, %24, %cst : f32
        memref.store %26, %arg1[%c0, %c0, %arg2, %23] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %c6 = arith.constant 6 : index
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c16 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c112 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%c0, %c0, %0, %2] : memref<1x64x112x112xf32>
    %5 = arith.cmpf ugt, %4, %cst : f32
    %6 = arith.select %5, %4, %cst : f32
    memref.store %6, %arg1[%c0, %c0, %0, %2] : memref<1x64x112x112xf32>
    %7 = arith.addi %2, %c1 : index
    %8 = memref.load %arg0[%c0, %c0, %0, %7] : memref<1x64x112x112xf32>
    %9 = arith.cmpf ugt, %8, %cst : f32
    %10 = arith.select %9, %8, %cst : f32
    memref.store %10, %arg1[%c0, %c0, %0, %7] : memref<1x64x112x112xf32>
    %11 = arith.addi %2, %c2 : index
    %12 = memref.load %arg0[%c0, %c0, %0, %11] : memref<1x64x112x112xf32>
    %13 = arith.cmpf ugt, %12, %cst : f32
    %14 = arith.select %13, %12, %cst : f32
    memref.store %14, %arg1[%c0, %c0, %0, %11] : memref<1x64x112x112xf32>
    %15 = arith.addi %2, %c3 : index
    %16 = memref.load %arg0[%c0, %c0, %0, %15] : memref<1x64x112x112xf32>
    %17 = arith.cmpf ugt, %16, %cst : f32
    %18 = arith.select %17, %16, %cst : f32
    memref.store %18, %arg1[%c0, %c0, %0, %15] : memref<1x64x112x112xf32>
    %19 = arith.addi %2, %c4 : index
    %20 = memref.load %arg0[%c0, %c0, %0, %19] : memref<1x64x112x112xf32>
    %21 = arith.cmpf ugt, %20, %cst : f32
    %22 = arith.select %21, %20, %cst : f32
    memref.store %22, %arg1[%c0, %c0, %0, %19] : memref<1x64x112x112xf32>
    %23 = arith.addi %2, %c5 : index
    %24 = memref.load %arg0[%c0, %c0, %0, %23] : memref<1x64x112x112xf32>
    %25 = arith.cmpf ugt, %24, %cst : f32
    %26 = arith.select %25, %24, %cst : f32
    memref.store %26, %arg1[%c0, %c0, %0, %23] : memref<1x64x112x112xf32>
    %27 = arith.addi %2, %c6 : index
    %28 = memref.load %arg0[%c0, %c0, %0, %27] : memref<1x64x112x112xf32>
    %29 = arith.cmpf ugt, %28, %cst : f32
    %30 = arith.select %29, %28, %cst : f32
    memref.store %30, %arg1[%c0, %c0, %0, %27] : memref<1x64x112x112xf32>
    %31 = arith.addi %2, %c7 : index
    cf.br ^bb4(%31 : index)
  ^bb6:  // pred: ^bb4
    %32 = arith.addi %0, %c1 : index
    cf.br ^bb2(%32 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After FinalizeMemRefToLLVMConversionPass (finalize-memref-to-llvm) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c6 = arith.constant 6 : index
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %2 = builtin.unrealized_conversion_cast %c0 : index to i64
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%3: index):  // 2 preds: ^bb1, ^bb6
    %4 = builtin.unrealized_conversion_cast %3 : index to i64
    %5 = arith.cmpi slt, %3, %c16 : index
    cf.cond_br %5, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%6: index):  // 2 preds: ^bb3, ^bb5
    %7 = builtin.unrealized_conversion_cast %6 : index to i64
    %8 = arith.cmpi slt, %6, %c112 : index
    cf.cond_br %8, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %9 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %10 = llvm.mlir.constant(802816 : index) : i64
    %11 = llvm.mul %2, %10  : i64
    %12 = llvm.mlir.constant(12544 : index) : i64
    %13 = llvm.mul %2, %12  : i64
    %14 = llvm.add %11, %13  : i64
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.mul %4, %15  : i64
    %17 = llvm.add %14, %16  : i64
    %18 = llvm.add %17, %7  : i64
    %19 = llvm.getelementptr %9[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %20 = llvm.load %19 : !llvm.ptr -> f32
    %21 = arith.cmpf ugt, %20, %cst : f32
    %22 = arith.select %21, %20, %cst : f32
    %23 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(802816 : index) : i64
    %25 = llvm.mul %2, %24  : i64
    %26 = llvm.mlir.constant(12544 : index) : i64
    %27 = llvm.mul %2, %26  : i64
    %28 = llvm.add %25, %27  : i64
    %29 = llvm.mlir.constant(112 : index) : i64
    %30 = llvm.mul %4, %29  : i64
    %31 = llvm.add %28, %30  : i64
    %32 = llvm.add %31, %7  : i64
    %33 = llvm.getelementptr %23[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %22, %33 : f32, !llvm.ptr
    %34 = arith.addi %6, %c1 : index
    %35 = builtin.unrealized_conversion_cast %34 : index to i64
    %36 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(802816 : index) : i64
    %38 = llvm.mul %2, %37  : i64
    %39 = llvm.mlir.constant(12544 : index) : i64
    %40 = llvm.mul %2, %39  : i64
    %41 = llvm.add %38, %40  : i64
    %42 = llvm.mlir.constant(112 : index) : i64
    %43 = llvm.mul %4, %42  : i64
    %44 = llvm.add %41, %43  : i64
    %45 = llvm.add %44, %35  : i64
    %46 = llvm.getelementptr %36[%45] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %47 = llvm.load %46 : !llvm.ptr -> f32
    %48 = arith.cmpf ugt, %47, %cst : f32
    %49 = arith.select %48, %47, %cst : f32
    %50 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(802816 : index) : i64
    %52 = llvm.mul %2, %51  : i64
    %53 = llvm.mlir.constant(12544 : index) : i64
    %54 = llvm.mul %2, %53  : i64
    %55 = llvm.add %52, %54  : i64
    %56 = llvm.mlir.constant(112 : index) : i64
    %57 = llvm.mul %4, %56  : i64
    %58 = llvm.add %55, %57  : i64
    %59 = llvm.add %58, %35  : i64
    %60 = llvm.getelementptr %50[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %49, %60 : f32, !llvm.ptr
    %61 = arith.addi %6, %c2 : index
    %62 = builtin.unrealized_conversion_cast %61 : index to i64
    %63 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %64 = llvm.mlir.constant(802816 : index) : i64
    %65 = llvm.mul %2, %64  : i64
    %66 = llvm.mlir.constant(12544 : index) : i64
    %67 = llvm.mul %2, %66  : i64
    %68 = llvm.add %65, %67  : i64
    %69 = llvm.mlir.constant(112 : index) : i64
    %70 = llvm.mul %4, %69  : i64
    %71 = llvm.add %68, %70  : i64
    %72 = llvm.add %71, %62  : i64
    %73 = llvm.getelementptr %63[%72] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %74 = llvm.load %73 : !llvm.ptr -> f32
    %75 = arith.cmpf ugt, %74, %cst : f32
    %76 = arith.select %75, %74, %cst : f32
    %77 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %78 = llvm.mlir.constant(802816 : index) : i64
    %79 = llvm.mul %2, %78  : i64
    %80 = llvm.mlir.constant(12544 : index) : i64
    %81 = llvm.mul %2, %80  : i64
    %82 = llvm.add %79, %81  : i64
    %83 = llvm.mlir.constant(112 : index) : i64
    %84 = llvm.mul %4, %83  : i64
    %85 = llvm.add %82, %84  : i64
    %86 = llvm.add %85, %62  : i64
    %87 = llvm.getelementptr %77[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %76, %87 : f32, !llvm.ptr
    %88 = arith.addi %6, %c3 : index
    %89 = builtin.unrealized_conversion_cast %88 : index to i64
    %90 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %91 = llvm.mlir.constant(802816 : index) : i64
    %92 = llvm.mul %2, %91  : i64
    %93 = llvm.mlir.constant(12544 : index) : i64
    %94 = llvm.mul %2, %93  : i64
    %95 = llvm.add %92, %94  : i64
    %96 = llvm.mlir.constant(112 : index) : i64
    %97 = llvm.mul %4, %96  : i64
    %98 = llvm.add %95, %97  : i64
    %99 = llvm.add %98, %89  : i64
    %100 = llvm.getelementptr %90[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %101 = llvm.load %100 : !llvm.ptr -> f32
    %102 = arith.cmpf ugt, %101, %cst : f32
    %103 = arith.select %102, %101, %cst : f32
    %104 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %105 = llvm.mlir.constant(802816 : index) : i64
    %106 = llvm.mul %2, %105  : i64
    %107 = llvm.mlir.constant(12544 : index) : i64
    %108 = llvm.mul %2, %107  : i64
    %109 = llvm.add %106, %108  : i64
    %110 = llvm.mlir.constant(112 : index) : i64
    %111 = llvm.mul %4, %110  : i64
    %112 = llvm.add %109, %111  : i64
    %113 = llvm.add %112, %89  : i64
    %114 = llvm.getelementptr %104[%113] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %103, %114 : f32, !llvm.ptr
    %115 = arith.addi %6, %c4 : index
    %116 = builtin.unrealized_conversion_cast %115 : index to i64
    %117 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %118 = llvm.mlir.constant(802816 : index) : i64
    %119 = llvm.mul %2, %118  : i64
    %120 = llvm.mlir.constant(12544 : index) : i64
    %121 = llvm.mul %2, %120  : i64
    %122 = llvm.add %119, %121  : i64
    %123 = llvm.mlir.constant(112 : index) : i64
    %124 = llvm.mul %4, %123  : i64
    %125 = llvm.add %122, %124  : i64
    %126 = llvm.add %125, %116  : i64
    %127 = llvm.getelementptr %117[%126] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %128 = llvm.load %127 : !llvm.ptr -> f32
    %129 = arith.cmpf ugt, %128, %cst : f32
    %130 = arith.select %129, %128, %cst : f32
    %131 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %132 = llvm.mlir.constant(802816 : index) : i64
    %133 = llvm.mul %2, %132  : i64
    %134 = llvm.mlir.constant(12544 : index) : i64
    %135 = llvm.mul %2, %134  : i64
    %136 = llvm.add %133, %135  : i64
    %137 = llvm.mlir.constant(112 : index) : i64
    %138 = llvm.mul %4, %137  : i64
    %139 = llvm.add %136, %138  : i64
    %140 = llvm.add %139, %116  : i64
    %141 = llvm.getelementptr %131[%140] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %130, %141 : f32, !llvm.ptr
    %142 = arith.addi %6, %c5 : index
    %143 = builtin.unrealized_conversion_cast %142 : index to i64
    %144 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %145 = llvm.mlir.constant(802816 : index) : i64
    %146 = llvm.mul %2, %145  : i64
    %147 = llvm.mlir.constant(12544 : index) : i64
    %148 = llvm.mul %2, %147  : i64
    %149 = llvm.add %146, %148  : i64
    %150 = llvm.mlir.constant(112 : index) : i64
    %151 = llvm.mul %4, %150  : i64
    %152 = llvm.add %149, %151  : i64
    %153 = llvm.add %152, %143  : i64
    %154 = llvm.getelementptr %144[%153] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %155 = llvm.load %154 : !llvm.ptr -> f32
    %156 = arith.cmpf ugt, %155, %cst : f32
    %157 = arith.select %156, %155, %cst : f32
    %158 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %159 = llvm.mlir.constant(802816 : index) : i64
    %160 = llvm.mul %2, %159  : i64
    %161 = llvm.mlir.constant(12544 : index) : i64
    %162 = llvm.mul %2, %161  : i64
    %163 = llvm.add %160, %162  : i64
    %164 = llvm.mlir.constant(112 : index) : i64
    %165 = llvm.mul %4, %164  : i64
    %166 = llvm.add %163, %165  : i64
    %167 = llvm.add %166, %143  : i64
    %168 = llvm.getelementptr %158[%167] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %157, %168 : f32, !llvm.ptr
    %169 = arith.addi %6, %c6 : index
    %170 = builtin.unrealized_conversion_cast %169 : index to i64
    %171 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %172 = llvm.mlir.constant(802816 : index) : i64
    %173 = llvm.mul %2, %172  : i64
    %174 = llvm.mlir.constant(12544 : index) : i64
    %175 = llvm.mul %2, %174  : i64
    %176 = llvm.add %173, %175  : i64
    %177 = llvm.mlir.constant(112 : index) : i64
    %178 = llvm.mul %4, %177  : i64
    %179 = llvm.add %176, %178  : i64
    %180 = llvm.add %179, %170  : i64
    %181 = llvm.getelementptr %171[%180] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %182 = llvm.load %181 : !llvm.ptr -> f32
    %183 = arith.cmpf ugt, %182, %cst : f32
    %184 = arith.select %183, %182, %cst : f32
    %185 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %186 = llvm.mlir.constant(802816 : index) : i64
    %187 = llvm.mul %2, %186  : i64
    %188 = llvm.mlir.constant(12544 : index) : i64
    %189 = llvm.mul %2, %188  : i64
    %190 = llvm.add %187, %189  : i64
    %191 = llvm.mlir.constant(112 : index) : i64
    %192 = llvm.mul %4, %191  : i64
    %193 = llvm.add %190, %192  : i64
    %194 = llvm.add %193, %170  : i64
    %195 = llvm.getelementptr %185[%194] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %184, %195 : f32, !llvm.ptr
    %196 = arith.addi %6, %c7 : index
    cf.br ^bb4(%196 : index)
  ^bb6:  // pred: ^bb4
    %197 = arith.addi %3, %c1 : index
    cf.br ^bb2(%197 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLLVMPass (convert-math-to-llvm) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c6 = arith.constant 6 : index
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %2 = builtin.unrealized_conversion_cast %c0 : index to i64
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%3: index):  // 2 preds: ^bb1, ^bb6
    %4 = builtin.unrealized_conversion_cast %3 : index to i64
    %5 = arith.cmpi slt, %3, %c16 : index
    cf.cond_br %5, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%6: index):  // 2 preds: ^bb3, ^bb5
    %7 = builtin.unrealized_conversion_cast %6 : index to i64
    %8 = arith.cmpi slt, %6, %c112 : index
    cf.cond_br %8, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %9 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %10 = llvm.mlir.constant(802816 : index) : i64
    %11 = llvm.mul %2, %10  : i64
    %12 = llvm.mlir.constant(12544 : index) : i64
    %13 = llvm.mul %2, %12  : i64
    %14 = llvm.add %11, %13  : i64
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.mul %4, %15  : i64
    %17 = llvm.add %14, %16  : i64
    %18 = llvm.add %17, %7  : i64
    %19 = llvm.getelementptr %9[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %20 = llvm.load %19 : !llvm.ptr -> f32
    %21 = arith.cmpf ugt, %20, %cst : f32
    %22 = arith.select %21, %20, %cst : f32
    %23 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(802816 : index) : i64
    %25 = llvm.mul %2, %24  : i64
    %26 = llvm.mlir.constant(12544 : index) : i64
    %27 = llvm.mul %2, %26  : i64
    %28 = llvm.add %25, %27  : i64
    %29 = llvm.mlir.constant(112 : index) : i64
    %30 = llvm.mul %4, %29  : i64
    %31 = llvm.add %28, %30  : i64
    %32 = llvm.add %31, %7  : i64
    %33 = llvm.getelementptr %23[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %22, %33 : f32, !llvm.ptr
    %34 = arith.addi %6, %c1 : index
    %35 = builtin.unrealized_conversion_cast %34 : index to i64
    %36 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(802816 : index) : i64
    %38 = llvm.mul %2, %37  : i64
    %39 = llvm.mlir.constant(12544 : index) : i64
    %40 = llvm.mul %2, %39  : i64
    %41 = llvm.add %38, %40  : i64
    %42 = llvm.mlir.constant(112 : index) : i64
    %43 = llvm.mul %4, %42  : i64
    %44 = llvm.add %41, %43  : i64
    %45 = llvm.add %44, %35  : i64
    %46 = llvm.getelementptr %36[%45] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %47 = llvm.load %46 : !llvm.ptr -> f32
    %48 = arith.cmpf ugt, %47, %cst : f32
    %49 = arith.select %48, %47, %cst : f32
    %50 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(802816 : index) : i64
    %52 = llvm.mul %2, %51  : i64
    %53 = llvm.mlir.constant(12544 : index) : i64
    %54 = llvm.mul %2, %53  : i64
    %55 = llvm.add %52, %54  : i64
    %56 = llvm.mlir.constant(112 : index) : i64
    %57 = llvm.mul %4, %56  : i64
    %58 = llvm.add %55, %57  : i64
    %59 = llvm.add %58, %35  : i64
    %60 = llvm.getelementptr %50[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %49, %60 : f32, !llvm.ptr
    %61 = arith.addi %6, %c2 : index
    %62 = builtin.unrealized_conversion_cast %61 : index to i64
    %63 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %64 = llvm.mlir.constant(802816 : index) : i64
    %65 = llvm.mul %2, %64  : i64
    %66 = llvm.mlir.constant(12544 : index) : i64
    %67 = llvm.mul %2, %66  : i64
    %68 = llvm.add %65, %67  : i64
    %69 = llvm.mlir.constant(112 : index) : i64
    %70 = llvm.mul %4, %69  : i64
    %71 = llvm.add %68, %70  : i64
    %72 = llvm.add %71, %62  : i64
    %73 = llvm.getelementptr %63[%72] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %74 = llvm.load %73 : !llvm.ptr -> f32
    %75 = arith.cmpf ugt, %74, %cst : f32
    %76 = arith.select %75, %74, %cst : f32
    %77 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %78 = llvm.mlir.constant(802816 : index) : i64
    %79 = llvm.mul %2, %78  : i64
    %80 = llvm.mlir.constant(12544 : index) : i64
    %81 = llvm.mul %2, %80  : i64
    %82 = llvm.add %79, %81  : i64
    %83 = llvm.mlir.constant(112 : index) : i64
    %84 = llvm.mul %4, %83  : i64
    %85 = llvm.add %82, %84  : i64
    %86 = llvm.add %85, %62  : i64
    %87 = llvm.getelementptr %77[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %76, %87 : f32, !llvm.ptr
    %88 = arith.addi %6, %c3 : index
    %89 = builtin.unrealized_conversion_cast %88 : index to i64
    %90 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %91 = llvm.mlir.constant(802816 : index) : i64
    %92 = llvm.mul %2, %91  : i64
    %93 = llvm.mlir.constant(12544 : index) : i64
    %94 = llvm.mul %2, %93  : i64
    %95 = llvm.add %92, %94  : i64
    %96 = llvm.mlir.constant(112 : index) : i64
    %97 = llvm.mul %4, %96  : i64
    %98 = llvm.add %95, %97  : i64
    %99 = llvm.add %98, %89  : i64
    %100 = llvm.getelementptr %90[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %101 = llvm.load %100 : !llvm.ptr -> f32
    %102 = arith.cmpf ugt, %101, %cst : f32
    %103 = arith.select %102, %101, %cst : f32
    %104 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %105 = llvm.mlir.constant(802816 : index) : i64
    %106 = llvm.mul %2, %105  : i64
    %107 = llvm.mlir.constant(12544 : index) : i64
    %108 = llvm.mul %2, %107  : i64
    %109 = llvm.add %106, %108  : i64
    %110 = llvm.mlir.constant(112 : index) : i64
    %111 = llvm.mul %4, %110  : i64
    %112 = llvm.add %109, %111  : i64
    %113 = llvm.add %112, %89  : i64
    %114 = llvm.getelementptr %104[%113] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %103, %114 : f32, !llvm.ptr
    %115 = arith.addi %6, %c4 : index
    %116 = builtin.unrealized_conversion_cast %115 : index to i64
    %117 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %118 = llvm.mlir.constant(802816 : index) : i64
    %119 = llvm.mul %2, %118  : i64
    %120 = llvm.mlir.constant(12544 : index) : i64
    %121 = llvm.mul %2, %120  : i64
    %122 = llvm.add %119, %121  : i64
    %123 = llvm.mlir.constant(112 : index) : i64
    %124 = llvm.mul %4, %123  : i64
    %125 = llvm.add %122, %124  : i64
    %126 = llvm.add %125, %116  : i64
    %127 = llvm.getelementptr %117[%126] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %128 = llvm.load %127 : !llvm.ptr -> f32
    %129 = arith.cmpf ugt, %128, %cst : f32
    %130 = arith.select %129, %128, %cst : f32
    %131 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %132 = llvm.mlir.constant(802816 : index) : i64
    %133 = llvm.mul %2, %132  : i64
    %134 = llvm.mlir.constant(12544 : index) : i64
    %135 = llvm.mul %2, %134  : i64
    %136 = llvm.add %133, %135  : i64
    %137 = llvm.mlir.constant(112 : index) : i64
    %138 = llvm.mul %4, %137  : i64
    %139 = llvm.add %136, %138  : i64
    %140 = llvm.add %139, %116  : i64
    %141 = llvm.getelementptr %131[%140] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %130, %141 : f32, !llvm.ptr
    %142 = arith.addi %6, %c5 : index
    %143 = builtin.unrealized_conversion_cast %142 : index to i64
    %144 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %145 = llvm.mlir.constant(802816 : index) : i64
    %146 = llvm.mul %2, %145  : i64
    %147 = llvm.mlir.constant(12544 : index) : i64
    %148 = llvm.mul %2, %147  : i64
    %149 = llvm.add %146, %148  : i64
    %150 = llvm.mlir.constant(112 : index) : i64
    %151 = llvm.mul %4, %150  : i64
    %152 = llvm.add %149, %151  : i64
    %153 = llvm.add %152, %143  : i64
    %154 = llvm.getelementptr %144[%153] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %155 = llvm.load %154 : !llvm.ptr -> f32
    %156 = arith.cmpf ugt, %155, %cst : f32
    %157 = arith.select %156, %155, %cst : f32
    %158 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %159 = llvm.mlir.constant(802816 : index) : i64
    %160 = llvm.mul %2, %159  : i64
    %161 = llvm.mlir.constant(12544 : index) : i64
    %162 = llvm.mul %2, %161  : i64
    %163 = llvm.add %160, %162  : i64
    %164 = llvm.mlir.constant(112 : index) : i64
    %165 = llvm.mul %4, %164  : i64
    %166 = llvm.add %163, %165  : i64
    %167 = llvm.add %166, %143  : i64
    %168 = llvm.getelementptr %158[%167] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %157, %168 : f32, !llvm.ptr
    %169 = arith.addi %6, %c6 : index
    %170 = builtin.unrealized_conversion_cast %169 : index to i64
    %171 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %172 = llvm.mlir.constant(802816 : index) : i64
    %173 = llvm.mul %2, %172  : i64
    %174 = llvm.mlir.constant(12544 : index) : i64
    %175 = llvm.mul %2, %174  : i64
    %176 = llvm.add %173, %175  : i64
    %177 = llvm.mlir.constant(112 : index) : i64
    %178 = llvm.mul %4, %177  : i64
    %179 = llvm.add %176, %178  : i64
    %180 = llvm.add %179, %170  : i64
    %181 = llvm.getelementptr %171[%180] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %182 = llvm.load %181 : !llvm.ptr -> f32
    %183 = arith.cmpf ugt, %182, %cst : f32
    %184 = arith.select %183, %182, %cst : f32
    %185 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %186 = llvm.mlir.constant(802816 : index) : i64
    %187 = llvm.mul %2, %186  : i64
    %188 = llvm.mlir.constant(12544 : index) : i64
    %189 = llvm.mul %2, %188  : i64
    %190 = llvm.add %187, %189  : i64
    %191 = llvm.mlir.constant(112 : index) : i64
    %192 = llvm.mul %4, %191  : i64
    %193 = llvm.add %190, %192  : i64
    %194 = llvm.add %193, %170  : i64
    %195 = llvm.getelementptr %185[%194] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %184, %195 : f32, !llvm.ptr
    %196 = arith.addi %6, %c7 : index
    cf.br ^bb4(%196 : index)
  ^bb6:  // pred: ^bb4
    %197 = arith.addi %3, %c1 : index
    cf.br ^bb2(%197 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLibm (convert-math-to-libm) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c6 = arith.constant 6 : index
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c112 = arith.constant 112 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %c0 = arith.constant 0 : index
    %2 = builtin.unrealized_conversion_cast %c0 : index to i64
    %cst = arith.constant 0.000000e+00 : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%3: index):  // 2 preds: ^bb1, ^bb6
    %4 = builtin.unrealized_conversion_cast %3 : index to i64
    %5 = arith.cmpi slt, %3, %c16 : index
    cf.cond_br %5, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%6: index):  // 2 preds: ^bb3, ^bb5
    %7 = builtin.unrealized_conversion_cast %6 : index to i64
    %8 = arith.cmpi slt, %6, %c112 : index
    cf.cond_br %8, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %9 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %10 = llvm.mlir.constant(802816 : index) : i64
    %11 = llvm.mul %2, %10  : i64
    %12 = llvm.mlir.constant(12544 : index) : i64
    %13 = llvm.mul %2, %12  : i64
    %14 = llvm.add %11, %13  : i64
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.mul %4, %15  : i64
    %17 = llvm.add %14, %16  : i64
    %18 = llvm.add %17, %7  : i64
    %19 = llvm.getelementptr %9[%18] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %20 = llvm.load %19 : !llvm.ptr -> f32
    %21 = arith.cmpf ugt, %20, %cst : f32
    %22 = arith.select %21, %20, %cst : f32
    %23 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(802816 : index) : i64
    %25 = llvm.mul %2, %24  : i64
    %26 = llvm.mlir.constant(12544 : index) : i64
    %27 = llvm.mul %2, %26  : i64
    %28 = llvm.add %25, %27  : i64
    %29 = llvm.mlir.constant(112 : index) : i64
    %30 = llvm.mul %4, %29  : i64
    %31 = llvm.add %28, %30  : i64
    %32 = llvm.add %31, %7  : i64
    %33 = llvm.getelementptr %23[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %22, %33 : f32, !llvm.ptr
    %34 = arith.addi %6, %c1 : index
    %35 = builtin.unrealized_conversion_cast %34 : index to i64
    %36 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(802816 : index) : i64
    %38 = llvm.mul %2, %37  : i64
    %39 = llvm.mlir.constant(12544 : index) : i64
    %40 = llvm.mul %2, %39  : i64
    %41 = llvm.add %38, %40  : i64
    %42 = llvm.mlir.constant(112 : index) : i64
    %43 = llvm.mul %4, %42  : i64
    %44 = llvm.add %41, %43  : i64
    %45 = llvm.add %44, %35  : i64
    %46 = llvm.getelementptr %36[%45] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %47 = llvm.load %46 : !llvm.ptr -> f32
    %48 = arith.cmpf ugt, %47, %cst : f32
    %49 = arith.select %48, %47, %cst : f32
    %50 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(802816 : index) : i64
    %52 = llvm.mul %2, %51  : i64
    %53 = llvm.mlir.constant(12544 : index) : i64
    %54 = llvm.mul %2, %53  : i64
    %55 = llvm.add %52, %54  : i64
    %56 = llvm.mlir.constant(112 : index) : i64
    %57 = llvm.mul %4, %56  : i64
    %58 = llvm.add %55, %57  : i64
    %59 = llvm.add %58, %35  : i64
    %60 = llvm.getelementptr %50[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %49, %60 : f32, !llvm.ptr
    %61 = arith.addi %6, %c2 : index
    %62 = builtin.unrealized_conversion_cast %61 : index to i64
    %63 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %64 = llvm.mlir.constant(802816 : index) : i64
    %65 = llvm.mul %2, %64  : i64
    %66 = llvm.mlir.constant(12544 : index) : i64
    %67 = llvm.mul %2, %66  : i64
    %68 = llvm.add %65, %67  : i64
    %69 = llvm.mlir.constant(112 : index) : i64
    %70 = llvm.mul %4, %69  : i64
    %71 = llvm.add %68, %70  : i64
    %72 = llvm.add %71, %62  : i64
    %73 = llvm.getelementptr %63[%72] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %74 = llvm.load %73 : !llvm.ptr -> f32
    %75 = arith.cmpf ugt, %74, %cst : f32
    %76 = arith.select %75, %74, %cst : f32
    %77 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %78 = llvm.mlir.constant(802816 : index) : i64
    %79 = llvm.mul %2, %78  : i64
    %80 = llvm.mlir.constant(12544 : index) : i64
    %81 = llvm.mul %2, %80  : i64
    %82 = llvm.add %79, %81  : i64
    %83 = llvm.mlir.constant(112 : index) : i64
    %84 = llvm.mul %4, %83  : i64
    %85 = llvm.add %82, %84  : i64
    %86 = llvm.add %85, %62  : i64
    %87 = llvm.getelementptr %77[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %76, %87 : f32, !llvm.ptr
    %88 = arith.addi %6, %c3 : index
    %89 = builtin.unrealized_conversion_cast %88 : index to i64
    %90 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %91 = llvm.mlir.constant(802816 : index) : i64
    %92 = llvm.mul %2, %91  : i64
    %93 = llvm.mlir.constant(12544 : index) : i64
    %94 = llvm.mul %2, %93  : i64
    %95 = llvm.add %92, %94  : i64
    %96 = llvm.mlir.constant(112 : index) : i64
    %97 = llvm.mul %4, %96  : i64
    %98 = llvm.add %95, %97  : i64
    %99 = llvm.add %98, %89  : i64
    %100 = llvm.getelementptr %90[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %101 = llvm.load %100 : !llvm.ptr -> f32
    %102 = arith.cmpf ugt, %101, %cst : f32
    %103 = arith.select %102, %101, %cst : f32
    %104 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %105 = llvm.mlir.constant(802816 : index) : i64
    %106 = llvm.mul %2, %105  : i64
    %107 = llvm.mlir.constant(12544 : index) : i64
    %108 = llvm.mul %2, %107  : i64
    %109 = llvm.add %106, %108  : i64
    %110 = llvm.mlir.constant(112 : index) : i64
    %111 = llvm.mul %4, %110  : i64
    %112 = llvm.add %109, %111  : i64
    %113 = llvm.add %112, %89  : i64
    %114 = llvm.getelementptr %104[%113] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %103, %114 : f32, !llvm.ptr
    %115 = arith.addi %6, %c4 : index
    %116 = builtin.unrealized_conversion_cast %115 : index to i64
    %117 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %118 = llvm.mlir.constant(802816 : index) : i64
    %119 = llvm.mul %2, %118  : i64
    %120 = llvm.mlir.constant(12544 : index) : i64
    %121 = llvm.mul %2, %120  : i64
    %122 = llvm.add %119, %121  : i64
    %123 = llvm.mlir.constant(112 : index) : i64
    %124 = llvm.mul %4, %123  : i64
    %125 = llvm.add %122, %124  : i64
    %126 = llvm.add %125, %116  : i64
    %127 = llvm.getelementptr %117[%126] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %128 = llvm.load %127 : !llvm.ptr -> f32
    %129 = arith.cmpf ugt, %128, %cst : f32
    %130 = arith.select %129, %128, %cst : f32
    %131 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %132 = llvm.mlir.constant(802816 : index) : i64
    %133 = llvm.mul %2, %132  : i64
    %134 = llvm.mlir.constant(12544 : index) : i64
    %135 = llvm.mul %2, %134  : i64
    %136 = llvm.add %133, %135  : i64
    %137 = llvm.mlir.constant(112 : index) : i64
    %138 = llvm.mul %4, %137  : i64
    %139 = llvm.add %136, %138  : i64
    %140 = llvm.add %139, %116  : i64
    %141 = llvm.getelementptr %131[%140] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %130, %141 : f32, !llvm.ptr
    %142 = arith.addi %6, %c5 : index
    %143 = builtin.unrealized_conversion_cast %142 : index to i64
    %144 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %145 = llvm.mlir.constant(802816 : index) : i64
    %146 = llvm.mul %2, %145  : i64
    %147 = llvm.mlir.constant(12544 : index) : i64
    %148 = llvm.mul %2, %147  : i64
    %149 = llvm.add %146, %148  : i64
    %150 = llvm.mlir.constant(112 : index) : i64
    %151 = llvm.mul %4, %150  : i64
    %152 = llvm.add %149, %151  : i64
    %153 = llvm.add %152, %143  : i64
    %154 = llvm.getelementptr %144[%153] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %155 = llvm.load %154 : !llvm.ptr -> f32
    %156 = arith.cmpf ugt, %155, %cst : f32
    %157 = arith.select %156, %155, %cst : f32
    %158 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %159 = llvm.mlir.constant(802816 : index) : i64
    %160 = llvm.mul %2, %159  : i64
    %161 = llvm.mlir.constant(12544 : index) : i64
    %162 = llvm.mul %2, %161  : i64
    %163 = llvm.add %160, %162  : i64
    %164 = llvm.mlir.constant(112 : index) : i64
    %165 = llvm.mul %4, %164  : i64
    %166 = llvm.add %163, %165  : i64
    %167 = llvm.add %166, %143  : i64
    %168 = llvm.getelementptr %158[%167] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %157, %168 : f32, !llvm.ptr
    %169 = arith.addi %6, %c6 : index
    %170 = builtin.unrealized_conversion_cast %169 : index to i64
    %171 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %172 = llvm.mlir.constant(802816 : index) : i64
    %173 = llvm.mul %2, %172  : i64
    %174 = llvm.mlir.constant(12544 : index) : i64
    %175 = llvm.mul %2, %174  : i64
    %176 = llvm.add %173, %175  : i64
    %177 = llvm.mlir.constant(112 : index) : i64
    %178 = llvm.mul %4, %177  : i64
    %179 = llvm.add %176, %178  : i64
    %180 = llvm.add %179, %170  : i64
    %181 = llvm.getelementptr %171[%180] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %182 = llvm.load %181 : !llvm.ptr -> f32
    %183 = arith.cmpf ugt, %182, %cst : f32
    %184 = arith.select %183, %182, %cst : f32
    %185 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %186 = llvm.mlir.constant(802816 : index) : i64
    %187 = llvm.mul %2, %186  : i64
    %188 = llvm.mlir.constant(12544 : index) : i64
    %189 = llvm.mul %2, %188  : i64
    %190 = llvm.add %187, %189  : i64
    %191 = llvm.mlir.constant(112 : index) : i64
    %192 = llvm.mul %4, %191  : i64
    %193 = llvm.add %190, %192  : i64
    %194 = llvm.add %193, %170  : i64
    %195 = llvm.getelementptr %185[%194] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %184, %195 : f32, !llvm.ptr
    %196 = arith.addi %6, %c7 : index
    cf.br ^bb4(%196 : index)
  ^bb6:  // pred: ^bb4
    %197 = arith.addi %3, %c1 : index
    cf.br ^bb2(%197 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ArithToLLVMConversionPass (convert-arith-to-llvm) //----- //
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = llvm.mlir.constant(6 : index) : i64
    %3 = llvm.mlir.constant(5 : index) : i64
    %4 = llvm.mlir.constant(4 : index) : i64
    %5 = llvm.mlir.constant(3 : index) : i64
    %6 = llvm.mlir.constant(2 : index) : i64
    %7 = llvm.mlir.constant(7 : index) : i64
    %8 = llvm.mlir.constant(112 : index) : i64
    %9 = llvm.mlir.constant(1 : index) : i64
    %10 = llvm.mlir.constant(16 : index) : i64
    %11 = llvm.mlir.constant(0 : index) : i64
    %12 = builtin.unrealized_conversion_cast %11 : i64 to index
    %13 = builtin.unrealized_conversion_cast %12 : index to i64
    %14 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%12 : index)
  ^bb2(%15: index):  // 2 preds: ^bb1, ^bb6
    %16 = builtin.unrealized_conversion_cast %15 : index to i64
    %17 = builtin.unrealized_conversion_cast %15 : index to i64
    %18 = llvm.icmp "slt" %16, %10 : i64
    cf.cond_br %18, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%12 : index)
  ^bb4(%19: index):  // 2 preds: ^bb3, ^bb5
    %20 = builtin.unrealized_conversion_cast %19 : index to i64
    %21 = builtin.unrealized_conversion_cast %19 : index to i64
    %22 = llvm.icmp "slt" %20, %8 : i64
    cf.cond_br %22, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %23 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(802816 : index) : i64
    %25 = llvm.mul %13, %24  : i64
    %26 = llvm.mlir.constant(12544 : index) : i64
    %27 = llvm.mul %13, %26  : i64
    %28 = llvm.add %25, %27  : i64
    %29 = llvm.mlir.constant(112 : index) : i64
    %30 = llvm.mul %17, %29  : i64
    %31 = llvm.add %28, %30  : i64
    %32 = llvm.add %31, %21  : i64
    %33 = llvm.getelementptr %23[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %34 = llvm.load %33 : !llvm.ptr -> f32
    %35 = llvm.fcmp "ugt" %34, %14 : f32
    %36 = llvm.select %35, %34, %14 : i1, f32
    %37 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(802816 : index) : i64
    %39 = llvm.mul %13, %38  : i64
    %40 = llvm.mlir.constant(12544 : index) : i64
    %41 = llvm.mul %13, %40  : i64
    %42 = llvm.add %39, %41  : i64
    %43 = llvm.mlir.constant(112 : index) : i64
    %44 = llvm.mul %17, %43  : i64
    %45 = llvm.add %42, %44  : i64
    %46 = llvm.add %45, %21  : i64
    %47 = llvm.getelementptr %37[%46] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %36, %47 : f32, !llvm.ptr
    %48 = llvm.add %20, %9  : i64
    %49 = builtin.unrealized_conversion_cast %48 : i64 to index
    %50 = builtin.unrealized_conversion_cast %49 : index to i64
    %51 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %52 = llvm.mlir.constant(802816 : index) : i64
    %53 = llvm.mul %13, %52  : i64
    %54 = llvm.mlir.constant(12544 : index) : i64
    %55 = llvm.mul %13, %54  : i64
    %56 = llvm.add %53, %55  : i64
    %57 = llvm.mlir.constant(112 : index) : i64
    %58 = llvm.mul %17, %57  : i64
    %59 = llvm.add %56, %58  : i64
    %60 = llvm.add %59, %50  : i64
    %61 = llvm.getelementptr %51[%60] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %62 = llvm.load %61 : !llvm.ptr -> f32
    %63 = llvm.fcmp "ugt" %62, %14 : f32
    %64 = llvm.select %63, %62, %14 : i1, f32
    %65 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(802816 : index) : i64
    %67 = llvm.mul %13, %66  : i64
    %68 = llvm.mlir.constant(12544 : index) : i64
    %69 = llvm.mul %13, %68  : i64
    %70 = llvm.add %67, %69  : i64
    %71 = llvm.mlir.constant(112 : index) : i64
    %72 = llvm.mul %17, %71  : i64
    %73 = llvm.add %70, %72  : i64
    %74 = llvm.add %73, %50  : i64
    %75 = llvm.getelementptr %65[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %64, %75 : f32, !llvm.ptr
    %76 = llvm.add %20, %6  : i64
    %77 = builtin.unrealized_conversion_cast %76 : i64 to index
    %78 = builtin.unrealized_conversion_cast %77 : index to i64
    %79 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %80 = llvm.mlir.constant(802816 : index) : i64
    %81 = llvm.mul %13, %80  : i64
    %82 = llvm.mlir.constant(12544 : index) : i64
    %83 = llvm.mul %13, %82  : i64
    %84 = llvm.add %81, %83  : i64
    %85 = llvm.mlir.constant(112 : index) : i64
    %86 = llvm.mul %17, %85  : i64
    %87 = llvm.add %84, %86  : i64
    %88 = llvm.add %87, %78  : i64
    %89 = llvm.getelementptr %79[%88] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %90 = llvm.load %89 : !llvm.ptr -> f32
    %91 = llvm.fcmp "ugt" %90, %14 : f32
    %92 = llvm.select %91, %90, %14 : i1, f32
    %93 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %94 = llvm.mlir.constant(802816 : index) : i64
    %95 = llvm.mul %13, %94  : i64
    %96 = llvm.mlir.constant(12544 : index) : i64
    %97 = llvm.mul %13, %96  : i64
    %98 = llvm.add %95, %97  : i64
    %99 = llvm.mlir.constant(112 : index) : i64
    %100 = llvm.mul %17, %99  : i64
    %101 = llvm.add %98, %100  : i64
    %102 = llvm.add %101, %78  : i64
    %103 = llvm.getelementptr %93[%102] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %92, %103 : f32, !llvm.ptr
    %104 = llvm.add %20, %5  : i64
    %105 = builtin.unrealized_conversion_cast %104 : i64 to index
    %106 = builtin.unrealized_conversion_cast %105 : index to i64
    %107 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %108 = llvm.mlir.constant(802816 : index) : i64
    %109 = llvm.mul %13, %108  : i64
    %110 = llvm.mlir.constant(12544 : index) : i64
    %111 = llvm.mul %13, %110  : i64
    %112 = llvm.add %109, %111  : i64
    %113 = llvm.mlir.constant(112 : index) : i64
    %114 = llvm.mul %17, %113  : i64
    %115 = llvm.add %112, %114  : i64
    %116 = llvm.add %115, %106  : i64
    %117 = llvm.getelementptr %107[%116] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %118 = llvm.load %117 : !llvm.ptr -> f32
    %119 = llvm.fcmp "ugt" %118, %14 : f32
    %120 = llvm.select %119, %118, %14 : i1, f32
    %121 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %122 = llvm.mlir.constant(802816 : index) : i64
    %123 = llvm.mul %13, %122  : i64
    %124 = llvm.mlir.constant(12544 : index) : i64
    %125 = llvm.mul %13, %124  : i64
    %126 = llvm.add %123, %125  : i64
    %127 = llvm.mlir.constant(112 : index) : i64
    %128 = llvm.mul %17, %127  : i64
    %129 = llvm.add %126, %128  : i64
    %130 = llvm.add %129, %106  : i64
    %131 = llvm.getelementptr %121[%130] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %120, %131 : f32, !llvm.ptr
    %132 = llvm.add %20, %4  : i64
    %133 = builtin.unrealized_conversion_cast %132 : i64 to index
    %134 = builtin.unrealized_conversion_cast %133 : index to i64
    %135 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %136 = llvm.mlir.constant(802816 : index) : i64
    %137 = llvm.mul %13, %136  : i64
    %138 = llvm.mlir.constant(12544 : index) : i64
    %139 = llvm.mul %13, %138  : i64
    %140 = llvm.add %137, %139  : i64
    %141 = llvm.mlir.constant(112 : index) : i64
    %142 = llvm.mul %17, %141  : i64
    %143 = llvm.add %140, %142  : i64
    %144 = llvm.add %143, %134  : i64
    %145 = llvm.getelementptr %135[%144] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %146 = llvm.load %145 : !llvm.ptr -> f32
    %147 = llvm.fcmp "ugt" %146, %14 : f32
    %148 = llvm.select %147, %146, %14 : i1, f32
    %149 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %150 = llvm.mlir.constant(802816 : index) : i64
    %151 = llvm.mul %13, %150  : i64
    %152 = llvm.mlir.constant(12544 : index) : i64
    %153 = llvm.mul %13, %152  : i64
    %154 = llvm.add %151, %153  : i64
    %155 = llvm.mlir.constant(112 : index) : i64
    %156 = llvm.mul %17, %155  : i64
    %157 = llvm.add %154, %156  : i64
    %158 = llvm.add %157, %134  : i64
    %159 = llvm.getelementptr %149[%158] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %148, %159 : f32, !llvm.ptr
    %160 = llvm.add %20, %3  : i64
    %161 = builtin.unrealized_conversion_cast %160 : i64 to index
    %162 = builtin.unrealized_conversion_cast %161 : index to i64
    %163 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %164 = llvm.mlir.constant(802816 : index) : i64
    %165 = llvm.mul %13, %164  : i64
    %166 = llvm.mlir.constant(12544 : index) : i64
    %167 = llvm.mul %13, %166  : i64
    %168 = llvm.add %165, %167  : i64
    %169 = llvm.mlir.constant(112 : index) : i64
    %170 = llvm.mul %17, %169  : i64
    %171 = llvm.add %168, %170  : i64
    %172 = llvm.add %171, %162  : i64
    %173 = llvm.getelementptr %163[%172] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %174 = llvm.load %173 : !llvm.ptr -> f32
    %175 = llvm.fcmp "ugt" %174, %14 : f32
    %176 = llvm.select %175, %174, %14 : i1, f32
    %177 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %178 = llvm.mlir.constant(802816 : index) : i64
    %179 = llvm.mul %13, %178  : i64
    %180 = llvm.mlir.constant(12544 : index) : i64
    %181 = llvm.mul %13, %180  : i64
    %182 = llvm.add %179, %181  : i64
    %183 = llvm.mlir.constant(112 : index) : i64
    %184 = llvm.mul %17, %183  : i64
    %185 = llvm.add %182, %184  : i64
    %186 = llvm.add %185, %162  : i64
    %187 = llvm.getelementptr %177[%186] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %176, %187 : f32, !llvm.ptr
    %188 = llvm.add %20, %2  : i64
    %189 = builtin.unrealized_conversion_cast %188 : i64 to index
    %190 = builtin.unrealized_conversion_cast %189 : index to i64
    %191 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %192 = llvm.mlir.constant(802816 : index) : i64
    %193 = llvm.mul %13, %192  : i64
    %194 = llvm.mlir.constant(12544 : index) : i64
    %195 = llvm.mul %13, %194  : i64
    %196 = llvm.add %193, %195  : i64
    %197 = llvm.mlir.constant(112 : index) : i64
    %198 = llvm.mul %17, %197  : i64
    %199 = llvm.add %196, %198  : i64
    %200 = llvm.add %199, %190  : i64
    %201 = llvm.getelementptr %191[%200] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %202 = llvm.load %201 : !llvm.ptr -> f32
    %203 = llvm.fcmp "ugt" %202, %14 : f32
    %204 = llvm.select %203, %202, %14 : i1, f32
    %205 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %206 = llvm.mlir.constant(802816 : index) : i64
    %207 = llvm.mul %13, %206  : i64
    %208 = llvm.mlir.constant(12544 : index) : i64
    %209 = llvm.mul %13, %208  : i64
    %210 = llvm.add %207, %209  : i64
    %211 = llvm.mlir.constant(112 : index) : i64
    %212 = llvm.mul %17, %211  : i64
    %213 = llvm.add %210, %212  : i64
    %214 = llvm.add %213, %190  : i64
    %215 = llvm.getelementptr %205[%214] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %204, %215 : f32, !llvm.ptr
    %216 = llvm.add %20, %7  : i64
    %217 = builtin.unrealized_conversion_cast %216 : i64 to index
    cf.br ^bb4(%217 : index)
  ^bb6:  // pred: ^bb4
    %218 = llvm.add %16, %9  : i64
    %219 = builtin.unrealized_conversion_cast %218 : i64 to index
    cf.br ^bb2(%219 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertFuncToLLVMPass (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(802816 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(12544 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(112 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(112 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = builtin.unrealized_conversion_cast %20 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x112x112xf32>
    %22 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %23 = llvm.insertvalue %arg1, %22[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.insertvalue %arg1, %23[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %25 = llvm.mlir.constant(0 : index) : i64
    %26 = llvm.insertvalue %25, %24[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.insertvalue %27, %26[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %29 = llvm.mlir.constant(802816 : index) : i64
    %30 = llvm.insertvalue %29, %28[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %31 = llvm.mlir.constant(64 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %33 = llvm.mlir.constant(12544 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %35 = llvm.mlir.constant(112 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(112 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %39 = llvm.mlir.constant(112 : index) : i64
    %40 = llvm.insertvalue %39, %38[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %41 = llvm.mlir.constant(1 : index) : i64
    %42 = llvm.insertvalue %41, %40[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %43 = builtin.unrealized_conversion_cast %42 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x112x112xf32>
    %44 = builtin.unrealized_conversion_cast %21 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %45 = builtin.unrealized_conversion_cast %43 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %46 = llvm.mlir.constant(6 : index) : i64
    %47 = llvm.mlir.constant(5 : index) : i64
    %48 = llvm.mlir.constant(4 : index) : i64
    %49 = llvm.mlir.constant(3 : index) : i64
    %50 = llvm.mlir.constant(2 : index) : i64
    %51 = llvm.mlir.constant(7 : index) : i64
    %52 = llvm.mlir.constant(112 : index) : i64
    %53 = llvm.mlir.constant(1 : index) : i64
    %54 = llvm.mlir.constant(16 : index) : i64
    %55 = llvm.mlir.constant(0 : index) : i64
    %56 = builtin.unrealized_conversion_cast %55 : i64 to index
    %57 = builtin.unrealized_conversion_cast %56 : index to i64
    %58 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%55 : i64)
  ^bb2(%59: i64):  // 2 preds: ^bb1, ^bb6
    %60 = builtin.unrealized_conversion_cast %59 : i64 to index
    %61 = builtin.unrealized_conversion_cast %60 : index to i64
    %62 = builtin.unrealized_conversion_cast %60 : index to i64
    %63 = llvm.icmp "slt" %61, %54 : i64
    llvm.cond_br %63, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%55 : i64)
  ^bb4(%64: i64):  // 2 preds: ^bb3, ^bb5
    %65 = builtin.unrealized_conversion_cast %64 : i64 to index
    %66 = builtin.unrealized_conversion_cast %65 : index to i64
    %67 = builtin.unrealized_conversion_cast %65 : index to i64
    %68 = llvm.icmp "slt" %66, %52 : i64
    llvm.cond_br %68, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %69 = llvm.extractvalue %44[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %70 = llvm.mlir.constant(802816 : index) : i64
    %71 = llvm.mul %57, %70  : i64
    %72 = llvm.mlir.constant(12544 : index) : i64
    %73 = llvm.mul %57, %72  : i64
    %74 = llvm.add %71, %73  : i64
    %75 = llvm.mlir.constant(112 : index) : i64
    %76 = llvm.mul %62, %75  : i64
    %77 = llvm.add %74, %76  : i64
    %78 = llvm.add %77, %67  : i64
    %79 = llvm.getelementptr %69[%78] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %80 = llvm.load %79 : !llvm.ptr -> f32
    %81 = llvm.fcmp "ugt" %80, %58 : f32
    %82 = llvm.select %81, %80, %58 : i1, f32
    %83 = llvm.extractvalue %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %84 = llvm.mlir.constant(802816 : index) : i64
    %85 = llvm.mul %57, %84  : i64
    %86 = llvm.mlir.constant(12544 : index) : i64
    %87 = llvm.mul %57, %86  : i64
    %88 = llvm.add %85, %87  : i64
    %89 = llvm.mlir.constant(112 : index) : i64
    %90 = llvm.mul %62, %89  : i64
    %91 = llvm.add %88, %90  : i64
    %92 = llvm.add %91, %67  : i64
    %93 = llvm.getelementptr %83[%92] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %82, %93 : f32, !llvm.ptr
    %94 = llvm.add %66, %53  : i64
    %95 = builtin.unrealized_conversion_cast %94 : i64 to index
    %96 = builtin.unrealized_conversion_cast %95 : index to i64
    %97 = llvm.extractvalue %44[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %98 = llvm.mlir.constant(802816 : index) : i64
    %99 = llvm.mul %57, %98  : i64
    %100 = llvm.mlir.constant(12544 : index) : i64
    %101 = llvm.mul %57, %100  : i64
    %102 = llvm.add %99, %101  : i64
    %103 = llvm.mlir.constant(112 : index) : i64
    %104 = llvm.mul %62, %103  : i64
    %105 = llvm.add %102, %104  : i64
    %106 = llvm.add %105, %96  : i64
    %107 = llvm.getelementptr %97[%106] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %108 = llvm.load %107 : !llvm.ptr -> f32
    %109 = llvm.fcmp "ugt" %108, %58 : f32
    %110 = llvm.select %109, %108, %58 : i1, f32
    %111 = llvm.extractvalue %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %112 = llvm.mlir.constant(802816 : index) : i64
    %113 = llvm.mul %57, %112  : i64
    %114 = llvm.mlir.constant(12544 : index) : i64
    %115 = llvm.mul %57, %114  : i64
    %116 = llvm.add %113, %115  : i64
    %117 = llvm.mlir.constant(112 : index) : i64
    %118 = llvm.mul %62, %117  : i64
    %119 = llvm.add %116, %118  : i64
    %120 = llvm.add %119, %96  : i64
    %121 = llvm.getelementptr %111[%120] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %110, %121 : f32, !llvm.ptr
    %122 = llvm.add %66, %50  : i64
    %123 = builtin.unrealized_conversion_cast %122 : i64 to index
    %124 = builtin.unrealized_conversion_cast %123 : index to i64
    %125 = llvm.extractvalue %44[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %126 = llvm.mlir.constant(802816 : index) : i64
    %127 = llvm.mul %57, %126  : i64
    %128 = llvm.mlir.constant(12544 : index) : i64
    %129 = llvm.mul %57, %128  : i64
    %130 = llvm.add %127, %129  : i64
    %131 = llvm.mlir.constant(112 : index) : i64
    %132 = llvm.mul %62, %131  : i64
    %133 = llvm.add %130, %132  : i64
    %134 = llvm.add %133, %124  : i64
    %135 = llvm.getelementptr %125[%134] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %136 = llvm.load %135 : !llvm.ptr -> f32
    %137 = llvm.fcmp "ugt" %136, %58 : f32
    %138 = llvm.select %137, %136, %58 : i1, f32
    %139 = llvm.extractvalue %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %140 = llvm.mlir.constant(802816 : index) : i64
    %141 = llvm.mul %57, %140  : i64
    %142 = llvm.mlir.constant(12544 : index) : i64
    %143 = llvm.mul %57, %142  : i64
    %144 = llvm.add %141, %143  : i64
    %145 = llvm.mlir.constant(112 : index) : i64
    %146 = llvm.mul %62, %145  : i64
    %147 = llvm.add %144, %146  : i64
    %148 = llvm.add %147, %124  : i64
    %149 = llvm.getelementptr %139[%148] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %138, %149 : f32, !llvm.ptr
    %150 = llvm.add %66, %49  : i64
    %151 = builtin.unrealized_conversion_cast %150 : i64 to index
    %152 = builtin.unrealized_conversion_cast %151 : index to i64
    %153 = llvm.extractvalue %44[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %154 = llvm.mlir.constant(802816 : index) : i64
    %155 = llvm.mul %57, %154  : i64
    %156 = llvm.mlir.constant(12544 : index) : i64
    %157 = llvm.mul %57, %156  : i64
    %158 = llvm.add %155, %157  : i64
    %159 = llvm.mlir.constant(112 : index) : i64
    %160 = llvm.mul %62, %159  : i64
    %161 = llvm.add %158, %160  : i64
    %162 = llvm.add %161, %152  : i64
    %163 = llvm.getelementptr %153[%162] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %164 = llvm.load %163 : !llvm.ptr -> f32
    %165 = llvm.fcmp "ugt" %164, %58 : f32
    %166 = llvm.select %165, %164, %58 : i1, f32
    %167 = llvm.extractvalue %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %168 = llvm.mlir.constant(802816 : index) : i64
    %169 = llvm.mul %57, %168  : i64
    %170 = llvm.mlir.constant(12544 : index) : i64
    %171 = llvm.mul %57, %170  : i64
    %172 = llvm.add %169, %171  : i64
    %173 = llvm.mlir.constant(112 : index) : i64
    %174 = llvm.mul %62, %173  : i64
    %175 = llvm.add %172, %174  : i64
    %176 = llvm.add %175, %152  : i64
    %177 = llvm.getelementptr %167[%176] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %166, %177 : f32, !llvm.ptr
    %178 = llvm.add %66, %48  : i64
    %179 = builtin.unrealized_conversion_cast %178 : i64 to index
    %180 = builtin.unrealized_conversion_cast %179 : index to i64
    %181 = llvm.extractvalue %44[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %182 = llvm.mlir.constant(802816 : index) : i64
    %183 = llvm.mul %57, %182  : i64
    %184 = llvm.mlir.constant(12544 : index) : i64
    %185 = llvm.mul %57, %184  : i64
    %186 = llvm.add %183, %185  : i64
    %187 = llvm.mlir.constant(112 : index) : i64
    %188 = llvm.mul %62, %187  : i64
    %189 = llvm.add %186, %188  : i64
    %190 = llvm.add %189, %180  : i64
    %191 = llvm.getelementptr %181[%190] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %192 = llvm.load %191 : !llvm.ptr -> f32
    %193 = llvm.fcmp "ugt" %192, %58 : f32
    %194 = llvm.select %193, %192, %58 : i1, f32
    %195 = llvm.extractvalue %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %196 = llvm.mlir.constant(802816 : index) : i64
    %197 = llvm.mul %57, %196  : i64
    %198 = llvm.mlir.constant(12544 : index) : i64
    %199 = llvm.mul %57, %198  : i64
    %200 = llvm.add %197, %199  : i64
    %201 = llvm.mlir.constant(112 : index) : i64
    %202 = llvm.mul %62, %201  : i64
    %203 = llvm.add %200, %202  : i64
    %204 = llvm.add %203, %180  : i64
    %205 = llvm.getelementptr %195[%204] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %194, %205 : f32, !llvm.ptr
    %206 = llvm.add %66, %47  : i64
    %207 = builtin.unrealized_conversion_cast %206 : i64 to index
    %208 = builtin.unrealized_conversion_cast %207 : index to i64
    %209 = llvm.extractvalue %44[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %210 = llvm.mlir.constant(802816 : index) : i64
    %211 = llvm.mul %57, %210  : i64
    %212 = llvm.mlir.constant(12544 : index) : i64
    %213 = llvm.mul %57, %212  : i64
    %214 = llvm.add %211, %213  : i64
    %215 = llvm.mlir.constant(112 : index) : i64
    %216 = llvm.mul %62, %215  : i64
    %217 = llvm.add %214, %216  : i64
    %218 = llvm.add %217, %208  : i64
    %219 = llvm.getelementptr %209[%218] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %220 = llvm.load %219 : !llvm.ptr -> f32
    %221 = llvm.fcmp "ugt" %220, %58 : f32
    %222 = llvm.select %221, %220, %58 : i1, f32
    %223 = llvm.extractvalue %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %224 = llvm.mlir.constant(802816 : index) : i64
    %225 = llvm.mul %57, %224  : i64
    %226 = llvm.mlir.constant(12544 : index) : i64
    %227 = llvm.mul %57, %226  : i64
    %228 = llvm.add %225, %227  : i64
    %229 = llvm.mlir.constant(112 : index) : i64
    %230 = llvm.mul %62, %229  : i64
    %231 = llvm.add %228, %230  : i64
    %232 = llvm.add %231, %208  : i64
    %233 = llvm.getelementptr %223[%232] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %222, %233 : f32, !llvm.ptr
    %234 = llvm.add %66, %46  : i64
    %235 = builtin.unrealized_conversion_cast %234 : i64 to index
    %236 = builtin.unrealized_conversion_cast %235 : index to i64
    %237 = llvm.extractvalue %44[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %238 = llvm.mlir.constant(802816 : index) : i64
    %239 = llvm.mul %57, %238  : i64
    %240 = llvm.mlir.constant(12544 : index) : i64
    %241 = llvm.mul %57, %240  : i64
    %242 = llvm.add %239, %241  : i64
    %243 = llvm.mlir.constant(112 : index) : i64
    %244 = llvm.mul %62, %243  : i64
    %245 = llvm.add %242, %244  : i64
    %246 = llvm.add %245, %236  : i64
    %247 = llvm.getelementptr %237[%246] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %248 = llvm.load %247 : !llvm.ptr -> f32
    %249 = llvm.fcmp "ugt" %248, %58 : f32
    %250 = llvm.select %249, %248, %58 : i1, f32
    %251 = llvm.extractvalue %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %252 = llvm.mlir.constant(802816 : index) : i64
    %253 = llvm.mul %57, %252  : i64
    %254 = llvm.mlir.constant(12544 : index) : i64
    %255 = llvm.mul %57, %254  : i64
    %256 = llvm.add %253, %255  : i64
    %257 = llvm.mlir.constant(112 : index) : i64
    %258 = llvm.mul %62, %257  : i64
    %259 = llvm.add %256, %258  : i64
    %260 = llvm.add %259, %236  : i64
    %261 = llvm.getelementptr %251[%260] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %250, %261 : f32, !llvm.ptr
    %262 = llvm.add %66, %51  : i64
    %263 = builtin.unrealized_conversion_cast %262 : i64 to index
    llvm.br ^bb4(%262 : i64)
  ^bb6:  // pred: ^bb4
    %264 = llvm.add %61, %53  : i64
    %265 = builtin.unrealized_conversion_cast %264 : i64 to index
    llvm.br ^bb2(%264 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(802816 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(12544 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(112 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(112 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(112 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %22 = llvm.insertvalue %arg1, %21[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %23 = llvm.insertvalue %arg1, %22[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = llvm.insertvalue %24, %23[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %26 = llvm.mlir.constant(1 : index) : i64
    %27 = llvm.insertvalue %26, %25[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %28 = llvm.mlir.constant(802816 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(64 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(12544 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(112 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(112 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(112 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.constant(6 : index) : i64
    %43 = llvm.mlir.constant(5 : index) : i64
    %44 = llvm.mlir.constant(4 : index) : i64
    %45 = llvm.mlir.constant(3 : index) : i64
    %46 = llvm.mlir.constant(2 : index) : i64
    %47 = llvm.mlir.constant(7 : index) : i64
    %48 = llvm.mlir.constant(112 : index) : i64
    %49 = llvm.mlir.constant(1 : index) : i64
    %50 = llvm.mlir.constant(16 : index) : i64
    %51 = llvm.mlir.constant(0 : index) : i64
    %52 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%51 : i64)
  ^bb2(%53: i64):  // 2 preds: ^bb1, ^bb6
    %54 = llvm.icmp "slt" %53, %50 : i64
    llvm.cond_br %54, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%51 : i64)
  ^bb4(%55: i64):  // 2 preds: ^bb3, ^bb5
    %56 = llvm.icmp "slt" %55, %48 : i64
    llvm.cond_br %56, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %57 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %58 = llvm.mlir.constant(802816 : index) : i64
    %59 = llvm.mul %51, %58  : i64
    %60 = llvm.mlir.constant(12544 : index) : i64
    %61 = llvm.mul %51, %60  : i64
    %62 = llvm.add %59, %61  : i64
    %63 = llvm.mlir.constant(112 : index) : i64
    %64 = llvm.mul %53, %63  : i64
    %65 = llvm.add %62, %64  : i64
    %66 = llvm.add %65, %55  : i64
    %67 = llvm.getelementptr %57[%66] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %68 = llvm.load %67 : !llvm.ptr -> f32
    %69 = llvm.fcmp "ugt" %68, %52 : f32
    %70 = llvm.select %69, %68, %52 : i1, f32
    %71 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %72 = llvm.mlir.constant(802816 : index) : i64
    %73 = llvm.mul %51, %72  : i64
    %74 = llvm.mlir.constant(12544 : index) : i64
    %75 = llvm.mul %51, %74  : i64
    %76 = llvm.add %73, %75  : i64
    %77 = llvm.mlir.constant(112 : index) : i64
    %78 = llvm.mul %53, %77  : i64
    %79 = llvm.add %76, %78  : i64
    %80 = llvm.add %79, %55  : i64
    %81 = llvm.getelementptr %71[%80] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %70, %81 : f32, !llvm.ptr
    %82 = llvm.add %55, %49  : i64
    %83 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %84 = llvm.mlir.constant(802816 : index) : i64
    %85 = llvm.mul %51, %84  : i64
    %86 = llvm.mlir.constant(12544 : index) : i64
    %87 = llvm.mul %51, %86  : i64
    %88 = llvm.add %85, %87  : i64
    %89 = llvm.mlir.constant(112 : index) : i64
    %90 = llvm.mul %53, %89  : i64
    %91 = llvm.add %88, %90  : i64
    %92 = llvm.add %91, %82  : i64
    %93 = llvm.getelementptr %83[%92] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %94 = llvm.load %93 : !llvm.ptr -> f32
    %95 = llvm.fcmp "ugt" %94, %52 : f32
    %96 = llvm.select %95, %94, %52 : i1, f32
    %97 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %98 = llvm.mlir.constant(802816 : index) : i64
    %99 = llvm.mul %51, %98  : i64
    %100 = llvm.mlir.constant(12544 : index) : i64
    %101 = llvm.mul %51, %100  : i64
    %102 = llvm.add %99, %101  : i64
    %103 = llvm.mlir.constant(112 : index) : i64
    %104 = llvm.mul %53, %103  : i64
    %105 = llvm.add %102, %104  : i64
    %106 = llvm.add %105, %82  : i64
    %107 = llvm.getelementptr %97[%106] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %96, %107 : f32, !llvm.ptr
    %108 = llvm.add %55, %46  : i64
    %109 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %110 = llvm.mlir.constant(802816 : index) : i64
    %111 = llvm.mul %51, %110  : i64
    %112 = llvm.mlir.constant(12544 : index) : i64
    %113 = llvm.mul %51, %112  : i64
    %114 = llvm.add %111, %113  : i64
    %115 = llvm.mlir.constant(112 : index) : i64
    %116 = llvm.mul %53, %115  : i64
    %117 = llvm.add %114, %116  : i64
    %118 = llvm.add %117, %108  : i64
    %119 = llvm.getelementptr %109[%118] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %120 = llvm.load %119 : !llvm.ptr -> f32
    %121 = llvm.fcmp "ugt" %120, %52 : f32
    %122 = llvm.select %121, %120, %52 : i1, f32
    %123 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %124 = llvm.mlir.constant(802816 : index) : i64
    %125 = llvm.mul %51, %124  : i64
    %126 = llvm.mlir.constant(12544 : index) : i64
    %127 = llvm.mul %51, %126  : i64
    %128 = llvm.add %125, %127  : i64
    %129 = llvm.mlir.constant(112 : index) : i64
    %130 = llvm.mul %53, %129  : i64
    %131 = llvm.add %128, %130  : i64
    %132 = llvm.add %131, %108  : i64
    %133 = llvm.getelementptr %123[%132] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %122, %133 : f32, !llvm.ptr
    %134 = llvm.add %55, %45  : i64
    %135 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %136 = llvm.mlir.constant(802816 : index) : i64
    %137 = llvm.mul %51, %136  : i64
    %138 = llvm.mlir.constant(12544 : index) : i64
    %139 = llvm.mul %51, %138  : i64
    %140 = llvm.add %137, %139  : i64
    %141 = llvm.mlir.constant(112 : index) : i64
    %142 = llvm.mul %53, %141  : i64
    %143 = llvm.add %140, %142  : i64
    %144 = llvm.add %143, %134  : i64
    %145 = llvm.getelementptr %135[%144] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %146 = llvm.load %145 : !llvm.ptr -> f32
    %147 = llvm.fcmp "ugt" %146, %52 : f32
    %148 = llvm.select %147, %146, %52 : i1, f32
    %149 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %150 = llvm.mlir.constant(802816 : index) : i64
    %151 = llvm.mul %51, %150  : i64
    %152 = llvm.mlir.constant(12544 : index) : i64
    %153 = llvm.mul %51, %152  : i64
    %154 = llvm.add %151, %153  : i64
    %155 = llvm.mlir.constant(112 : index) : i64
    %156 = llvm.mul %53, %155  : i64
    %157 = llvm.add %154, %156  : i64
    %158 = llvm.add %157, %134  : i64
    %159 = llvm.getelementptr %149[%158] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %148, %159 : f32, !llvm.ptr
    %160 = llvm.add %55, %44  : i64
    %161 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %162 = llvm.mlir.constant(802816 : index) : i64
    %163 = llvm.mul %51, %162  : i64
    %164 = llvm.mlir.constant(12544 : index) : i64
    %165 = llvm.mul %51, %164  : i64
    %166 = llvm.add %163, %165  : i64
    %167 = llvm.mlir.constant(112 : index) : i64
    %168 = llvm.mul %53, %167  : i64
    %169 = llvm.add %166, %168  : i64
    %170 = llvm.add %169, %160  : i64
    %171 = llvm.getelementptr %161[%170] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %172 = llvm.load %171 : !llvm.ptr -> f32
    %173 = llvm.fcmp "ugt" %172, %52 : f32
    %174 = llvm.select %173, %172, %52 : i1, f32
    %175 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %176 = llvm.mlir.constant(802816 : index) : i64
    %177 = llvm.mul %51, %176  : i64
    %178 = llvm.mlir.constant(12544 : index) : i64
    %179 = llvm.mul %51, %178  : i64
    %180 = llvm.add %177, %179  : i64
    %181 = llvm.mlir.constant(112 : index) : i64
    %182 = llvm.mul %53, %181  : i64
    %183 = llvm.add %180, %182  : i64
    %184 = llvm.add %183, %160  : i64
    %185 = llvm.getelementptr %175[%184] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %174, %185 : f32, !llvm.ptr
    %186 = llvm.add %55, %43  : i64
    %187 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %188 = llvm.mlir.constant(802816 : index) : i64
    %189 = llvm.mul %51, %188  : i64
    %190 = llvm.mlir.constant(12544 : index) : i64
    %191 = llvm.mul %51, %190  : i64
    %192 = llvm.add %189, %191  : i64
    %193 = llvm.mlir.constant(112 : index) : i64
    %194 = llvm.mul %53, %193  : i64
    %195 = llvm.add %192, %194  : i64
    %196 = llvm.add %195, %186  : i64
    %197 = llvm.getelementptr %187[%196] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %198 = llvm.load %197 : !llvm.ptr -> f32
    %199 = llvm.fcmp "ugt" %198, %52 : f32
    %200 = llvm.select %199, %198, %52 : i1, f32
    %201 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %202 = llvm.mlir.constant(802816 : index) : i64
    %203 = llvm.mul %51, %202  : i64
    %204 = llvm.mlir.constant(12544 : index) : i64
    %205 = llvm.mul %51, %204  : i64
    %206 = llvm.add %203, %205  : i64
    %207 = llvm.mlir.constant(112 : index) : i64
    %208 = llvm.mul %53, %207  : i64
    %209 = llvm.add %206, %208  : i64
    %210 = llvm.add %209, %186  : i64
    %211 = llvm.getelementptr %201[%210] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %200, %211 : f32, !llvm.ptr
    %212 = llvm.add %55, %42  : i64
    %213 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %214 = llvm.mlir.constant(802816 : index) : i64
    %215 = llvm.mul %51, %214  : i64
    %216 = llvm.mlir.constant(12544 : index) : i64
    %217 = llvm.mul %51, %216  : i64
    %218 = llvm.add %215, %217  : i64
    %219 = llvm.mlir.constant(112 : index) : i64
    %220 = llvm.mul %53, %219  : i64
    %221 = llvm.add %218, %220  : i64
    %222 = llvm.add %221, %212  : i64
    %223 = llvm.getelementptr %213[%222] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %224 = llvm.load %223 : !llvm.ptr -> f32
    %225 = llvm.fcmp "ugt" %224, %52 : f32
    %226 = llvm.select %225, %224, %52 : i1, f32
    %227 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %228 = llvm.mlir.constant(802816 : index) : i64
    %229 = llvm.mul %51, %228  : i64
    %230 = llvm.mlir.constant(12544 : index) : i64
    %231 = llvm.mul %51, %230  : i64
    %232 = llvm.add %229, %231  : i64
    %233 = llvm.mlir.constant(112 : index) : i64
    %234 = llvm.mul %53, %233  : i64
    %235 = llvm.add %232, %234  : i64
    %236 = llvm.add %235, %212  : i64
    %237 = llvm.getelementptr %227[%236] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %226, %237 : f32, !llvm.ptr
    %238 = llvm.add %55, %47  : i64
    llvm.br ^bb4(%238 : i64)
  ^bb6:  // pred: ^bb4
    %239 = llvm.add %53, %49  : i64
    llvm.br ^bb2(%239 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) attributes {Kernel, forward_kernel_2} {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(16 : index) : i64
    %2 = llvm.mlir.constant(7 : index) : i64
    %3 = llvm.mlir.constant(2 : index) : i64
    %4 = llvm.mlir.constant(3 : index) : i64
    %5 = llvm.mlir.constant(4 : index) : i64
    %6 = llvm.mlir.constant(5 : index) : i64
    %7 = llvm.mlir.constant(6 : index) : i64
    %8 = llvm.mlir.constant(112 : index) : i64
    %9 = llvm.mlir.constant(12544 : index) : i64
    %10 = llvm.mlir.constant(802816 : index) : i64
    %11 = llvm.mlir.constant(1 : index) : i64
    %12 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%12 : i64)
  ^bb2(%13: i64):  // 2 preds: ^bb1, ^bb6
    %14 = llvm.icmp "slt" %13, %1 : i64
    llvm.cond_br %14, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%12 : i64)
  ^bb4(%15: i64):  // 2 preds: ^bb3, ^bb5
    %16 = llvm.icmp "slt" %15, %8 : i64
    llvm.cond_br %16, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %17 = llvm.mul %12, %10  : i64
    %18 = llvm.mul %12, %9  : i64
    %19 = llvm.add %17, %18  : i64
    %20 = llvm.mul %13, %8  : i64
    %21 = llvm.add %19, %20  : i64
    %22 = llvm.add %21, %15  : i64
    %23 = llvm.getelementptr %arg0[%22] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %24 = llvm.load %23 : !llvm.ptr -> f32
    %25 = llvm.fcmp "ugt" %24, %0 : f32
    %26 = llvm.select %25, %24, %0 : i1, f32
    %27 = llvm.mul %12, %10  : i64
    %28 = llvm.mul %12, %9  : i64
    %29 = llvm.add %27, %28  : i64
    %30 = llvm.mul %13, %8  : i64
    %31 = llvm.add %29, %30  : i64
    %32 = llvm.add %31, %15  : i64
    %33 = llvm.getelementptr %arg1[%32] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %26, %33 : f32, !llvm.ptr
    %34 = llvm.add %15, %11  : i64
    %35 = llvm.mul %12, %10  : i64
    %36 = llvm.mul %12, %9  : i64
    %37 = llvm.add %35, %36  : i64
    %38 = llvm.mul %13, %8  : i64
    %39 = llvm.add %37, %38  : i64
    %40 = llvm.add %39, %34  : i64
    %41 = llvm.getelementptr %arg0[%40] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %42 = llvm.load %41 : !llvm.ptr -> f32
    %43 = llvm.fcmp "ugt" %42, %0 : f32
    %44 = llvm.select %43, %42, %0 : i1, f32
    %45 = llvm.mul %12, %10  : i64
    %46 = llvm.mul %12, %9  : i64
    %47 = llvm.add %45, %46  : i64
    %48 = llvm.mul %13, %8  : i64
    %49 = llvm.add %47, %48  : i64
    %50 = llvm.add %49, %34  : i64
    %51 = llvm.getelementptr %arg1[%50] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %44, %51 : f32, !llvm.ptr
    %52 = llvm.add %15, %3  : i64
    %53 = llvm.mul %12, %10  : i64
    %54 = llvm.mul %12, %9  : i64
    %55 = llvm.add %53, %54  : i64
    %56 = llvm.mul %13, %8  : i64
    %57 = llvm.add %55, %56  : i64
    %58 = llvm.add %57, %52  : i64
    %59 = llvm.getelementptr %arg0[%58] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %60 = llvm.load %59 : !llvm.ptr -> f32
    %61 = llvm.fcmp "ugt" %60, %0 : f32
    %62 = llvm.select %61, %60, %0 : i1, f32
    %63 = llvm.mul %12, %10  : i64
    %64 = llvm.mul %12, %9  : i64
    %65 = llvm.add %63, %64  : i64
    %66 = llvm.mul %13, %8  : i64
    %67 = llvm.add %65, %66  : i64
    %68 = llvm.add %67, %52  : i64
    %69 = llvm.getelementptr %arg1[%68] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %62, %69 : f32, !llvm.ptr
    %70 = llvm.add %15, %4  : i64
    %71 = llvm.mul %12, %10  : i64
    %72 = llvm.mul %12, %9  : i64
    %73 = llvm.add %71, %72  : i64
    %74 = llvm.mul %13, %8  : i64
    %75 = llvm.add %73, %74  : i64
    %76 = llvm.add %75, %70  : i64
    %77 = llvm.getelementptr %arg0[%76] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %78 = llvm.load %77 : !llvm.ptr -> f32
    %79 = llvm.fcmp "ugt" %78, %0 : f32
    %80 = llvm.select %79, %78, %0 : i1, f32
    %81 = llvm.mul %12, %10  : i64
    %82 = llvm.mul %12, %9  : i64
    %83 = llvm.add %81, %82  : i64
    %84 = llvm.mul %13, %8  : i64
    %85 = llvm.add %83, %84  : i64
    %86 = llvm.add %85, %70  : i64
    %87 = llvm.getelementptr %arg1[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %80, %87 : f32, !llvm.ptr
    %88 = llvm.add %15, %5  : i64
    %89 = llvm.mul %12, %10  : i64
    %90 = llvm.mul %12, %9  : i64
    %91 = llvm.add %89, %90  : i64
    %92 = llvm.mul %13, %8  : i64
    %93 = llvm.add %91, %92  : i64
    %94 = llvm.add %93, %88  : i64
    %95 = llvm.getelementptr %arg0[%94] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %96 = llvm.load %95 : !llvm.ptr -> f32
    %97 = llvm.fcmp "ugt" %96, %0 : f32
    %98 = llvm.select %97, %96, %0 : i1, f32
    %99 = llvm.mul %12, %10  : i64
    %100 = llvm.mul %12, %9  : i64
    %101 = llvm.add %99, %100  : i64
    %102 = llvm.mul %13, %8  : i64
    %103 = llvm.add %101, %102  : i64
    %104 = llvm.add %103, %88  : i64
    %105 = llvm.getelementptr %arg1[%104] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %98, %105 : f32, !llvm.ptr
    %106 = llvm.add %15, %6  : i64
    %107 = llvm.mul %12, %10  : i64
    %108 = llvm.mul %12, %9  : i64
    %109 = llvm.add %107, %108  : i64
    %110 = llvm.mul %13, %8  : i64
    %111 = llvm.add %109, %110  : i64
    %112 = llvm.add %111, %106  : i64
    %113 = llvm.getelementptr %arg0[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = llvm.fcmp "ugt" %114, %0 : f32
    %116 = llvm.select %115, %114, %0 : i1, f32
    %117 = llvm.mul %12, %10  : i64
    %118 = llvm.mul %12, %9  : i64
    %119 = llvm.add %117, %118  : i64
    %120 = llvm.mul %13, %8  : i64
    %121 = llvm.add %119, %120  : i64
    %122 = llvm.add %121, %106  : i64
    %123 = llvm.getelementptr %arg1[%122] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %116, %123 : f32, !llvm.ptr
    %124 = llvm.add %15, %7  : i64
    %125 = llvm.mul %12, %10  : i64
    %126 = llvm.mul %12, %9  : i64
    %127 = llvm.add %125, %126  : i64
    %128 = llvm.mul %13, %8  : i64
    %129 = llvm.add %127, %128  : i64
    %130 = llvm.add %129, %124  : i64
    %131 = llvm.getelementptr %arg0[%130] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %132 = llvm.load %131 : !llvm.ptr -> f32
    %133 = llvm.fcmp "ugt" %132, %0 : f32
    %134 = llvm.select %133, %132, %0 : i1, f32
    %135 = llvm.mul %12, %10  : i64
    %136 = llvm.mul %12, %9  : i64
    %137 = llvm.add %135, %136  : i64
    %138 = llvm.mul %13, %8  : i64
    %139 = llvm.add %137, %138  : i64
    %140 = llvm.add %139, %124  : i64
    %141 = llvm.getelementptr %arg1[%140] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %134, %141 : f32, !llvm.ptr
    %142 = llvm.add %15, %2  : i64
    llvm.br ^bb4(%142 : i64)
  ^bb6:  // pred: ^bb4
    %143 = llvm.add %13, %11  : i64
    llvm.br ^bb2(%143 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}



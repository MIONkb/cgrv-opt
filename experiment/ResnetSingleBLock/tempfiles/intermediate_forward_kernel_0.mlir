// -----// IR Dump After ArithExpandOps (arith-expand) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg4 = 0 to 8 {
      %0 = affine.load %arg0[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
      %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
        %2 = affine.for %arg7 = 0 to 7 iter_args(%arg8 = %arg6) -> (f32) {
          %3 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c0] : memref<1x3x230x230xf32>
          %4 = affine.load %arg2[0, %arg5, %arg7, %c0] : memref<64x3x7x7xf32>
          %5 = arith.mulf %3, %4 : f32
          %6 = arith.addf %arg8, %5 : f32
          %c1 = arith.constant 1 : index
          %7 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c1] : memref<1x3x230x230xf32>
          %8 = affine.load %arg2[0, %arg5, %arg7, %c1] : memref<64x3x7x7xf32>
          %9 = arith.mulf %7, %8 : f32
          %10 = arith.addf %6, %9 : f32
          %c2 = arith.constant 2 : index
          %11 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c2] : memref<1x3x230x230xf32>
          %12 = affine.load %arg2[0, %arg5, %arg7, %c2] : memref<64x3x7x7xf32>
          %13 = arith.mulf %11, %12 : f32
          %14 = arith.addf %10, %13 : f32
          %c3 = arith.constant 3 : index
          %15 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c3] : memref<1x3x230x230xf32>
          %16 = affine.load %arg2[0, %arg5, %arg7, %c3] : memref<64x3x7x7xf32>
          %17 = arith.mulf %15, %16 : f32
          %18 = arith.addf %14, %17 : f32
          %c4 = arith.constant 4 : index
          %19 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c4] : memref<1x3x230x230xf32>
          %20 = affine.load %arg2[0, %arg5, %arg7, %c4] : memref<64x3x7x7xf32>
          %21 = arith.mulf %19, %20 : f32
          %22 = arith.addf %18, %21 : f32
          %c5 = arith.constant 5 : index
          %23 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c5] : memref<1x3x230x230xf32>
          %24 = affine.load %arg2[0, %arg5, %arg7, %c5] : memref<64x3x7x7xf32>
          %25 = arith.mulf %23, %24 : f32
          %26 = arith.addf %22, %25 : f32
          %c6 = arith.constant 6 : index
          %27 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c6] : memref<1x3x230x230xf32>
          %28 = affine.load %arg2[0, %arg5, %arg7, %c6] : memref<64x3x7x7xf32>
          %29 = arith.mulf %27, %28 : f32
          %30 = arith.addf %26, %29 : f32
          affine.yield %30 : f32
        }
        affine.yield %2 : f32
      }
      affine.store %1, %arg3[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
    }
    return
  }
}


// -----// IR Dump After ExpandOps (memref-expand) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg4 = 0 to 8 {
      %0 = affine.load %arg0[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
      %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
        %2 = affine.for %arg7 = 0 to 7 iter_args(%arg8 = %arg6) -> (f32) {
          %3 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c0] : memref<1x3x230x230xf32>
          %4 = affine.load %arg2[0, %arg5, %arg7, %c0] : memref<64x3x7x7xf32>
          %5 = arith.mulf %3, %4 : f32
          %6 = arith.addf %arg8, %5 : f32
          %c1 = arith.constant 1 : index
          %7 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c1] : memref<1x3x230x230xf32>
          %8 = affine.load %arg2[0, %arg5, %arg7, %c1] : memref<64x3x7x7xf32>
          %9 = arith.mulf %7, %8 : f32
          %10 = arith.addf %6, %9 : f32
          %c2 = arith.constant 2 : index
          %11 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c2] : memref<1x3x230x230xf32>
          %12 = affine.load %arg2[0, %arg5, %arg7, %c2] : memref<64x3x7x7xf32>
          %13 = arith.mulf %11, %12 : f32
          %14 = arith.addf %10, %13 : f32
          %c3 = arith.constant 3 : index
          %15 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c3] : memref<1x3x230x230xf32>
          %16 = affine.load %arg2[0, %arg5, %arg7, %c3] : memref<64x3x7x7xf32>
          %17 = arith.mulf %15, %16 : f32
          %18 = arith.addf %14, %17 : f32
          %c4 = arith.constant 4 : index
          %19 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c4] : memref<1x3x230x230xf32>
          %20 = affine.load %arg2[0, %arg5, %arg7, %c4] : memref<64x3x7x7xf32>
          %21 = arith.mulf %19, %20 : f32
          %22 = arith.addf %18, %21 : f32
          %c5 = arith.constant 5 : index
          %23 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c5] : memref<1x3x230x230xf32>
          %24 = affine.load %arg2[0, %arg5, %arg7, %c5] : memref<64x3x7x7xf32>
          %25 = arith.mulf %23, %24 : f32
          %26 = arith.addf %22, %25 : f32
          %c6 = arith.constant 6 : index
          %27 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c6] : memref<1x3x230x230xf32>
          %28 = affine.load %arg2[0, %arg5, %arg7, %c6] : memref<64x3x7x7xf32>
          %29 = arith.mulf %27, %28 : f32
          %30 = arith.addf %26, %29 : f32
          affine.yield %30 : f32
        }
        affine.yield %2 : f32
      }
      affine.store %1, %arg3[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
    }
    return
  }
}


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
  %c0 = arith.constant 0 : index
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg4 = 0 to 8 {
    %0 = affine.load %arg0[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
    %1 = affine.for %arg5 = 0 to 3 iter_args(%arg6 = %0) -> (f32) {
      %2 = affine.for %arg7 = 0 to 7 iter_args(%arg8 = %arg6) -> (f32) {
        %3 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c0] : memref<1x3x230x230xf32>
        %4 = affine.load %arg2[0, %arg5, %arg7, %c0] : memref<64x3x7x7xf32>
        %5 = arith.mulf %3, %4 : f32
        %6 = arith.addf %arg8, %5 : f32
        %c1 = arith.constant 1 : index
        %7 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c1] : memref<1x3x230x230xf32>
        %8 = affine.load %arg2[0, %arg5, %arg7, %c1] : memref<64x3x7x7xf32>
        %9 = arith.mulf %7, %8 : f32
        %10 = arith.addf %6, %9 : f32
        %c2 = arith.constant 2 : index
        %11 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c2] : memref<1x3x230x230xf32>
        %12 = affine.load %arg2[0, %arg5, %arg7, %c2] : memref<64x3x7x7xf32>
        %13 = arith.mulf %11, %12 : f32
        %14 = arith.addf %10, %13 : f32
        %c3 = arith.constant 3 : index
        %15 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c3] : memref<1x3x230x230xf32>
        %16 = affine.load %arg2[0, %arg5, %arg7, %c3] : memref<64x3x7x7xf32>
        %17 = arith.mulf %15, %16 : f32
        %18 = arith.addf %14, %17 : f32
        %c4 = arith.constant 4 : index
        %19 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c4] : memref<1x3x230x230xf32>
        %20 = affine.load %arg2[0, %arg5, %arg7, %c4] : memref<64x3x7x7xf32>
        %21 = arith.mulf %19, %20 : f32
        %22 = arith.addf %18, %21 : f32
        %c5 = arith.constant 5 : index
        %23 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c5] : memref<1x3x230x230xf32>
        %24 = affine.load %arg2[0, %arg5, %arg7, %c5] : memref<64x3x7x7xf32>
        %25 = arith.mulf %23, %24 : f32
        %26 = arith.addf %22, %25 : f32
        %c6 = arith.constant 6 : index
        %27 = affine.load %arg1[0, %arg5, %arg7, %arg4 * 2 + %c6] : memref<1x3x230x230xf32>
        %28 = affine.load %arg2[0, %arg5, %arg7, %c6] : memref<64x3x7x7xf32>
        %29 = arith.mulf %27, %28 : f32
        %30 = arith.addf %26, %29 : f32
        affine.yield %30 : f32
      }
      affine.yield %2 : f32
    }
    affine.store %1, %arg3[0, 0, 0, %arg4] : memref<1x64x112x112xf32>
  }
  return
}

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0_0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    scf.for %arg4 = %c0_0 to %c8 step %c1 {
      %c0_1 = arith.constant 0 : index
      %c0_2 = arith.constant 0 : index
      %c0_3 = arith.constant 0 : index
      %0 = memref.load %arg0[%c0_1, %c0_2, %c0_3, %arg4] : memref<1x64x112x112xf32>
      %c0_4 = arith.constant 0 : index
      %c3 = arith.constant 3 : index
      %c1_5 = arith.constant 1 : index
      %1 = scf.for %arg5 = %c0_4 to %c3 step %c1_5 iter_args(%arg6 = %0) -> (f32) {
        %c0_9 = arith.constant 0 : index
        %c7 = arith.constant 7 : index
        %c1_10 = arith.constant 1 : index
        %2 = scf.for %arg7 = %c0_9 to %c7 step %c1_10 iter_args(%arg8 = %arg6) -> (f32) {
          %c0_11 = arith.constant 0 : index
          %c2 = arith.constant 2 : index
          %3 = arith.muli %arg4, %c2 : index
          %4 = arith.addi %3, %c0 : index
          %5 = memref.load %arg1[%c0_11, %arg5, %arg7, %4] : memref<1x3x230x230xf32>
          %c0_12 = arith.constant 0 : index
          %6 = memref.load %arg2[%c0_12, %arg5, %arg7, %c0] : memref<64x3x7x7xf32>
          %7 = arith.mulf %5, %6 : f32
          %8 = arith.addf %arg8, %7 : f32
          %c1_13 = arith.constant 1 : index
          %c0_14 = arith.constant 0 : index
          %c2_15 = arith.constant 2 : index
          %9 = arith.muli %arg4, %c2_15 : index
          %10 = arith.addi %9, %c1_13 : index
          %11 = memref.load %arg1[%c0_14, %arg5, %arg7, %10] : memref<1x3x230x230xf32>
          %c0_16 = arith.constant 0 : index
          %12 = memref.load %arg2[%c0_16, %arg5, %arg7, %c1_13] : memref<64x3x7x7xf32>
          %13 = arith.mulf %11, %12 : f32
          %14 = arith.addf %8, %13 : f32
          %c2_17 = arith.constant 2 : index
          %c0_18 = arith.constant 0 : index
          %c2_19 = arith.constant 2 : index
          %15 = arith.muli %arg4, %c2_19 : index
          %16 = arith.addi %15, %c2_17 : index
          %17 = memref.load %arg1[%c0_18, %arg5, %arg7, %16] : memref<1x3x230x230xf32>
          %c0_20 = arith.constant 0 : index
          %18 = memref.load %arg2[%c0_20, %arg5, %arg7, %c2_17] : memref<64x3x7x7xf32>
          %19 = arith.mulf %17, %18 : f32
          %20 = arith.addf %14, %19 : f32
          %c3_21 = arith.constant 3 : index
          %c0_22 = arith.constant 0 : index
          %c2_23 = arith.constant 2 : index
          %21 = arith.muli %arg4, %c2_23 : index
          %22 = arith.addi %21, %c3_21 : index
          %23 = memref.load %arg1[%c0_22, %arg5, %arg7, %22] : memref<1x3x230x230xf32>
          %c0_24 = arith.constant 0 : index
          %24 = memref.load %arg2[%c0_24, %arg5, %arg7, %c3_21] : memref<64x3x7x7xf32>
          %25 = arith.mulf %23, %24 : f32
          %26 = arith.addf %20, %25 : f32
          %c4 = arith.constant 4 : index
          %c0_25 = arith.constant 0 : index
          %c2_26 = arith.constant 2 : index
          %27 = arith.muli %arg4, %c2_26 : index
          %28 = arith.addi %27, %c4 : index
          %29 = memref.load %arg1[%c0_25, %arg5, %arg7, %28] : memref<1x3x230x230xf32>
          %c0_27 = arith.constant 0 : index
          %30 = memref.load %arg2[%c0_27, %arg5, %arg7, %c4] : memref<64x3x7x7xf32>
          %31 = arith.mulf %29, %30 : f32
          %32 = arith.addf %26, %31 : f32
          %c5 = arith.constant 5 : index
          %c0_28 = arith.constant 0 : index
          %c2_29 = arith.constant 2 : index
          %33 = arith.muli %arg4, %c2_29 : index
          %34 = arith.addi %33, %c5 : index
          %35 = memref.load %arg1[%c0_28, %arg5, %arg7, %34] : memref<1x3x230x230xf32>
          %c0_30 = arith.constant 0 : index
          %36 = memref.load %arg2[%c0_30, %arg5, %arg7, %c5] : memref<64x3x7x7xf32>
          %37 = arith.mulf %35, %36 : f32
          %38 = arith.addf %32, %37 : f32
          %c6 = arith.constant 6 : index
          %c0_31 = arith.constant 0 : index
          %c2_32 = arith.constant 2 : index
          %39 = arith.muli %arg4, %c2_32 : index
          %40 = arith.addi %39, %c6 : index
          %41 = memref.load %arg1[%c0_31, %arg5, %arg7, %40] : memref<1x3x230x230xf32>
          %c0_33 = arith.constant 0 : index
          %42 = memref.load %arg2[%c0_33, %arg5, %arg7, %c6] : memref<64x3x7x7xf32>
          %43 = arith.mulf %41, %42 : f32
          %44 = arith.addf %38, %43 : f32
          scf.yield %44 : f32
        }
        scf.yield %2 : f32
      }
      %c0_6 = arith.constant 0 : index
      %c0_7 = arith.constant 0 : index
      %c0_8 = arith.constant 0 : index
      memref.store %1, %arg3[%c0_6, %c0_7, %c0_8, %arg4] : memref<1x64x112x112xf32>
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %c6 = arith.constant 6 : index
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg4 = %c0 to %c8 step %c1 {
      %0 = memref.load %arg0[%c0, %c0, %c0, %arg4] : memref<1x64x112x112xf32>
      %1 = scf.for %arg5 = %c0 to %c3 step %c1 iter_args(%arg6 = %0) -> (f32) {
        %2 = scf.for %arg7 = %c0 to %c7 step %c1 iter_args(%arg8 = %arg6) -> (f32) {
          %3 = arith.muli %arg4, %c2 : index
          %4 = memref.load %arg1[%c0, %arg5, %arg7, %3] : memref<1x3x230x230xf32>
          %5 = memref.load %arg2[%c0, %arg5, %arg7, %c0] : memref<64x3x7x7xf32>
          %6 = arith.mulf %4, %5 : f32
          %7 = arith.addf %arg8, %6 : f32
          %8 = arith.muli %arg4, %c2 : index
          %9 = arith.addi %8, %c1 : index
          %10 = memref.load %arg1[%c0, %arg5, %arg7, %9] : memref<1x3x230x230xf32>
          %11 = memref.load %arg2[%c0, %arg5, %arg7, %c1] : memref<64x3x7x7xf32>
          %12 = arith.mulf %10, %11 : f32
          %13 = arith.addf %7, %12 : f32
          %14 = arith.muli %arg4, %c2 : index
          %15 = arith.addi %14, %c2 : index
          %16 = memref.load %arg1[%c0, %arg5, %arg7, %15] : memref<1x3x230x230xf32>
          %17 = memref.load %arg2[%c0, %arg5, %arg7, %c2] : memref<64x3x7x7xf32>
          %18 = arith.mulf %16, %17 : f32
          %19 = arith.addf %13, %18 : f32
          %20 = arith.muli %arg4, %c2 : index
          %21 = arith.addi %20, %c3 : index
          %22 = memref.load %arg1[%c0, %arg5, %arg7, %21] : memref<1x3x230x230xf32>
          %23 = memref.load %arg2[%c0, %arg5, %arg7, %c3] : memref<64x3x7x7xf32>
          %24 = arith.mulf %22, %23 : f32
          %25 = arith.addf %19, %24 : f32
          %26 = arith.muli %arg4, %c2 : index
          %27 = arith.addi %26, %c4 : index
          %28 = memref.load %arg1[%c0, %arg5, %arg7, %27] : memref<1x3x230x230xf32>
          %29 = memref.load %arg2[%c0, %arg5, %arg7, %c4] : memref<64x3x7x7xf32>
          %30 = arith.mulf %28, %29 : f32
          %31 = arith.addf %25, %30 : f32
          %32 = arith.muli %arg4, %c2 : index
          %33 = arith.addi %32, %c5 : index
          %34 = memref.load %arg1[%c0, %arg5, %arg7, %33] : memref<1x3x230x230xf32>
          %35 = memref.load %arg2[%c0, %arg5, %arg7, %c5] : memref<64x3x7x7xf32>
          %36 = arith.mulf %34, %35 : f32
          %37 = arith.addf %31, %36 : f32
          %38 = arith.muli %arg4, %c2 : index
          %39 = arith.addi %38, %c6 : index
          %40 = memref.load %arg1[%c0, %arg5, %arg7, %39] : memref<1x3x230x230xf32>
          %41 = memref.load %arg2[%c0, %arg5, %arg7, %c6] : memref<64x3x7x7xf32>
          %42 = arith.mulf %40, %41 : f32
          %43 = arith.addf %37, %42 : f32
          scf.yield %43 : f32
        }
        scf.yield %2 : f32
      }
      memref.store %1, %arg3[%c0, %c0, %c0, %arg4] : memref<1x64x112x112xf32>
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %c6 = arith.constant 6 : index
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c2 = arith.constant 2 : index
    %c7 = arith.constant 7 : index
    %c3 = arith.constant 3 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb9
    %1 = arith.cmpi slt, %0, %c8 : index
    cf.cond_br %1, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    %2 = memref.load %arg0[%c0, %c0, %c0, %0] : memref<1x64x112x112xf32>
    cf.br ^bb4(%c0, %2 : index, f32)
  ^bb4(%3: index, %4: f32):  // 2 preds: ^bb3, ^bb8
    %5 = arith.cmpi slt, %3, %c3 : index
    cf.cond_br %5, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0, %4 : index, f32)
  ^bb6(%6: index, %7: f32):  // 2 preds: ^bb5, ^bb7
    %8 = arith.cmpi slt, %6, %c7 : index
    cf.cond_br %8, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %9 = arith.muli %0, %c2 : index
    %10 = memref.load %arg1[%c0, %3, %6, %9] : memref<1x3x230x230xf32>
    %11 = memref.load %arg2[%c0, %3, %6, %c0] : memref<64x3x7x7xf32>
    %12 = arith.mulf %10, %11 : f32
    %13 = arith.addf %7, %12 : f32
    %14 = arith.muli %0, %c2 : index
    %15 = arith.addi %14, %c1 : index
    %16 = memref.load %arg1[%c0, %3, %6, %15] : memref<1x3x230x230xf32>
    %17 = memref.load %arg2[%c0, %3, %6, %c1] : memref<64x3x7x7xf32>
    %18 = arith.mulf %16, %17 : f32
    %19 = arith.addf %13, %18 : f32
    %20 = arith.muli %0, %c2 : index
    %21 = arith.addi %20, %c2 : index
    %22 = memref.load %arg1[%c0, %3, %6, %21] : memref<1x3x230x230xf32>
    %23 = memref.load %arg2[%c0, %3, %6, %c2] : memref<64x3x7x7xf32>
    %24 = arith.mulf %22, %23 : f32
    %25 = arith.addf %19, %24 : f32
    %26 = arith.muli %0, %c2 : index
    %27 = arith.addi %26, %c3 : index
    %28 = memref.load %arg1[%c0, %3, %6, %27] : memref<1x3x230x230xf32>
    %29 = memref.load %arg2[%c0, %3, %6, %c3] : memref<64x3x7x7xf32>
    %30 = arith.mulf %28, %29 : f32
    %31 = arith.addf %25, %30 : f32
    %32 = arith.muli %0, %c2 : index
    %33 = arith.addi %32, %c4 : index
    %34 = memref.load %arg1[%c0, %3, %6, %33] : memref<1x3x230x230xf32>
    %35 = memref.load %arg2[%c0, %3, %6, %c4] : memref<64x3x7x7xf32>
    %36 = arith.mulf %34, %35 : f32
    %37 = arith.addf %31, %36 : f32
    %38 = arith.muli %0, %c2 : index
    %39 = arith.addi %38, %c5 : index
    %40 = memref.load %arg1[%c0, %3, %6, %39] : memref<1x3x230x230xf32>
    %41 = memref.load %arg2[%c0, %3, %6, %c5] : memref<64x3x7x7xf32>
    %42 = arith.mulf %40, %41 : f32
    %43 = arith.addf %37, %42 : f32
    %44 = arith.muli %0, %c2 : index
    %45 = arith.addi %44, %c6 : index
    %46 = memref.load %arg1[%c0, %3, %6, %45] : memref<1x3x230x230xf32>
    %47 = memref.load %arg2[%c0, %3, %6, %c6] : memref<64x3x7x7xf32>
    %48 = arith.mulf %46, %47 : f32
    %49 = arith.addf %43, %48 : f32
    %50 = arith.addi %6, %c1 : index
    cf.br ^bb6(%50, %49 : index, f32)
  ^bb8:  // pred: ^bb6
    %51 = arith.addi %3, %c1 : index
    cf.br ^bb4(%51, %7 : index, f32)
  ^bb9:  // pred: ^bb4
    memref.store %4, %arg3[%c0, %c0, %c0, %0] : memref<1x64x112x112xf32>
    %52 = arith.addi %0, %c1 : index
    cf.br ^bb2(%52 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After FinalizeMemRefToLLVMConversionPass (finalize-memref-to-llvm) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x3x230x230xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64x3x7x7xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %3 = builtin.unrealized_conversion_cast %arg3 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c6 = arith.constant 6 : index
    %4 = builtin.unrealized_conversion_cast %c6 : index to i64
    %c5 = arith.constant 5 : index
    %5 = builtin.unrealized_conversion_cast %c5 : index to i64
    %c4 = arith.constant 4 : index
    %6 = builtin.unrealized_conversion_cast %c4 : index to i64
    %c2 = arith.constant 2 : index
    %7 = builtin.unrealized_conversion_cast %c2 : index to i64
    %c7 = arith.constant 7 : index
    %c3 = arith.constant 3 : index
    %8 = builtin.unrealized_conversion_cast %c3 : index to i64
    %c1 = arith.constant 1 : index
    %9 = builtin.unrealized_conversion_cast %c1 : index to i64
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %10 = builtin.unrealized_conversion_cast %c0 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%11: index):  // 2 preds: ^bb1, ^bb9
    %12 = builtin.unrealized_conversion_cast %11 : index to i64
    %13 = arith.cmpi slt, %11, %c8 : index
    cf.cond_br %13, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    %14 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(802816 : index) : i64
    %16 = llvm.mul %10, %15  : i64
    %17 = llvm.mlir.constant(12544 : index) : i64
    %18 = llvm.mul %10, %17  : i64
    %19 = llvm.add %16, %18  : i64
    %20 = llvm.mlir.constant(112 : index) : i64
    %21 = llvm.mul %10, %20  : i64
    %22 = llvm.add %19, %21  : i64
    %23 = llvm.add %22, %12  : i64
    %24 = llvm.getelementptr %14[%23] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %25 = llvm.load %24 : !llvm.ptr -> f32
    cf.br ^bb4(%c0, %25 : index, f32)
  ^bb4(%26: index, %27: f32):  // 2 preds: ^bb3, ^bb8
    %28 = builtin.unrealized_conversion_cast %26 : index to i64
    %29 = arith.cmpi slt, %26, %c3 : index
    cf.cond_br %29, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0, %27 : index, f32)
  ^bb6(%30: index, %31: f32):  // 2 preds: ^bb5, ^bb7
    %32 = builtin.unrealized_conversion_cast %30 : index to i64
    %33 = arith.cmpi slt, %30, %c7 : index
    cf.cond_br %33, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %34 = arith.muli %11, %c2 : index
    %35 = builtin.unrealized_conversion_cast %34 : index to i64
    %36 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(158700 : index) : i64
    %38 = llvm.mul %10, %37  : i64
    %39 = llvm.mlir.constant(52900 : index) : i64
    %40 = llvm.mul %28, %39  : i64
    %41 = llvm.add %38, %40  : i64
    %42 = llvm.mlir.constant(230 : index) : i64
    %43 = llvm.mul %32, %42  : i64
    %44 = llvm.add %41, %43  : i64
    %45 = llvm.add %44, %35  : i64
    %46 = llvm.getelementptr %36[%45] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %47 = llvm.load %46 : !llvm.ptr -> f32
    %48 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(147 : index) : i64
    %50 = llvm.mul %10, %49  : i64
    %51 = llvm.mlir.constant(49 : index) : i64
    %52 = llvm.mul %28, %51  : i64
    %53 = llvm.add %50, %52  : i64
    %54 = llvm.mlir.constant(7 : index) : i64
    %55 = llvm.mul %32, %54  : i64
    %56 = llvm.add %53, %55  : i64
    %57 = llvm.add %56, %10  : i64
    %58 = llvm.getelementptr %48[%57] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %59 = llvm.load %58 : !llvm.ptr -> f32
    %60 = arith.mulf %47, %59 : f32
    %61 = arith.addf %31, %60 : f32
    %62 = arith.muli %11, %c2 : index
    %63 = arith.addi %62, %c1 : index
    %64 = builtin.unrealized_conversion_cast %63 : index to i64
    %65 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(158700 : index) : i64
    %67 = llvm.mul %10, %66  : i64
    %68 = llvm.mlir.constant(52900 : index) : i64
    %69 = llvm.mul %28, %68  : i64
    %70 = llvm.add %67, %69  : i64
    %71 = llvm.mlir.constant(230 : index) : i64
    %72 = llvm.mul %32, %71  : i64
    %73 = llvm.add %70, %72  : i64
    %74 = llvm.add %73, %64  : i64
    %75 = llvm.getelementptr %65[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %76 = llvm.load %75 : !llvm.ptr -> f32
    %77 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %78 = llvm.mlir.constant(147 : index) : i64
    %79 = llvm.mul %10, %78  : i64
    %80 = llvm.mlir.constant(49 : index) : i64
    %81 = llvm.mul %28, %80  : i64
    %82 = llvm.add %79, %81  : i64
    %83 = llvm.mlir.constant(7 : index) : i64
    %84 = llvm.mul %32, %83  : i64
    %85 = llvm.add %82, %84  : i64
    %86 = llvm.add %85, %9  : i64
    %87 = llvm.getelementptr %77[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %88 = llvm.load %87 : !llvm.ptr -> f32
    %89 = arith.mulf %76, %88 : f32
    %90 = arith.addf %61, %89 : f32
    %91 = arith.muli %11, %c2 : index
    %92 = arith.addi %91, %c2 : index
    %93 = builtin.unrealized_conversion_cast %92 : index to i64
    %94 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %95 = llvm.mlir.constant(158700 : index) : i64
    %96 = llvm.mul %10, %95  : i64
    %97 = llvm.mlir.constant(52900 : index) : i64
    %98 = llvm.mul %28, %97  : i64
    %99 = llvm.add %96, %98  : i64
    %100 = llvm.mlir.constant(230 : index) : i64
    %101 = llvm.mul %32, %100  : i64
    %102 = llvm.add %99, %101  : i64
    %103 = llvm.add %102, %93  : i64
    %104 = llvm.getelementptr %94[%103] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %105 = llvm.load %104 : !llvm.ptr -> f32
    %106 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %107 = llvm.mlir.constant(147 : index) : i64
    %108 = llvm.mul %10, %107  : i64
    %109 = llvm.mlir.constant(49 : index) : i64
    %110 = llvm.mul %28, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.mlir.constant(7 : index) : i64
    %113 = llvm.mul %32, %112  : i64
    %114 = llvm.add %111, %113  : i64
    %115 = llvm.add %114, %7  : i64
    %116 = llvm.getelementptr %106[%115] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %117 = llvm.load %116 : !llvm.ptr -> f32
    %118 = arith.mulf %105, %117 : f32
    %119 = arith.addf %90, %118 : f32
    %120 = arith.muli %11, %c2 : index
    %121 = arith.addi %120, %c3 : index
    %122 = builtin.unrealized_conversion_cast %121 : index to i64
    %123 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %124 = llvm.mlir.constant(158700 : index) : i64
    %125 = llvm.mul %10, %124  : i64
    %126 = llvm.mlir.constant(52900 : index) : i64
    %127 = llvm.mul %28, %126  : i64
    %128 = llvm.add %125, %127  : i64
    %129 = llvm.mlir.constant(230 : index) : i64
    %130 = llvm.mul %32, %129  : i64
    %131 = llvm.add %128, %130  : i64
    %132 = llvm.add %131, %122  : i64
    %133 = llvm.getelementptr %123[%132] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %134 = llvm.load %133 : !llvm.ptr -> f32
    %135 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %136 = llvm.mlir.constant(147 : index) : i64
    %137 = llvm.mul %10, %136  : i64
    %138 = llvm.mlir.constant(49 : index) : i64
    %139 = llvm.mul %28, %138  : i64
    %140 = llvm.add %137, %139  : i64
    %141 = llvm.mlir.constant(7 : index) : i64
    %142 = llvm.mul %32, %141  : i64
    %143 = llvm.add %140, %142  : i64
    %144 = llvm.add %143, %8  : i64
    %145 = llvm.getelementptr %135[%144] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %146 = llvm.load %145 : !llvm.ptr -> f32
    %147 = arith.mulf %134, %146 : f32
    %148 = arith.addf %119, %147 : f32
    %149 = arith.muli %11, %c2 : index
    %150 = arith.addi %149, %c4 : index
    %151 = builtin.unrealized_conversion_cast %150 : index to i64
    %152 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %153 = llvm.mlir.constant(158700 : index) : i64
    %154 = llvm.mul %10, %153  : i64
    %155 = llvm.mlir.constant(52900 : index) : i64
    %156 = llvm.mul %28, %155  : i64
    %157 = llvm.add %154, %156  : i64
    %158 = llvm.mlir.constant(230 : index) : i64
    %159 = llvm.mul %32, %158  : i64
    %160 = llvm.add %157, %159  : i64
    %161 = llvm.add %160, %151  : i64
    %162 = llvm.getelementptr %152[%161] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %163 = llvm.load %162 : !llvm.ptr -> f32
    %164 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %165 = llvm.mlir.constant(147 : index) : i64
    %166 = llvm.mul %10, %165  : i64
    %167 = llvm.mlir.constant(49 : index) : i64
    %168 = llvm.mul %28, %167  : i64
    %169 = llvm.add %166, %168  : i64
    %170 = llvm.mlir.constant(7 : index) : i64
    %171 = llvm.mul %32, %170  : i64
    %172 = llvm.add %169, %171  : i64
    %173 = llvm.add %172, %6  : i64
    %174 = llvm.getelementptr %164[%173] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %175 = llvm.load %174 : !llvm.ptr -> f32
    %176 = arith.mulf %163, %175 : f32
    %177 = arith.addf %148, %176 : f32
    %178 = arith.muli %11, %c2 : index
    %179 = arith.addi %178, %c5 : index
    %180 = builtin.unrealized_conversion_cast %179 : index to i64
    %181 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %182 = llvm.mlir.constant(158700 : index) : i64
    %183 = llvm.mul %10, %182  : i64
    %184 = llvm.mlir.constant(52900 : index) : i64
    %185 = llvm.mul %28, %184  : i64
    %186 = llvm.add %183, %185  : i64
    %187 = llvm.mlir.constant(230 : index) : i64
    %188 = llvm.mul %32, %187  : i64
    %189 = llvm.add %186, %188  : i64
    %190 = llvm.add %189, %180  : i64
    %191 = llvm.getelementptr %181[%190] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %192 = llvm.load %191 : !llvm.ptr -> f32
    %193 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %194 = llvm.mlir.constant(147 : index) : i64
    %195 = llvm.mul %10, %194  : i64
    %196 = llvm.mlir.constant(49 : index) : i64
    %197 = llvm.mul %28, %196  : i64
    %198 = llvm.add %195, %197  : i64
    %199 = llvm.mlir.constant(7 : index) : i64
    %200 = llvm.mul %32, %199  : i64
    %201 = llvm.add %198, %200  : i64
    %202 = llvm.add %201, %5  : i64
    %203 = llvm.getelementptr %193[%202] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %204 = llvm.load %203 : !llvm.ptr -> f32
    %205 = arith.mulf %192, %204 : f32
    %206 = arith.addf %177, %205 : f32
    %207 = arith.muli %11, %c2 : index
    %208 = arith.addi %207, %c6 : index
    %209 = builtin.unrealized_conversion_cast %208 : index to i64
    %210 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %211 = llvm.mlir.constant(158700 : index) : i64
    %212 = llvm.mul %10, %211  : i64
    %213 = llvm.mlir.constant(52900 : index) : i64
    %214 = llvm.mul %28, %213  : i64
    %215 = llvm.add %212, %214  : i64
    %216 = llvm.mlir.constant(230 : index) : i64
    %217 = llvm.mul %32, %216  : i64
    %218 = llvm.add %215, %217  : i64
    %219 = llvm.add %218, %209  : i64
    %220 = llvm.getelementptr %210[%219] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %221 = llvm.load %220 : !llvm.ptr -> f32
    %222 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %223 = llvm.mlir.constant(147 : index) : i64
    %224 = llvm.mul %10, %223  : i64
    %225 = llvm.mlir.constant(49 : index) : i64
    %226 = llvm.mul %28, %225  : i64
    %227 = llvm.add %224, %226  : i64
    %228 = llvm.mlir.constant(7 : index) : i64
    %229 = llvm.mul %32, %228  : i64
    %230 = llvm.add %227, %229  : i64
    %231 = llvm.add %230, %4  : i64
    %232 = llvm.getelementptr %222[%231] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %233 = llvm.load %232 : !llvm.ptr -> f32
    %234 = arith.mulf %221, %233 : f32
    %235 = arith.addf %206, %234 : f32
    %236 = arith.addi %30, %c1 : index
    cf.br ^bb6(%236, %235 : index, f32)
  ^bb8:  // pred: ^bb6
    %237 = arith.addi %26, %c1 : index
    cf.br ^bb4(%237, %31 : index, f32)
  ^bb9:  // pred: ^bb4
    %238 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %239 = llvm.mlir.constant(802816 : index) : i64
    %240 = llvm.mul %10, %239  : i64
    %241 = llvm.mlir.constant(12544 : index) : i64
    %242 = llvm.mul %10, %241  : i64
    %243 = llvm.add %240, %242  : i64
    %244 = llvm.mlir.constant(112 : index) : i64
    %245 = llvm.mul %10, %244  : i64
    %246 = llvm.add %243, %245  : i64
    %247 = llvm.add %246, %12  : i64
    %248 = llvm.getelementptr %238[%247] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %27, %248 : f32, !llvm.ptr
    %249 = arith.addi %11, %c1 : index
    cf.br ^bb2(%249 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLLVMPass (convert-math-to-llvm) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x3x230x230xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64x3x7x7xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %3 = builtin.unrealized_conversion_cast %arg3 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c6 = arith.constant 6 : index
    %4 = builtin.unrealized_conversion_cast %c6 : index to i64
    %c5 = arith.constant 5 : index
    %5 = builtin.unrealized_conversion_cast %c5 : index to i64
    %c4 = arith.constant 4 : index
    %6 = builtin.unrealized_conversion_cast %c4 : index to i64
    %c2 = arith.constant 2 : index
    %7 = builtin.unrealized_conversion_cast %c2 : index to i64
    %c7 = arith.constant 7 : index
    %c3 = arith.constant 3 : index
    %8 = builtin.unrealized_conversion_cast %c3 : index to i64
    %c1 = arith.constant 1 : index
    %9 = builtin.unrealized_conversion_cast %c1 : index to i64
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %10 = builtin.unrealized_conversion_cast %c0 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%11: index):  // 2 preds: ^bb1, ^bb9
    %12 = builtin.unrealized_conversion_cast %11 : index to i64
    %13 = arith.cmpi slt, %11, %c8 : index
    cf.cond_br %13, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    %14 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(802816 : index) : i64
    %16 = llvm.mul %10, %15  : i64
    %17 = llvm.mlir.constant(12544 : index) : i64
    %18 = llvm.mul %10, %17  : i64
    %19 = llvm.add %16, %18  : i64
    %20 = llvm.mlir.constant(112 : index) : i64
    %21 = llvm.mul %10, %20  : i64
    %22 = llvm.add %19, %21  : i64
    %23 = llvm.add %22, %12  : i64
    %24 = llvm.getelementptr %14[%23] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %25 = llvm.load %24 : !llvm.ptr -> f32
    cf.br ^bb4(%c0, %25 : index, f32)
  ^bb4(%26: index, %27: f32):  // 2 preds: ^bb3, ^bb8
    %28 = builtin.unrealized_conversion_cast %26 : index to i64
    %29 = arith.cmpi slt, %26, %c3 : index
    cf.cond_br %29, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0, %27 : index, f32)
  ^bb6(%30: index, %31: f32):  // 2 preds: ^bb5, ^bb7
    %32 = builtin.unrealized_conversion_cast %30 : index to i64
    %33 = arith.cmpi slt, %30, %c7 : index
    cf.cond_br %33, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %34 = arith.muli %11, %c2 : index
    %35 = builtin.unrealized_conversion_cast %34 : index to i64
    %36 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(158700 : index) : i64
    %38 = llvm.mul %10, %37  : i64
    %39 = llvm.mlir.constant(52900 : index) : i64
    %40 = llvm.mul %28, %39  : i64
    %41 = llvm.add %38, %40  : i64
    %42 = llvm.mlir.constant(230 : index) : i64
    %43 = llvm.mul %32, %42  : i64
    %44 = llvm.add %41, %43  : i64
    %45 = llvm.add %44, %35  : i64
    %46 = llvm.getelementptr %36[%45] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %47 = llvm.load %46 : !llvm.ptr -> f32
    %48 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(147 : index) : i64
    %50 = llvm.mul %10, %49  : i64
    %51 = llvm.mlir.constant(49 : index) : i64
    %52 = llvm.mul %28, %51  : i64
    %53 = llvm.add %50, %52  : i64
    %54 = llvm.mlir.constant(7 : index) : i64
    %55 = llvm.mul %32, %54  : i64
    %56 = llvm.add %53, %55  : i64
    %57 = llvm.add %56, %10  : i64
    %58 = llvm.getelementptr %48[%57] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %59 = llvm.load %58 : !llvm.ptr -> f32
    %60 = arith.mulf %47, %59 : f32
    %61 = arith.addf %31, %60 : f32
    %62 = arith.muli %11, %c2 : index
    %63 = arith.addi %62, %c1 : index
    %64 = builtin.unrealized_conversion_cast %63 : index to i64
    %65 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(158700 : index) : i64
    %67 = llvm.mul %10, %66  : i64
    %68 = llvm.mlir.constant(52900 : index) : i64
    %69 = llvm.mul %28, %68  : i64
    %70 = llvm.add %67, %69  : i64
    %71 = llvm.mlir.constant(230 : index) : i64
    %72 = llvm.mul %32, %71  : i64
    %73 = llvm.add %70, %72  : i64
    %74 = llvm.add %73, %64  : i64
    %75 = llvm.getelementptr %65[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %76 = llvm.load %75 : !llvm.ptr -> f32
    %77 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %78 = llvm.mlir.constant(147 : index) : i64
    %79 = llvm.mul %10, %78  : i64
    %80 = llvm.mlir.constant(49 : index) : i64
    %81 = llvm.mul %28, %80  : i64
    %82 = llvm.add %79, %81  : i64
    %83 = llvm.mlir.constant(7 : index) : i64
    %84 = llvm.mul %32, %83  : i64
    %85 = llvm.add %82, %84  : i64
    %86 = llvm.add %85, %9  : i64
    %87 = llvm.getelementptr %77[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %88 = llvm.load %87 : !llvm.ptr -> f32
    %89 = arith.mulf %76, %88 : f32
    %90 = arith.addf %61, %89 : f32
    %91 = arith.muli %11, %c2 : index
    %92 = arith.addi %91, %c2 : index
    %93 = builtin.unrealized_conversion_cast %92 : index to i64
    %94 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %95 = llvm.mlir.constant(158700 : index) : i64
    %96 = llvm.mul %10, %95  : i64
    %97 = llvm.mlir.constant(52900 : index) : i64
    %98 = llvm.mul %28, %97  : i64
    %99 = llvm.add %96, %98  : i64
    %100 = llvm.mlir.constant(230 : index) : i64
    %101 = llvm.mul %32, %100  : i64
    %102 = llvm.add %99, %101  : i64
    %103 = llvm.add %102, %93  : i64
    %104 = llvm.getelementptr %94[%103] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %105 = llvm.load %104 : !llvm.ptr -> f32
    %106 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %107 = llvm.mlir.constant(147 : index) : i64
    %108 = llvm.mul %10, %107  : i64
    %109 = llvm.mlir.constant(49 : index) : i64
    %110 = llvm.mul %28, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.mlir.constant(7 : index) : i64
    %113 = llvm.mul %32, %112  : i64
    %114 = llvm.add %111, %113  : i64
    %115 = llvm.add %114, %7  : i64
    %116 = llvm.getelementptr %106[%115] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %117 = llvm.load %116 : !llvm.ptr -> f32
    %118 = arith.mulf %105, %117 : f32
    %119 = arith.addf %90, %118 : f32
    %120 = arith.muli %11, %c2 : index
    %121 = arith.addi %120, %c3 : index
    %122 = builtin.unrealized_conversion_cast %121 : index to i64
    %123 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %124 = llvm.mlir.constant(158700 : index) : i64
    %125 = llvm.mul %10, %124  : i64
    %126 = llvm.mlir.constant(52900 : index) : i64
    %127 = llvm.mul %28, %126  : i64
    %128 = llvm.add %125, %127  : i64
    %129 = llvm.mlir.constant(230 : index) : i64
    %130 = llvm.mul %32, %129  : i64
    %131 = llvm.add %128, %130  : i64
    %132 = llvm.add %131, %122  : i64
    %133 = llvm.getelementptr %123[%132] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %134 = llvm.load %133 : !llvm.ptr -> f32
    %135 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %136 = llvm.mlir.constant(147 : index) : i64
    %137 = llvm.mul %10, %136  : i64
    %138 = llvm.mlir.constant(49 : index) : i64
    %139 = llvm.mul %28, %138  : i64
    %140 = llvm.add %137, %139  : i64
    %141 = llvm.mlir.constant(7 : index) : i64
    %142 = llvm.mul %32, %141  : i64
    %143 = llvm.add %140, %142  : i64
    %144 = llvm.add %143, %8  : i64
    %145 = llvm.getelementptr %135[%144] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %146 = llvm.load %145 : !llvm.ptr -> f32
    %147 = arith.mulf %134, %146 : f32
    %148 = arith.addf %119, %147 : f32
    %149 = arith.muli %11, %c2 : index
    %150 = arith.addi %149, %c4 : index
    %151 = builtin.unrealized_conversion_cast %150 : index to i64
    %152 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %153 = llvm.mlir.constant(158700 : index) : i64
    %154 = llvm.mul %10, %153  : i64
    %155 = llvm.mlir.constant(52900 : index) : i64
    %156 = llvm.mul %28, %155  : i64
    %157 = llvm.add %154, %156  : i64
    %158 = llvm.mlir.constant(230 : index) : i64
    %159 = llvm.mul %32, %158  : i64
    %160 = llvm.add %157, %159  : i64
    %161 = llvm.add %160, %151  : i64
    %162 = llvm.getelementptr %152[%161] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %163 = llvm.load %162 : !llvm.ptr -> f32
    %164 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %165 = llvm.mlir.constant(147 : index) : i64
    %166 = llvm.mul %10, %165  : i64
    %167 = llvm.mlir.constant(49 : index) : i64
    %168 = llvm.mul %28, %167  : i64
    %169 = llvm.add %166, %168  : i64
    %170 = llvm.mlir.constant(7 : index) : i64
    %171 = llvm.mul %32, %170  : i64
    %172 = llvm.add %169, %171  : i64
    %173 = llvm.add %172, %6  : i64
    %174 = llvm.getelementptr %164[%173] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %175 = llvm.load %174 : !llvm.ptr -> f32
    %176 = arith.mulf %163, %175 : f32
    %177 = arith.addf %148, %176 : f32
    %178 = arith.muli %11, %c2 : index
    %179 = arith.addi %178, %c5 : index
    %180 = builtin.unrealized_conversion_cast %179 : index to i64
    %181 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %182 = llvm.mlir.constant(158700 : index) : i64
    %183 = llvm.mul %10, %182  : i64
    %184 = llvm.mlir.constant(52900 : index) : i64
    %185 = llvm.mul %28, %184  : i64
    %186 = llvm.add %183, %185  : i64
    %187 = llvm.mlir.constant(230 : index) : i64
    %188 = llvm.mul %32, %187  : i64
    %189 = llvm.add %186, %188  : i64
    %190 = llvm.add %189, %180  : i64
    %191 = llvm.getelementptr %181[%190] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %192 = llvm.load %191 : !llvm.ptr -> f32
    %193 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %194 = llvm.mlir.constant(147 : index) : i64
    %195 = llvm.mul %10, %194  : i64
    %196 = llvm.mlir.constant(49 : index) : i64
    %197 = llvm.mul %28, %196  : i64
    %198 = llvm.add %195, %197  : i64
    %199 = llvm.mlir.constant(7 : index) : i64
    %200 = llvm.mul %32, %199  : i64
    %201 = llvm.add %198, %200  : i64
    %202 = llvm.add %201, %5  : i64
    %203 = llvm.getelementptr %193[%202] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %204 = llvm.load %203 : !llvm.ptr -> f32
    %205 = arith.mulf %192, %204 : f32
    %206 = arith.addf %177, %205 : f32
    %207 = arith.muli %11, %c2 : index
    %208 = arith.addi %207, %c6 : index
    %209 = builtin.unrealized_conversion_cast %208 : index to i64
    %210 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %211 = llvm.mlir.constant(158700 : index) : i64
    %212 = llvm.mul %10, %211  : i64
    %213 = llvm.mlir.constant(52900 : index) : i64
    %214 = llvm.mul %28, %213  : i64
    %215 = llvm.add %212, %214  : i64
    %216 = llvm.mlir.constant(230 : index) : i64
    %217 = llvm.mul %32, %216  : i64
    %218 = llvm.add %215, %217  : i64
    %219 = llvm.add %218, %209  : i64
    %220 = llvm.getelementptr %210[%219] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %221 = llvm.load %220 : !llvm.ptr -> f32
    %222 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %223 = llvm.mlir.constant(147 : index) : i64
    %224 = llvm.mul %10, %223  : i64
    %225 = llvm.mlir.constant(49 : index) : i64
    %226 = llvm.mul %28, %225  : i64
    %227 = llvm.add %224, %226  : i64
    %228 = llvm.mlir.constant(7 : index) : i64
    %229 = llvm.mul %32, %228  : i64
    %230 = llvm.add %227, %229  : i64
    %231 = llvm.add %230, %4  : i64
    %232 = llvm.getelementptr %222[%231] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %233 = llvm.load %232 : !llvm.ptr -> f32
    %234 = arith.mulf %221, %233 : f32
    %235 = arith.addf %206, %234 : f32
    %236 = arith.addi %30, %c1 : index
    cf.br ^bb6(%236, %235 : index, f32)
  ^bb8:  // pred: ^bb6
    %237 = arith.addi %26, %c1 : index
    cf.br ^bb4(%237, %31 : index, f32)
  ^bb9:  // pred: ^bb4
    %238 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %239 = llvm.mlir.constant(802816 : index) : i64
    %240 = llvm.mul %10, %239  : i64
    %241 = llvm.mlir.constant(12544 : index) : i64
    %242 = llvm.mul %10, %241  : i64
    %243 = llvm.add %240, %242  : i64
    %244 = llvm.mlir.constant(112 : index) : i64
    %245 = llvm.mul %10, %244  : i64
    %246 = llvm.add %243, %245  : i64
    %247 = llvm.add %246, %12  : i64
    %248 = llvm.getelementptr %238[%247] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %27, %248 : f32, !llvm.ptr
    %249 = arith.addi %11, %c1 : index
    cf.br ^bb2(%249 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLibm (convert-math-to-libm) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x3x230x230xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64x3x7x7xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %3 = builtin.unrealized_conversion_cast %arg3 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c6 = arith.constant 6 : index
    %4 = builtin.unrealized_conversion_cast %c6 : index to i64
    %c5 = arith.constant 5 : index
    %5 = builtin.unrealized_conversion_cast %c5 : index to i64
    %c4 = arith.constant 4 : index
    %6 = builtin.unrealized_conversion_cast %c4 : index to i64
    %c2 = arith.constant 2 : index
    %7 = builtin.unrealized_conversion_cast %c2 : index to i64
    %c7 = arith.constant 7 : index
    %c3 = arith.constant 3 : index
    %8 = builtin.unrealized_conversion_cast %c3 : index to i64
    %c1 = arith.constant 1 : index
    %9 = builtin.unrealized_conversion_cast %c1 : index to i64
    %c8 = arith.constant 8 : index
    %c0 = arith.constant 0 : index
    %10 = builtin.unrealized_conversion_cast %c0 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%11: index):  // 2 preds: ^bb1, ^bb9
    %12 = builtin.unrealized_conversion_cast %11 : index to i64
    %13 = arith.cmpi slt, %11, %c8 : index
    cf.cond_br %13, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    %14 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(802816 : index) : i64
    %16 = llvm.mul %10, %15  : i64
    %17 = llvm.mlir.constant(12544 : index) : i64
    %18 = llvm.mul %10, %17  : i64
    %19 = llvm.add %16, %18  : i64
    %20 = llvm.mlir.constant(112 : index) : i64
    %21 = llvm.mul %10, %20  : i64
    %22 = llvm.add %19, %21  : i64
    %23 = llvm.add %22, %12  : i64
    %24 = llvm.getelementptr %14[%23] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %25 = llvm.load %24 : !llvm.ptr -> f32
    cf.br ^bb4(%c0, %25 : index, f32)
  ^bb4(%26: index, %27: f32):  // 2 preds: ^bb3, ^bb8
    %28 = builtin.unrealized_conversion_cast %26 : index to i64
    %29 = arith.cmpi slt, %26, %c3 : index
    cf.cond_br %29, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%c0, %27 : index, f32)
  ^bb6(%30: index, %31: f32):  // 2 preds: ^bb5, ^bb7
    %32 = builtin.unrealized_conversion_cast %30 : index to i64
    %33 = arith.cmpi slt, %30, %c7 : index
    cf.cond_br %33, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %34 = arith.muli %11, %c2 : index
    %35 = builtin.unrealized_conversion_cast %34 : index to i64
    %36 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(158700 : index) : i64
    %38 = llvm.mul %10, %37  : i64
    %39 = llvm.mlir.constant(52900 : index) : i64
    %40 = llvm.mul %28, %39  : i64
    %41 = llvm.add %38, %40  : i64
    %42 = llvm.mlir.constant(230 : index) : i64
    %43 = llvm.mul %32, %42  : i64
    %44 = llvm.add %41, %43  : i64
    %45 = llvm.add %44, %35  : i64
    %46 = llvm.getelementptr %36[%45] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %47 = llvm.load %46 : !llvm.ptr -> f32
    %48 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(147 : index) : i64
    %50 = llvm.mul %10, %49  : i64
    %51 = llvm.mlir.constant(49 : index) : i64
    %52 = llvm.mul %28, %51  : i64
    %53 = llvm.add %50, %52  : i64
    %54 = llvm.mlir.constant(7 : index) : i64
    %55 = llvm.mul %32, %54  : i64
    %56 = llvm.add %53, %55  : i64
    %57 = llvm.add %56, %10  : i64
    %58 = llvm.getelementptr %48[%57] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %59 = llvm.load %58 : !llvm.ptr -> f32
    %60 = arith.mulf %47, %59 : f32
    %61 = arith.addf %31, %60 : f32
    %62 = arith.muli %11, %c2 : index
    %63 = arith.addi %62, %c1 : index
    %64 = builtin.unrealized_conversion_cast %63 : index to i64
    %65 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(158700 : index) : i64
    %67 = llvm.mul %10, %66  : i64
    %68 = llvm.mlir.constant(52900 : index) : i64
    %69 = llvm.mul %28, %68  : i64
    %70 = llvm.add %67, %69  : i64
    %71 = llvm.mlir.constant(230 : index) : i64
    %72 = llvm.mul %32, %71  : i64
    %73 = llvm.add %70, %72  : i64
    %74 = llvm.add %73, %64  : i64
    %75 = llvm.getelementptr %65[%74] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %76 = llvm.load %75 : !llvm.ptr -> f32
    %77 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %78 = llvm.mlir.constant(147 : index) : i64
    %79 = llvm.mul %10, %78  : i64
    %80 = llvm.mlir.constant(49 : index) : i64
    %81 = llvm.mul %28, %80  : i64
    %82 = llvm.add %79, %81  : i64
    %83 = llvm.mlir.constant(7 : index) : i64
    %84 = llvm.mul %32, %83  : i64
    %85 = llvm.add %82, %84  : i64
    %86 = llvm.add %85, %9  : i64
    %87 = llvm.getelementptr %77[%86] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %88 = llvm.load %87 : !llvm.ptr -> f32
    %89 = arith.mulf %76, %88 : f32
    %90 = arith.addf %61, %89 : f32
    %91 = arith.muli %11, %c2 : index
    %92 = arith.addi %91, %c2 : index
    %93 = builtin.unrealized_conversion_cast %92 : index to i64
    %94 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %95 = llvm.mlir.constant(158700 : index) : i64
    %96 = llvm.mul %10, %95  : i64
    %97 = llvm.mlir.constant(52900 : index) : i64
    %98 = llvm.mul %28, %97  : i64
    %99 = llvm.add %96, %98  : i64
    %100 = llvm.mlir.constant(230 : index) : i64
    %101 = llvm.mul %32, %100  : i64
    %102 = llvm.add %99, %101  : i64
    %103 = llvm.add %102, %93  : i64
    %104 = llvm.getelementptr %94[%103] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %105 = llvm.load %104 : !llvm.ptr -> f32
    %106 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %107 = llvm.mlir.constant(147 : index) : i64
    %108 = llvm.mul %10, %107  : i64
    %109 = llvm.mlir.constant(49 : index) : i64
    %110 = llvm.mul %28, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.mlir.constant(7 : index) : i64
    %113 = llvm.mul %32, %112  : i64
    %114 = llvm.add %111, %113  : i64
    %115 = llvm.add %114, %7  : i64
    %116 = llvm.getelementptr %106[%115] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %117 = llvm.load %116 : !llvm.ptr -> f32
    %118 = arith.mulf %105, %117 : f32
    %119 = arith.addf %90, %118 : f32
    %120 = arith.muli %11, %c2 : index
    %121 = arith.addi %120, %c3 : index
    %122 = builtin.unrealized_conversion_cast %121 : index to i64
    %123 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %124 = llvm.mlir.constant(158700 : index) : i64
    %125 = llvm.mul %10, %124  : i64
    %126 = llvm.mlir.constant(52900 : index) : i64
    %127 = llvm.mul %28, %126  : i64
    %128 = llvm.add %125, %127  : i64
    %129 = llvm.mlir.constant(230 : index) : i64
    %130 = llvm.mul %32, %129  : i64
    %131 = llvm.add %128, %130  : i64
    %132 = llvm.add %131, %122  : i64
    %133 = llvm.getelementptr %123[%132] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %134 = llvm.load %133 : !llvm.ptr -> f32
    %135 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %136 = llvm.mlir.constant(147 : index) : i64
    %137 = llvm.mul %10, %136  : i64
    %138 = llvm.mlir.constant(49 : index) : i64
    %139 = llvm.mul %28, %138  : i64
    %140 = llvm.add %137, %139  : i64
    %141 = llvm.mlir.constant(7 : index) : i64
    %142 = llvm.mul %32, %141  : i64
    %143 = llvm.add %140, %142  : i64
    %144 = llvm.add %143, %8  : i64
    %145 = llvm.getelementptr %135[%144] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %146 = llvm.load %145 : !llvm.ptr -> f32
    %147 = arith.mulf %134, %146 : f32
    %148 = arith.addf %119, %147 : f32
    %149 = arith.muli %11, %c2 : index
    %150 = arith.addi %149, %c4 : index
    %151 = builtin.unrealized_conversion_cast %150 : index to i64
    %152 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %153 = llvm.mlir.constant(158700 : index) : i64
    %154 = llvm.mul %10, %153  : i64
    %155 = llvm.mlir.constant(52900 : index) : i64
    %156 = llvm.mul %28, %155  : i64
    %157 = llvm.add %154, %156  : i64
    %158 = llvm.mlir.constant(230 : index) : i64
    %159 = llvm.mul %32, %158  : i64
    %160 = llvm.add %157, %159  : i64
    %161 = llvm.add %160, %151  : i64
    %162 = llvm.getelementptr %152[%161] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %163 = llvm.load %162 : !llvm.ptr -> f32
    %164 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %165 = llvm.mlir.constant(147 : index) : i64
    %166 = llvm.mul %10, %165  : i64
    %167 = llvm.mlir.constant(49 : index) : i64
    %168 = llvm.mul %28, %167  : i64
    %169 = llvm.add %166, %168  : i64
    %170 = llvm.mlir.constant(7 : index) : i64
    %171 = llvm.mul %32, %170  : i64
    %172 = llvm.add %169, %171  : i64
    %173 = llvm.add %172, %6  : i64
    %174 = llvm.getelementptr %164[%173] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %175 = llvm.load %174 : !llvm.ptr -> f32
    %176 = arith.mulf %163, %175 : f32
    %177 = arith.addf %148, %176 : f32
    %178 = arith.muli %11, %c2 : index
    %179 = arith.addi %178, %c5 : index
    %180 = builtin.unrealized_conversion_cast %179 : index to i64
    %181 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %182 = llvm.mlir.constant(158700 : index) : i64
    %183 = llvm.mul %10, %182  : i64
    %184 = llvm.mlir.constant(52900 : index) : i64
    %185 = llvm.mul %28, %184  : i64
    %186 = llvm.add %183, %185  : i64
    %187 = llvm.mlir.constant(230 : index) : i64
    %188 = llvm.mul %32, %187  : i64
    %189 = llvm.add %186, %188  : i64
    %190 = llvm.add %189, %180  : i64
    %191 = llvm.getelementptr %181[%190] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %192 = llvm.load %191 : !llvm.ptr -> f32
    %193 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %194 = llvm.mlir.constant(147 : index) : i64
    %195 = llvm.mul %10, %194  : i64
    %196 = llvm.mlir.constant(49 : index) : i64
    %197 = llvm.mul %28, %196  : i64
    %198 = llvm.add %195, %197  : i64
    %199 = llvm.mlir.constant(7 : index) : i64
    %200 = llvm.mul %32, %199  : i64
    %201 = llvm.add %198, %200  : i64
    %202 = llvm.add %201, %5  : i64
    %203 = llvm.getelementptr %193[%202] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %204 = llvm.load %203 : !llvm.ptr -> f32
    %205 = arith.mulf %192, %204 : f32
    %206 = arith.addf %177, %205 : f32
    %207 = arith.muli %11, %c2 : index
    %208 = arith.addi %207, %c6 : index
    %209 = builtin.unrealized_conversion_cast %208 : index to i64
    %210 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %211 = llvm.mlir.constant(158700 : index) : i64
    %212 = llvm.mul %10, %211  : i64
    %213 = llvm.mlir.constant(52900 : index) : i64
    %214 = llvm.mul %28, %213  : i64
    %215 = llvm.add %212, %214  : i64
    %216 = llvm.mlir.constant(230 : index) : i64
    %217 = llvm.mul %32, %216  : i64
    %218 = llvm.add %215, %217  : i64
    %219 = llvm.add %218, %209  : i64
    %220 = llvm.getelementptr %210[%219] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %221 = llvm.load %220 : !llvm.ptr -> f32
    %222 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %223 = llvm.mlir.constant(147 : index) : i64
    %224 = llvm.mul %10, %223  : i64
    %225 = llvm.mlir.constant(49 : index) : i64
    %226 = llvm.mul %28, %225  : i64
    %227 = llvm.add %224, %226  : i64
    %228 = llvm.mlir.constant(7 : index) : i64
    %229 = llvm.mul %32, %228  : i64
    %230 = llvm.add %227, %229  : i64
    %231 = llvm.add %230, %4  : i64
    %232 = llvm.getelementptr %222[%231] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %233 = llvm.load %232 : !llvm.ptr -> f32
    %234 = arith.mulf %221, %233 : f32
    %235 = arith.addf %206, %234 : f32
    %236 = arith.addi %30, %c1 : index
    cf.br ^bb6(%236, %235 : index, f32)
  ^bb8:  // pred: ^bb6
    %237 = arith.addi %26, %c1 : index
    cf.br ^bb4(%237, %31 : index, f32)
  ^bb9:  // pred: ^bb4
    %238 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %239 = llvm.mlir.constant(802816 : index) : i64
    %240 = llvm.mul %10, %239  : i64
    %241 = llvm.mlir.constant(12544 : index) : i64
    %242 = llvm.mul %10, %241  : i64
    %243 = llvm.add %240, %242  : i64
    %244 = llvm.mlir.constant(112 : index) : i64
    %245 = llvm.mul %10, %244  : i64
    %246 = llvm.add %243, %245  : i64
    %247 = llvm.add %246, %12  : i64
    %248 = llvm.getelementptr %238[%247] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %27, %248 : f32, !llvm.ptr
    %249 = arith.addi %11, %c1 : index
    cf.br ^bb2(%249 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ArithToLLVMConversionPass (convert-arith-to-llvm) //----- //
module {
  func.func @forward_kernel_0(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x3x230x230xf32>, %arg2: memref<64x3x7x7xf32>, %arg3: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_0} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x3x230x230xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<64x3x7x7xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %3 = builtin.unrealized_conversion_cast %arg3 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %4 = llvm.mlir.constant(6 : index) : i64
    %5 = builtin.unrealized_conversion_cast %4 : i64 to index
    %6 = builtin.unrealized_conversion_cast %5 : index to i64
    %7 = llvm.mlir.constant(5 : index) : i64
    %8 = builtin.unrealized_conversion_cast %7 : i64 to index
    %9 = builtin.unrealized_conversion_cast %8 : index to i64
    %10 = llvm.mlir.constant(4 : index) : i64
    %11 = builtin.unrealized_conversion_cast %10 : i64 to index
    %12 = builtin.unrealized_conversion_cast %11 : index to i64
    %13 = llvm.mlir.constant(2 : index) : i64
    %14 = builtin.unrealized_conversion_cast %13 : i64 to index
    %15 = builtin.unrealized_conversion_cast %14 : index to i64
    %16 = llvm.mlir.constant(7 : index) : i64
    %17 = llvm.mlir.constant(3 : index) : i64
    %18 = builtin.unrealized_conversion_cast %17 : i64 to index
    %19 = builtin.unrealized_conversion_cast %18 : index to i64
    %20 = llvm.mlir.constant(1 : index) : i64
    %21 = builtin.unrealized_conversion_cast %20 : i64 to index
    %22 = builtin.unrealized_conversion_cast %21 : index to i64
    %23 = llvm.mlir.constant(8 : index) : i64
    %24 = llvm.mlir.constant(0 : index) : i64
    %25 = builtin.unrealized_conversion_cast %24 : i64 to index
    %26 = builtin.unrealized_conversion_cast %25 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%25 : index)
  ^bb2(%27: index):  // 2 preds: ^bb1, ^bb9
    %28 = builtin.unrealized_conversion_cast %27 : index to i64
    %29 = builtin.unrealized_conversion_cast %27 : index to i64
    %30 = llvm.icmp "slt" %28, %23 : i64
    cf.cond_br %30, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    %31 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(802816 : index) : i64
    %33 = llvm.mul %26, %32  : i64
    %34 = llvm.mlir.constant(12544 : index) : i64
    %35 = llvm.mul %26, %34  : i64
    %36 = llvm.add %33, %35  : i64
    %37 = llvm.mlir.constant(112 : index) : i64
    %38 = llvm.mul %26, %37  : i64
    %39 = llvm.add %36, %38  : i64
    %40 = llvm.add %39, %29  : i64
    %41 = llvm.getelementptr %31[%40] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %42 = llvm.load %41 : !llvm.ptr -> f32
    cf.br ^bb4(%25, %42 : index, f32)
  ^bb4(%43: index, %44: f32):  // 2 preds: ^bb3, ^bb8
    %45 = builtin.unrealized_conversion_cast %43 : index to i64
    %46 = builtin.unrealized_conversion_cast %43 : index to i64
    %47 = llvm.icmp "slt" %45, %17 : i64
    cf.cond_br %47, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    cf.br ^bb6(%25, %44 : index, f32)
  ^bb6(%48: index, %49: f32):  // 2 preds: ^bb5, ^bb7
    %50 = builtin.unrealized_conversion_cast %48 : index to i64
    %51 = builtin.unrealized_conversion_cast %48 : index to i64
    %52 = llvm.icmp "slt" %50, %16 : i64
    cf.cond_br %52, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %53 = llvm.mul %28, %13  : i64
    %54 = builtin.unrealized_conversion_cast %53 : i64 to index
    %55 = builtin.unrealized_conversion_cast %54 : index to i64
    %56 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(158700 : index) : i64
    %58 = llvm.mul %26, %57  : i64
    %59 = llvm.mlir.constant(52900 : index) : i64
    %60 = llvm.mul %46, %59  : i64
    %61 = llvm.add %58, %60  : i64
    %62 = llvm.mlir.constant(230 : index) : i64
    %63 = llvm.mul %51, %62  : i64
    %64 = llvm.add %61, %63  : i64
    %65 = llvm.add %64, %55  : i64
    %66 = llvm.getelementptr %56[%65] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %67 = llvm.load %66 : !llvm.ptr -> f32
    %68 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %69 = llvm.mlir.constant(147 : index) : i64
    %70 = llvm.mul %26, %69  : i64
    %71 = llvm.mlir.constant(49 : index) : i64
    %72 = llvm.mul %46, %71  : i64
    %73 = llvm.add %70, %72  : i64
    %74 = llvm.mlir.constant(7 : index) : i64
    %75 = llvm.mul %51, %74  : i64
    %76 = llvm.add %73, %75  : i64
    %77 = llvm.add %76, %26  : i64
    %78 = llvm.getelementptr %68[%77] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %79 = llvm.load %78 : !llvm.ptr -> f32
    %80 = llvm.fmul %67, %79  : f32
    %81 = llvm.fadd %49, %80  : f32
    %82 = llvm.mul %28, %13  : i64
    %83 = llvm.add %82, %20  : i64
    %84 = builtin.unrealized_conversion_cast %83 : i64 to index
    %85 = builtin.unrealized_conversion_cast %84 : index to i64
    %86 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %87 = llvm.mlir.constant(158700 : index) : i64
    %88 = llvm.mul %26, %87  : i64
    %89 = llvm.mlir.constant(52900 : index) : i64
    %90 = llvm.mul %46, %89  : i64
    %91 = llvm.add %88, %90  : i64
    %92 = llvm.mlir.constant(230 : index) : i64
    %93 = llvm.mul %51, %92  : i64
    %94 = llvm.add %91, %93  : i64
    %95 = llvm.add %94, %85  : i64
    %96 = llvm.getelementptr %86[%95] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %97 = llvm.load %96 : !llvm.ptr -> f32
    %98 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %99 = llvm.mlir.constant(147 : index) : i64
    %100 = llvm.mul %26, %99  : i64
    %101 = llvm.mlir.constant(49 : index) : i64
    %102 = llvm.mul %46, %101  : i64
    %103 = llvm.add %100, %102  : i64
    %104 = llvm.mlir.constant(7 : index) : i64
    %105 = llvm.mul %51, %104  : i64
    %106 = llvm.add %103, %105  : i64
    %107 = llvm.add %106, %22  : i64
    %108 = llvm.getelementptr %98[%107] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %109 = llvm.load %108 : !llvm.ptr -> f32
    %110 = llvm.fmul %97, %109  : f32
    %111 = llvm.fadd %81, %110  : f32
    %112 = llvm.mul %28, %13  : i64
    %113 = llvm.add %112, %13  : i64
    %114 = builtin.unrealized_conversion_cast %113 : i64 to index
    %115 = builtin.unrealized_conversion_cast %114 : index to i64
    %116 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %117 = llvm.mlir.constant(158700 : index) : i64
    %118 = llvm.mul %26, %117  : i64
    %119 = llvm.mlir.constant(52900 : index) : i64
    %120 = llvm.mul %46, %119  : i64
    %121 = llvm.add %118, %120  : i64
    %122 = llvm.mlir.constant(230 : index) : i64
    %123 = llvm.mul %51, %122  : i64
    %124 = llvm.add %121, %123  : i64
    %125 = llvm.add %124, %115  : i64
    %126 = llvm.getelementptr %116[%125] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %127 = llvm.load %126 : !llvm.ptr -> f32
    %128 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %129 = llvm.mlir.constant(147 : index) : i64
    %130 = llvm.mul %26, %129  : i64
    %131 = llvm.mlir.constant(49 : index) : i64
    %132 = llvm.mul %46, %131  : i64
    %133 = llvm.add %130, %132  : i64
    %134 = llvm.mlir.constant(7 : index) : i64
    %135 = llvm.mul %51, %134  : i64
    %136 = llvm.add %133, %135  : i64
    %137 = llvm.add %136, %15  : i64
    %138 = llvm.getelementptr %128[%137] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %139 = llvm.load %138 : !llvm.ptr -> f32
    %140 = llvm.fmul %127, %139  : f32
    %141 = llvm.fadd %111, %140  : f32
    %142 = llvm.mul %28, %13  : i64
    %143 = llvm.add %142, %17  : i64
    %144 = builtin.unrealized_conversion_cast %143 : i64 to index
    %145 = builtin.unrealized_conversion_cast %144 : index to i64
    %146 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %147 = llvm.mlir.constant(158700 : index) : i64
    %148 = llvm.mul %26, %147  : i64
    %149 = llvm.mlir.constant(52900 : index) : i64
    %150 = llvm.mul %46, %149  : i64
    %151 = llvm.add %148, %150  : i64
    %152 = llvm.mlir.constant(230 : index) : i64
    %153 = llvm.mul %51, %152  : i64
    %154 = llvm.add %151, %153  : i64
    %155 = llvm.add %154, %145  : i64
    %156 = llvm.getelementptr %146[%155] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %157 = llvm.load %156 : !llvm.ptr -> f32
    %158 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %159 = llvm.mlir.constant(147 : index) : i64
    %160 = llvm.mul %26, %159  : i64
    %161 = llvm.mlir.constant(49 : index) : i64
    %162 = llvm.mul %46, %161  : i64
    %163 = llvm.add %160, %162  : i64
    %164 = llvm.mlir.constant(7 : index) : i64
    %165 = llvm.mul %51, %164  : i64
    %166 = llvm.add %163, %165  : i64
    %167 = llvm.add %166, %19  : i64
    %168 = llvm.getelementptr %158[%167] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %169 = llvm.load %168 : !llvm.ptr -> f32
    %170 = llvm.fmul %157, %169  : f32
    %171 = llvm.fadd %141, %170  : f32
    %172 = llvm.mul %28, %13  : i64
    %173 = llvm.add %172, %10  : i64
    %174 = builtin.unrealized_conversion_cast %173 : i64 to index
    %175 = builtin.unrealized_conversion_cast %174 : index to i64
    %176 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %177 = llvm.mlir.constant(158700 : index) : i64
    %178 = llvm.mul %26, %177  : i64
    %179 = llvm.mlir.constant(52900 : index) : i64
    %180 = llvm.mul %46, %179  : i64
    %181 = llvm.add %178, %180  : i64
    %182 = llvm.mlir.constant(230 : index) : i64
    %183 = llvm.mul %51, %182  : i64
    %184 = llvm.add %181, %183  : i64
    %185 = llvm.add %184, %175  : i64
    %186 = llvm.getelementptr %176[%185] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %187 = llvm.load %186 : !llvm.ptr -> f32
    %188 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %189 = llvm.mlir.constant(147 : index) : i64
    %190 = llvm.mul %26, %189  : i64
    %191 = llvm.mlir.constant(49 : index) : i64
    %192 = llvm.mul %46, %191  : i64
    %193 = llvm.add %190, %192  : i64
    %194 = llvm.mlir.constant(7 : index) : i64
    %195 = llvm.mul %51, %194  : i64
    %196 = llvm.add %193, %195  : i64
    %197 = llvm.add %196, %12  : i64
    %198 = llvm.getelementptr %188[%197] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %199 = llvm.load %198 : !llvm.ptr -> f32
    %200 = llvm.fmul %187, %199  : f32
    %201 = llvm.fadd %171, %200  : f32
    %202 = llvm.mul %28, %13  : i64
    %203 = llvm.add %202, %7  : i64
    %204 = builtin.unrealized_conversion_cast %203 : i64 to index
    %205 = builtin.unrealized_conversion_cast %204 : index to i64
    %206 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %207 = llvm.mlir.constant(158700 : index) : i64
    %208 = llvm.mul %26, %207  : i64
    %209 = llvm.mlir.constant(52900 : index) : i64
    %210 = llvm.mul %46, %209  : i64
    %211 = llvm.add %208, %210  : i64
    %212 = llvm.mlir.constant(230 : index) : i64
    %213 = llvm.mul %51, %212  : i64
    %214 = llvm.add %211, %213  : i64
    %215 = llvm.add %214, %205  : i64
    %216 = llvm.getelementptr %206[%215] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %217 = llvm.load %216 : !llvm.ptr -> f32
    %218 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %219 = llvm.mlir.constant(147 : index) : i64
    %220 = llvm.mul %26, %219  : i64
    %221 = llvm.mlir.constant(49 : index) : i64
    %222 = llvm.mul %46, %221  : i64
    %223 = llvm.add %220, %222  : i64
    %224 = llvm.mlir.constant(7 : index) : i64
    %225 = llvm.mul %51, %224  : i64
    %226 = llvm.add %223, %225  : i64
    %227 = llvm.add %226, %9  : i64
    %228 = llvm.getelementptr %218[%227] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %229 = llvm.load %228 : !llvm.ptr -> f32
    %230 = llvm.fmul %217, %229  : f32
    %231 = llvm.fadd %201, %230  : f32
    %232 = llvm.mul %28, %13  : i64
    %233 = llvm.add %232, %4  : i64
    %234 = builtin.unrealized_conversion_cast %233 : i64 to index
    %235 = builtin.unrealized_conversion_cast %234 : index to i64
    %236 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %237 = llvm.mlir.constant(158700 : index) : i64
    %238 = llvm.mul %26, %237  : i64
    %239 = llvm.mlir.constant(52900 : index) : i64
    %240 = llvm.mul %46, %239  : i64
    %241 = llvm.add %238, %240  : i64
    %242 = llvm.mlir.constant(230 : index) : i64
    %243 = llvm.mul %51, %242  : i64
    %244 = llvm.add %241, %243  : i64
    %245 = llvm.add %244, %235  : i64
    %246 = llvm.getelementptr %236[%245] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %247 = llvm.load %246 : !llvm.ptr -> f32
    %248 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %249 = llvm.mlir.constant(147 : index) : i64
    %250 = llvm.mul %26, %249  : i64
    %251 = llvm.mlir.constant(49 : index) : i64
    %252 = llvm.mul %46, %251  : i64
    %253 = llvm.add %250, %252  : i64
    %254 = llvm.mlir.constant(7 : index) : i64
    %255 = llvm.mul %51, %254  : i64
    %256 = llvm.add %253, %255  : i64
    %257 = llvm.add %256, %6  : i64
    %258 = llvm.getelementptr %248[%257] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %259 = llvm.load %258 : !llvm.ptr -> f32
    %260 = llvm.fmul %247, %259  : f32
    %261 = llvm.fadd %231, %260  : f32
    %262 = llvm.add %50, %20  : i64
    %263 = builtin.unrealized_conversion_cast %262 : i64 to index
    cf.br ^bb6(%263, %261 : index, f32)
  ^bb8:  // pred: ^bb6
    %264 = llvm.add %45, %20  : i64
    %265 = builtin.unrealized_conversion_cast %264 : i64 to index
    cf.br ^bb4(%265, %49 : index, f32)
  ^bb9:  // pred: ^bb4
    %266 = llvm.extractvalue %3[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %267 = llvm.mlir.constant(802816 : index) : i64
    %268 = llvm.mul %26, %267  : i64
    %269 = llvm.mlir.constant(12544 : index) : i64
    %270 = llvm.mul %26, %269  : i64
    %271 = llvm.add %268, %270  : i64
    %272 = llvm.mlir.constant(112 : index) : i64
    %273 = llvm.mul %26, %272  : i64
    %274 = llvm.add %271, %273  : i64
    %275 = llvm.add %274, %29  : i64
    %276 = llvm.getelementptr %266[%275] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %44, %276 : f32, !llvm.ptr
    %277 = llvm.add %28, %20  : i64
    %278 = builtin.unrealized_conversion_cast %277 : i64 to index
    cf.br ^bb2(%278 : index)
  ^bb10:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertFuncToLLVMPass (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
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
    %29 = llvm.mlir.constant(158700 : index) : i64
    %30 = llvm.insertvalue %29, %28[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %31 = llvm.mlir.constant(3 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %33 = llvm.mlir.constant(52900 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %35 = llvm.mlir.constant(230 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(230 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %39 = llvm.mlir.constant(230 : index) : i64
    %40 = llvm.insertvalue %39, %38[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %41 = llvm.mlir.constant(1 : index) : i64
    %42 = llvm.insertvalue %41, %40[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %43 = builtin.unrealized_conversion_cast %42 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x3x230x230xf32>
    %44 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %45 = llvm.insertvalue %arg2, %44[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %46 = llvm.insertvalue %arg2, %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(0 : index) : i64
    %48 = llvm.insertvalue %47, %46[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(64 : index) : i64
    %50 = llvm.insertvalue %49, %48[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(147 : index) : i64
    %52 = llvm.insertvalue %51, %50[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(3 : index) : i64
    %54 = llvm.insertvalue %53, %52[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(49 : index) : i64
    %56 = llvm.insertvalue %55, %54[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(7 : index) : i64
    %58 = llvm.insertvalue %57, %56[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(7 : index) : i64
    %60 = llvm.insertvalue %59, %58[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %61 = llvm.mlir.constant(7 : index) : i64
    %62 = llvm.insertvalue %61, %60[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %63 = llvm.mlir.constant(1 : index) : i64
    %64 = llvm.insertvalue %63, %62[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = builtin.unrealized_conversion_cast %64 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<64x3x7x7xf32>
    %66 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %67 = llvm.insertvalue %arg3, %66[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %68 = llvm.insertvalue %arg3, %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %69 = llvm.mlir.constant(0 : index) : i64
    %70 = llvm.insertvalue %69, %68[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %71 = llvm.mlir.constant(1 : index) : i64
    %72 = llvm.insertvalue %71, %70[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %73 = llvm.mlir.constant(802816 : index) : i64
    %74 = llvm.insertvalue %73, %72[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %75 = llvm.mlir.constant(64 : index) : i64
    %76 = llvm.insertvalue %75, %74[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %77 = llvm.mlir.constant(12544 : index) : i64
    %78 = llvm.insertvalue %77, %76[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %79 = llvm.mlir.constant(112 : index) : i64
    %80 = llvm.insertvalue %79, %78[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %81 = llvm.mlir.constant(112 : index) : i64
    %82 = llvm.insertvalue %81, %80[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %83 = llvm.mlir.constant(112 : index) : i64
    %84 = llvm.insertvalue %83, %82[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %85 = llvm.mlir.constant(1 : index) : i64
    %86 = llvm.insertvalue %85, %84[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %87 = builtin.unrealized_conversion_cast %86 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x112x112xf32>
    %88 = builtin.unrealized_conversion_cast %21 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %89 = builtin.unrealized_conversion_cast %43 : memref<1x3x230x230xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %90 = builtin.unrealized_conversion_cast %65 : memref<64x3x7x7xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %91 = builtin.unrealized_conversion_cast %87 : memref<1x64x112x112xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %92 = llvm.mlir.constant(6 : index) : i64
    %93 = builtin.unrealized_conversion_cast %92 : i64 to index
    %94 = builtin.unrealized_conversion_cast %93 : index to i64
    %95 = llvm.mlir.constant(5 : index) : i64
    %96 = builtin.unrealized_conversion_cast %95 : i64 to index
    %97 = builtin.unrealized_conversion_cast %96 : index to i64
    %98 = llvm.mlir.constant(4 : index) : i64
    %99 = builtin.unrealized_conversion_cast %98 : i64 to index
    %100 = builtin.unrealized_conversion_cast %99 : index to i64
    %101 = llvm.mlir.constant(2 : index) : i64
    %102 = builtin.unrealized_conversion_cast %101 : i64 to index
    %103 = builtin.unrealized_conversion_cast %102 : index to i64
    %104 = llvm.mlir.constant(7 : index) : i64
    %105 = llvm.mlir.constant(3 : index) : i64
    %106 = builtin.unrealized_conversion_cast %105 : i64 to index
    %107 = builtin.unrealized_conversion_cast %106 : index to i64
    %108 = llvm.mlir.constant(1 : index) : i64
    %109 = builtin.unrealized_conversion_cast %108 : i64 to index
    %110 = builtin.unrealized_conversion_cast %109 : index to i64
    %111 = llvm.mlir.constant(8 : index) : i64
    %112 = llvm.mlir.constant(0 : index) : i64
    %113 = builtin.unrealized_conversion_cast %112 : i64 to index
    %114 = builtin.unrealized_conversion_cast %113 : index to i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%112 : i64)
  ^bb2(%115: i64):  // 2 preds: ^bb1, ^bb9
    %116 = builtin.unrealized_conversion_cast %115 : i64 to index
    %117 = builtin.unrealized_conversion_cast %116 : index to i64
    %118 = builtin.unrealized_conversion_cast %116 : index to i64
    %119 = llvm.icmp "slt" %117, %111 : i64
    llvm.cond_br %119, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    %120 = llvm.extractvalue %88[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %121 = llvm.mlir.constant(802816 : index) : i64
    %122 = llvm.mul %114, %121  : i64
    %123 = llvm.mlir.constant(12544 : index) : i64
    %124 = llvm.mul %114, %123  : i64
    %125 = llvm.add %122, %124  : i64
    %126 = llvm.mlir.constant(112 : index) : i64
    %127 = llvm.mul %114, %126  : i64
    %128 = llvm.add %125, %127  : i64
    %129 = llvm.add %128, %118  : i64
    %130 = llvm.getelementptr %120[%129] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %131 = llvm.load %130 : !llvm.ptr -> f32
    llvm.br ^bb4(%112, %131 : i64, f32)
  ^bb4(%132: i64, %133: f32):  // 2 preds: ^bb3, ^bb8
    %134 = builtin.unrealized_conversion_cast %132 : i64 to index
    %135 = builtin.unrealized_conversion_cast %134 : index to i64
    %136 = builtin.unrealized_conversion_cast %134 : index to i64
    %137 = llvm.icmp "slt" %135, %105 : i64
    llvm.cond_br %137, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%112, %133 : i64, f32)
  ^bb6(%138: i64, %139: f32):  // 2 preds: ^bb5, ^bb7
    %140 = builtin.unrealized_conversion_cast %138 : i64 to index
    %141 = builtin.unrealized_conversion_cast %140 : index to i64
    %142 = builtin.unrealized_conversion_cast %140 : index to i64
    %143 = llvm.icmp "slt" %141, %104 : i64
    llvm.cond_br %143, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %144 = llvm.mul %117, %101  : i64
    %145 = builtin.unrealized_conversion_cast %144 : i64 to index
    %146 = builtin.unrealized_conversion_cast %145 : index to i64
    %147 = llvm.extractvalue %89[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %148 = llvm.mlir.constant(158700 : index) : i64
    %149 = llvm.mul %114, %148  : i64
    %150 = llvm.mlir.constant(52900 : index) : i64
    %151 = llvm.mul %136, %150  : i64
    %152 = llvm.add %149, %151  : i64
    %153 = llvm.mlir.constant(230 : index) : i64
    %154 = llvm.mul %142, %153  : i64
    %155 = llvm.add %152, %154  : i64
    %156 = llvm.add %155, %146  : i64
    %157 = llvm.getelementptr %147[%156] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %158 = llvm.load %157 : !llvm.ptr -> f32
    %159 = llvm.extractvalue %90[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %160 = llvm.mlir.constant(147 : index) : i64
    %161 = llvm.mul %114, %160  : i64
    %162 = llvm.mlir.constant(49 : index) : i64
    %163 = llvm.mul %136, %162  : i64
    %164 = llvm.add %161, %163  : i64
    %165 = llvm.mlir.constant(7 : index) : i64
    %166 = llvm.mul %142, %165  : i64
    %167 = llvm.add %164, %166  : i64
    %168 = llvm.add %167, %114  : i64
    %169 = llvm.getelementptr %159[%168] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %170 = llvm.load %169 : !llvm.ptr -> f32
    %171 = llvm.fmul %158, %170  : f32
    %172 = llvm.fadd %139, %171  : f32
    %173 = llvm.mul %117, %101  : i64
    %174 = llvm.add %173, %108  : i64
    %175 = builtin.unrealized_conversion_cast %174 : i64 to index
    %176 = builtin.unrealized_conversion_cast %175 : index to i64
    %177 = llvm.extractvalue %89[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %178 = llvm.mlir.constant(158700 : index) : i64
    %179 = llvm.mul %114, %178  : i64
    %180 = llvm.mlir.constant(52900 : index) : i64
    %181 = llvm.mul %136, %180  : i64
    %182 = llvm.add %179, %181  : i64
    %183 = llvm.mlir.constant(230 : index) : i64
    %184 = llvm.mul %142, %183  : i64
    %185 = llvm.add %182, %184  : i64
    %186 = llvm.add %185, %176  : i64
    %187 = llvm.getelementptr %177[%186] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %188 = llvm.load %187 : !llvm.ptr -> f32
    %189 = llvm.extractvalue %90[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %190 = llvm.mlir.constant(147 : index) : i64
    %191 = llvm.mul %114, %190  : i64
    %192 = llvm.mlir.constant(49 : index) : i64
    %193 = llvm.mul %136, %192  : i64
    %194 = llvm.add %191, %193  : i64
    %195 = llvm.mlir.constant(7 : index) : i64
    %196 = llvm.mul %142, %195  : i64
    %197 = llvm.add %194, %196  : i64
    %198 = llvm.add %197, %110  : i64
    %199 = llvm.getelementptr %189[%198] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %200 = llvm.load %199 : !llvm.ptr -> f32
    %201 = llvm.fmul %188, %200  : f32
    %202 = llvm.fadd %172, %201  : f32
    %203 = llvm.mul %117, %101  : i64
    %204 = llvm.add %203, %101  : i64
    %205 = builtin.unrealized_conversion_cast %204 : i64 to index
    %206 = builtin.unrealized_conversion_cast %205 : index to i64
    %207 = llvm.extractvalue %89[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %208 = llvm.mlir.constant(158700 : index) : i64
    %209 = llvm.mul %114, %208  : i64
    %210 = llvm.mlir.constant(52900 : index) : i64
    %211 = llvm.mul %136, %210  : i64
    %212 = llvm.add %209, %211  : i64
    %213 = llvm.mlir.constant(230 : index) : i64
    %214 = llvm.mul %142, %213  : i64
    %215 = llvm.add %212, %214  : i64
    %216 = llvm.add %215, %206  : i64
    %217 = llvm.getelementptr %207[%216] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %218 = llvm.load %217 : !llvm.ptr -> f32
    %219 = llvm.extractvalue %90[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %220 = llvm.mlir.constant(147 : index) : i64
    %221 = llvm.mul %114, %220  : i64
    %222 = llvm.mlir.constant(49 : index) : i64
    %223 = llvm.mul %136, %222  : i64
    %224 = llvm.add %221, %223  : i64
    %225 = llvm.mlir.constant(7 : index) : i64
    %226 = llvm.mul %142, %225  : i64
    %227 = llvm.add %224, %226  : i64
    %228 = llvm.add %227, %103  : i64
    %229 = llvm.getelementptr %219[%228] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %230 = llvm.load %229 : !llvm.ptr -> f32
    %231 = llvm.fmul %218, %230  : f32
    %232 = llvm.fadd %202, %231  : f32
    %233 = llvm.mul %117, %101  : i64
    %234 = llvm.add %233, %105  : i64
    %235 = builtin.unrealized_conversion_cast %234 : i64 to index
    %236 = builtin.unrealized_conversion_cast %235 : index to i64
    %237 = llvm.extractvalue %89[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %238 = llvm.mlir.constant(158700 : index) : i64
    %239 = llvm.mul %114, %238  : i64
    %240 = llvm.mlir.constant(52900 : index) : i64
    %241 = llvm.mul %136, %240  : i64
    %242 = llvm.add %239, %241  : i64
    %243 = llvm.mlir.constant(230 : index) : i64
    %244 = llvm.mul %142, %243  : i64
    %245 = llvm.add %242, %244  : i64
    %246 = llvm.add %245, %236  : i64
    %247 = llvm.getelementptr %237[%246] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %248 = llvm.load %247 : !llvm.ptr -> f32
    %249 = llvm.extractvalue %90[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %250 = llvm.mlir.constant(147 : index) : i64
    %251 = llvm.mul %114, %250  : i64
    %252 = llvm.mlir.constant(49 : index) : i64
    %253 = llvm.mul %136, %252  : i64
    %254 = llvm.add %251, %253  : i64
    %255 = llvm.mlir.constant(7 : index) : i64
    %256 = llvm.mul %142, %255  : i64
    %257 = llvm.add %254, %256  : i64
    %258 = llvm.add %257, %107  : i64
    %259 = llvm.getelementptr %249[%258] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %260 = llvm.load %259 : !llvm.ptr -> f32
    %261 = llvm.fmul %248, %260  : f32
    %262 = llvm.fadd %232, %261  : f32
    %263 = llvm.mul %117, %101  : i64
    %264 = llvm.add %263, %98  : i64
    %265 = builtin.unrealized_conversion_cast %264 : i64 to index
    %266 = builtin.unrealized_conversion_cast %265 : index to i64
    %267 = llvm.extractvalue %89[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %268 = llvm.mlir.constant(158700 : index) : i64
    %269 = llvm.mul %114, %268  : i64
    %270 = llvm.mlir.constant(52900 : index) : i64
    %271 = llvm.mul %136, %270  : i64
    %272 = llvm.add %269, %271  : i64
    %273 = llvm.mlir.constant(230 : index) : i64
    %274 = llvm.mul %142, %273  : i64
    %275 = llvm.add %272, %274  : i64
    %276 = llvm.add %275, %266  : i64
    %277 = llvm.getelementptr %267[%276] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %278 = llvm.load %277 : !llvm.ptr -> f32
    %279 = llvm.extractvalue %90[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %280 = llvm.mlir.constant(147 : index) : i64
    %281 = llvm.mul %114, %280  : i64
    %282 = llvm.mlir.constant(49 : index) : i64
    %283 = llvm.mul %136, %282  : i64
    %284 = llvm.add %281, %283  : i64
    %285 = llvm.mlir.constant(7 : index) : i64
    %286 = llvm.mul %142, %285  : i64
    %287 = llvm.add %284, %286  : i64
    %288 = llvm.add %287, %100  : i64
    %289 = llvm.getelementptr %279[%288] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %290 = llvm.load %289 : !llvm.ptr -> f32
    %291 = llvm.fmul %278, %290  : f32
    %292 = llvm.fadd %262, %291  : f32
    %293 = llvm.mul %117, %101  : i64
    %294 = llvm.add %293, %95  : i64
    %295 = builtin.unrealized_conversion_cast %294 : i64 to index
    %296 = builtin.unrealized_conversion_cast %295 : index to i64
    %297 = llvm.extractvalue %89[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %298 = llvm.mlir.constant(158700 : index) : i64
    %299 = llvm.mul %114, %298  : i64
    %300 = llvm.mlir.constant(52900 : index) : i64
    %301 = llvm.mul %136, %300  : i64
    %302 = llvm.add %299, %301  : i64
    %303 = llvm.mlir.constant(230 : index) : i64
    %304 = llvm.mul %142, %303  : i64
    %305 = llvm.add %302, %304  : i64
    %306 = llvm.add %305, %296  : i64
    %307 = llvm.getelementptr %297[%306] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %308 = llvm.load %307 : !llvm.ptr -> f32
    %309 = llvm.extractvalue %90[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %310 = llvm.mlir.constant(147 : index) : i64
    %311 = llvm.mul %114, %310  : i64
    %312 = llvm.mlir.constant(49 : index) : i64
    %313 = llvm.mul %136, %312  : i64
    %314 = llvm.add %311, %313  : i64
    %315 = llvm.mlir.constant(7 : index) : i64
    %316 = llvm.mul %142, %315  : i64
    %317 = llvm.add %314, %316  : i64
    %318 = llvm.add %317, %97  : i64
    %319 = llvm.getelementptr %309[%318] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %320 = llvm.load %319 : !llvm.ptr -> f32
    %321 = llvm.fmul %308, %320  : f32
    %322 = llvm.fadd %292, %321  : f32
    %323 = llvm.mul %117, %101  : i64
    %324 = llvm.add %323, %92  : i64
    %325 = builtin.unrealized_conversion_cast %324 : i64 to index
    %326 = builtin.unrealized_conversion_cast %325 : index to i64
    %327 = llvm.extractvalue %89[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %328 = llvm.mlir.constant(158700 : index) : i64
    %329 = llvm.mul %114, %328  : i64
    %330 = llvm.mlir.constant(52900 : index) : i64
    %331 = llvm.mul %136, %330  : i64
    %332 = llvm.add %329, %331  : i64
    %333 = llvm.mlir.constant(230 : index) : i64
    %334 = llvm.mul %142, %333  : i64
    %335 = llvm.add %332, %334  : i64
    %336 = llvm.add %335, %326  : i64
    %337 = llvm.getelementptr %327[%336] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %338 = llvm.load %337 : !llvm.ptr -> f32
    %339 = llvm.extractvalue %90[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %340 = llvm.mlir.constant(147 : index) : i64
    %341 = llvm.mul %114, %340  : i64
    %342 = llvm.mlir.constant(49 : index) : i64
    %343 = llvm.mul %136, %342  : i64
    %344 = llvm.add %341, %343  : i64
    %345 = llvm.mlir.constant(7 : index) : i64
    %346 = llvm.mul %142, %345  : i64
    %347 = llvm.add %344, %346  : i64
    %348 = llvm.add %347, %94  : i64
    %349 = llvm.getelementptr %339[%348] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %350 = llvm.load %349 : !llvm.ptr -> f32
    %351 = llvm.fmul %338, %350  : f32
    %352 = llvm.fadd %322, %351  : f32
    %353 = llvm.add %141, %108  : i64
    %354 = builtin.unrealized_conversion_cast %353 : i64 to index
    llvm.br ^bb6(%353, %352 : i64, f32)
  ^bb8:  // pred: ^bb6
    %355 = llvm.add %135, %108  : i64
    %356 = builtin.unrealized_conversion_cast %355 : i64 to index
    llvm.br ^bb4(%355, %139 : i64, f32)
  ^bb9:  // pred: ^bb4
    %357 = llvm.extractvalue %91[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %358 = llvm.mlir.constant(802816 : index) : i64
    %359 = llvm.mul %114, %358  : i64
    %360 = llvm.mlir.constant(12544 : index) : i64
    %361 = llvm.mul %114, %360  : i64
    %362 = llvm.add %359, %361  : i64
    %363 = llvm.mlir.constant(112 : index) : i64
    %364 = llvm.mul %114, %363  : i64
    %365 = llvm.add %362, %364  : i64
    %366 = llvm.add %365, %118  : i64
    %367 = llvm.getelementptr %357[%366] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %133, %367 : f32, !llvm.ptr
    %368 = llvm.add %117, %108  : i64
    %369 = builtin.unrealized_conversion_cast %368 : i64 to index
    llvm.br ^bb2(%368 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
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
    %28 = llvm.mlir.constant(158700 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(3 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(52900 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(230 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(230 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(230 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %43 = llvm.insertvalue %arg2, %42[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %44 = llvm.insertvalue %arg2, %43[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.insertvalue %45, %44[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(64 : index) : i64
    %48 = llvm.insertvalue %47, %46[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(147 : index) : i64
    %50 = llvm.insertvalue %49, %48[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(3 : index) : i64
    %52 = llvm.insertvalue %51, %50[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(49 : index) : i64
    %54 = llvm.insertvalue %53, %52[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(7 : index) : i64
    %56 = llvm.insertvalue %55, %54[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(7 : index) : i64
    %58 = llvm.insertvalue %57, %56[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(7 : index) : i64
    %60 = llvm.insertvalue %59, %58[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %61 = llvm.mlir.constant(1 : index) : i64
    %62 = llvm.insertvalue %61, %60[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %63 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %64 = llvm.insertvalue %arg3, %63[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = llvm.insertvalue %arg3, %64[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %66 = llvm.mlir.constant(0 : index) : i64
    %67 = llvm.insertvalue %66, %65[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %68 = llvm.mlir.constant(1 : index) : i64
    %69 = llvm.insertvalue %68, %67[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %70 = llvm.mlir.constant(802816 : index) : i64
    %71 = llvm.insertvalue %70, %69[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %72 = llvm.mlir.constant(64 : index) : i64
    %73 = llvm.insertvalue %72, %71[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %74 = llvm.mlir.constant(12544 : index) : i64
    %75 = llvm.insertvalue %74, %73[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %76 = llvm.mlir.constant(112 : index) : i64
    %77 = llvm.insertvalue %76, %75[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %78 = llvm.mlir.constant(112 : index) : i64
    %79 = llvm.insertvalue %78, %77[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %80 = llvm.mlir.constant(112 : index) : i64
    %81 = llvm.insertvalue %80, %79[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %82 = llvm.mlir.constant(1 : index) : i64
    %83 = llvm.insertvalue %82, %81[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %84 = llvm.mlir.constant(6 : index) : i64
    %85 = llvm.mlir.constant(5 : index) : i64
    %86 = llvm.mlir.constant(4 : index) : i64
    %87 = llvm.mlir.constant(2 : index) : i64
    %88 = llvm.mlir.constant(7 : index) : i64
    %89 = llvm.mlir.constant(3 : index) : i64
    %90 = llvm.mlir.constant(1 : index) : i64
    %91 = llvm.mlir.constant(8 : index) : i64
    %92 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%92 : i64)
  ^bb2(%93: i64):  // 2 preds: ^bb1, ^bb9
    %94 = llvm.icmp "slt" %93, %91 : i64
    llvm.cond_br %94, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    %95 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %96 = llvm.mlir.constant(802816 : index) : i64
    %97 = llvm.mul %92, %96  : i64
    %98 = llvm.mlir.constant(12544 : index) : i64
    %99 = llvm.mul %92, %98  : i64
    %100 = llvm.add %97, %99  : i64
    %101 = llvm.mlir.constant(112 : index) : i64
    %102 = llvm.mul %92, %101  : i64
    %103 = llvm.add %100, %102  : i64
    %104 = llvm.add %103, %93  : i64
    %105 = llvm.getelementptr %95[%104] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %106 = llvm.load %105 : !llvm.ptr -> f32
    llvm.br ^bb4(%92, %106 : i64, f32)
  ^bb4(%107: i64, %108: f32):  // 2 preds: ^bb3, ^bb8
    %109 = llvm.icmp "slt" %107, %89 : i64
    llvm.cond_br %109, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%92, %108 : i64, f32)
  ^bb6(%110: i64, %111: f32):  // 2 preds: ^bb5, ^bb7
    %112 = llvm.icmp "slt" %110, %88 : i64
    llvm.cond_br %112, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %113 = llvm.mul %93, %87  : i64
    %114 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %115 = llvm.mlir.constant(158700 : index) : i64
    %116 = llvm.mul %92, %115  : i64
    %117 = llvm.mlir.constant(52900 : index) : i64
    %118 = llvm.mul %107, %117  : i64
    %119 = llvm.add %116, %118  : i64
    %120 = llvm.mlir.constant(230 : index) : i64
    %121 = llvm.mul %110, %120  : i64
    %122 = llvm.add %119, %121  : i64
    %123 = llvm.add %122, %113  : i64
    %124 = llvm.getelementptr %114[%123] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %125 = llvm.load %124 : !llvm.ptr -> f32
    %126 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %127 = llvm.mlir.constant(147 : index) : i64
    %128 = llvm.mul %92, %127  : i64
    %129 = llvm.mlir.constant(49 : index) : i64
    %130 = llvm.mul %107, %129  : i64
    %131 = llvm.add %128, %130  : i64
    %132 = llvm.mlir.constant(7 : index) : i64
    %133 = llvm.mul %110, %132  : i64
    %134 = llvm.add %131, %133  : i64
    %135 = llvm.add %134, %92  : i64
    %136 = llvm.getelementptr %126[%135] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %137 = llvm.load %136 : !llvm.ptr -> f32
    %138 = llvm.fmul %125, %137  : f32
    %139 = llvm.fadd %111, %138  : f32
    %140 = llvm.mul %93, %87  : i64
    %141 = llvm.add %140, %90  : i64
    %142 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %143 = llvm.mlir.constant(158700 : index) : i64
    %144 = llvm.mul %92, %143  : i64
    %145 = llvm.mlir.constant(52900 : index) : i64
    %146 = llvm.mul %107, %145  : i64
    %147 = llvm.add %144, %146  : i64
    %148 = llvm.mlir.constant(230 : index) : i64
    %149 = llvm.mul %110, %148  : i64
    %150 = llvm.add %147, %149  : i64
    %151 = llvm.add %150, %141  : i64
    %152 = llvm.getelementptr %142[%151] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %153 = llvm.load %152 : !llvm.ptr -> f32
    %154 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %155 = llvm.mlir.constant(147 : index) : i64
    %156 = llvm.mul %92, %155  : i64
    %157 = llvm.mlir.constant(49 : index) : i64
    %158 = llvm.mul %107, %157  : i64
    %159 = llvm.add %156, %158  : i64
    %160 = llvm.mlir.constant(7 : index) : i64
    %161 = llvm.mul %110, %160  : i64
    %162 = llvm.add %159, %161  : i64
    %163 = llvm.add %162, %90  : i64
    %164 = llvm.getelementptr %154[%163] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %165 = llvm.load %164 : !llvm.ptr -> f32
    %166 = llvm.fmul %153, %165  : f32
    %167 = llvm.fadd %139, %166  : f32
    %168 = llvm.mul %93, %87  : i64
    %169 = llvm.add %168, %87  : i64
    %170 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %171 = llvm.mlir.constant(158700 : index) : i64
    %172 = llvm.mul %92, %171  : i64
    %173 = llvm.mlir.constant(52900 : index) : i64
    %174 = llvm.mul %107, %173  : i64
    %175 = llvm.add %172, %174  : i64
    %176 = llvm.mlir.constant(230 : index) : i64
    %177 = llvm.mul %110, %176  : i64
    %178 = llvm.add %175, %177  : i64
    %179 = llvm.add %178, %169  : i64
    %180 = llvm.getelementptr %170[%179] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %181 = llvm.load %180 : !llvm.ptr -> f32
    %182 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %183 = llvm.mlir.constant(147 : index) : i64
    %184 = llvm.mul %92, %183  : i64
    %185 = llvm.mlir.constant(49 : index) : i64
    %186 = llvm.mul %107, %185  : i64
    %187 = llvm.add %184, %186  : i64
    %188 = llvm.mlir.constant(7 : index) : i64
    %189 = llvm.mul %110, %188  : i64
    %190 = llvm.add %187, %189  : i64
    %191 = llvm.add %190, %87  : i64
    %192 = llvm.getelementptr %182[%191] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %193 = llvm.load %192 : !llvm.ptr -> f32
    %194 = llvm.fmul %181, %193  : f32
    %195 = llvm.fadd %167, %194  : f32
    %196 = llvm.mul %93, %87  : i64
    %197 = llvm.add %196, %89  : i64
    %198 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %199 = llvm.mlir.constant(158700 : index) : i64
    %200 = llvm.mul %92, %199  : i64
    %201 = llvm.mlir.constant(52900 : index) : i64
    %202 = llvm.mul %107, %201  : i64
    %203 = llvm.add %200, %202  : i64
    %204 = llvm.mlir.constant(230 : index) : i64
    %205 = llvm.mul %110, %204  : i64
    %206 = llvm.add %203, %205  : i64
    %207 = llvm.add %206, %197  : i64
    %208 = llvm.getelementptr %198[%207] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %209 = llvm.load %208 : !llvm.ptr -> f32
    %210 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %211 = llvm.mlir.constant(147 : index) : i64
    %212 = llvm.mul %92, %211  : i64
    %213 = llvm.mlir.constant(49 : index) : i64
    %214 = llvm.mul %107, %213  : i64
    %215 = llvm.add %212, %214  : i64
    %216 = llvm.mlir.constant(7 : index) : i64
    %217 = llvm.mul %110, %216  : i64
    %218 = llvm.add %215, %217  : i64
    %219 = llvm.add %218, %89  : i64
    %220 = llvm.getelementptr %210[%219] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %221 = llvm.load %220 : !llvm.ptr -> f32
    %222 = llvm.fmul %209, %221  : f32
    %223 = llvm.fadd %195, %222  : f32
    %224 = llvm.mul %93, %87  : i64
    %225 = llvm.add %224, %86  : i64
    %226 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %227 = llvm.mlir.constant(158700 : index) : i64
    %228 = llvm.mul %92, %227  : i64
    %229 = llvm.mlir.constant(52900 : index) : i64
    %230 = llvm.mul %107, %229  : i64
    %231 = llvm.add %228, %230  : i64
    %232 = llvm.mlir.constant(230 : index) : i64
    %233 = llvm.mul %110, %232  : i64
    %234 = llvm.add %231, %233  : i64
    %235 = llvm.add %234, %225  : i64
    %236 = llvm.getelementptr %226[%235] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %237 = llvm.load %236 : !llvm.ptr -> f32
    %238 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %239 = llvm.mlir.constant(147 : index) : i64
    %240 = llvm.mul %92, %239  : i64
    %241 = llvm.mlir.constant(49 : index) : i64
    %242 = llvm.mul %107, %241  : i64
    %243 = llvm.add %240, %242  : i64
    %244 = llvm.mlir.constant(7 : index) : i64
    %245 = llvm.mul %110, %244  : i64
    %246 = llvm.add %243, %245  : i64
    %247 = llvm.add %246, %86  : i64
    %248 = llvm.getelementptr %238[%247] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %249 = llvm.load %248 : !llvm.ptr -> f32
    %250 = llvm.fmul %237, %249  : f32
    %251 = llvm.fadd %223, %250  : f32
    %252 = llvm.mul %93, %87  : i64
    %253 = llvm.add %252, %85  : i64
    %254 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %255 = llvm.mlir.constant(158700 : index) : i64
    %256 = llvm.mul %92, %255  : i64
    %257 = llvm.mlir.constant(52900 : index) : i64
    %258 = llvm.mul %107, %257  : i64
    %259 = llvm.add %256, %258  : i64
    %260 = llvm.mlir.constant(230 : index) : i64
    %261 = llvm.mul %110, %260  : i64
    %262 = llvm.add %259, %261  : i64
    %263 = llvm.add %262, %253  : i64
    %264 = llvm.getelementptr %254[%263] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %265 = llvm.load %264 : !llvm.ptr -> f32
    %266 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %267 = llvm.mlir.constant(147 : index) : i64
    %268 = llvm.mul %92, %267  : i64
    %269 = llvm.mlir.constant(49 : index) : i64
    %270 = llvm.mul %107, %269  : i64
    %271 = llvm.add %268, %270  : i64
    %272 = llvm.mlir.constant(7 : index) : i64
    %273 = llvm.mul %110, %272  : i64
    %274 = llvm.add %271, %273  : i64
    %275 = llvm.add %274, %85  : i64
    %276 = llvm.getelementptr %266[%275] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %277 = llvm.load %276 : !llvm.ptr -> f32
    %278 = llvm.fmul %265, %277  : f32
    %279 = llvm.fadd %251, %278  : f32
    %280 = llvm.mul %93, %87  : i64
    %281 = llvm.add %280, %84  : i64
    %282 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %283 = llvm.mlir.constant(158700 : index) : i64
    %284 = llvm.mul %92, %283  : i64
    %285 = llvm.mlir.constant(52900 : index) : i64
    %286 = llvm.mul %107, %285  : i64
    %287 = llvm.add %284, %286  : i64
    %288 = llvm.mlir.constant(230 : index) : i64
    %289 = llvm.mul %110, %288  : i64
    %290 = llvm.add %287, %289  : i64
    %291 = llvm.add %290, %281  : i64
    %292 = llvm.getelementptr %282[%291] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %293 = llvm.load %292 : !llvm.ptr -> f32
    %294 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %295 = llvm.mlir.constant(147 : index) : i64
    %296 = llvm.mul %92, %295  : i64
    %297 = llvm.mlir.constant(49 : index) : i64
    %298 = llvm.mul %107, %297  : i64
    %299 = llvm.add %296, %298  : i64
    %300 = llvm.mlir.constant(7 : index) : i64
    %301 = llvm.mul %110, %300  : i64
    %302 = llvm.add %299, %301  : i64
    %303 = llvm.add %302, %84  : i64
    %304 = llvm.getelementptr %294[%303] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %305 = llvm.load %304 : !llvm.ptr -> f32
    %306 = llvm.fmul %293, %305  : f32
    %307 = llvm.fadd %279, %306  : f32
    %308 = llvm.add %110, %90  : i64
    llvm.br ^bb6(%308, %307 : i64, f32)
  ^bb8:  // pred: ^bb6
    %309 = llvm.add %107, %90  : i64
    llvm.br ^bb4(%309, %111 : i64, f32)
  ^bb9:  // pred: ^bb4
    %310 = llvm.extractvalue %83[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %311 = llvm.mlir.constant(802816 : index) : i64
    %312 = llvm.mul %92, %311  : i64
    %313 = llvm.mlir.constant(12544 : index) : i64
    %314 = llvm.mul %92, %313  : i64
    %315 = llvm.add %312, %314  : i64
    %316 = llvm.mlir.constant(112 : index) : i64
    %317 = llvm.mul %92, %316  : i64
    %318 = llvm.add %315, %317  : i64
    %319 = llvm.add %318, %93  : i64
    %320 = llvm.getelementptr %310[%319] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %108, %320 : f32, !llvm.ptr
    %321 = llvm.add %93, %90  : i64
    llvm.br ^bb2(%321 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr) attributes {Kernel, forward_kernel_0} {
    %0 = llvm.mlir.constant(8 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(4 : index) : i64
    %3 = llvm.mlir.constant(5 : index) : i64
    %4 = llvm.mlir.constant(6 : index) : i64
    %5 = llvm.mlir.constant(7 : index) : i64
    %6 = llvm.mlir.constant(49 : index) : i64
    %7 = llvm.mlir.constant(147 : index) : i64
    %8 = llvm.mlir.constant(230 : index) : i64
    %9 = llvm.mlir.constant(52900 : index) : i64
    %10 = llvm.mlir.constant(3 : index) : i64
    %11 = llvm.mlir.constant(158700 : index) : i64
    %12 = llvm.mlir.constant(112 : index) : i64
    %13 = llvm.mlir.constant(12544 : index) : i64
    %14 = llvm.mlir.constant(802816 : index) : i64
    %15 = llvm.mlir.constant(1 : index) : i64
    %16 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%16 : i64)
  ^bb2(%17: i64):  // 2 preds: ^bb1, ^bb9
    %18 = llvm.icmp "slt" %17, %0 : i64
    llvm.cond_br %18, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    %19 = llvm.mul %16, %14  : i64
    %20 = llvm.mul %16, %13  : i64
    %21 = llvm.add %19, %20  : i64
    %22 = llvm.mul %16, %12  : i64
    %23 = llvm.add %21, %22  : i64
    %24 = llvm.add %23, %17  : i64
    %25 = llvm.getelementptr %arg0[%24] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %26 = llvm.load %25 : !llvm.ptr -> f32
    llvm.br ^bb4(%16, %26 : i64, f32)
  ^bb4(%27: i64, %28: f32):  // 2 preds: ^bb3, ^bb8
    %29 = llvm.icmp "slt" %27, %10 : i64
    llvm.cond_br %29, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%16, %28 : i64, f32)
  ^bb6(%30: i64, %31: f32):  // 2 preds: ^bb5, ^bb7
    %32 = llvm.icmp "slt" %30, %5 : i64
    llvm.cond_br %32, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %33 = llvm.mul %17, %1  : i64
    %34 = llvm.mul %16, %11  : i64
    %35 = llvm.mul %27, %9  : i64
    %36 = llvm.add %34, %35  : i64
    %37 = llvm.mul %30, %8  : i64
    %38 = llvm.add %36, %37  : i64
    %39 = llvm.add %38, %33  : i64
    %40 = llvm.getelementptr %arg1[%39] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %41 = llvm.load %40 : !llvm.ptr -> f32
    %42 = llvm.mul %16, %7  : i64
    %43 = llvm.mul %27, %6  : i64
    %44 = llvm.add %42, %43  : i64
    %45 = llvm.mul %30, %5  : i64
    %46 = llvm.add %44, %45  : i64
    %47 = llvm.add %46, %16  : i64
    %48 = llvm.getelementptr %arg2[%47] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %49 = llvm.load %48 : !llvm.ptr -> f32
    %50 = llvm.fmul %41, %49  : f32
    %51 = llvm.fadd %31, %50  : f32
    %52 = llvm.mul %17, %1  : i64
    %53 = llvm.add %52, %15  : i64
    %54 = llvm.mul %16, %11  : i64
    %55 = llvm.mul %27, %9  : i64
    %56 = llvm.add %54, %55  : i64
    %57 = llvm.mul %30, %8  : i64
    %58 = llvm.add %56, %57  : i64
    %59 = llvm.add %58, %53  : i64
    %60 = llvm.getelementptr %arg1[%59] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %61 = llvm.load %60 : !llvm.ptr -> f32
    %62 = llvm.mul %16, %7  : i64
    %63 = llvm.mul %27, %6  : i64
    %64 = llvm.add %62, %63  : i64
    %65 = llvm.mul %30, %5  : i64
    %66 = llvm.add %64, %65  : i64
    %67 = llvm.add %66, %15  : i64
    %68 = llvm.getelementptr %arg2[%67] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %69 = llvm.load %68 : !llvm.ptr -> f32
    %70 = llvm.fmul %61, %69  : f32
    %71 = llvm.fadd %51, %70  : f32
    %72 = llvm.mul %17, %1  : i64
    %73 = llvm.add %72, %1  : i64
    %74 = llvm.mul %16, %11  : i64
    %75 = llvm.mul %27, %9  : i64
    %76 = llvm.add %74, %75  : i64
    %77 = llvm.mul %30, %8  : i64
    %78 = llvm.add %76, %77  : i64
    %79 = llvm.add %78, %73  : i64
    %80 = llvm.getelementptr %arg1[%79] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %81 = llvm.load %80 : !llvm.ptr -> f32
    %82 = llvm.mul %16, %7  : i64
    %83 = llvm.mul %27, %6  : i64
    %84 = llvm.add %82, %83  : i64
    %85 = llvm.mul %30, %5  : i64
    %86 = llvm.add %84, %85  : i64
    %87 = llvm.add %86, %1  : i64
    %88 = llvm.getelementptr %arg2[%87] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %89 = llvm.load %88 : !llvm.ptr -> f32
    %90 = llvm.fmul %81, %89  : f32
    %91 = llvm.fadd %71, %90  : f32
    %92 = llvm.mul %17, %1  : i64
    %93 = llvm.add %92, %10  : i64
    %94 = llvm.mul %16, %11  : i64
    %95 = llvm.mul %27, %9  : i64
    %96 = llvm.add %94, %95  : i64
    %97 = llvm.mul %30, %8  : i64
    %98 = llvm.add %96, %97  : i64
    %99 = llvm.add %98, %93  : i64
    %100 = llvm.getelementptr %arg1[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %101 = llvm.load %100 : !llvm.ptr -> f32
    %102 = llvm.mul %16, %7  : i64
    %103 = llvm.mul %27, %6  : i64
    %104 = llvm.add %102, %103  : i64
    %105 = llvm.mul %30, %5  : i64
    %106 = llvm.add %104, %105  : i64
    %107 = llvm.add %106, %10  : i64
    %108 = llvm.getelementptr %arg2[%107] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %109 = llvm.load %108 : !llvm.ptr -> f32
    %110 = llvm.fmul %101, %109  : f32
    %111 = llvm.fadd %91, %110  : f32
    %112 = llvm.mul %17, %1  : i64
    %113 = llvm.add %112, %2  : i64
    %114 = llvm.mul %16, %11  : i64
    %115 = llvm.mul %27, %9  : i64
    %116 = llvm.add %114, %115  : i64
    %117 = llvm.mul %30, %8  : i64
    %118 = llvm.add %116, %117  : i64
    %119 = llvm.add %118, %113  : i64
    %120 = llvm.getelementptr %arg1[%119] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %121 = llvm.load %120 : !llvm.ptr -> f32
    %122 = llvm.mul %16, %7  : i64
    %123 = llvm.mul %27, %6  : i64
    %124 = llvm.add %122, %123  : i64
    %125 = llvm.mul %30, %5  : i64
    %126 = llvm.add %124, %125  : i64
    %127 = llvm.add %126, %2  : i64
    %128 = llvm.getelementptr %arg2[%127] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %129 = llvm.load %128 : !llvm.ptr -> f32
    %130 = llvm.fmul %121, %129  : f32
    %131 = llvm.fadd %111, %130  : f32
    %132 = llvm.mul %17, %1  : i64
    %133 = llvm.add %132, %3  : i64
    %134 = llvm.mul %16, %11  : i64
    %135 = llvm.mul %27, %9  : i64
    %136 = llvm.add %134, %135  : i64
    %137 = llvm.mul %30, %8  : i64
    %138 = llvm.add %136, %137  : i64
    %139 = llvm.add %138, %133  : i64
    %140 = llvm.getelementptr %arg1[%139] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %141 = llvm.load %140 : !llvm.ptr -> f32
    %142 = llvm.mul %16, %7  : i64
    %143 = llvm.mul %27, %6  : i64
    %144 = llvm.add %142, %143  : i64
    %145 = llvm.mul %30, %5  : i64
    %146 = llvm.add %144, %145  : i64
    %147 = llvm.add %146, %3  : i64
    %148 = llvm.getelementptr %arg2[%147] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %149 = llvm.load %148 : !llvm.ptr -> f32
    %150 = llvm.fmul %141, %149  : f32
    %151 = llvm.fadd %131, %150  : f32
    %152 = llvm.mul %17, %1  : i64
    %153 = llvm.add %152, %4  : i64
    %154 = llvm.mul %16, %11  : i64
    %155 = llvm.mul %27, %9  : i64
    %156 = llvm.add %154, %155  : i64
    %157 = llvm.mul %30, %8  : i64
    %158 = llvm.add %156, %157  : i64
    %159 = llvm.add %158, %153  : i64
    %160 = llvm.getelementptr %arg1[%159] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %161 = llvm.load %160 : !llvm.ptr -> f32
    %162 = llvm.mul %16, %7  : i64
    %163 = llvm.mul %27, %6  : i64
    %164 = llvm.add %162, %163  : i64
    %165 = llvm.mul %30, %5  : i64
    %166 = llvm.add %164, %165  : i64
    %167 = llvm.add %166, %4  : i64
    %168 = llvm.getelementptr %arg2[%167] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %169 = llvm.load %168 : !llvm.ptr -> f32
    %170 = llvm.fmul %161, %169  : f32
    %171 = llvm.fadd %151, %170  : f32
    %172 = llvm.add %30, %15  : i64
    llvm.br ^bb6(%172, %171 : i64, f32)
  ^bb8:  // pred: ^bb6
    %173 = llvm.add %27, %15  : i64
    llvm.br ^bb4(%173, %31 : i64, f32)
  ^bb9:  // pred: ^bb4
    %174 = llvm.mul %16, %14  : i64
    %175 = llvm.mul %16, %13  : i64
    %176 = llvm.add %174, %175  : i64
    %177 = llvm.mul %16, %12  : i64
    %178 = llvm.add %176, %177  : i64
    %179 = llvm.add %178, %17  : i64
    %180 = llvm.getelementptr %arg3[%179] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %28, %180 : f32, !llvm.ptr
    %181 = llvm.add %17, %15  : i64
    llvm.br ^bb2(%181 : i64)
  ^bb10:  // pred: ^bb2
    llvm.return
  }
}



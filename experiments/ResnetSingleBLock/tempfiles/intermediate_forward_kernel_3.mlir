// -----// IR Dump After ArithExpandOps (arith-expand) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 56 {
        %0 = affine.load %arg0[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
        %1 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
        %2 = arith.cmpf ugt, %0, %1 : f32
        %3 = arith.select %2, %0, %1 : f32
        %c1 = arith.constant 1 : index
        %4 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %c1] : memref<1x64x114x114xf32>
        %5 = arith.cmpf ugt, %3, %4 : f32
        %6 = arith.select %5, %3, %4 : f32
        %c2 = arith.constant 2 : index
        %7 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %c2] : memref<1x64x114x114xf32>
        %8 = arith.cmpf ugt, %6, %7 : f32
        %9 = arith.select %8, %6, %7 : f32
        %c1_1 = arith.constant 1 : index
        %10 = affine.load %arg1[0, 0, %arg3 * 2 + %c1_1, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
        %11 = arith.cmpf ugt, %9, %10 : f32
        %12 = arith.select %11, %9, %10 : f32
        %c1_2 = arith.constant 1 : index
        %13 = affine.load %arg1[0, 0, %arg3 * 2 + %c1_1, %arg4 * 2 + %c1_2] : memref<1x64x114x114xf32>
        %14 = arith.cmpf ugt, %12, %13 : f32
        %15 = arith.select %14, %12, %13 : f32
        %c2_3 = arith.constant 2 : index
        %16 = affine.load %arg1[0, 0, %arg3 * 2 + %c1_1, %arg4 * 2 + %c2_3] : memref<1x64x114x114xf32>
        %17 = arith.cmpf ugt, %15, %16 : f32
        %18 = arith.select %17, %15, %16 : f32
        %c2_4 = arith.constant 2 : index
        %19 = affine.load %arg1[0, 0, %arg3 * 2 + %c2_4, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
        %20 = arith.cmpf ugt, %18, %19 : f32
        %21 = arith.select %20, %18, %19 : f32
        %c1_5 = arith.constant 1 : index
        %22 = affine.load %arg1[0, 0, %arg3 * 2 + %c2_4, %arg4 * 2 + %c1_5] : memref<1x64x114x114xf32>
        %23 = arith.cmpf ugt, %21, %22 : f32
        %24 = arith.select %23, %21, %22 : f32
        %c2_6 = arith.constant 2 : index
        %25 = affine.load %arg1[0, 0, %arg3 * 2 + %c2_4, %arg4 * 2 + %c2_6] : memref<1x64x114x114xf32>
        %26 = arith.cmpf ugt, %24, %25 : f32
        %27 = arith.select %26, %24, %25 : f32
        affine.store %27, %arg2[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
      }
    }
    return
  }
}


// -----// IR Dump After ExpandOps (memref-expand) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    affine.for %arg3 = 0 to 4 {
      affine.for %arg4 = 0 to 56 {
        %0 = affine.load %arg0[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
        %1 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
        %2 = arith.cmpf ugt, %0, %1 : f32
        %3 = arith.select %2, %0, %1 : f32
        %c1 = arith.constant 1 : index
        %4 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %c1] : memref<1x64x114x114xf32>
        %5 = arith.cmpf ugt, %3, %4 : f32
        %6 = arith.select %5, %3, %4 : f32
        %c2 = arith.constant 2 : index
        %7 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %c2] : memref<1x64x114x114xf32>
        %8 = arith.cmpf ugt, %6, %7 : f32
        %9 = arith.select %8, %6, %7 : f32
        %c1_1 = arith.constant 1 : index
        %10 = affine.load %arg1[0, 0, %arg3 * 2 + %c1_1, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
        %11 = arith.cmpf ugt, %9, %10 : f32
        %12 = arith.select %11, %9, %10 : f32
        %c1_2 = arith.constant 1 : index
        %13 = affine.load %arg1[0, 0, %arg3 * 2 + %c1_1, %arg4 * 2 + %c1_2] : memref<1x64x114x114xf32>
        %14 = arith.cmpf ugt, %12, %13 : f32
        %15 = arith.select %14, %12, %13 : f32
        %c2_3 = arith.constant 2 : index
        %16 = affine.load %arg1[0, 0, %arg3 * 2 + %c1_1, %arg4 * 2 + %c2_3] : memref<1x64x114x114xf32>
        %17 = arith.cmpf ugt, %15, %16 : f32
        %18 = arith.select %17, %15, %16 : f32
        %c2_4 = arith.constant 2 : index
        %19 = affine.load %arg1[0, 0, %arg3 * 2 + %c2_4, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
        %20 = arith.cmpf ugt, %18, %19 : f32
        %21 = arith.select %20, %18, %19 : f32
        %c1_5 = arith.constant 1 : index
        %22 = affine.load %arg1[0, 0, %arg3 * 2 + %c2_4, %arg4 * 2 + %c1_5] : memref<1x64x114x114xf32>
        %23 = arith.cmpf ugt, %21, %22 : f32
        %24 = arith.select %23, %21, %22 : f32
        %c2_6 = arith.constant 2 : index
        %25 = affine.load %arg1[0, 0, %arg3 * 2 + %c2_4, %arg4 * 2 + %c2_6] : memref<1x64x114x114xf32>
        %26 = arith.cmpf ugt, %24, %25 : f32
        %27 = arith.select %26, %24, %25 : f32
        affine.store %27, %arg2[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
  %c0 = arith.constant 0 : index
  %c0_0 = arith.constant 0 : index
  cf.br ^bb1
^bb1:  // pred: ^bb0
  affine.for %arg3 = 0 to 4 {
    affine.for %arg4 = 0 to 56 {
      %0 = affine.load %arg0[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
      %1 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
      %2 = arith.cmpf ugt, %0, %1 : f32
      %3 = arith.select %2, %0, %1 : f32
      %c1 = arith.constant 1 : index
      %4 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %c1] : memref<1x64x114x114xf32>
      %5 = arith.cmpf ugt, %3, %4 : f32
      %6 = arith.select %5, %3, %4 : f32
      %c2 = arith.constant 2 : index
      %7 = affine.load %arg1[0, 0, %arg3 * 2 + %c0, %arg4 * 2 + %c2] : memref<1x64x114x114xf32>
      %8 = arith.cmpf ugt, %6, %7 : f32
      %9 = arith.select %8, %6, %7 : f32
      %c1_1 = arith.constant 1 : index
      %10 = affine.load %arg1[0, 0, %arg3 * 2 + %c1_1, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
      %11 = arith.cmpf ugt, %9, %10 : f32
      %12 = arith.select %11, %9, %10 : f32
      %c1_2 = arith.constant 1 : index
      %13 = affine.load %arg1[0, 0, %arg3 * 2 + %c1_1, %arg4 * 2 + %c1_2] : memref<1x64x114x114xf32>
      %14 = arith.cmpf ugt, %12, %13 : f32
      %15 = arith.select %14, %12, %13 : f32
      %c2_3 = arith.constant 2 : index
      %16 = affine.load %arg1[0, 0, %arg3 * 2 + %c1_1, %arg4 * 2 + %c2_3] : memref<1x64x114x114xf32>
      %17 = arith.cmpf ugt, %15, %16 : f32
      %18 = arith.select %17, %15, %16 : f32
      %c2_4 = arith.constant 2 : index
      %19 = affine.load %arg1[0, 0, %arg3 * 2 + %c2_4, %arg4 * 2 + %c0_0] : memref<1x64x114x114xf32>
      %20 = arith.cmpf ugt, %18, %19 : f32
      %21 = arith.select %20, %18, %19 : f32
      %c1_5 = arith.constant 1 : index
      %22 = affine.load %arg1[0, 0, %arg3 * 2 + %c2_4, %arg4 * 2 + %c1_5] : memref<1x64x114x114xf32>
      %23 = arith.cmpf ugt, %21, %22 : f32
      %24 = arith.select %23, %21, %22 : f32
      %c2_6 = arith.constant 2 : index
      %25 = affine.load %arg1[0, 0, %arg3 * 2 + %c2_4, %arg4 * 2 + %c2_6] : memref<1x64x114x114xf32>
      %26 = arith.cmpf ugt, %24, %25 : f32
      %27 = arith.select %26, %24, %25 : f32
      affine.store %27, %arg2[0, 0, %arg3, %arg4] : memref<1x64x56x56xf32>
    }
  }
  return
}

// -----// IR Dump After ConvertAffineToStandard (lower-affine) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0_1 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %c0_1 to %c4 step %c1 {
      %c0_2 = arith.constant 0 : index
      %c56 = arith.constant 56 : index
      %c1_3 = arith.constant 1 : index
      scf.for %arg4 = %c0_2 to %c56 step %c1_3 {
        %c0_4 = arith.constant 0 : index
        %c0_5 = arith.constant 0 : index
        %0 = memref.load %arg0[%c0_4, %c0_5, %arg3, %arg4] : memref<1x64x56x56xf32>
        %c0_6 = arith.constant 0 : index
        %c0_7 = arith.constant 0 : index
        %c2 = arith.constant 2 : index
        %1 = arith.muli %arg3, %c2 : index
        %2 = arith.addi %1, %c0 : index
        %c2_8 = arith.constant 2 : index
        %3 = arith.muli %arg4, %c2_8 : index
        %4 = arith.addi %3, %c0_0 : index
        %5 = memref.load %arg1[%c0_6, %c0_7, %2, %4] : memref<1x64x114x114xf32>
        %6 = arith.cmpf ugt, %0, %5 : f32
        %7 = arith.select %6, %0, %5 : f32
        %c1_9 = arith.constant 1 : index
        %c0_10 = arith.constant 0 : index
        %c0_11 = arith.constant 0 : index
        %c2_12 = arith.constant 2 : index
        %8 = arith.muli %arg3, %c2_12 : index
        %9 = arith.addi %8, %c0 : index
        %c2_13 = arith.constant 2 : index
        %10 = arith.muli %arg4, %c2_13 : index
        %11 = arith.addi %10, %c1_9 : index
        %12 = memref.load %arg1[%c0_10, %c0_11, %9, %11] : memref<1x64x114x114xf32>
        %13 = arith.cmpf ugt, %7, %12 : f32
        %14 = arith.select %13, %7, %12 : f32
        %c2_14 = arith.constant 2 : index
        %c0_15 = arith.constant 0 : index
        %c0_16 = arith.constant 0 : index
        %c2_17 = arith.constant 2 : index
        %15 = arith.muli %arg3, %c2_17 : index
        %16 = arith.addi %15, %c0 : index
        %c2_18 = arith.constant 2 : index
        %17 = arith.muli %arg4, %c2_18 : index
        %18 = arith.addi %17, %c2_14 : index
        %19 = memref.load %arg1[%c0_15, %c0_16, %16, %18] : memref<1x64x114x114xf32>
        %20 = arith.cmpf ugt, %14, %19 : f32
        %21 = arith.select %20, %14, %19 : f32
        %c1_19 = arith.constant 1 : index
        %c0_20 = arith.constant 0 : index
        %c0_21 = arith.constant 0 : index
        %c2_22 = arith.constant 2 : index
        %22 = arith.muli %arg3, %c2_22 : index
        %23 = arith.addi %22, %c1_19 : index
        %c2_23 = arith.constant 2 : index
        %24 = arith.muli %arg4, %c2_23 : index
        %25 = arith.addi %24, %c0_0 : index
        %26 = memref.load %arg1[%c0_20, %c0_21, %23, %25] : memref<1x64x114x114xf32>
        %27 = arith.cmpf ugt, %21, %26 : f32
        %28 = arith.select %27, %21, %26 : f32
        %c1_24 = arith.constant 1 : index
        %c0_25 = arith.constant 0 : index
        %c0_26 = arith.constant 0 : index
        %c2_27 = arith.constant 2 : index
        %29 = arith.muli %arg3, %c2_27 : index
        %30 = arith.addi %29, %c1_19 : index
        %c2_28 = arith.constant 2 : index
        %31 = arith.muli %arg4, %c2_28 : index
        %32 = arith.addi %31, %c1_24 : index
        %33 = memref.load %arg1[%c0_25, %c0_26, %30, %32] : memref<1x64x114x114xf32>
        %34 = arith.cmpf ugt, %28, %33 : f32
        %35 = arith.select %34, %28, %33 : f32
        %c2_29 = arith.constant 2 : index
        %c0_30 = arith.constant 0 : index
        %c0_31 = arith.constant 0 : index
        %c2_32 = arith.constant 2 : index
        %36 = arith.muli %arg3, %c2_32 : index
        %37 = arith.addi %36, %c1_19 : index
        %c2_33 = arith.constant 2 : index
        %38 = arith.muli %arg4, %c2_33 : index
        %39 = arith.addi %38, %c2_29 : index
        %40 = memref.load %arg1[%c0_30, %c0_31, %37, %39] : memref<1x64x114x114xf32>
        %41 = arith.cmpf ugt, %35, %40 : f32
        %42 = arith.select %41, %35, %40 : f32
        %c2_34 = arith.constant 2 : index
        %c0_35 = arith.constant 0 : index
        %c0_36 = arith.constant 0 : index
        %c2_37 = arith.constant 2 : index
        %43 = arith.muli %arg3, %c2_37 : index
        %44 = arith.addi %43, %c2_34 : index
        %c2_38 = arith.constant 2 : index
        %45 = arith.muli %arg4, %c2_38 : index
        %46 = arith.addi %45, %c0_0 : index
        %47 = memref.load %arg1[%c0_35, %c0_36, %44, %46] : memref<1x64x114x114xf32>
        %48 = arith.cmpf ugt, %42, %47 : f32
        %49 = arith.select %48, %42, %47 : f32
        %c1_39 = arith.constant 1 : index
        %c0_40 = arith.constant 0 : index
        %c0_41 = arith.constant 0 : index
        %c2_42 = arith.constant 2 : index
        %50 = arith.muli %arg3, %c2_42 : index
        %51 = arith.addi %50, %c2_34 : index
        %c2_43 = arith.constant 2 : index
        %52 = arith.muli %arg4, %c2_43 : index
        %53 = arith.addi %52, %c1_39 : index
        %54 = memref.load %arg1[%c0_40, %c0_41, %51, %53] : memref<1x64x114x114xf32>
        %55 = arith.cmpf ugt, %49, %54 : f32
        %56 = arith.select %55, %49, %54 : f32
        %c2_44 = arith.constant 2 : index
        %c0_45 = arith.constant 0 : index
        %c0_46 = arith.constant 0 : index
        %c2_47 = arith.constant 2 : index
        %57 = arith.muli %arg3, %c2_47 : index
        %58 = arith.addi %57, %c2_34 : index
        %c2_48 = arith.constant 2 : index
        %59 = arith.muli %arg4, %c2_48 : index
        %60 = arith.addi %59, %c2_44 : index
        %61 = memref.load %arg1[%c0_45, %c0_46, %58, %60] : memref<1x64x114x114xf32>
        %62 = arith.cmpf ugt, %56, %61 : f32
        %63 = arith.select %62, %56, %61 : f32
        %c0_49 = arith.constant 0 : index
        %c0_50 = arith.constant 0 : index
        memref.store %63, %arg2[%c0_49, %c0_50, %arg3, %arg4] : memref<1x64x56x56xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFForLoopCanonicalization (scf-for-loop-canonicalization) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %c2 = arith.constant 2 : index
    %c56 = arith.constant 56 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg3 = %c0 to %c4 step %c1 {
      scf.for %arg4 = %c0 to %c56 step %c1 {
        %0 = memref.load %arg0[%c0, %c0, %arg3, %arg4] : memref<1x64x56x56xf32>
        %1 = arith.muli %arg3, %c2 : index
        %2 = arith.muli %arg4, %c2 : index
        %3 = memref.load %arg1[%c0, %c0, %1, %2] : memref<1x64x114x114xf32>
        %4 = arith.cmpf ugt, %0, %3 : f32
        %5 = arith.select %4, %0, %3 : f32
        %6 = arith.muli %arg3, %c2 : index
        %7 = arith.muli %arg4, %c2 : index
        %8 = arith.addi %7, %c1 : index
        %9 = memref.load %arg1[%c0, %c0, %6, %8] : memref<1x64x114x114xf32>
        %10 = arith.cmpf ugt, %5, %9 : f32
        %11 = arith.select %10, %5, %9 : f32
        %12 = arith.muli %arg3, %c2 : index
        %13 = arith.muli %arg4, %c2 : index
        %14 = arith.addi %13, %c2 : index
        %15 = memref.load %arg1[%c0, %c0, %12, %14] : memref<1x64x114x114xf32>
        %16 = arith.cmpf ugt, %11, %15 : f32
        %17 = arith.select %16, %11, %15 : f32
        %18 = arith.muli %arg3, %c2 : index
        %19 = arith.addi %18, %c1 : index
        %20 = arith.muli %arg4, %c2 : index
        %21 = memref.load %arg1[%c0, %c0, %19, %20] : memref<1x64x114x114xf32>
        %22 = arith.cmpf ugt, %17, %21 : f32
        %23 = arith.select %22, %17, %21 : f32
        %24 = arith.muli %arg3, %c2 : index
        %25 = arith.addi %24, %c1 : index
        %26 = arith.muli %arg4, %c2 : index
        %27 = arith.addi %26, %c1 : index
        %28 = memref.load %arg1[%c0, %c0, %25, %27] : memref<1x64x114x114xf32>
        %29 = arith.cmpf ugt, %23, %28 : f32
        %30 = arith.select %29, %23, %28 : f32
        %31 = arith.muli %arg3, %c2 : index
        %32 = arith.addi %31, %c1 : index
        %33 = arith.muli %arg4, %c2 : index
        %34 = arith.addi %33, %c2 : index
        %35 = memref.load %arg1[%c0, %c0, %32, %34] : memref<1x64x114x114xf32>
        %36 = arith.cmpf ugt, %30, %35 : f32
        %37 = arith.select %36, %30, %35 : f32
        %38 = arith.muli %arg3, %c2 : index
        %39 = arith.addi %38, %c2 : index
        %40 = arith.muli %arg4, %c2 : index
        %41 = memref.load %arg1[%c0, %c0, %39, %40] : memref<1x64x114x114xf32>
        %42 = arith.cmpf ugt, %37, %41 : f32
        %43 = arith.select %42, %37, %41 : f32
        %44 = arith.muli %arg3, %c2 : index
        %45 = arith.addi %44, %c2 : index
        %46 = arith.muli %arg4, %c2 : index
        %47 = arith.addi %46, %c1 : index
        %48 = memref.load %arg1[%c0, %c0, %45, %47] : memref<1x64x114x114xf32>
        %49 = arith.cmpf ugt, %43, %48 : f32
        %50 = arith.select %49, %43, %48 : f32
        %51 = arith.muli %arg3, %c2 : index
        %52 = arith.addi %51, %c2 : index
        %53 = arith.muli %arg4, %c2 : index
        %54 = arith.addi %53, %c2 : index
        %55 = memref.load %arg1[%c0, %c0, %52, %54] : memref<1x64x114x114xf32>
        %56 = arith.cmpf ugt, %50, %55 : f32
        %57 = arith.select %56, %50, %55 : f32
        memref.store %57, %arg2[%c0, %c0, %arg3, %arg4] : memref<1x64x56x56xf32>
      }
    }
    return
  }
}


// -----// IR Dump After SCFToControlFlow (convert-scf-to-cf) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %c2 = arith.constant 2 : index
    %c56 = arith.constant 56 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb6
    %1 = arith.cmpi slt, %0, %c4 : index
    cf.cond_br %1, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%2: index):  // 2 preds: ^bb3, ^bb5
    %3 = arith.cmpi slt, %2, %c56 : index
    cf.cond_br %3, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %4 = memref.load %arg0[%c0, %c0, %0, %2] : memref<1x64x56x56xf32>
    %5 = arith.muli %0, %c2 : index
    %6 = arith.muli %2, %c2 : index
    %7 = memref.load %arg1[%c0, %c0, %5, %6] : memref<1x64x114x114xf32>
    %8 = arith.cmpf ugt, %4, %7 : f32
    %9 = arith.select %8, %4, %7 : f32
    %10 = arith.muli %0, %c2 : index
    %11 = arith.muli %2, %c2 : index
    %12 = arith.addi %11, %c1 : index
    %13 = memref.load %arg1[%c0, %c0, %10, %12] : memref<1x64x114x114xf32>
    %14 = arith.cmpf ugt, %9, %13 : f32
    %15 = arith.select %14, %9, %13 : f32
    %16 = arith.muli %0, %c2 : index
    %17 = arith.muli %2, %c2 : index
    %18 = arith.addi %17, %c2 : index
    %19 = memref.load %arg1[%c0, %c0, %16, %18] : memref<1x64x114x114xf32>
    %20 = arith.cmpf ugt, %15, %19 : f32
    %21 = arith.select %20, %15, %19 : f32
    %22 = arith.muli %0, %c2 : index
    %23 = arith.addi %22, %c1 : index
    %24 = arith.muli %2, %c2 : index
    %25 = memref.load %arg1[%c0, %c0, %23, %24] : memref<1x64x114x114xf32>
    %26 = arith.cmpf ugt, %21, %25 : f32
    %27 = arith.select %26, %21, %25 : f32
    %28 = arith.muli %0, %c2 : index
    %29 = arith.addi %28, %c1 : index
    %30 = arith.muli %2, %c2 : index
    %31 = arith.addi %30, %c1 : index
    %32 = memref.load %arg1[%c0, %c0, %29, %31] : memref<1x64x114x114xf32>
    %33 = arith.cmpf ugt, %27, %32 : f32
    %34 = arith.select %33, %27, %32 : f32
    %35 = arith.muli %0, %c2 : index
    %36 = arith.addi %35, %c1 : index
    %37 = arith.muli %2, %c2 : index
    %38 = arith.addi %37, %c2 : index
    %39 = memref.load %arg1[%c0, %c0, %36, %38] : memref<1x64x114x114xf32>
    %40 = arith.cmpf ugt, %34, %39 : f32
    %41 = arith.select %40, %34, %39 : f32
    %42 = arith.muli %0, %c2 : index
    %43 = arith.addi %42, %c2 : index
    %44 = arith.muli %2, %c2 : index
    %45 = memref.load %arg1[%c0, %c0, %43, %44] : memref<1x64x114x114xf32>
    %46 = arith.cmpf ugt, %41, %45 : f32
    %47 = arith.select %46, %41, %45 : f32
    %48 = arith.muli %0, %c2 : index
    %49 = arith.addi %48, %c2 : index
    %50 = arith.muli %2, %c2 : index
    %51 = arith.addi %50, %c1 : index
    %52 = memref.load %arg1[%c0, %c0, %49, %51] : memref<1x64x114x114xf32>
    %53 = arith.cmpf ugt, %47, %52 : f32
    %54 = arith.select %53, %47, %52 : f32
    %55 = arith.muli %0, %c2 : index
    %56 = arith.addi %55, %c2 : index
    %57 = arith.muli %2, %c2 : index
    %58 = arith.addi %57, %c2 : index
    %59 = memref.load %arg1[%c0, %c0, %56, %58] : memref<1x64x114x114xf32>
    %60 = arith.cmpf ugt, %54, %59 : f32
    %61 = arith.select %60, %54, %59 : f32
    memref.store %61, %arg2[%c0, %c0, %0, %2] : memref<1x64x56x56xf32>
    %62 = arith.addi %2, %c1 : index
    cf.br ^bb4(%62 : index)
  ^bb6:  // pred: ^bb4
    %63 = arith.addi %0, %c1 : index
    cf.br ^bb2(%63 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After FinalizeMemRefToLLVMConversionPass (finalize-memref-to-llvm) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x114x114xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c2 = arith.constant 2 : index
    %c56 = arith.constant 56 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %3 = builtin.unrealized_conversion_cast %c0 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%4: index):  // 2 preds: ^bb1, ^bb6
    %5 = builtin.unrealized_conversion_cast %4 : index to i64
    %6 = arith.cmpi slt, %4, %c4 : index
    cf.cond_br %6, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%7: index):  // 2 preds: ^bb3, ^bb5
    %8 = builtin.unrealized_conversion_cast %7 : index to i64
    %9 = arith.cmpi slt, %7, %c56 : index
    cf.cond_br %9, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %10 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(200704 : index) : i64
    %12 = llvm.mul %3, %11  : i64
    %13 = llvm.mlir.constant(3136 : index) : i64
    %14 = llvm.mul %3, %13  : i64
    %15 = llvm.add %12, %14  : i64
    %16 = llvm.mlir.constant(56 : index) : i64
    %17 = llvm.mul %5, %16  : i64
    %18 = llvm.add %15, %17  : i64
    %19 = llvm.add %18, %8  : i64
    %20 = llvm.getelementptr %10[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    %22 = arith.muli %4, %c2 : index
    %23 = builtin.unrealized_conversion_cast %22 : index to i64
    %24 = arith.muli %7, %c2 : index
    %25 = builtin.unrealized_conversion_cast %24 : index to i64
    %26 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %27 = llvm.mlir.constant(831744 : index) : i64
    %28 = llvm.mul %3, %27  : i64
    %29 = llvm.mlir.constant(12996 : index) : i64
    %30 = llvm.mul %3, %29  : i64
    %31 = llvm.add %28, %30  : i64
    %32 = llvm.mlir.constant(114 : index) : i64
    %33 = llvm.mul %23, %32  : i64
    %34 = llvm.add %31, %33  : i64
    %35 = llvm.add %34, %25  : i64
    %36 = llvm.getelementptr %26[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %37 = llvm.load %36 : !llvm.ptr -> f32
    %38 = arith.cmpf ugt, %21, %37 : f32
    %39 = arith.select %38, %21, %37 : f32
    %40 = arith.muli %4, %c2 : index
    %41 = builtin.unrealized_conversion_cast %40 : index to i64
    %42 = arith.muli %7, %c2 : index
    %43 = arith.addi %42, %c1 : index
    %44 = builtin.unrealized_conversion_cast %43 : index to i64
    %45 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %46 = llvm.mlir.constant(831744 : index) : i64
    %47 = llvm.mul %3, %46  : i64
    %48 = llvm.mlir.constant(12996 : index) : i64
    %49 = llvm.mul %3, %48  : i64
    %50 = llvm.add %47, %49  : i64
    %51 = llvm.mlir.constant(114 : index) : i64
    %52 = llvm.mul %41, %51  : i64
    %53 = llvm.add %50, %52  : i64
    %54 = llvm.add %53, %44  : i64
    %55 = llvm.getelementptr %45[%54] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %56 = llvm.load %55 : !llvm.ptr -> f32
    %57 = arith.cmpf ugt, %39, %56 : f32
    %58 = arith.select %57, %39, %56 : f32
    %59 = arith.muli %4, %c2 : index
    %60 = builtin.unrealized_conversion_cast %59 : index to i64
    %61 = arith.muli %7, %c2 : index
    %62 = arith.addi %61, %c2 : index
    %63 = builtin.unrealized_conversion_cast %62 : index to i64
    %64 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = llvm.mlir.constant(831744 : index) : i64
    %66 = llvm.mul %3, %65  : i64
    %67 = llvm.mlir.constant(12996 : index) : i64
    %68 = llvm.mul %3, %67  : i64
    %69 = llvm.add %66, %68  : i64
    %70 = llvm.mlir.constant(114 : index) : i64
    %71 = llvm.mul %60, %70  : i64
    %72 = llvm.add %69, %71  : i64
    %73 = llvm.add %72, %63  : i64
    %74 = llvm.getelementptr %64[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %75 = llvm.load %74 : !llvm.ptr -> f32
    %76 = arith.cmpf ugt, %58, %75 : f32
    %77 = arith.select %76, %58, %75 : f32
    %78 = arith.muli %4, %c2 : index
    %79 = arith.addi %78, %c1 : index
    %80 = builtin.unrealized_conversion_cast %79 : index to i64
    %81 = arith.muli %7, %c2 : index
    %82 = builtin.unrealized_conversion_cast %81 : index to i64
    %83 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %84 = llvm.mlir.constant(831744 : index) : i64
    %85 = llvm.mul %3, %84  : i64
    %86 = llvm.mlir.constant(12996 : index) : i64
    %87 = llvm.mul %3, %86  : i64
    %88 = llvm.add %85, %87  : i64
    %89 = llvm.mlir.constant(114 : index) : i64
    %90 = llvm.mul %80, %89  : i64
    %91 = llvm.add %88, %90  : i64
    %92 = llvm.add %91, %82  : i64
    %93 = llvm.getelementptr %83[%92] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %94 = llvm.load %93 : !llvm.ptr -> f32
    %95 = arith.cmpf ugt, %77, %94 : f32
    %96 = arith.select %95, %77, %94 : f32
    %97 = arith.muli %4, %c2 : index
    %98 = arith.addi %97, %c1 : index
    %99 = builtin.unrealized_conversion_cast %98 : index to i64
    %100 = arith.muli %7, %c2 : index
    %101 = arith.addi %100, %c1 : index
    %102 = builtin.unrealized_conversion_cast %101 : index to i64
    %103 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %104 = llvm.mlir.constant(831744 : index) : i64
    %105 = llvm.mul %3, %104  : i64
    %106 = llvm.mlir.constant(12996 : index) : i64
    %107 = llvm.mul %3, %106  : i64
    %108 = llvm.add %105, %107  : i64
    %109 = llvm.mlir.constant(114 : index) : i64
    %110 = llvm.mul %99, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.add %111, %102  : i64
    %113 = llvm.getelementptr %103[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = arith.cmpf ugt, %96, %114 : f32
    %116 = arith.select %115, %96, %114 : f32
    %117 = arith.muli %4, %c2 : index
    %118 = arith.addi %117, %c1 : index
    %119 = builtin.unrealized_conversion_cast %118 : index to i64
    %120 = arith.muli %7, %c2 : index
    %121 = arith.addi %120, %c2 : index
    %122 = builtin.unrealized_conversion_cast %121 : index to i64
    %123 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %124 = llvm.mlir.constant(831744 : index) : i64
    %125 = llvm.mul %3, %124  : i64
    %126 = llvm.mlir.constant(12996 : index) : i64
    %127 = llvm.mul %3, %126  : i64
    %128 = llvm.add %125, %127  : i64
    %129 = llvm.mlir.constant(114 : index) : i64
    %130 = llvm.mul %119, %129  : i64
    %131 = llvm.add %128, %130  : i64
    %132 = llvm.add %131, %122  : i64
    %133 = llvm.getelementptr %123[%132] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %134 = llvm.load %133 : !llvm.ptr -> f32
    %135 = arith.cmpf ugt, %116, %134 : f32
    %136 = arith.select %135, %116, %134 : f32
    %137 = arith.muli %4, %c2 : index
    %138 = arith.addi %137, %c2 : index
    %139 = builtin.unrealized_conversion_cast %138 : index to i64
    %140 = arith.muli %7, %c2 : index
    %141 = builtin.unrealized_conversion_cast %140 : index to i64
    %142 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %143 = llvm.mlir.constant(831744 : index) : i64
    %144 = llvm.mul %3, %143  : i64
    %145 = llvm.mlir.constant(12996 : index) : i64
    %146 = llvm.mul %3, %145  : i64
    %147 = llvm.add %144, %146  : i64
    %148 = llvm.mlir.constant(114 : index) : i64
    %149 = llvm.mul %139, %148  : i64
    %150 = llvm.add %147, %149  : i64
    %151 = llvm.add %150, %141  : i64
    %152 = llvm.getelementptr %142[%151] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %153 = llvm.load %152 : !llvm.ptr -> f32
    %154 = arith.cmpf ugt, %136, %153 : f32
    %155 = arith.select %154, %136, %153 : f32
    %156 = arith.muli %4, %c2 : index
    %157 = arith.addi %156, %c2 : index
    %158 = builtin.unrealized_conversion_cast %157 : index to i64
    %159 = arith.muli %7, %c2 : index
    %160 = arith.addi %159, %c1 : index
    %161 = builtin.unrealized_conversion_cast %160 : index to i64
    %162 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %163 = llvm.mlir.constant(831744 : index) : i64
    %164 = llvm.mul %3, %163  : i64
    %165 = llvm.mlir.constant(12996 : index) : i64
    %166 = llvm.mul %3, %165  : i64
    %167 = llvm.add %164, %166  : i64
    %168 = llvm.mlir.constant(114 : index) : i64
    %169 = llvm.mul %158, %168  : i64
    %170 = llvm.add %167, %169  : i64
    %171 = llvm.add %170, %161  : i64
    %172 = llvm.getelementptr %162[%171] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %173 = llvm.load %172 : !llvm.ptr -> f32
    %174 = arith.cmpf ugt, %155, %173 : f32
    %175 = arith.select %174, %155, %173 : f32
    %176 = arith.muli %4, %c2 : index
    %177 = arith.addi %176, %c2 : index
    %178 = builtin.unrealized_conversion_cast %177 : index to i64
    %179 = arith.muli %7, %c2 : index
    %180 = arith.addi %179, %c2 : index
    %181 = builtin.unrealized_conversion_cast %180 : index to i64
    %182 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %183 = llvm.mlir.constant(831744 : index) : i64
    %184 = llvm.mul %3, %183  : i64
    %185 = llvm.mlir.constant(12996 : index) : i64
    %186 = llvm.mul %3, %185  : i64
    %187 = llvm.add %184, %186  : i64
    %188 = llvm.mlir.constant(114 : index) : i64
    %189 = llvm.mul %178, %188  : i64
    %190 = llvm.add %187, %189  : i64
    %191 = llvm.add %190, %181  : i64
    %192 = llvm.getelementptr %182[%191] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %193 = llvm.load %192 : !llvm.ptr -> f32
    %194 = arith.cmpf ugt, %175, %193 : f32
    %195 = arith.select %194, %175, %193 : f32
    %196 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %197 = llvm.mlir.constant(200704 : index) : i64
    %198 = llvm.mul %3, %197  : i64
    %199 = llvm.mlir.constant(3136 : index) : i64
    %200 = llvm.mul %3, %199  : i64
    %201 = llvm.add %198, %200  : i64
    %202 = llvm.mlir.constant(56 : index) : i64
    %203 = llvm.mul %5, %202  : i64
    %204 = llvm.add %201, %203  : i64
    %205 = llvm.add %204, %8  : i64
    %206 = llvm.getelementptr %196[%205] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %195, %206 : f32, !llvm.ptr
    %207 = arith.addi %7, %c1 : index
    cf.br ^bb4(%207 : index)
  ^bb6:  // pred: ^bb4
    %208 = arith.addi %4, %c1 : index
    cf.br ^bb2(%208 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLLVMPass (convert-math-to-llvm) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x114x114xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c2 = arith.constant 2 : index
    %c56 = arith.constant 56 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %3 = builtin.unrealized_conversion_cast %c0 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%4: index):  // 2 preds: ^bb1, ^bb6
    %5 = builtin.unrealized_conversion_cast %4 : index to i64
    %6 = arith.cmpi slt, %4, %c4 : index
    cf.cond_br %6, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%7: index):  // 2 preds: ^bb3, ^bb5
    %8 = builtin.unrealized_conversion_cast %7 : index to i64
    %9 = arith.cmpi slt, %7, %c56 : index
    cf.cond_br %9, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %10 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(200704 : index) : i64
    %12 = llvm.mul %3, %11  : i64
    %13 = llvm.mlir.constant(3136 : index) : i64
    %14 = llvm.mul %3, %13  : i64
    %15 = llvm.add %12, %14  : i64
    %16 = llvm.mlir.constant(56 : index) : i64
    %17 = llvm.mul %5, %16  : i64
    %18 = llvm.add %15, %17  : i64
    %19 = llvm.add %18, %8  : i64
    %20 = llvm.getelementptr %10[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    %22 = arith.muli %4, %c2 : index
    %23 = builtin.unrealized_conversion_cast %22 : index to i64
    %24 = arith.muli %7, %c2 : index
    %25 = builtin.unrealized_conversion_cast %24 : index to i64
    %26 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %27 = llvm.mlir.constant(831744 : index) : i64
    %28 = llvm.mul %3, %27  : i64
    %29 = llvm.mlir.constant(12996 : index) : i64
    %30 = llvm.mul %3, %29  : i64
    %31 = llvm.add %28, %30  : i64
    %32 = llvm.mlir.constant(114 : index) : i64
    %33 = llvm.mul %23, %32  : i64
    %34 = llvm.add %31, %33  : i64
    %35 = llvm.add %34, %25  : i64
    %36 = llvm.getelementptr %26[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %37 = llvm.load %36 : !llvm.ptr -> f32
    %38 = arith.cmpf ugt, %21, %37 : f32
    %39 = arith.select %38, %21, %37 : f32
    %40 = arith.muli %4, %c2 : index
    %41 = builtin.unrealized_conversion_cast %40 : index to i64
    %42 = arith.muli %7, %c2 : index
    %43 = arith.addi %42, %c1 : index
    %44 = builtin.unrealized_conversion_cast %43 : index to i64
    %45 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %46 = llvm.mlir.constant(831744 : index) : i64
    %47 = llvm.mul %3, %46  : i64
    %48 = llvm.mlir.constant(12996 : index) : i64
    %49 = llvm.mul %3, %48  : i64
    %50 = llvm.add %47, %49  : i64
    %51 = llvm.mlir.constant(114 : index) : i64
    %52 = llvm.mul %41, %51  : i64
    %53 = llvm.add %50, %52  : i64
    %54 = llvm.add %53, %44  : i64
    %55 = llvm.getelementptr %45[%54] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %56 = llvm.load %55 : !llvm.ptr -> f32
    %57 = arith.cmpf ugt, %39, %56 : f32
    %58 = arith.select %57, %39, %56 : f32
    %59 = arith.muli %4, %c2 : index
    %60 = builtin.unrealized_conversion_cast %59 : index to i64
    %61 = arith.muli %7, %c2 : index
    %62 = arith.addi %61, %c2 : index
    %63 = builtin.unrealized_conversion_cast %62 : index to i64
    %64 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = llvm.mlir.constant(831744 : index) : i64
    %66 = llvm.mul %3, %65  : i64
    %67 = llvm.mlir.constant(12996 : index) : i64
    %68 = llvm.mul %3, %67  : i64
    %69 = llvm.add %66, %68  : i64
    %70 = llvm.mlir.constant(114 : index) : i64
    %71 = llvm.mul %60, %70  : i64
    %72 = llvm.add %69, %71  : i64
    %73 = llvm.add %72, %63  : i64
    %74 = llvm.getelementptr %64[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %75 = llvm.load %74 : !llvm.ptr -> f32
    %76 = arith.cmpf ugt, %58, %75 : f32
    %77 = arith.select %76, %58, %75 : f32
    %78 = arith.muli %4, %c2 : index
    %79 = arith.addi %78, %c1 : index
    %80 = builtin.unrealized_conversion_cast %79 : index to i64
    %81 = arith.muli %7, %c2 : index
    %82 = builtin.unrealized_conversion_cast %81 : index to i64
    %83 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %84 = llvm.mlir.constant(831744 : index) : i64
    %85 = llvm.mul %3, %84  : i64
    %86 = llvm.mlir.constant(12996 : index) : i64
    %87 = llvm.mul %3, %86  : i64
    %88 = llvm.add %85, %87  : i64
    %89 = llvm.mlir.constant(114 : index) : i64
    %90 = llvm.mul %80, %89  : i64
    %91 = llvm.add %88, %90  : i64
    %92 = llvm.add %91, %82  : i64
    %93 = llvm.getelementptr %83[%92] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %94 = llvm.load %93 : !llvm.ptr -> f32
    %95 = arith.cmpf ugt, %77, %94 : f32
    %96 = arith.select %95, %77, %94 : f32
    %97 = arith.muli %4, %c2 : index
    %98 = arith.addi %97, %c1 : index
    %99 = builtin.unrealized_conversion_cast %98 : index to i64
    %100 = arith.muli %7, %c2 : index
    %101 = arith.addi %100, %c1 : index
    %102 = builtin.unrealized_conversion_cast %101 : index to i64
    %103 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %104 = llvm.mlir.constant(831744 : index) : i64
    %105 = llvm.mul %3, %104  : i64
    %106 = llvm.mlir.constant(12996 : index) : i64
    %107 = llvm.mul %3, %106  : i64
    %108 = llvm.add %105, %107  : i64
    %109 = llvm.mlir.constant(114 : index) : i64
    %110 = llvm.mul %99, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.add %111, %102  : i64
    %113 = llvm.getelementptr %103[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = arith.cmpf ugt, %96, %114 : f32
    %116 = arith.select %115, %96, %114 : f32
    %117 = arith.muli %4, %c2 : index
    %118 = arith.addi %117, %c1 : index
    %119 = builtin.unrealized_conversion_cast %118 : index to i64
    %120 = arith.muli %7, %c2 : index
    %121 = arith.addi %120, %c2 : index
    %122 = builtin.unrealized_conversion_cast %121 : index to i64
    %123 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %124 = llvm.mlir.constant(831744 : index) : i64
    %125 = llvm.mul %3, %124  : i64
    %126 = llvm.mlir.constant(12996 : index) : i64
    %127 = llvm.mul %3, %126  : i64
    %128 = llvm.add %125, %127  : i64
    %129 = llvm.mlir.constant(114 : index) : i64
    %130 = llvm.mul %119, %129  : i64
    %131 = llvm.add %128, %130  : i64
    %132 = llvm.add %131, %122  : i64
    %133 = llvm.getelementptr %123[%132] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %134 = llvm.load %133 : !llvm.ptr -> f32
    %135 = arith.cmpf ugt, %116, %134 : f32
    %136 = arith.select %135, %116, %134 : f32
    %137 = arith.muli %4, %c2 : index
    %138 = arith.addi %137, %c2 : index
    %139 = builtin.unrealized_conversion_cast %138 : index to i64
    %140 = arith.muli %7, %c2 : index
    %141 = builtin.unrealized_conversion_cast %140 : index to i64
    %142 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %143 = llvm.mlir.constant(831744 : index) : i64
    %144 = llvm.mul %3, %143  : i64
    %145 = llvm.mlir.constant(12996 : index) : i64
    %146 = llvm.mul %3, %145  : i64
    %147 = llvm.add %144, %146  : i64
    %148 = llvm.mlir.constant(114 : index) : i64
    %149 = llvm.mul %139, %148  : i64
    %150 = llvm.add %147, %149  : i64
    %151 = llvm.add %150, %141  : i64
    %152 = llvm.getelementptr %142[%151] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %153 = llvm.load %152 : !llvm.ptr -> f32
    %154 = arith.cmpf ugt, %136, %153 : f32
    %155 = arith.select %154, %136, %153 : f32
    %156 = arith.muli %4, %c2 : index
    %157 = arith.addi %156, %c2 : index
    %158 = builtin.unrealized_conversion_cast %157 : index to i64
    %159 = arith.muli %7, %c2 : index
    %160 = arith.addi %159, %c1 : index
    %161 = builtin.unrealized_conversion_cast %160 : index to i64
    %162 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %163 = llvm.mlir.constant(831744 : index) : i64
    %164 = llvm.mul %3, %163  : i64
    %165 = llvm.mlir.constant(12996 : index) : i64
    %166 = llvm.mul %3, %165  : i64
    %167 = llvm.add %164, %166  : i64
    %168 = llvm.mlir.constant(114 : index) : i64
    %169 = llvm.mul %158, %168  : i64
    %170 = llvm.add %167, %169  : i64
    %171 = llvm.add %170, %161  : i64
    %172 = llvm.getelementptr %162[%171] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %173 = llvm.load %172 : !llvm.ptr -> f32
    %174 = arith.cmpf ugt, %155, %173 : f32
    %175 = arith.select %174, %155, %173 : f32
    %176 = arith.muli %4, %c2 : index
    %177 = arith.addi %176, %c2 : index
    %178 = builtin.unrealized_conversion_cast %177 : index to i64
    %179 = arith.muli %7, %c2 : index
    %180 = arith.addi %179, %c2 : index
    %181 = builtin.unrealized_conversion_cast %180 : index to i64
    %182 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %183 = llvm.mlir.constant(831744 : index) : i64
    %184 = llvm.mul %3, %183  : i64
    %185 = llvm.mlir.constant(12996 : index) : i64
    %186 = llvm.mul %3, %185  : i64
    %187 = llvm.add %184, %186  : i64
    %188 = llvm.mlir.constant(114 : index) : i64
    %189 = llvm.mul %178, %188  : i64
    %190 = llvm.add %187, %189  : i64
    %191 = llvm.add %190, %181  : i64
    %192 = llvm.getelementptr %182[%191] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %193 = llvm.load %192 : !llvm.ptr -> f32
    %194 = arith.cmpf ugt, %175, %193 : f32
    %195 = arith.select %194, %175, %193 : f32
    %196 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %197 = llvm.mlir.constant(200704 : index) : i64
    %198 = llvm.mul %3, %197  : i64
    %199 = llvm.mlir.constant(3136 : index) : i64
    %200 = llvm.mul %3, %199  : i64
    %201 = llvm.add %198, %200  : i64
    %202 = llvm.mlir.constant(56 : index) : i64
    %203 = llvm.mul %5, %202  : i64
    %204 = llvm.add %201, %203  : i64
    %205 = llvm.add %204, %8  : i64
    %206 = llvm.getelementptr %196[%205] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %195, %206 : f32, !llvm.ptr
    %207 = arith.addi %7, %c1 : index
    cf.br ^bb4(%207 : index)
  ^bb6:  // pred: ^bb4
    %208 = arith.addi %4, %c1 : index
    cf.br ^bb2(%208 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertMathToLibm (convert-math-to-libm) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x114x114xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %c2 = arith.constant 2 : index
    %c56 = arith.constant 56 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %3 = builtin.unrealized_conversion_cast %c0 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%c0 : index)
  ^bb2(%4: index):  // 2 preds: ^bb1, ^bb6
    %5 = builtin.unrealized_conversion_cast %4 : index to i64
    %6 = arith.cmpi slt, %4, %c4 : index
    cf.cond_br %6, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%c0 : index)
  ^bb4(%7: index):  // 2 preds: ^bb3, ^bb5
    %8 = builtin.unrealized_conversion_cast %7 : index to i64
    %9 = arith.cmpi slt, %7, %c56 : index
    cf.cond_br %9, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %10 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(200704 : index) : i64
    %12 = llvm.mul %3, %11  : i64
    %13 = llvm.mlir.constant(3136 : index) : i64
    %14 = llvm.mul %3, %13  : i64
    %15 = llvm.add %12, %14  : i64
    %16 = llvm.mlir.constant(56 : index) : i64
    %17 = llvm.mul %5, %16  : i64
    %18 = llvm.add %15, %17  : i64
    %19 = llvm.add %18, %8  : i64
    %20 = llvm.getelementptr %10[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    %22 = arith.muli %4, %c2 : index
    %23 = builtin.unrealized_conversion_cast %22 : index to i64
    %24 = arith.muli %7, %c2 : index
    %25 = builtin.unrealized_conversion_cast %24 : index to i64
    %26 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %27 = llvm.mlir.constant(831744 : index) : i64
    %28 = llvm.mul %3, %27  : i64
    %29 = llvm.mlir.constant(12996 : index) : i64
    %30 = llvm.mul %3, %29  : i64
    %31 = llvm.add %28, %30  : i64
    %32 = llvm.mlir.constant(114 : index) : i64
    %33 = llvm.mul %23, %32  : i64
    %34 = llvm.add %31, %33  : i64
    %35 = llvm.add %34, %25  : i64
    %36 = llvm.getelementptr %26[%35] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %37 = llvm.load %36 : !llvm.ptr -> f32
    %38 = arith.cmpf ugt, %21, %37 : f32
    %39 = arith.select %38, %21, %37 : f32
    %40 = arith.muli %4, %c2 : index
    %41 = builtin.unrealized_conversion_cast %40 : index to i64
    %42 = arith.muli %7, %c2 : index
    %43 = arith.addi %42, %c1 : index
    %44 = builtin.unrealized_conversion_cast %43 : index to i64
    %45 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %46 = llvm.mlir.constant(831744 : index) : i64
    %47 = llvm.mul %3, %46  : i64
    %48 = llvm.mlir.constant(12996 : index) : i64
    %49 = llvm.mul %3, %48  : i64
    %50 = llvm.add %47, %49  : i64
    %51 = llvm.mlir.constant(114 : index) : i64
    %52 = llvm.mul %41, %51  : i64
    %53 = llvm.add %50, %52  : i64
    %54 = llvm.add %53, %44  : i64
    %55 = llvm.getelementptr %45[%54] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %56 = llvm.load %55 : !llvm.ptr -> f32
    %57 = arith.cmpf ugt, %39, %56 : f32
    %58 = arith.select %57, %39, %56 : f32
    %59 = arith.muli %4, %c2 : index
    %60 = builtin.unrealized_conversion_cast %59 : index to i64
    %61 = arith.muli %7, %c2 : index
    %62 = arith.addi %61, %c2 : index
    %63 = builtin.unrealized_conversion_cast %62 : index to i64
    %64 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = llvm.mlir.constant(831744 : index) : i64
    %66 = llvm.mul %3, %65  : i64
    %67 = llvm.mlir.constant(12996 : index) : i64
    %68 = llvm.mul %3, %67  : i64
    %69 = llvm.add %66, %68  : i64
    %70 = llvm.mlir.constant(114 : index) : i64
    %71 = llvm.mul %60, %70  : i64
    %72 = llvm.add %69, %71  : i64
    %73 = llvm.add %72, %63  : i64
    %74 = llvm.getelementptr %64[%73] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %75 = llvm.load %74 : !llvm.ptr -> f32
    %76 = arith.cmpf ugt, %58, %75 : f32
    %77 = arith.select %76, %58, %75 : f32
    %78 = arith.muli %4, %c2 : index
    %79 = arith.addi %78, %c1 : index
    %80 = builtin.unrealized_conversion_cast %79 : index to i64
    %81 = arith.muli %7, %c2 : index
    %82 = builtin.unrealized_conversion_cast %81 : index to i64
    %83 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %84 = llvm.mlir.constant(831744 : index) : i64
    %85 = llvm.mul %3, %84  : i64
    %86 = llvm.mlir.constant(12996 : index) : i64
    %87 = llvm.mul %3, %86  : i64
    %88 = llvm.add %85, %87  : i64
    %89 = llvm.mlir.constant(114 : index) : i64
    %90 = llvm.mul %80, %89  : i64
    %91 = llvm.add %88, %90  : i64
    %92 = llvm.add %91, %82  : i64
    %93 = llvm.getelementptr %83[%92] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %94 = llvm.load %93 : !llvm.ptr -> f32
    %95 = arith.cmpf ugt, %77, %94 : f32
    %96 = arith.select %95, %77, %94 : f32
    %97 = arith.muli %4, %c2 : index
    %98 = arith.addi %97, %c1 : index
    %99 = builtin.unrealized_conversion_cast %98 : index to i64
    %100 = arith.muli %7, %c2 : index
    %101 = arith.addi %100, %c1 : index
    %102 = builtin.unrealized_conversion_cast %101 : index to i64
    %103 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %104 = llvm.mlir.constant(831744 : index) : i64
    %105 = llvm.mul %3, %104  : i64
    %106 = llvm.mlir.constant(12996 : index) : i64
    %107 = llvm.mul %3, %106  : i64
    %108 = llvm.add %105, %107  : i64
    %109 = llvm.mlir.constant(114 : index) : i64
    %110 = llvm.mul %99, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.add %111, %102  : i64
    %113 = llvm.getelementptr %103[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = arith.cmpf ugt, %96, %114 : f32
    %116 = arith.select %115, %96, %114 : f32
    %117 = arith.muli %4, %c2 : index
    %118 = arith.addi %117, %c1 : index
    %119 = builtin.unrealized_conversion_cast %118 : index to i64
    %120 = arith.muli %7, %c2 : index
    %121 = arith.addi %120, %c2 : index
    %122 = builtin.unrealized_conversion_cast %121 : index to i64
    %123 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %124 = llvm.mlir.constant(831744 : index) : i64
    %125 = llvm.mul %3, %124  : i64
    %126 = llvm.mlir.constant(12996 : index) : i64
    %127 = llvm.mul %3, %126  : i64
    %128 = llvm.add %125, %127  : i64
    %129 = llvm.mlir.constant(114 : index) : i64
    %130 = llvm.mul %119, %129  : i64
    %131 = llvm.add %128, %130  : i64
    %132 = llvm.add %131, %122  : i64
    %133 = llvm.getelementptr %123[%132] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %134 = llvm.load %133 : !llvm.ptr -> f32
    %135 = arith.cmpf ugt, %116, %134 : f32
    %136 = arith.select %135, %116, %134 : f32
    %137 = arith.muli %4, %c2 : index
    %138 = arith.addi %137, %c2 : index
    %139 = builtin.unrealized_conversion_cast %138 : index to i64
    %140 = arith.muli %7, %c2 : index
    %141 = builtin.unrealized_conversion_cast %140 : index to i64
    %142 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %143 = llvm.mlir.constant(831744 : index) : i64
    %144 = llvm.mul %3, %143  : i64
    %145 = llvm.mlir.constant(12996 : index) : i64
    %146 = llvm.mul %3, %145  : i64
    %147 = llvm.add %144, %146  : i64
    %148 = llvm.mlir.constant(114 : index) : i64
    %149 = llvm.mul %139, %148  : i64
    %150 = llvm.add %147, %149  : i64
    %151 = llvm.add %150, %141  : i64
    %152 = llvm.getelementptr %142[%151] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %153 = llvm.load %152 : !llvm.ptr -> f32
    %154 = arith.cmpf ugt, %136, %153 : f32
    %155 = arith.select %154, %136, %153 : f32
    %156 = arith.muli %4, %c2 : index
    %157 = arith.addi %156, %c2 : index
    %158 = builtin.unrealized_conversion_cast %157 : index to i64
    %159 = arith.muli %7, %c2 : index
    %160 = arith.addi %159, %c1 : index
    %161 = builtin.unrealized_conversion_cast %160 : index to i64
    %162 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %163 = llvm.mlir.constant(831744 : index) : i64
    %164 = llvm.mul %3, %163  : i64
    %165 = llvm.mlir.constant(12996 : index) : i64
    %166 = llvm.mul %3, %165  : i64
    %167 = llvm.add %164, %166  : i64
    %168 = llvm.mlir.constant(114 : index) : i64
    %169 = llvm.mul %158, %168  : i64
    %170 = llvm.add %167, %169  : i64
    %171 = llvm.add %170, %161  : i64
    %172 = llvm.getelementptr %162[%171] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %173 = llvm.load %172 : !llvm.ptr -> f32
    %174 = arith.cmpf ugt, %155, %173 : f32
    %175 = arith.select %174, %155, %173 : f32
    %176 = arith.muli %4, %c2 : index
    %177 = arith.addi %176, %c2 : index
    %178 = builtin.unrealized_conversion_cast %177 : index to i64
    %179 = arith.muli %7, %c2 : index
    %180 = arith.addi %179, %c2 : index
    %181 = builtin.unrealized_conversion_cast %180 : index to i64
    %182 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %183 = llvm.mlir.constant(831744 : index) : i64
    %184 = llvm.mul %3, %183  : i64
    %185 = llvm.mlir.constant(12996 : index) : i64
    %186 = llvm.mul %3, %185  : i64
    %187 = llvm.add %184, %186  : i64
    %188 = llvm.mlir.constant(114 : index) : i64
    %189 = llvm.mul %178, %188  : i64
    %190 = llvm.add %187, %189  : i64
    %191 = llvm.add %190, %181  : i64
    %192 = llvm.getelementptr %182[%191] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %193 = llvm.load %192 : !llvm.ptr -> f32
    %194 = arith.cmpf ugt, %175, %193 : f32
    %195 = arith.select %194, %175, %193 : f32
    %196 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %197 = llvm.mlir.constant(200704 : index) : i64
    %198 = llvm.mul %3, %197  : i64
    %199 = llvm.mlir.constant(3136 : index) : i64
    %200 = llvm.mul %3, %199  : i64
    %201 = llvm.add %198, %200  : i64
    %202 = llvm.mlir.constant(56 : index) : i64
    %203 = llvm.mul %5, %202  : i64
    %204 = llvm.add %201, %203  : i64
    %205 = llvm.add %204, %8  : i64
    %206 = llvm.getelementptr %196[%205] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %195, %206 : f32, !llvm.ptr
    %207 = arith.addi %7, %c1 : index
    cf.br ^bb4(%207 : index)
  ^bb6:  // pred: ^bb4
    %208 = arith.addi %4, %c1 : index
    cf.br ^bb2(%208 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ArithToLLVMConversionPass (convert-arith-to-llvm) //----- //
module {
  func.func @forward_kernel_3(%arg0: memref<1x64x56x56xf32>, %arg1: memref<1x64x114x114xf32>, %arg2: memref<1x64x56x56xf32>) attributes {Kernel, forward_kernel_3} {
    %0 = builtin.unrealized_conversion_cast %arg0 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = builtin.unrealized_conversion_cast %arg1 : memref<1x64x114x114xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %2 = builtin.unrealized_conversion_cast %arg2 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %3 = llvm.mlir.constant(2 : index) : i64
    %4 = llvm.mlir.constant(56 : index) : i64
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(4 : index) : i64
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = builtin.unrealized_conversion_cast %7 : i64 to index
    %9 = builtin.unrealized_conversion_cast %8 : index to i64
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.br ^bb2(%8 : index)
  ^bb2(%10: index):  // 2 preds: ^bb1, ^bb6
    %11 = builtin.unrealized_conversion_cast %10 : index to i64
    %12 = builtin.unrealized_conversion_cast %10 : index to i64
    %13 = llvm.icmp "slt" %11, %6 : i64
    cf.cond_br %13, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    cf.br ^bb4(%8 : index)
  ^bb4(%14: index):  // 2 preds: ^bb3, ^bb5
    %15 = builtin.unrealized_conversion_cast %14 : index to i64
    %16 = builtin.unrealized_conversion_cast %14 : index to i64
    %17 = llvm.icmp "slt" %15, %4 : i64
    cf.cond_br %17, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %18 = llvm.extractvalue %0[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(200704 : index) : i64
    %20 = llvm.mul %9, %19  : i64
    %21 = llvm.mlir.constant(3136 : index) : i64
    %22 = llvm.mul %9, %21  : i64
    %23 = llvm.add %20, %22  : i64
    %24 = llvm.mlir.constant(56 : index) : i64
    %25 = llvm.mul %12, %24  : i64
    %26 = llvm.add %23, %25  : i64
    %27 = llvm.add %26, %16  : i64
    %28 = llvm.getelementptr %18[%27] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %29 = llvm.load %28 : !llvm.ptr -> f32
    %30 = llvm.mul %11, %3  : i64
    %31 = builtin.unrealized_conversion_cast %30 : i64 to index
    %32 = builtin.unrealized_conversion_cast %31 : index to i64
    %33 = llvm.mul %15, %3  : i64
    %34 = builtin.unrealized_conversion_cast %33 : i64 to index
    %35 = builtin.unrealized_conversion_cast %34 : index to i64
    %36 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(831744 : index) : i64
    %38 = llvm.mul %9, %37  : i64
    %39 = llvm.mlir.constant(12996 : index) : i64
    %40 = llvm.mul %9, %39  : i64
    %41 = llvm.add %38, %40  : i64
    %42 = llvm.mlir.constant(114 : index) : i64
    %43 = llvm.mul %32, %42  : i64
    %44 = llvm.add %41, %43  : i64
    %45 = llvm.add %44, %35  : i64
    %46 = llvm.getelementptr %36[%45] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %47 = llvm.load %46 : !llvm.ptr -> f32
    %48 = llvm.fcmp "ugt" %29, %47 : f32
    %49 = llvm.select %48, %29, %47 : i1, f32
    %50 = llvm.mul %11, %3  : i64
    %51 = builtin.unrealized_conversion_cast %50 : i64 to index
    %52 = builtin.unrealized_conversion_cast %51 : index to i64
    %53 = llvm.mul %15, %3  : i64
    %54 = llvm.add %53, %5  : i64
    %55 = builtin.unrealized_conversion_cast %54 : i64 to index
    %56 = builtin.unrealized_conversion_cast %55 : index to i64
    %57 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %58 = llvm.mlir.constant(831744 : index) : i64
    %59 = llvm.mul %9, %58  : i64
    %60 = llvm.mlir.constant(12996 : index) : i64
    %61 = llvm.mul %9, %60  : i64
    %62 = llvm.add %59, %61  : i64
    %63 = llvm.mlir.constant(114 : index) : i64
    %64 = llvm.mul %52, %63  : i64
    %65 = llvm.add %62, %64  : i64
    %66 = llvm.add %65, %56  : i64
    %67 = llvm.getelementptr %57[%66] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %68 = llvm.load %67 : !llvm.ptr -> f32
    %69 = llvm.fcmp "ugt" %49, %68 : f32
    %70 = llvm.select %69, %49, %68 : i1, f32
    %71 = llvm.mul %11, %3  : i64
    %72 = builtin.unrealized_conversion_cast %71 : i64 to index
    %73 = builtin.unrealized_conversion_cast %72 : index to i64
    %74 = llvm.mul %15, %3  : i64
    %75 = llvm.add %74, %3  : i64
    %76 = builtin.unrealized_conversion_cast %75 : i64 to index
    %77 = builtin.unrealized_conversion_cast %76 : index to i64
    %78 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %79 = llvm.mlir.constant(831744 : index) : i64
    %80 = llvm.mul %9, %79  : i64
    %81 = llvm.mlir.constant(12996 : index) : i64
    %82 = llvm.mul %9, %81  : i64
    %83 = llvm.add %80, %82  : i64
    %84 = llvm.mlir.constant(114 : index) : i64
    %85 = llvm.mul %73, %84  : i64
    %86 = llvm.add %83, %85  : i64
    %87 = llvm.add %86, %77  : i64
    %88 = llvm.getelementptr %78[%87] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %89 = llvm.load %88 : !llvm.ptr -> f32
    %90 = llvm.fcmp "ugt" %70, %89 : f32
    %91 = llvm.select %90, %70, %89 : i1, f32
    %92 = llvm.mul %11, %3  : i64
    %93 = llvm.add %92, %5  : i64
    %94 = builtin.unrealized_conversion_cast %93 : i64 to index
    %95 = builtin.unrealized_conversion_cast %94 : index to i64
    %96 = llvm.mul %15, %3  : i64
    %97 = builtin.unrealized_conversion_cast %96 : i64 to index
    %98 = builtin.unrealized_conversion_cast %97 : index to i64
    %99 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %100 = llvm.mlir.constant(831744 : index) : i64
    %101 = llvm.mul %9, %100  : i64
    %102 = llvm.mlir.constant(12996 : index) : i64
    %103 = llvm.mul %9, %102  : i64
    %104 = llvm.add %101, %103  : i64
    %105 = llvm.mlir.constant(114 : index) : i64
    %106 = llvm.mul %95, %105  : i64
    %107 = llvm.add %104, %106  : i64
    %108 = llvm.add %107, %98  : i64
    %109 = llvm.getelementptr %99[%108] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %110 = llvm.load %109 : !llvm.ptr -> f32
    %111 = llvm.fcmp "ugt" %91, %110 : f32
    %112 = llvm.select %111, %91, %110 : i1, f32
    %113 = llvm.mul %11, %3  : i64
    %114 = llvm.add %113, %5  : i64
    %115 = builtin.unrealized_conversion_cast %114 : i64 to index
    %116 = builtin.unrealized_conversion_cast %115 : index to i64
    %117 = llvm.mul %15, %3  : i64
    %118 = llvm.add %117, %5  : i64
    %119 = builtin.unrealized_conversion_cast %118 : i64 to index
    %120 = builtin.unrealized_conversion_cast %119 : index to i64
    %121 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %122 = llvm.mlir.constant(831744 : index) : i64
    %123 = llvm.mul %9, %122  : i64
    %124 = llvm.mlir.constant(12996 : index) : i64
    %125 = llvm.mul %9, %124  : i64
    %126 = llvm.add %123, %125  : i64
    %127 = llvm.mlir.constant(114 : index) : i64
    %128 = llvm.mul %116, %127  : i64
    %129 = llvm.add %126, %128  : i64
    %130 = llvm.add %129, %120  : i64
    %131 = llvm.getelementptr %121[%130] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %132 = llvm.load %131 : !llvm.ptr -> f32
    %133 = llvm.fcmp "ugt" %112, %132 : f32
    %134 = llvm.select %133, %112, %132 : i1, f32
    %135 = llvm.mul %11, %3  : i64
    %136 = llvm.add %135, %5  : i64
    %137 = builtin.unrealized_conversion_cast %136 : i64 to index
    %138 = builtin.unrealized_conversion_cast %137 : index to i64
    %139 = llvm.mul %15, %3  : i64
    %140 = llvm.add %139, %3  : i64
    %141 = builtin.unrealized_conversion_cast %140 : i64 to index
    %142 = builtin.unrealized_conversion_cast %141 : index to i64
    %143 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %144 = llvm.mlir.constant(831744 : index) : i64
    %145 = llvm.mul %9, %144  : i64
    %146 = llvm.mlir.constant(12996 : index) : i64
    %147 = llvm.mul %9, %146  : i64
    %148 = llvm.add %145, %147  : i64
    %149 = llvm.mlir.constant(114 : index) : i64
    %150 = llvm.mul %138, %149  : i64
    %151 = llvm.add %148, %150  : i64
    %152 = llvm.add %151, %142  : i64
    %153 = llvm.getelementptr %143[%152] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %154 = llvm.load %153 : !llvm.ptr -> f32
    %155 = llvm.fcmp "ugt" %134, %154 : f32
    %156 = llvm.select %155, %134, %154 : i1, f32
    %157 = llvm.mul %11, %3  : i64
    %158 = llvm.add %157, %3  : i64
    %159 = builtin.unrealized_conversion_cast %158 : i64 to index
    %160 = builtin.unrealized_conversion_cast %159 : index to i64
    %161 = llvm.mul %15, %3  : i64
    %162 = builtin.unrealized_conversion_cast %161 : i64 to index
    %163 = builtin.unrealized_conversion_cast %162 : index to i64
    %164 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %165 = llvm.mlir.constant(831744 : index) : i64
    %166 = llvm.mul %9, %165  : i64
    %167 = llvm.mlir.constant(12996 : index) : i64
    %168 = llvm.mul %9, %167  : i64
    %169 = llvm.add %166, %168  : i64
    %170 = llvm.mlir.constant(114 : index) : i64
    %171 = llvm.mul %160, %170  : i64
    %172 = llvm.add %169, %171  : i64
    %173 = llvm.add %172, %163  : i64
    %174 = llvm.getelementptr %164[%173] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %175 = llvm.load %174 : !llvm.ptr -> f32
    %176 = llvm.fcmp "ugt" %156, %175 : f32
    %177 = llvm.select %176, %156, %175 : i1, f32
    %178 = llvm.mul %11, %3  : i64
    %179 = llvm.add %178, %3  : i64
    %180 = builtin.unrealized_conversion_cast %179 : i64 to index
    %181 = builtin.unrealized_conversion_cast %180 : index to i64
    %182 = llvm.mul %15, %3  : i64
    %183 = llvm.add %182, %5  : i64
    %184 = builtin.unrealized_conversion_cast %183 : i64 to index
    %185 = builtin.unrealized_conversion_cast %184 : index to i64
    %186 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %187 = llvm.mlir.constant(831744 : index) : i64
    %188 = llvm.mul %9, %187  : i64
    %189 = llvm.mlir.constant(12996 : index) : i64
    %190 = llvm.mul %9, %189  : i64
    %191 = llvm.add %188, %190  : i64
    %192 = llvm.mlir.constant(114 : index) : i64
    %193 = llvm.mul %181, %192  : i64
    %194 = llvm.add %191, %193  : i64
    %195 = llvm.add %194, %185  : i64
    %196 = llvm.getelementptr %186[%195] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %197 = llvm.load %196 : !llvm.ptr -> f32
    %198 = llvm.fcmp "ugt" %177, %197 : f32
    %199 = llvm.select %198, %177, %197 : i1, f32
    %200 = llvm.mul %11, %3  : i64
    %201 = llvm.add %200, %3  : i64
    %202 = builtin.unrealized_conversion_cast %201 : i64 to index
    %203 = builtin.unrealized_conversion_cast %202 : index to i64
    %204 = llvm.mul %15, %3  : i64
    %205 = llvm.add %204, %3  : i64
    %206 = builtin.unrealized_conversion_cast %205 : i64 to index
    %207 = builtin.unrealized_conversion_cast %206 : index to i64
    %208 = llvm.extractvalue %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %209 = llvm.mlir.constant(831744 : index) : i64
    %210 = llvm.mul %9, %209  : i64
    %211 = llvm.mlir.constant(12996 : index) : i64
    %212 = llvm.mul %9, %211  : i64
    %213 = llvm.add %210, %212  : i64
    %214 = llvm.mlir.constant(114 : index) : i64
    %215 = llvm.mul %203, %214  : i64
    %216 = llvm.add %213, %215  : i64
    %217 = llvm.add %216, %207  : i64
    %218 = llvm.getelementptr %208[%217] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %219 = llvm.load %218 : !llvm.ptr -> f32
    %220 = llvm.fcmp "ugt" %199, %219 : f32
    %221 = llvm.select %220, %199, %219 : i1, f32
    %222 = llvm.extractvalue %2[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %223 = llvm.mlir.constant(200704 : index) : i64
    %224 = llvm.mul %9, %223  : i64
    %225 = llvm.mlir.constant(3136 : index) : i64
    %226 = llvm.mul %9, %225  : i64
    %227 = llvm.add %224, %226  : i64
    %228 = llvm.mlir.constant(56 : index) : i64
    %229 = llvm.mul %12, %228  : i64
    %230 = llvm.add %227, %229  : i64
    %231 = llvm.add %230, %16  : i64
    %232 = llvm.getelementptr %222[%231] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %221, %232 : f32, !llvm.ptr
    %233 = llvm.add %15, %5  : i64
    %234 = builtin.unrealized_conversion_cast %233 : i64 to index
    cf.br ^bb4(%234 : index)
  ^bb6:  // pred: ^bb4
    %235 = llvm.add %11, %5  : i64
    %236 = builtin.unrealized_conversion_cast %235 : i64 to index
    cf.br ^bb2(%236 : index)
  ^bb7:  // pred: ^bb2
    return
  }
}


// -----// IR Dump After ConvertFuncToLLVMPass (convert-func-to-llvm) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_3(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_3} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(200704 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(3136 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(56 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(56 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(56 : index) : i64
    %18 = llvm.insertvalue %17, %16[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %19 = llvm.mlir.constant(1 : index) : i64
    %20 = llvm.insertvalue %19, %18[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %21 = builtin.unrealized_conversion_cast %20 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x56x56xf32>
    %22 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %23 = llvm.insertvalue %arg1, %22[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %24 = llvm.insertvalue %arg1, %23[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %25 = llvm.mlir.constant(0 : index) : i64
    %26 = llvm.insertvalue %25, %24[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %27 = llvm.mlir.constant(1 : index) : i64
    %28 = llvm.insertvalue %27, %26[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %29 = llvm.mlir.constant(831744 : index) : i64
    %30 = llvm.insertvalue %29, %28[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %31 = llvm.mlir.constant(64 : index) : i64
    %32 = llvm.insertvalue %31, %30[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %33 = llvm.mlir.constant(12996 : index) : i64
    %34 = llvm.insertvalue %33, %32[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %35 = llvm.mlir.constant(114 : index) : i64
    %36 = llvm.insertvalue %35, %34[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %37 = llvm.mlir.constant(114 : index) : i64
    %38 = llvm.insertvalue %37, %36[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %39 = llvm.mlir.constant(114 : index) : i64
    %40 = llvm.insertvalue %39, %38[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %41 = llvm.mlir.constant(1 : index) : i64
    %42 = llvm.insertvalue %41, %40[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %43 = builtin.unrealized_conversion_cast %42 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x114x114xf32>
    %44 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %45 = llvm.insertvalue %arg2, %44[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %46 = llvm.insertvalue %arg2, %45[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(0 : index) : i64
    %48 = llvm.insertvalue %47, %46[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(1 : index) : i64
    %50 = llvm.insertvalue %49, %48[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(200704 : index) : i64
    %52 = llvm.insertvalue %51, %50[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(64 : index) : i64
    %54 = llvm.insertvalue %53, %52[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(3136 : index) : i64
    %56 = llvm.insertvalue %55, %54[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(56 : index) : i64
    %58 = llvm.insertvalue %57, %56[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(56 : index) : i64
    %60 = llvm.insertvalue %59, %58[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %61 = llvm.mlir.constant(56 : index) : i64
    %62 = llvm.insertvalue %61, %60[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %63 = llvm.mlir.constant(1 : index) : i64
    %64 = llvm.insertvalue %63, %62[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %65 = builtin.unrealized_conversion_cast %64 : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> to memref<1x64x56x56xf32>
    %66 = builtin.unrealized_conversion_cast %21 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %67 = builtin.unrealized_conversion_cast %43 : memref<1x64x114x114xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %68 = builtin.unrealized_conversion_cast %65 : memref<1x64x56x56xf32> to !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %69 = llvm.mlir.constant(2 : index) : i64
    %70 = llvm.mlir.constant(56 : index) : i64
    %71 = llvm.mlir.constant(1 : index) : i64
    %72 = llvm.mlir.constant(4 : index) : i64
    %73 = llvm.mlir.constant(0 : index) : i64
    %74 = builtin.unrealized_conversion_cast %73 : i64 to index
    %75 = builtin.unrealized_conversion_cast %74 : index to i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%73 : i64)
  ^bb2(%76: i64):  // 2 preds: ^bb1, ^bb6
    %77 = builtin.unrealized_conversion_cast %76 : i64 to index
    %78 = builtin.unrealized_conversion_cast %77 : index to i64
    %79 = builtin.unrealized_conversion_cast %77 : index to i64
    %80 = llvm.icmp "slt" %78, %72 : i64
    llvm.cond_br %80, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%73 : i64)
  ^bb4(%81: i64):  // 2 preds: ^bb3, ^bb5
    %82 = builtin.unrealized_conversion_cast %81 : i64 to index
    %83 = builtin.unrealized_conversion_cast %82 : index to i64
    %84 = builtin.unrealized_conversion_cast %82 : index to i64
    %85 = llvm.icmp "slt" %83, %70 : i64
    llvm.cond_br %85, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %86 = llvm.extractvalue %66[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %87 = llvm.mlir.constant(200704 : index) : i64
    %88 = llvm.mul %75, %87  : i64
    %89 = llvm.mlir.constant(3136 : index) : i64
    %90 = llvm.mul %75, %89  : i64
    %91 = llvm.add %88, %90  : i64
    %92 = llvm.mlir.constant(56 : index) : i64
    %93 = llvm.mul %79, %92  : i64
    %94 = llvm.add %91, %93  : i64
    %95 = llvm.add %94, %84  : i64
    %96 = llvm.getelementptr %86[%95] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %97 = llvm.load %96 : !llvm.ptr -> f32
    %98 = llvm.mul %78, %69  : i64
    %99 = builtin.unrealized_conversion_cast %98 : i64 to index
    %100 = builtin.unrealized_conversion_cast %99 : index to i64
    %101 = llvm.mul %83, %69  : i64
    %102 = builtin.unrealized_conversion_cast %101 : i64 to index
    %103 = builtin.unrealized_conversion_cast %102 : index to i64
    %104 = llvm.extractvalue %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %105 = llvm.mlir.constant(831744 : index) : i64
    %106 = llvm.mul %75, %105  : i64
    %107 = llvm.mlir.constant(12996 : index) : i64
    %108 = llvm.mul %75, %107  : i64
    %109 = llvm.add %106, %108  : i64
    %110 = llvm.mlir.constant(114 : index) : i64
    %111 = llvm.mul %100, %110  : i64
    %112 = llvm.add %109, %111  : i64
    %113 = llvm.add %112, %103  : i64
    %114 = llvm.getelementptr %104[%113] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %115 = llvm.load %114 : !llvm.ptr -> f32
    %116 = llvm.fcmp "ugt" %97, %115 : f32
    %117 = llvm.select %116, %97, %115 : i1, f32
    %118 = llvm.mul %78, %69  : i64
    %119 = builtin.unrealized_conversion_cast %118 : i64 to index
    %120 = builtin.unrealized_conversion_cast %119 : index to i64
    %121 = llvm.mul %83, %69  : i64
    %122 = llvm.add %121, %71  : i64
    %123 = builtin.unrealized_conversion_cast %122 : i64 to index
    %124 = builtin.unrealized_conversion_cast %123 : index to i64
    %125 = llvm.extractvalue %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %126 = llvm.mlir.constant(831744 : index) : i64
    %127 = llvm.mul %75, %126  : i64
    %128 = llvm.mlir.constant(12996 : index) : i64
    %129 = llvm.mul %75, %128  : i64
    %130 = llvm.add %127, %129  : i64
    %131 = llvm.mlir.constant(114 : index) : i64
    %132 = llvm.mul %120, %131  : i64
    %133 = llvm.add %130, %132  : i64
    %134 = llvm.add %133, %124  : i64
    %135 = llvm.getelementptr %125[%134] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %136 = llvm.load %135 : !llvm.ptr -> f32
    %137 = llvm.fcmp "ugt" %117, %136 : f32
    %138 = llvm.select %137, %117, %136 : i1, f32
    %139 = llvm.mul %78, %69  : i64
    %140 = builtin.unrealized_conversion_cast %139 : i64 to index
    %141 = builtin.unrealized_conversion_cast %140 : index to i64
    %142 = llvm.mul %83, %69  : i64
    %143 = llvm.add %142, %69  : i64
    %144 = builtin.unrealized_conversion_cast %143 : i64 to index
    %145 = builtin.unrealized_conversion_cast %144 : index to i64
    %146 = llvm.extractvalue %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %147 = llvm.mlir.constant(831744 : index) : i64
    %148 = llvm.mul %75, %147  : i64
    %149 = llvm.mlir.constant(12996 : index) : i64
    %150 = llvm.mul %75, %149  : i64
    %151 = llvm.add %148, %150  : i64
    %152 = llvm.mlir.constant(114 : index) : i64
    %153 = llvm.mul %141, %152  : i64
    %154 = llvm.add %151, %153  : i64
    %155 = llvm.add %154, %145  : i64
    %156 = llvm.getelementptr %146[%155] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %157 = llvm.load %156 : !llvm.ptr -> f32
    %158 = llvm.fcmp "ugt" %138, %157 : f32
    %159 = llvm.select %158, %138, %157 : i1, f32
    %160 = llvm.mul %78, %69  : i64
    %161 = llvm.add %160, %71  : i64
    %162 = builtin.unrealized_conversion_cast %161 : i64 to index
    %163 = builtin.unrealized_conversion_cast %162 : index to i64
    %164 = llvm.mul %83, %69  : i64
    %165 = builtin.unrealized_conversion_cast %164 : i64 to index
    %166 = builtin.unrealized_conversion_cast %165 : index to i64
    %167 = llvm.extractvalue %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %168 = llvm.mlir.constant(831744 : index) : i64
    %169 = llvm.mul %75, %168  : i64
    %170 = llvm.mlir.constant(12996 : index) : i64
    %171 = llvm.mul %75, %170  : i64
    %172 = llvm.add %169, %171  : i64
    %173 = llvm.mlir.constant(114 : index) : i64
    %174 = llvm.mul %163, %173  : i64
    %175 = llvm.add %172, %174  : i64
    %176 = llvm.add %175, %166  : i64
    %177 = llvm.getelementptr %167[%176] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %178 = llvm.load %177 : !llvm.ptr -> f32
    %179 = llvm.fcmp "ugt" %159, %178 : f32
    %180 = llvm.select %179, %159, %178 : i1, f32
    %181 = llvm.mul %78, %69  : i64
    %182 = llvm.add %181, %71  : i64
    %183 = builtin.unrealized_conversion_cast %182 : i64 to index
    %184 = builtin.unrealized_conversion_cast %183 : index to i64
    %185 = llvm.mul %83, %69  : i64
    %186 = llvm.add %185, %71  : i64
    %187 = builtin.unrealized_conversion_cast %186 : i64 to index
    %188 = builtin.unrealized_conversion_cast %187 : index to i64
    %189 = llvm.extractvalue %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %190 = llvm.mlir.constant(831744 : index) : i64
    %191 = llvm.mul %75, %190  : i64
    %192 = llvm.mlir.constant(12996 : index) : i64
    %193 = llvm.mul %75, %192  : i64
    %194 = llvm.add %191, %193  : i64
    %195 = llvm.mlir.constant(114 : index) : i64
    %196 = llvm.mul %184, %195  : i64
    %197 = llvm.add %194, %196  : i64
    %198 = llvm.add %197, %188  : i64
    %199 = llvm.getelementptr %189[%198] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %200 = llvm.load %199 : !llvm.ptr -> f32
    %201 = llvm.fcmp "ugt" %180, %200 : f32
    %202 = llvm.select %201, %180, %200 : i1, f32
    %203 = llvm.mul %78, %69  : i64
    %204 = llvm.add %203, %71  : i64
    %205 = builtin.unrealized_conversion_cast %204 : i64 to index
    %206 = builtin.unrealized_conversion_cast %205 : index to i64
    %207 = llvm.mul %83, %69  : i64
    %208 = llvm.add %207, %69  : i64
    %209 = builtin.unrealized_conversion_cast %208 : i64 to index
    %210 = builtin.unrealized_conversion_cast %209 : index to i64
    %211 = llvm.extractvalue %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %212 = llvm.mlir.constant(831744 : index) : i64
    %213 = llvm.mul %75, %212  : i64
    %214 = llvm.mlir.constant(12996 : index) : i64
    %215 = llvm.mul %75, %214  : i64
    %216 = llvm.add %213, %215  : i64
    %217 = llvm.mlir.constant(114 : index) : i64
    %218 = llvm.mul %206, %217  : i64
    %219 = llvm.add %216, %218  : i64
    %220 = llvm.add %219, %210  : i64
    %221 = llvm.getelementptr %211[%220] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %222 = llvm.load %221 : !llvm.ptr -> f32
    %223 = llvm.fcmp "ugt" %202, %222 : f32
    %224 = llvm.select %223, %202, %222 : i1, f32
    %225 = llvm.mul %78, %69  : i64
    %226 = llvm.add %225, %69  : i64
    %227 = builtin.unrealized_conversion_cast %226 : i64 to index
    %228 = builtin.unrealized_conversion_cast %227 : index to i64
    %229 = llvm.mul %83, %69  : i64
    %230 = builtin.unrealized_conversion_cast %229 : i64 to index
    %231 = builtin.unrealized_conversion_cast %230 : index to i64
    %232 = llvm.extractvalue %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %233 = llvm.mlir.constant(831744 : index) : i64
    %234 = llvm.mul %75, %233  : i64
    %235 = llvm.mlir.constant(12996 : index) : i64
    %236 = llvm.mul %75, %235  : i64
    %237 = llvm.add %234, %236  : i64
    %238 = llvm.mlir.constant(114 : index) : i64
    %239 = llvm.mul %228, %238  : i64
    %240 = llvm.add %237, %239  : i64
    %241 = llvm.add %240, %231  : i64
    %242 = llvm.getelementptr %232[%241] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %243 = llvm.load %242 : !llvm.ptr -> f32
    %244 = llvm.fcmp "ugt" %224, %243 : f32
    %245 = llvm.select %244, %224, %243 : i1, f32
    %246 = llvm.mul %78, %69  : i64
    %247 = llvm.add %246, %69  : i64
    %248 = builtin.unrealized_conversion_cast %247 : i64 to index
    %249 = builtin.unrealized_conversion_cast %248 : index to i64
    %250 = llvm.mul %83, %69  : i64
    %251 = llvm.add %250, %71  : i64
    %252 = builtin.unrealized_conversion_cast %251 : i64 to index
    %253 = builtin.unrealized_conversion_cast %252 : index to i64
    %254 = llvm.extractvalue %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %255 = llvm.mlir.constant(831744 : index) : i64
    %256 = llvm.mul %75, %255  : i64
    %257 = llvm.mlir.constant(12996 : index) : i64
    %258 = llvm.mul %75, %257  : i64
    %259 = llvm.add %256, %258  : i64
    %260 = llvm.mlir.constant(114 : index) : i64
    %261 = llvm.mul %249, %260  : i64
    %262 = llvm.add %259, %261  : i64
    %263 = llvm.add %262, %253  : i64
    %264 = llvm.getelementptr %254[%263] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %265 = llvm.load %264 : !llvm.ptr -> f32
    %266 = llvm.fcmp "ugt" %245, %265 : f32
    %267 = llvm.select %266, %245, %265 : i1, f32
    %268 = llvm.mul %78, %69  : i64
    %269 = llvm.add %268, %69  : i64
    %270 = builtin.unrealized_conversion_cast %269 : i64 to index
    %271 = builtin.unrealized_conversion_cast %270 : index to i64
    %272 = llvm.mul %83, %69  : i64
    %273 = llvm.add %272, %69  : i64
    %274 = builtin.unrealized_conversion_cast %273 : i64 to index
    %275 = builtin.unrealized_conversion_cast %274 : index to i64
    %276 = llvm.extractvalue %67[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %277 = llvm.mlir.constant(831744 : index) : i64
    %278 = llvm.mul %75, %277  : i64
    %279 = llvm.mlir.constant(12996 : index) : i64
    %280 = llvm.mul %75, %279  : i64
    %281 = llvm.add %278, %280  : i64
    %282 = llvm.mlir.constant(114 : index) : i64
    %283 = llvm.mul %271, %282  : i64
    %284 = llvm.add %281, %283  : i64
    %285 = llvm.add %284, %275  : i64
    %286 = llvm.getelementptr %276[%285] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %287 = llvm.load %286 : !llvm.ptr -> f32
    %288 = llvm.fcmp "ugt" %267, %287 : f32
    %289 = llvm.select %288, %267, %287 : i1, f32
    %290 = llvm.extractvalue %68[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %291 = llvm.mlir.constant(200704 : index) : i64
    %292 = llvm.mul %75, %291  : i64
    %293 = llvm.mlir.constant(3136 : index) : i64
    %294 = llvm.mul %75, %293  : i64
    %295 = llvm.add %292, %294  : i64
    %296 = llvm.mlir.constant(56 : index) : i64
    %297 = llvm.mul %79, %296  : i64
    %298 = llvm.add %295, %297  : i64
    %299 = llvm.add %298, %84  : i64
    %300 = llvm.getelementptr %290[%299] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %289, %300 : f32, !llvm.ptr
    %301 = llvm.add %83, %71  : i64
    %302 = builtin.unrealized_conversion_cast %301 : i64 to index
    llvm.br ^bb4(%301 : i64)
  ^bb6:  // pred: ^bb4
    %303 = llvm.add %78, %71  : i64
    %304 = builtin.unrealized_conversion_cast %303 : i64 to index
    llvm.br ^bb2(%303 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After ReconcileUnrealizedCasts (reconcile-unrealized-casts) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_3(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_3} {
    %0 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %1 = llvm.insertvalue %arg0, %0[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %2 = llvm.insertvalue %arg0, %1[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.insertvalue %3, %2[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.insertvalue %5, %4[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %7 = llvm.mlir.constant(200704 : index) : i64
    %8 = llvm.insertvalue %7, %6[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %9 = llvm.mlir.constant(64 : index) : i64
    %10 = llvm.insertvalue %9, %8[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %11 = llvm.mlir.constant(3136 : index) : i64
    %12 = llvm.insertvalue %11, %10[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %13 = llvm.mlir.constant(56 : index) : i64
    %14 = llvm.insertvalue %13, %12[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %15 = llvm.mlir.constant(56 : index) : i64
    %16 = llvm.insertvalue %15, %14[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %17 = llvm.mlir.constant(56 : index) : i64
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
    %28 = llvm.mlir.constant(831744 : index) : i64
    %29 = llvm.insertvalue %28, %27[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %30 = llvm.mlir.constant(64 : index) : i64
    %31 = llvm.insertvalue %30, %29[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %32 = llvm.mlir.constant(12996 : index) : i64
    %33 = llvm.insertvalue %32, %31[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %34 = llvm.mlir.constant(114 : index) : i64
    %35 = llvm.insertvalue %34, %33[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %36 = llvm.mlir.constant(114 : index) : i64
    %37 = llvm.insertvalue %36, %35[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %38 = llvm.mlir.constant(114 : index) : i64
    %39 = llvm.insertvalue %38, %37[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %40 = llvm.mlir.constant(1 : index) : i64
    %41 = llvm.insertvalue %40, %39[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %42 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)>
    %43 = llvm.insertvalue %arg2, %42[0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %44 = llvm.insertvalue %arg2, %43[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %45 = llvm.mlir.constant(0 : index) : i64
    %46 = llvm.insertvalue %45, %44[2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %47 = llvm.mlir.constant(1 : index) : i64
    %48 = llvm.insertvalue %47, %46[3, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %49 = llvm.mlir.constant(200704 : index) : i64
    %50 = llvm.insertvalue %49, %48[4, 0] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %51 = llvm.mlir.constant(64 : index) : i64
    %52 = llvm.insertvalue %51, %50[3, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %53 = llvm.mlir.constant(3136 : index) : i64
    %54 = llvm.insertvalue %53, %52[4, 1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %55 = llvm.mlir.constant(56 : index) : i64
    %56 = llvm.insertvalue %55, %54[3, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %57 = llvm.mlir.constant(56 : index) : i64
    %58 = llvm.insertvalue %57, %56[4, 2] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %59 = llvm.mlir.constant(56 : index) : i64
    %60 = llvm.insertvalue %59, %58[3, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %61 = llvm.mlir.constant(1 : index) : i64
    %62 = llvm.insertvalue %61, %60[4, 3] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %63 = llvm.mlir.constant(2 : index) : i64
    %64 = llvm.mlir.constant(56 : index) : i64
    %65 = llvm.mlir.constant(1 : index) : i64
    %66 = llvm.mlir.constant(4 : index) : i64
    %67 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%67 : i64)
  ^bb2(%68: i64):  // 2 preds: ^bb1, ^bb6
    %69 = llvm.icmp "slt" %68, %66 : i64
    llvm.cond_br %69, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%67 : i64)
  ^bb4(%70: i64):  // 2 preds: ^bb3, ^bb5
    %71 = llvm.icmp "slt" %70, %64 : i64
    llvm.cond_br %71, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %72 = llvm.extractvalue %20[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %73 = llvm.mlir.constant(200704 : index) : i64
    %74 = llvm.mul %67, %73  : i64
    %75 = llvm.mlir.constant(3136 : index) : i64
    %76 = llvm.mul %67, %75  : i64
    %77 = llvm.add %74, %76  : i64
    %78 = llvm.mlir.constant(56 : index) : i64
    %79 = llvm.mul %68, %78  : i64
    %80 = llvm.add %77, %79  : i64
    %81 = llvm.add %80, %70  : i64
    %82 = llvm.getelementptr %72[%81] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %83 = llvm.load %82 : !llvm.ptr -> f32
    %84 = llvm.mul %68, %63  : i64
    %85 = llvm.mul %70, %63  : i64
    %86 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %87 = llvm.mlir.constant(831744 : index) : i64
    %88 = llvm.mul %67, %87  : i64
    %89 = llvm.mlir.constant(12996 : index) : i64
    %90 = llvm.mul %67, %89  : i64
    %91 = llvm.add %88, %90  : i64
    %92 = llvm.mlir.constant(114 : index) : i64
    %93 = llvm.mul %84, %92  : i64
    %94 = llvm.add %91, %93  : i64
    %95 = llvm.add %94, %85  : i64
    %96 = llvm.getelementptr %86[%95] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %97 = llvm.load %96 : !llvm.ptr -> f32
    %98 = llvm.fcmp "ugt" %83, %97 : f32
    %99 = llvm.select %98, %83, %97 : i1, f32
    %100 = llvm.mul %68, %63  : i64
    %101 = llvm.mul %70, %63  : i64
    %102 = llvm.add %101, %65  : i64
    %103 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %104 = llvm.mlir.constant(831744 : index) : i64
    %105 = llvm.mul %67, %104  : i64
    %106 = llvm.mlir.constant(12996 : index) : i64
    %107 = llvm.mul %67, %106  : i64
    %108 = llvm.add %105, %107  : i64
    %109 = llvm.mlir.constant(114 : index) : i64
    %110 = llvm.mul %100, %109  : i64
    %111 = llvm.add %108, %110  : i64
    %112 = llvm.add %111, %102  : i64
    %113 = llvm.getelementptr %103[%112] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %114 = llvm.load %113 : !llvm.ptr -> f32
    %115 = llvm.fcmp "ugt" %99, %114 : f32
    %116 = llvm.select %115, %99, %114 : i1, f32
    %117 = llvm.mul %68, %63  : i64
    %118 = llvm.mul %70, %63  : i64
    %119 = llvm.add %118, %63  : i64
    %120 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %121 = llvm.mlir.constant(831744 : index) : i64
    %122 = llvm.mul %67, %121  : i64
    %123 = llvm.mlir.constant(12996 : index) : i64
    %124 = llvm.mul %67, %123  : i64
    %125 = llvm.add %122, %124  : i64
    %126 = llvm.mlir.constant(114 : index) : i64
    %127 = llvm.mul %117, %126  : i64
    %128 = llvm.add %125, %127  : i64
    %129 = llvm.add %128, %119  : i64
    %130 = llvm.getelementptr %120[%129] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %131 = llvm.load %130 : !llvm.ptr -> f32
    %132 = llvm.fcmp "ugt" %116, %131 : f32
    %133 = llvm.select %132, %116, %131 : i1, f32
    %134 = llvm.mul %68, %63  : i64
    %135 = llvm.add %134, %65  : i64
    %136 = llvm.mul %70, %63  : i64
    %137 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %138 = llvm.mlir.constant(831744 : index) : i64
    %139 = llvm.mul %67, %138  : i64
    %140 = llvm.mlir.constant(12996 : index) : i64
    %141 = llvm.mul %67, %140  : i64
    %142 = llvm.add %139, %141  : i64
    %143 = llvm.mlir.constant(114 : index) : i64
    %144 = llvm.mul %135, %143  : i64
    %145 = llvm.add %142, %144  : i64
    %146 = llvm.add %145, %136  : i64
    %147 = llvm.getelementptr %137[%146] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %148 = llvm.load %147 : !llvm.ptr -> f32
    %149 = llvm.fcmp "ugt" %133, %148 : f32
    %150 = llvm.select %149, %133, %148 : i1, f32
    %151 = llvm.mul %68, %63  : i64
    %152 = llvm.add %151, %65  : i64
    %153 = llvm.mul %70, %63  : i64
    %154 = llvm.add %153, %65  : i64
    %155 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %156 = llvm.mlir.constant(831744 : index) : i64
    %157 = llvm.mul %67, %156  : i64
    %158 = llvm.mlir.constant(12996 : index) : i64
    %159 = llvm.mul %67, %158  : i64
    %160 = llvm.add %157, %159  : i64
    %161 = llvm.mlir.constant(114 : index) : i64
    %162 = llvm.mul %152, %161  : i64
    %163 = llvm.add %160, %162  : i64
    %164 = llvm.add %163, %154  : i64
    %165 = llvm.getelementptr %155[%164] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %166 = llvm.load %165 : !llvm.ptr -> f32
    %167 = llvm.fcmp "ugt" %150, %166 : f32
    %168 = llvm.select %167, %150, %166 : i1, f32
    %169 = llvm.mul %68, %63  : i64
    %170 = llvm.add %169, %65  : i64
    %171 = llvm.mul %70, %63  : i64
    %172 = llvm.add %171, %63  : i64
    %173 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %174 = llvm.mlir.constant(831744 : index) : i64
    %175 = llvm.mul %67, %174  : i64
    %176 = llvm.mlir.constant(12996 : index) : i64
    %177 = llvm.mul %67, %176  : i64
    %178 = llvm.add %175, %177  : i64
    %179 = llvm.mlir.constant(114 : index) : i64
    %180 = llvm.mul %170, %179  : i64
    %181 = llvm.add %178, %180  : i64
    %182 = llvm.add %181, %172  : i64
    %183 = llvm.getelementptr %173[%182] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %184 = llvm.load %183 : !llvm.ptr -> f32
    %185 = llvm.fcmp "ugt" %168, %184 : f32
    %186 = llvm.select %185, %168, %184 : i1, f32
    %187 = llvm.mul %68, %63  : i64
    %188 = llvm.add %187, %63  : i64
    %189 = llvm.mul %70, %63  : i64
    %190 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %191 = llvm.mlir.constant(831744 : index) : i64
    %192 = llvm.mul %67, %191  : i64
    %193 = llvm.mlir.constant(12996 : index) : i64
    %194 = llvm.mul %67, %193  : i64
    %195 = llvm.add %192, %194  : i64
    %196 = llvm.mlir.constant(114 : index) : i64
    %197 = llvm.mul %188, %196  : i64
    %198 = llvm.add %195, %197  : i64
    %199 = llvm.add %198, %189  : i64
    %200 = llvm.getelementptr %190[%199] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %201 = llvm.load %200 : !llvm.ptr -> f32
    %202 = llvm.fcmp "ugt" %186, %201 : f32
    %203 = llvm.select %202, %186, %201 : i1, f32
    %204 = llvm.mul %68, %63  : i64
    %205 = llvm.add %204, %63  : i64
    %206 = llvm.mul %70, %63  : i64
    %207 = llvm.add %206, %65  : i64
    %208 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %209 = llvm.mlir.constant(831744 : index) : i64
    %210 = llvm.mul %67, %209  : i64
    %211 = llvm.mlir.constant(12996 : index) : i64
    %212 = llvm.mul %67, %211  : i64
    %213 = llvm.add %210, %212  : i64
    %214 = llvm.mlir.constant(114 : index) : i64
    %215 = llvm.mul %205, %214  : i64
    %216 = llvm.add %213, %215  : i64
    %217 = llvm.add %216, %207  : i64
    %218 = llvm.getelementptr %208[%217] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %219 = llvm.load %218 : !llvm.ptr -> f32
    %220 = llvm.fcmp "ugt" %203, %219 : f32
    %221 = llvm.select %220, %203, %219 : i1, f32
    %222 = llvm.mul %68, %63  : i64
    %223 = llvm.add %222, %63  : i64
    %224 = llvm.mul %70, %63  : i64
    %225 = llvm.add %224, %63  : i64
    %226 = llvm.extractvalue %41[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %227 = llvm.mlir.constant(831744 : index) : i64
    %228 = llvm.mul %67, %227  : i64
    %229 = llvm.mlir.constant(12996 : index) : i64
    %230 = llvm.mul %67, %229  : i64
    %231 = llvm.add %228, %230  : i64
    %232 = llvm.mlir.constant(114 : index) : i64
    %233 = llvm.mul %223, %232  : i64
    %234 = llvm.add %231, %233  : i64
    %235 = llvm.add %234, %225  : i64
    %236 = llvm.getelementptr %226[%235] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %237 = llvm.load %236 : !llvm.ptr -> f32
    %238 = llvm.fcmp "ugt" %221, %237 : f32
    %239 = llvm.select %238, %221, %237 : i1, f32
    %240 = llvm.extractvalue %62[1] : !llvm.struct<(ptr, ptr, i64, array<4 x i64>, array<4 x i64>)> 
    %241 = llvm.mlir.constant(200704 : index) : i64
    %242 = llvm.mul %67, %241  : i64
    %243 = llvm.mlir.constant(3136 : index) : i64
    %244 = llvm.mul %67, %243  : i64
    %245 = llvm.add %242, %244  : i64
    %246 = llvm.mlir.constant(56 : index) : i64
    %247 = llvm.mul %68, %246  : i64
    %248 = llvm.add %245, %247  : i64
    %249 = llvm.add %248, %70  : i64
    %250 = llvm.getelementptr %240[%249] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %239, %250 : f32, !llvm.ptr
    %251 = llvm.add %70, %65  : i64
    llvm.br ^bb4(%251 : i64)
  ^bb6:  // pred: ^bb4
    %252 = llvm.add %68, %65  : i64
    llvm.br ^bb2(%252 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}


// -----// IR Dump After Canonicalizer (canonicalize) //----- //
module attributes {llvm.data_layout = ""} {
  llvm.func @forward_kernel_3(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr) attributes {Kernel, forward_kernel_3} {
    %0 = llvm.mlir.constant(4 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(114 : index) : i64
    %3 = llvm.mlir.constant(12996 : index) : i64
    %4 = llvm.mlir.constant(831744 : index) : i64
    %5 = llvm.mlir.constant(56 : index) : i64
    %6 = llvm.mlir.constant(3136 : index) : i64
    %7 = llvm.mlir.constant(200704 : index) : i64
    %8 = llvm.mlir.constant(1 : index) : i64
    %9 = llvm.mlir.constant(0 : index) : i64
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%9 : i64)
  ^bb2(%10: i64):  // 2 preds: ^bb1, ^bb6
    %11 = llvm.icmp "slt" %10, %0 : i64
    llvm.cond_br %11, ^bb3, ^bb7
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%9 : i64)
  ^bb4(%12: i64):  // 2 preds: ^bb3, ^bb5
    %13 = llvm.icmp "slt" %12, %5 : i64
    llvm.cond_br %13, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %14 = llvm.mul %9, %7  : i64
    %15 = llvm.mul %9, %6  : i64
    %16 = llvm.add %14, %15  : i64
    %17 = llvm.mul %10, %5  : i64
    %18 = llvm.add %16, %17  : i64
    %19 = llvm.add %18, %12  : i64
    %20 = llvm.getelementptr %arg0[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %21 = llvm.load %20 : !llvm.ptr -> f32
    %22 = llvm.mul %10, %1  : i64
    %23 = llvm.mul %12, %1  : i64
    %24 = llvm.mul %9, %4  : i64
    %25 = llvm.mul %9, %3  : i64
    %26 = llvm.add %24, %25  : i64
    %27 = llvm.mul %22, %2  : i64
    %28 = llvm.add %26, %27  : i64
    %29 = llvm.add %28, %23  : i64
    %30 = llvm.getelementptr %arg1[%29] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %31 = llvm.load %30 : !llvm.ptr -> f32
    %32 = llvm.fcmp "ugt" %21, %31 : f32
    %33 = llvm.select %32, %21, %31 : i1, f32
    %34 = llvm.mul %10, %1  : i64
    %35 = llvm.mul %12, %1  : i64
    %36 = llvm.add %35, %8  : i64
    %37 = llvm.mul %9, %4  : i64
    %38 = llvm.mul %9, %3  : i64
    %39 = llvm.add %37, %38  : i64
    %40 = llvm.mul %34, %2  : i64
    %41 = llvm.add %39, %40  : i64
    %42 = llvm.add %41, %36  : i64
    %43 = llvm.getelementptr %arg1[%42] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %44 = llvm.load %43 : !llvm.ptr -> f32
    %45 = llvm.fcmp "ugt" %33, %44 : f32
    %46 = llvm.select %45, %33, %44 : i1, f32
    %47 = llvm.mul %10, %1  : i64
    %48 = llvm.mul %12, %1  : i64
    %49 = llvm.add %48, %1  : i64
    %50 = llvm.mul %9, %4  : i64
    %51 = llvm.mul %9, %3  : i64
    %52 = llvm.add %50, %51  : i64
    %53 = llvm.mul %47, %2  : i64
    %54 = llvm.add %52, %53  : i64
    %55 = llvm.add %54, %49  : i64
    %56 = llvm.getelementptr %arg1[%55] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %57 = llvm.load %56 : !llvm.ptr -> f32
    %58 = llvm.fcmp "ugt" %46, %57 : f32
    %59 = llvm.select %58, %46, %57 : i1, f32
    %60 = llvm.mul %10, %1  : i64
    %61 = llvm.add %60, %8  : i64
    %62 = llvm.mul %12, %1  : i64
    %63 = llvm.mul %9, %4  : i64
    %64 = llvm.mul %9, %3  : i64
    %65 = llvm.add %63, %64  : i64
    %66 = llvm.mul %61, %2  : i64
    %67 = llvm.add %65, %66  : i64
    %68 = llvm.add %67, %62  : i64
    %69 = llvm.getelementptr %arg1[%68] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %70 = llvm.load %69 : !llvm.ptr -> f32
    %71 = llvm.fcmp "ugt" %59, %70 : f32
    %72 = llvm.select %71, %59, %70 : i1, f32
    %73 = llvm.mul %10, %1  : i64
    %74 = llvm.add %73, %8  : i64
    %75 = llvm.mul %12, %1  : i64
    %76 = llvm.add %75, %8  : i64
    %77 = llvm.mul %9, %4  : i64
    %78 = llvm.mul %9, %3  : i64
    %79 = llvm.add %77, %78  : i64
    %80 = llvm.mul %74, %2  : i64
    %81 = llvm.add %79, %80  : i64
    %82 = llvm.add %81, %76  : i64
    %83 = llvm.getelementptr %arg1[%82] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %84 = llvm.load %83 : !llvm.ptr -> f32
    %85 = llvm.fcmp "ugt" %72, %84 : f32
    %86 = llvm.select %85, %72, %84 : i1, f32
    %87 = llvm.mul %10, %1  : i64
    %88 = llvm.add %87, %8  : i64
    %89 = llvm.mul %12, %1  : i64
    %90 = llvm.add %89, %1  : i64
    %91 = llvm.mul %9, %4  : i64
    %92 = llvm.mul %9, %3  : i64
    %93 = llvm.add %91, %92  : i64
    %94 = llvm.mul %88, %2  : i64
    %95 = llvm.add %93, %94  : i64
    %96 = llvm.add %95, %90  : i64
    %97 = llvm.getelementptr %arg1[%96] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %98 = llvm.load %97 : !llvm.ptr -> f32
    %99 = llvm.fcmp "ugt" %86, %98 : f32
    %100 = llvm.select %99, %86, %98 : i1, f32
    %101 = llvm.mul %10, %1  : i64
    %102 = llvm.add %101, %1  : i64
    %103 = llvm.mul %12, %1  : i64
    %104 = llvm.mul %9, %4  : i64
    %105 = llvm.mul %9, %3  : i64
    %106 = llvm.add %104, %105  : i64
    %107 = llvm.mul %102, %2  : i64
    %108 = llvm.add %106, %107  : i64
    %109 = llvm.add %108, %103  : i64
    %110 = llvm.getelementptr %arg1[%109] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %111 = llvm.load %110 : !llvm.ptr -> f32
    %112 = llvm.fcmp "ugt" %100, %111 : f32
    %113 = llvm.select %112, %100, %111 : i1, f32
    %114 = llvm.mul %10, %1  : i64
    %115 = llvm.add %114, %1  : i64
    %116 = llvm.mul %12, %1  : i64
    %117 = llvm.add %116, %8  : i64
    %118 = llvm.mul %9, %4  : i64
    %119 = llvm.mul %9, %3  : i64
    %120 = llvm.add %118, %119  : i64
    %121 = llvm.mul %115, %2  : i64
    %122 = llvm.add %120, %121  : i64
    %123 = llvm.add %122, %117  : i64
    %124 = llvm.getelementptr %arg1[%123] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %125 = llvm.load %124 : !llvm.ptr -> f32
    %126 = llvm.fcmp "ugt" %113, %125 : f32
    %127 = llvm.select %126, %113, %125 : i1, f32
    %128 = llvm.mul %10, %1  : i64
    %129 = llvm.add %128, %1  : i64
    %130 = llvm.mul %12, %1  : i64
    %131 = llvm.add %130, %1  : i64
    %132 = llvm.mul %9, %4  : i64
    %133 = llvm.mul %9, %3  : i64
    %134 = llvm.add %132, %133  : i64
    %135 = llvm.mul %129, %2  : i64
    %136 = llvm.add %134, %135  : i64
    %137 = llvm.add %136, %131  : i64
    %138 = llvm.getelementptr %arg1[%137] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    %139 = llvm.load %138 : !llvm.ptr -> f32
    %140 = llvm.fcmp "ugt" %127, %139 : f32
    %141 = llvm.select %140, %127, %139 : i1, f32
    %142 = llvm.mul %9, %7  : i64
    %143 = llvm.mul %9, %6  : i64
    %144 = llvm.add %142, %143  : i64
    %145 = llvm.mul %10, %5  : i64
    %146 = llvm.add %144, %145  : i64
    %147 = llvm.add %146, %12  : i64
    %148 = llvm.getelementptr %arg2[%147] : (!llvm.ptr, i64) -> !llvm.ptr, f32
    llvm.store %141, %148 : f32, !llvm.ptr
    %149 = llvm.add %12, %8  : i64
    llvm.br ^bb4(%149 : i64)
  ^bb6:  // pred: ^bb4
    %150 = llvm.add %10, %8  : i64
    llvm.br ^bb2(%150 : i64)
  ^bb7:  // pred: ^bb2
    llvm.return
  }
}



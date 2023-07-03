// -----// IR Dump After AffineLoopUnroll (affine-loop-unroll) //----- //
func.func @conv_kernel_0(%arg0: memref<1x5x224x3xi32>, %arg1: memref<1x3x3x3xi32>, %arg2: i32, %arg3: memref<1x3x222x1xi32>, %arg4: index) attributes {Kernel, conv_kernel_0} {
  %c0 = arith.constant 0 : index
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %true = arith.constant true
  %c224_i32 = arith.constant 224 : i32
  %c0_i32 = arith.constant 0 : i32
  %c2147483647_i32 = arith.constant 2147483647 : i32
  %c2147483647_i64 = arith.constant 2147483647 : i64
  %c-2147483648_i64 = arith.constant -2147483648 : i64
  affine.for %arg5 = 0 to 3 {
    %0 = arith.index_cast %arg5 : index to i32
    affine.for %arg6 = 0 to 222 {
      %1 = arith.index_cast %arg6 : index to i32
      %2 = affine.for %arg7 = 0 to 3 iter_args(%arg8 = %c0_i32) -> (i32) {
        %7 = arith.index_cast %arg7 : index to i32
        %8 = arith.addi %0, %7 : i32
        %9 = affine.if affine_set<(d0, d1) : (-d0 - d1 - 1 >= 0)>(%arg5, %arg7) -> i1 {
          affine.yield %true : i1
        } else {
          %11 = arith.cmpi sge, %8, %c224_i32 : i32
          affine.yield %11 : i1
        }
        %10 = affine.for %arg9 = 0 to 3 iter_args(%arg10 = %arg8) -> (i32) {
          %11 = arith.index_cast %arg9 : index to i32
          %12 = arith.addi %1, %11 : i32
          %13 = scf.if %9 -> (i1) {
            scf.yield %true : i1
          } else {
            %29 = arith.cmpi slt, %12, %c0_i32 : i32
            scf.yield %29 : i1
          }
          %14 = scf.if %13 -> (i1) {
            scf.yield %true : i1
          } else {
            %29 = arith.cmpi sge, %12, %c224_i32 : i32
            scf.yield %29 : i1
          }
          %15 = scf.if %14 -> (i32) {
            scf.yield %c0_i32 : i32
          } else {
            %29 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %arg9, %c0] : memref<1x5x224x3xi32>
            scf.yield %29 : i32
          }
          %16 = affine.load %arg1[0, %arg7, %arg9, %c0] : memref<1x3x3x3xi32>
          %17 = arith.muli %16, %15 : i32
          %18 = arith.addi %arg10, %17 : i32
          %19 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0)
          %20 = scf.if %14 -> (i32) {
            scf.yield %c0_i32 : i32
          } else {
            %29 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %arg9, %19] : memref<1x5x224x3xi32>
            scf.yield %29 : i32
          }
          %21 = affine.load %arg1[0, %arg7, %arg9, %19] : memref<1x3x3x3xi32>
          %22 = arith.muli %21, %20 : i32
          %23 = arith.addi %18, %22 : i32
          %24 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0)
          %25 = scf.if %14 -> (i32) {
            scf.yield %c0_i32 : i32
          } else {
            %29 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %arg9, %24] : memref<1x5x224x3xi32>
            scf.yield %29 : i32
          }
          %26 = affine.load %arg1[0, %arg7, %arg9, %24] : memref<1x3x3x3xi32>
          %27 = arith.muli %26, %25 : i32
          %28 = arith.addi %23, %27 : i32
          affine.yield %28 : i32
        }
        affine.yield %10 : i32
      }
      %3 = arith.addi %2, %arg2 : i32
      %4 = arith.cmpi sgt, %3, %c2147483647_i32 : i32
      %5 = scf.if %4 -> (i64) {
        scf.yield %c2147483647_i64 : i64
      } else {
        %7 = arith.extsi %3 : i32 to i64
        %8 = arith.cmpi slt, %7, %c-2147483648_i64 : i64
        %9 = arith.select %8, %c-2147483648_i64, %7 : i64
        scf.yield %9 : i64
      }
      %6 = arith.trunci %5 : i64 to i32
      affine.store %6, %arg3[0, %arg5, %arg6, %arg4] : memref<1x3x222x1xi32>
    }
  }
  return
}

// -----// IR Dump After AffineLoopUnroll (affine-loop-unroll) //----- //
func.func @conv_kernel_0(%arg0: memref<1x5x224x3xi32>, %arg1: memref<1x3x3x3xi32>, %arg2: i32, %arg3: memref<1x3x222x1xi32>, %arg4: index) attributes {Kernel, conv_kernel_0} {
  %c0 = arith.constant 0 : index
  %c0_0 = arith.constant 0 : index
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %true = arith.constant true
  %c224_i32 = arith.constant 224 : i32
  %c0_i32 = arith.constant 0 : i32
  %c2147483647_i32 = arith.constant 2147483647 : i32
  %c2147483647_i64 = arith.constant 2147483647 : i64
  %c-2147483648_i64 = arith.constant -2147483648 : i64
  affine.for %arg5 = 0 to 3 {
    %0 = arith.index_cast %arg5 : index to i32
    affine.for %arg6 = 0 to 222 {
      %1 = arith.index_cast %arg6 : index to i32
      %2 = affine.for %arg7 = 0 to 3 iter_args(%arg8 = %c0_i32) -> (i32) {
        %7 = arith.index_cast %arg7 : index to i32
        %8 = arith.addi %0, %7 : i32
        %9 = affine.if affine_set<(d0, d1) : (-d0 - d1 - 1 >= 0)>(%arg5, %arg7) -> i1 {
          affine.yield %true : i1
        } else {
          %66 = arith.cmpi sge, %8, %c224_i32 : i32
          affine.yield %66 : i1
        }
        %10 = arith.index_cast %c0 : index to i32
        %11 = arith.addi %1, %10 : i32
        %12 = scf.if %9 -> (i1) {
          scf.yield %true : i1
        } else {
          %66 = arith.cmpi slt, %11, %c0_i32 : i32
          scf.yield %66 : i1
        }
        %13 = scf.if %12 -> (i1) {
          scf.yield %true : i1
        } else {
          %66 = arith.cmpi sge, %11, %c224_i32 : i32
          scf.yield %66 : i1
        }
        %14 = scf.if %13 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %66 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %c0, %c0_0] : memref<1x5x224x3xi32>
          scf.yield %66 : i32
        }
        %15 = affine.load %arg1[0, %arg7, %c0, %c0_0] : memref<1x3x3x3xi32>
        %16 = arith.muli %15, %14 : i32
        %17 = arith.addi %arg8, %16 : i32
        %18 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_0)
        %19 = scf.if %13 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %66 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %c0, %18] : memref<1x5x224x3xi32>
          scf.yield %66 : i32
        }
        %20 = affine.load %arg1[0, %arg7, %c0, %18] : memref<1x3x3x3xi32>
        %21 = arith.muli %20, %19 : i32
        %22 = arith.addi %17, %21 : i32
        %23 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_0)
        %24 = scf.if %13 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %66 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %c0, %23] : memref<1x5x224x3xi32>
          scf.yield %66 : i32
        }
        %25 = affine.load %arg1[0, %arg7, %c0, %23] : memref<1x3x3x3xi32>
        %26 = arith.muli %25, %24 : i32
        %27 = arith.addi %22, %26 : i32
        %28 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0)
        %29 = arith.index_cast %28 : index to i32
        %30 = arith.addi %1, %29 : i32
        %31 = scf.if %9 -> (i1) {
          scf.yield %true : i1
        } else {
          %66 = arith.cmpi slt, %30, %c0_i32 : i32
          scf.yield %66 : i1
        }
        %32 = scf.if %31 -> (i1) {
          scf.yield %true : i1
        } else {
          %66 = arith.cmpi sge, %30, %c224_i32 : i32
          scf.yield %66 : i1
        }
        %33 = scf.if %32 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %66 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %28, %c0_0] : memref<1x5x224x3xi32>
          scf.yield %66 : i32
        }
        %34 = affine.load %arg1[0, %arg7, %28, %c0_0] : memref<1x3x3x3xi32>
        %35 = arith.muli %34, %33 : i32
        %36 = arith.addi %27, %35 : i32
        %37 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_0)
        %38 = scf.if %32 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %66 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %28, %37] : memref<1x5x224x3xi32>
          scf.yield %66 : i32
        }
        %39 = affine.load %arg1[0, %arg7, %28, %37] : memref<1x3x3x3xi32>
        %40 = arith.muli %39, %38 : i32
        %41 = arith.addi %36, %40 : i32
        %42 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_0)
        %43 = scf.if %32 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %66 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %28, %42] : memref<1x5x224x3xi32>
          scf.yield %66 : i32
        }
        %44 = affine.load %arg1[0, %arg7, %28, %42] : memref<1x3x3x3xi32>
        %45 = arith.muli %44, %43 : i32
        %46 = arith.addi %41, %45 : i32
        %47 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0)
        %48 = arith.index_cast %47 : index to i32
        %49 = arith.addi %1, %48 : i32
        %50 = scf.if %9 -> (i1) {
          scf.yield %true : i1
        } else {
          %66 = arith.cmpi slt, %49, %c0_i32 : i32
          scf.yield %66 : i1
        }
        %51 = scf.if %50 -> (i1) {
          scf.yield %true : i1
        } else {
          %66 = arith.cmpi sge, %49, %c224_i32 : i32
          scf.yield %66 : i1
        }
        %52 = scf.if %51 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %66 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %47, %c0_0] : memref<1x5x224x3xi32>
          scf.yield %66 : i32
        }
        %53 = affine.load %arg1[0, %arg7, %47, %c0_0] : memref<1x3x3x3xi32>
        %54 = arith.muli %53, %52 : i32
        %55 = arith.addi %46, %54 : i32
        %56 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_0)
        %57 = scf.if %51 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %66 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %47, %56] : memref<1x5x224x3xi32>
          scf.yield %66 : i32
        }
        %58 = affine.load %arg1[0, %arg7, %47, %56] : memref<1x3x3x3xi32>
        %59 = arith.muli %58, %57 : i32
        %60 = arith.addi %55, %59 : i32
        %61 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_0)
        %62 = scf.if %51 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %66 = affine.load %arg0[0, %arg5 + %arg7, %arg6 + %47, %61] : memref<1x5x224x3xi32>
          scf.yield %66 : i32
        }
        %63 = affine.load %arg1[0, %arg7, %47, %61] : memref<1x3x3x3xi32>
        %64 = arith.muli %63, %62 : i32
        %65 = arith.addi %60, %64 : i32
        affine.yield %65 : i32
      }
      %3 = arith.addi %2, %arg2 : i32
      %4 = arith.cmpi sgt, %3, %c2147483647_i32 : i32
      %5 = scf.if %4 -> (i64) {
        scf.yield %c2147483647_i64 : i64
      } else {
        %7 = arith.extsi %3 : i32 to i64
        %8 = arith.cmpi slt, %7, %c-2147483648_i64 : i64
        %9 = arith.select %8, %c-2147483648_i64, %7 : i64
        scf.yield %9 : i64
      }
      %6 = arith.trunci %5 : i64 to i32
      affine.store %6, %arg3[0, %arg5, %arg6, %arg4] : memref<1x3x222x1xi32>
    }
  }
  return
}

// -----// IR Dump After AffineLoopUnroll (affine-loop-unroll) //----- //
func.func @conv_kernel_0(%arg0: memref<1x5x224x3xi32>, %arg1: memref<1x3x3x3xi32>, %arg2: i32, %arg3: memref<1x3x222x1xi32>, %arg4: index) attributes {Kernel, conv_kernel_0} {
  %c0 = arith.constant 0 : index
  %c0_0 = arith.constant 0 : index
  %c0_1 = arith.constant 0 : index
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %true = arith.constant true
  %c224_i32 = arith.constant 224 : i32
  %c0_i32 = arith.constant 0 : i32
  %c2147483647_i32 = arith.constant 2147483647 : i32
  %c2147483647_i64 = arith.constant 2147483647 : i64
  %c-2147483648_i64 = arith.constant -2147483648 : i64
  affine.for %arg5 = 0 to 3 {
    %0 = arith.index_cast %arg5 : index to i32
    affine.for %arg6 = 0 to 222 {
      %1 = arith.index_cast %arg6 : index to i32
      %2 = arith.index_cast %c0 : index to i32
      %3 = arith.addi %0, %2 : i32
      %4 = affine.if affine_set<(d0, d1) : (-d0 - d1 - 1 >= 0)>(%arg5, %c0) -> i1 {
        affine.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %3, %c224_i32 : i32
        affine.yield %185 : i1
      }
      %5 = arith.index_cast %c0_0 : index to i32
      %6 = arith.addi %1, %5 : i32
      %7 = scf.if %4 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %6, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %8 = scf.if %7 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %6, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %9 = scf.if %8 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c0_0, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %10 = affine.load %arg1[0, %c0, %c0_0, %c0_1] : memref<1x3x3x3xi32>
      %11 = arith.muli %10, %9 : i32
      %12 = arith.addi %c0_i32, %11 : i32
      %13 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %14 = scf.if %8 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c0_0, %13] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %15 = affine.load %arg1[0, %c0, %c0_0, %13] : memref<1x3x3x3xi32>
      %16 = arith.muli %15, %14 : i32
      %17 = arith.addi %12, %16 : i32
      %18 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %19 = scf.if %8 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c0_0, %18] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %20 = affine.load %arg1[0, %c0, %c0_0, %18] : memref<1x3x3x3xi32>
      %21 = arith.muli %20, %19 : i32
      %22 = arith.addi %17, %21 : i32
      %23 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_0)
      %24 = arith.index_cast %23 : index to i32
      %25 = arith.addi %1, %24 : i32
      %26 = scf.if %4 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %25, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %27 = scf.if %26 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %25, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %28 = scf.if %27 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %23, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %29 = affine.load %arg1[0, %c0, %23, %c0_1] : memref<1x3x3x3xi32>
      %30 = arith.muli %29, %28 : i32
      %31 = arith.addi %22, %30 : i32
      %32 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %33 = scf.if %27 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %23, %32] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %34 = affine.load %arg1[0, %c0, %23, %32] : memref<1x3x3x3xi32>
      %35 = arith.muli %34, %33 : i32
      %36 = arith.addi %31, %35 : i32
      %37 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %38 = scf.if %27 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %23, %37] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %39 = affine.load %arg1[0, %c0, %23, %37] : memref<1x3x3x3xi32>
      %40 = arith.muli %39, %38 : i32
      %41 = arith.addi %36, %40 : i32
      %42 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_0)
      %43 = arith.index_cast %42 : index to i32
      %44 = arith.addi %1, %43 : i32
      %45 = scf.if %4 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %44, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %46 = scf.if %45 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %44, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %47 = scf.if %46 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %42, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %48 = affine.load %arg1[0, %c0, %42, %c0_1] : memref<1x3x3x3xi32>
      %49 = arith.muli %48, %47 : i32
      %50 = arith.addi %41, %49 : i32
      %51 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %52 = scf.if %46 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %42, %51] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %53 = affine.load %arg1[0, %c0, %42, %51] : memref<1x3x3x3xi32>
      %54 = arith.muli %53, %52 : i32
      %55 = arith.addi %50, %54 : i32
      %56 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %57 = scf.if %46 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %42, %56] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %58 = affine.load %arg1[0, %c0, %42, %56] : memref<1x3x3x3xi32>
      %59 = arith.muli %58, %57 : i32
      %60 = arith.addi %55, %59 : i32
      %61 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0)
      %62 = arith.index_cast %61 : index to i32
      %63 = arith.addi %0, %62 : i32
      %64 = affine.if affine_set<(d0, d1) : (-d0 - d1 - 1 >= 0)>(%arg5, %61) -> i1 {
        affine.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %63, %c224_i32 : i32
        affine.yield %185 : i1
      }
      %65 = arith.index_cast %c0_0 : index to i32
      %66 = arith.addi %1, %65 : i32
      %67 = scf.if %64 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %66, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %68 = scf.if %67 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %66, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %69 = scf.if %68 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %c0_0, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %70 = affine.load %arg1[0, %61, %c0_0, %c0_1] : memref<1x3x3x3xi32>
      %71 = arith.muli %70, %69 : i32
      %72 = arith.addi %60, %71 : i32
      %73 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %74 = scf.if %68 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %c0_0, %73] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %75 = affine.load %arg1[0, %61, %c0_0, %73] : memref<1x3x3x3xi32>
      %76 = arith.muli %75, %74 : i32
      %77 = arith.addi %72, %76 : i32
      %78 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %79 = scf.if %68 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %c0_0, %78] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %80 = affine.load %arg1[0, %61, %c0_0, %78] : memref<1x3x3x3xi32>
      %81 = arith.muli %80, %79 : i32
      %82 = arith.addi %77, %81 : i32
      %83 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_0)
      %84 = arith.index_cast %83 : index to i32
      %85 = arith.addi %1, %84 : i32
      %86 = scf.if %64 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %85, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %87 = scf.if %86 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %85, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %88 = scf.if %87 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %83, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %89 = affine.load %arg1[0, %61, %83, %c0_1] : memref<1x3x3x3xi32>
      %90 = arith.muli %89, %88 : i32
      %91 = arith.addi %82, %90 : i32
      %92 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %93 = scf.if %87 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %83, %92] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %94 = affine.load %arg1[0, %61, %83, %92] : memref<1x3x3x3xi32>
      %95 = arith.muli %94, %93 : i32
      %96 = arith.addi %91, %95 : i32
      %97 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %98 = scf.if %87 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %83, %97] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %99 = affine.load %arg1[0, %61, %83, %97] : memref<1x3x3x3xi32>
      %100 = arith.muli %99, %98 : i32
      %101 = arith.addi %96, %100 : i32
      %102 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_0)
      %103 = arith.index_cast %102 : index to i32
      %104 = arith.addi %1, %103 : i32
      %105 = scf.if %64 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %104, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %106 = scf.if %105 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %104, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %107 = scf.if %106 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %102, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %108 = affine.load %arg1[0, %61, %102, %c0_1] : memref<1x3x3x3xi32>
      %109 = arith.muli %108, %107 : i32
      %110 = arith.addi %101, %109 : i32
      %111 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %112 = scf.if %106 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %102, %111] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %113 = affine.load %arg1[0, %61, %102, %111] : memref<1x3x3x3xi32>
      %114 = arith.muli %113, %112 : i32
      %115 = arith.addi %110, %114 : i32
      %116 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %117 = scf.if %106 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %102, %116] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %118 = affine.load %arg1[0, %61, %102, %116] : memref<1x3x3x3xi32>
      %119 = arith.muli %118, %117 : i32
      %120 = arith.addi %115, %119 : i32
      %121 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0)
      %122 = arith.index_cast %121 : index to i32
      %123 = arith.addi %0, %122 : i32
      %124 = affine.if affine_set<(d0, d1) : (-d0 - d1 - 1 >= 0)>(%arg5, %121) -> i1 {
        affine.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %123, %c224_i32 : i32
        affine.yield %185 : i1
      }
      %125 = arith.index_cast %c0_0 : index to i32
      %126 = arith.addi %1, %125 : i32
      %127 = scf.if %124 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %126, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %128 = scf.if %127 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %126, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %129 = scf.if %128 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %c0_0, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %130 = affine.load %arg1[0, %121, %c0_0, %c0_1] : memref<1x3x3x3xi32>
      %131 = arith.muli %130, %129 : i32
      %132 = arith.addi %120, %131 : i32
      %133 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %134 = scf.if %128 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %c0_0, %133] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %135 = affine.load %arg1[0, %121, %c0_0, %133] : memref<1x3x3x3xi32>
      %136 = arith.muli %135, %134 : i32
      %137 = arith.addi %132, %136 : i32
      %138 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %139 = scf.if %128 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %c0_0, %138] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %140 = affine.load %arg1[0, %121, %c0_0, %138] : memref<1x3x3x3xi32>
      %141 = arith.muli %140, %139 : i32
      %142 = arith.addi %137, %141 : i32
      %143 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_0)
      %144 = arith.index_cast %143 : index to i32
      %145 = arith.addi %1, %144 : i32
      %146 = scf.if %124 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %145, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %147 = scf.if %146 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %145, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %148 = scf.if %147 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %143, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %149 = affine.load %arg1[0, %121, %143, %c0_1] : memref<1x3x3x3xi32>
      %150 = arith.muli %149, %148 : i32
      %151 = arith.addi %142, %150 : i32
      %152 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %153 = scf.if %147 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %143, %152] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %154 = affine.load %arg1[0, %121, %143, %152] : memref<1x3x3x3xi32>
      %155 = arith.muli %154, %153 : i32
      %156 = arith.addi %151, %155 : i32
      %157 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %158 = scf.if %147 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %143, %157] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %159 = affine.load %arg1[0, %121, %143, %157] : memref<1x3x3x3xi32>
      %160 = arith.muli %159, %158 : i32
      %161 = arith.addi %156, %160 : i32
      %162 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_0)
      %163 = arith.index_cast %162 : index to i32
      %164 = arith.addi %1, %163 : i32
      %165 = scf.if %124 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %164, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %166 = scf.if %165 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %164, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %167 = scf.if %166 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %162, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %168 = affine.load %arg1[0, %121, %162, %c0_1] : memref<1x3x3x3xi32>
      %169 = arith.muli %168, %167 : i32
      %170 = arith.addi %161, %169 : i32
      %171 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %172 = scf.if %166 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %162, %171] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %173 = affine.load %arg1[0, %121, %162, %171] : memref<1x3x3x3xi32>
      %174 = arith.muli %173, %172 : i32
      %175 = arith.addi %170, %174 : i32
      %176 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %177 = scf.if %166 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %162, %176] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %178 = affine.load %arg1[0, %121, %162, %176] : memref<1x3x3x3xi32>
      %179 = arith.muli %178, %177 : i32
      %180 = arith.addi %175, %179 : i32
      %181 = arith.addi %180, %arg2 : i32
      %182 = arith.cmpi sgt, %181, %c2147483647_i32 : i32
      %183 = scf.if %182 -> (i64) {
        scf.yield %c2147483647_i64 : i64
      } else {
        %185 = arith.extsi %181 : i32 to i64
        %186 = arith.cmpi slt, %185, %c-2147483648_i64 : i64
        %187 = arith.select %186, %c-2147483648_i64, %185 : i64
        scf.yield %187 : i64
      }
      %184 = arith.trunci %183 : i64 to i32
      affine.store %184, %arg3[0, %arg5, %arg6, %arg4] : memref<1x3x222x1xi32>
    }
  }
  return
}

// -----// IR Dump After AffineLoopNormalize (affine-loop-normalize) //----- //
func.func @conv_kernel_0(%arg0: memref<1x5x224x3xi32>, %arg1: memref<1x3x3x3xi32>, %arg2: i32, %arg3: memref<1x3x222x1xi32>, %arg4: index) attributes {Kernel, conv_kernel_0} {
  %c0 = arith.constant 0 : index
  %c0_0 = arith.constant 0 : index
  %c0_1 = arith.constant 0 : index
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %true = arith.constant true
  %c224_i32 = arith.constant 224 : i32
  %c0_i32 = arith.constant 0 : i32
  %c2147483647_i32 = arith.constant 2147483647 : i32
  %c2147483647_i64 = arith.constant 2147483647 : i64
  %c-2147483648_i64 = arith.constant -2147483648 : i64
  affine.for %arg5 = 0 to 3 {
    %0 = arith.index_cast %arg5 : index to i32
    affine.for %arg6 = 0 to 222 {
      %1 = arith.index_cast %arg6 : index to i32
      %2 = arith.index_cast %c0 : index to i32
      %3 = arith.addi %0, %2 : i32
      %4 = affine.if affine_set<(d0, d1) : (-d0 - d1 - 1 >= 0)>(%arg5, %c0) -> i1 {
        affine.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %3, %c224_i32 : i32
        affine.yield %185 : i1
      }
      %5 = arith.index_cast %c0_0 : index to i32
      %6 = arith.addi %1, %5 : i32
      %7 = scf.if %4 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %6, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %8 = scf.if %7 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %6, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %9 = scf.if %8 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c0_0, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %10 = affine.load %arg1[0, %c0, %c0_0, %c0_1] : memref<1x3x3x3xi32>
      %11 = arith.muli %10, %9 : i32
      %12 = arith.addi %c0_i32, %11 : i32
      %13 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %14 = scf.if %8 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c0_0, %13] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %15 = affine.load %arg1[0, %c0, %c0_0, %13] : memref<1x3x3x3xi32>
      %16 = arith.muli %15, %14 : i32
      %17 = arith.addi %12, %16 : i32
      %18 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %19 = scf.if %8 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c0_0, %18] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %20 = affine.load %arg1[0, %c0, %c0_0, %18] : memref<1x3x3x3xi32>
      %21 = arith.muli %20, %19 : i32
      %22 = arith.addi %17, %21 : i32
      %23 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_0)
      %24 = arith.index_cast %23 : index to i32
      %25 = arith.addi %1, %24 : i32
      %26 = scf.if %4 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %25, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %27 = scf.if %26 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %25, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %28 = scf.if %27 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %23, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %29 = affine.load %arg1[0, %c0, %23, %c0_1] : memref<1x3x3x3xi32>
      %30 = arith.muli %29, %28 : i32
      %31 = arith.addi %22, %30 : i32
      %32 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %33 = scf.if %27 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %23, %32] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %34 = affine.load %arg1[0, %c0, %23, %32] : memref<1x3x3x3xi32>
      %35 = arith.muli %34, %33 : i32
      %36 = arith.addi %31, %35 : i32
      %37 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %38 = scf.if %27 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %23, %37] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %39 = affine.load %arg1[0, %c0, %23, %37] : memref<1x3x3x3xi32>
      %40 = arith.muli %39, %38 : i32
      %41 = arith.addi %36, %40 : i32
      %42 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_0)
      %43 = arith.index_cast %42 : index to i32
      %44 = arith.addi %1, %43 : i32
      %45 = scf.if %4 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %44, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %46 = scf.if %45 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %44, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %47 = scf.if %46 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %42, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %48 = affine.load %arg1[0, %c0, %42, %c0_1] : memref<1x3x3x3xi32>
      %49 = arith.muli %48, %47 : i32
      %50 = arith.addi %41, %49 : i32
      %51 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %52 = scf.if %46 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %42, %51] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %53 = affine.load %arg1[0, %c0, %42, %51] : memref<1x3x3x3xi32>
      %54 = arith.muli %53, %52 : i32
      %55 = arith.addi %50, %54 : i32
      %56 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %57 = scf.if %46 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %42, %56] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %58 = affine.load %arg1[0, %c0, %42, %56] : memref<1x3x3x3xi32>
      %59 = arith.muli %58, %57 : i32
      %60 = arith.addi %55, %59 : i32
      %61 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0)
      %62 = arith.index_cast %61 : index to i32
      %63 = arith.addi %0, %62 : i32
      %64 = affine.if affine_set<(d0, d1) : (-d0 - d1 - 1 >= 0)>(%arg5, %61) -> i1 {
        affine.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %63, %c224_i32 : i32
        affine.yield %185 : i1
      }
      %65 = arith.index_cast %c0_0 : index to i32
      %66 = arith.addi %1, %65 : i32
      %67 = scf.if %64 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %66, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %68 = scf.if %67 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %66, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %69 = scf.if %68 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %c0_0, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %70 = affine.load %arg1[0, %61, %c0_0, %c0_1] : memref<1x3x3x3xi32>
      %71 = arith.muli %70, %69 : i32
      %72 = arith.addi %60, %71 : i32
      %73 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %74 = scf.if %68 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %c0_0, %73] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %75 = affine.load %arg1[0, %61, %c0_0, %73] : memref<1x3x3x3xi32>
      %76 = arith.muli %75, %74 : i32
      %77 = arith.addi %72, %76 : i32
      %78 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %79 = scf.if %68 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %c0_0, %78] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %80 = affine.load %arg1[0, %61, %c0_0, %78] : memref<1x3x3x3xi32>
      %81 = arith.muli %80, %79 : i32
      %82 = arith.addi %77, %81 : i32
      %83 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_0)
      %84 = arith.index_cast %83 : index to i32
      %85 = arith.addi %1, %84 : i32
      %86 = scf.if %64 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %85, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %87 = scf.if %86 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %85, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %88 = scf.if %87 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %83, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %89 = affine.load %arg1[0, %61, %83, %c0_1] : memref<1x3x3x3xi32>
      %90 = arith.muli %89, %88 : i32
      %91 = arith.addi %82, %90 : i32
      %92 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %93 = scf.if %87 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %83, %92] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %94 = affine.load %arg1[0, %61, %83, %92] : memref<1x3x3x3xi32>
      %95 = arith.muli %94, %93 : i32
      %96 = arith.addi %91, %95 : i32
      %97 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %98 = scf.if %87 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %83, %97] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %99 = affine.load %arg1[0, %61, %83, %97] : memref<1x3x3x3xi32>
      %100 = arith.muli %99, %98 : i32
      %101 = arith.addi %96, %100 : i32
      %102 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_0)
      %103 = arith.index_cast %102 : index to i32
      %104 = arith.addi %1, %103 : i32
      %105 = scf.if %64 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %104, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %106 = scf.if %105 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %104, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %107 = scf.if %106 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %102, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %108 = affine.load %arg1[0, %61, %102, %c0_1] : memref<1x3x3x3xi32>
      %109 = arith.muli %108, %107 : i32
      %110 = arith.addi %101, %109 : i32
      %111 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %112 = scf.if %106 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %102, %111] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %113 = affine.load %arg1[0, %61, %102, %111] : memref<1x3x3x3xi32>
      %114 = arith.muli %113, %112 : i32
      %115 = arith.addi %110, %114 : i32
      %116 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %117 = scf.if %106 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %61, %arg6 + %102, %116] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %118 = affine.load %arg1[0, %61, %102, %116] : memref<1x3x3x3xi32>
      %119 = arith.muli %118, %117 : i32
      %120 = arith.addi %115, %119 : i32
      %121 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0)
      %122 = arith.index_cast %121 : index to i32
      %123 = arith.addi %0, %122 : i32
      %124 = affine.if affine_set<(d0, d1) : (-d0 - d1 - 1 >= 0)>(%arg5, %121) -> i1 {
        affine.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %123, %c224_i32 : i32
        affine.yield %185 : i1
      }
      %125 = arith.index_cast %c0_0 : index to i32
      %126 = arith.addi %1, %125 : i32
      %127 = scf.if %124 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %126, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %128 = scf.if %127 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %126, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %129 = scf.if %128 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %c0_0, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %130 = affine.load %arg1[0, %121, %c0_0, %c0_1] : memref<1x3x3x3xi32>
      %131 = arith.muli %130, %129 : i32
      %132 = arith.addi %120, %131 : i32
      %133 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %134 = scf.if %128 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %c0_0, %133] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %135 = affine.load %arg1[0, %121, %c0_0, %133] : memref<1x3x3x3xi32>
      %136 = arith.muli %135, %134 : i32
      %137 = arith.addi %132, %136 : i32
      %138 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %139 = scf.if %128 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %c0_0, %138] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %140 = affine.load %arg1[0, %121, %c0_0, %138] : memref<1x3x3x3xi32>
      %141 = arith.muli %140, %139 : i32
      %142 = arith.addi %137, %141 : i32
      %143 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_0)
      %144 = arith.index_cast %143 : index to i32
      %145 = arith.addi %1, %144 : i32
      %146 = scf.if %124 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %145, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %147 = scf.if %146 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %145, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %148 = scf.if %147 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %143, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %149 = affine.load %arg1[0, %121, %143, %c0_1] : memref<1x3x3x3xi32>
      %150 = arith.muli %149, %148 : i32
      %151 = arith.addi %142, %150 : i32
      %152 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %153 = scf.if %147 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %143, %152] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %154 = affine.load %arg1[0, %121, %143, %152] : memref<1x3x3x3xi32>
      %155 = arith.muli %154, %153 : i32
      %156 = arith.addi %151, %155 : i32
      %157 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %158 = scf.if %147 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %143, %157] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %159 = affine.load %arg1[0, %121, %143, %157] : memref<1x3x3x3xi32>
      %160 = arith.muli %159, %158 : i32
      %161 = arith.addi %156, %160 : i32
      %162 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_0)
      %163 = arith.index_cast %162 : index to i32
      %164 = arith.addi %1, %163 : i32
      %165 = scf.if %124 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi slt, %164, %c0_i32 : i32
        scf.yield %185 : i1
      }
      %166 = scf.if %165 -> (i1) {
        scf.yield %true : i1
      } else {
        %185 = arith.cmpi sge, %164, %c224_i32 : i32
        scf.yield %185 : i1
      }
      %167 = scf.if %166 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %162, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %168 = affine.load %arg1[0, %121, %162, %c0_1] : memref<1x3x3x3xi32>
      %169 = arith.muli %168, %167 : i32
      %170 = arith.addi %161, %169 : i32
      %171 = affine.apply affine_map<(d0) -> (d0 + 1)>(%c0_1)
      %172 = scf.if %166 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %162, %171] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %173 = affine.load %arg1[0, %121, %162, %171] : memref<1x3x3x3xi32>
      %174 = arith.muli %173, %172 : i32
      %175 = arith.addi %170, %174 : i32
      %176 = affine.apply affine_map<(d0) -> (d0 + 2)>(%c0_1)
      %177 = scf.if %166 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %185 = affine.load %arg0[0, %arg5 + %121, %arg6 + %162, %176] : memref<1x5x224x3xi32>
        scf.yield %185 : i32
      }
      %178 = affine.load %arg1[0, %121, %162, %176] : memref<1x3x3x3xi32>
      %179 = arith.muli %178, %177 : i32
      %180 = arith.addi %175, %179 : i32
      %181 = arith.addi %180, %arg2 : i32
      %182 = arith.cmpi sgt, %181, %c2147483647_i32 : i32
      %183 = scf.if %182 -> (i64) {
        scf.yield %c2147483647_i64 : i64
      } else {
        %185 = arith.extsi %181 : i32 to i64
        %186 = arith.cmpi slt, %185, %c-2147483648_i64 : i64
        %187 = arith.select %186, %c-2147483648_i64, %185 : i64
        scf.yield %187 : i64
      }
      %184 = arith.trunci %183 : i64 to i32
      affine.store %184, %arg3[0, %arg5, %arg6, %arg4] : memref<1x3x222x1xi32>
    }
  }
  return
}

// -----// IR Dump After SimplifyAffineStructures (affine-simplify-structures) //----- //
func.func @conv_kernel_0(%arg0: memref<1x5x224x3xi32>, %arg1: memref<1x3x3x3xi32>, %arg2: i32, %arg3: memref<1x3x222x1xi32>, %arg4: index) attributes {Kernel, conv_kernel_0} {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c0 = arith.constant 0 : index
  %c0_0 = arith.constant 0 : index
  %c0_1 = arith.constant 0 : index
  cf.br ^bb1
^bb1:  // pred: ^bb0
  %true = arith.constant true
  %c224_i32 = arith.constant 224 : i32
  %c0_i32 = arith.constant 0 : i32
  %c2147483647_i32 = arith.constant 2147483647 : i32
  %c2147483647_i64 = arith.constant 2147483647 : i64
  %c-2147483648_i64 = arith.constant -2147483648 : i64
  affine.for %arg5 = 0 to 3 {
    %0 = arith.index_cast %arg5 : index to i32
    affine.for %arg6 = 0 to 222 {
      %1 = arith.index_cast %arg6 : index to i32
      %2 = arith.index_cast %c0 : index to i32
      %3 = arith.addi %0, %2 : i32
      %4 = affine.if affine_set<(d0) : (-d0 - 1 >= 0)>(%arg5) -> i1 {
        affine.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %3, %c224_i32 : i32
        affine.yield %159 : i1
      }
      %5 = arith.index_cast %c0_0 : index to i32
      %6 = arith.addi %1, %5 : i32
      %7 = scf.if %4 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi slt, %6, %c0_i32 : i32
        scf.yield %159 : i1
      }
      %8 = scf.if %7 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %6, %c224_i32 : i32
        scf.yield %159 : i1
      }
      %9 = scf.if %8 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c0_0, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %10 = affine.load %arg1[0, %c0, %c0_0, %c0_1] : memref<1x3x3x3xi32>
      %11 = arith.muli %10, %9 : i32
      %12 = arith.addi %c0_i32, %11 : i32
      %13 = scf.if %8 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c0_0, %c1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %14 = affine.load %arg1[0, %c0, %c0_0, %c1] : memref<1x3x3x3xi32>
      %15 = arith.muli %14, %13 : i32
      %16 = arith.addi %12, %15 : i32
      %17 = scf.if %8 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c0_0, %c2] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %18 = affine.load %arg1[0, %c0, %c0_0, %c2] : memref<1x3x3x3xi32>
      %19 = arith.muli %18, %17 : i32
      %20 = arith.addi %16, %19 : i32
      %21 = arith.index_cast %c1 : index to i32
      %22 = arith.addi %1, %21 : i32
      %23 = scf.if %4 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi slt, %22, %c0_i32 : i32
        scf.yield %159 : i1
      }
      %24 = scf.if %23 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %22, %c224_i32 : i32
        scf.yield %159 : i1
      }
      %25 = scf.if %24 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c1, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %26 = affine.load %arg1[0, %c0, %c1, %c0_1] : memref<1x3x3x3xi32>
      %27 = arith.muli %26, %25 : i32
      %28 = arith.addi %20, %27 : i32
      %29 = scf.if %24 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c1, %c1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %30 = affine.load %arg1[0, %c0, %c1, %c1] : memref<1x3x3x3xi32>
      %31 = arith.muli %30, %29 : i32
      %32 = arith.addi %28, %31 : i32
      %33 = scf.if %24 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c1, %c2] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %34 = affine.load %arg1[0, %c0, %c1, %c2] : memref<1x3x3x3xi32>
      %35 = arith.muli %34, %33 : i32
      %36 = arith.addi %32, %35 : i32
      %37 = arith.index_cast %c2 : index to i32
      %38 = arith.addi %1, %37 : i32
      %39 = scf.if %4 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi slt, %38, %c0_i32 : i32
        scf.yield %159 : i1
      }
      %40 = scf.if %39 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %38, %c224_i32 : i32
        scf.yield %159 : i1
      }
      %41 = scf.if %40 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c2, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %42 = affine.load %arg1[0, %c0, %c2, %c0_1] : memref<1x3x3x3xi32>
      %43 = arith.muli %42, %41 : i32
      %44 = arith.addi %36, %43 : i32
      %45 = scf.if %40 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c2, %c1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %46 = affine.load %arg1[0, %c0, %c2, %c1] : memref<1x3x3x3xi32>
      %47 = arith.muli %46, %45 : i32
      %48 = arith.addi %44, %47 : i32
      %49 = scf.if %40 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c0, %arg6 + %c2, %c2] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %50 = affine.load %arg1[0, %c0, %c2, %c2] : memref<1x3x3x3xi32>
      %51 = arith.muli %50, %49 : i32
      %52 = arith.addi %48, %51 : i32
      %53 = arith.index_cast %c1 : index to i32
      %54 = arith.addi %0, %53 : i32
      %55 = affine.if affine_set<(d0) : (-d0 - 2 >= 0)>(%arg5) -> i1 {
        affine.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %54, %c224_i32 : i32
        affine.yield %159 : i1
      }
      %56 = arith.index_cast %c0_0 : index to i32
      %57 = arith.addi %1, %56 : i32
      %58 = scf.if %55 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi slt, %57, %c0_i32 : i32
        scf.yield %159 : i1
      }
      %59 = scf.if %58 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %57, %c224_i32 : i32
        scf.yield %159 : i1
      }
      %60 = scf.if %59 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c1, %arg6 + %c0_0, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %61 = affine.load %arg1[0, %c1, %c0_0, %c0_1] : memref<1x3x3x3xi32>
      %62 = arith.muli %61, %60 : i32
      %63 = arith.addi %52, %62 : i32
      %64 = scf.if %59 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c1, %arg6 + %c0_0, %c1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %65 = affine.load %arg1[0, %c1, %c0_0, %c1] : memref<1x3x3x3xi32>
      %66 = arith.muli %65, %64 : i32
      %67 = arith.addi %63, %66 : i32
      %68 = scf.if %59 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c1, %arg6 + %c0_0, %c2] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %69 = affine.load %arg1[0, %c1, %c0_0, %c2] : memref<1x3x3x3xi32>
      %70 = arith.muli %69, %68 : i32
      %71 = arith.addi %67, %70 : i32
      %72 = arith.index_cast %c1 : index to i32
      %73 = arith.addi %1, %72 : i32
      %74 = scf.if %55 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi slt, %73, %c0_i32 : i32
        scf.yield %159 : i1
      }
      %75 = scf.if %74 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %73, %c224_i32 : i32
        scf.yield %159 : i1
      }
      %76 = scf.if %75 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c1, %arg6 + %c1, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %77 = affine.load %arg1[0, %c1, %c1, %c0_1] : memref<1x3x3x3xi32>
      %78 = arith.muli %77, %76 : i32
      %79 = arith.addi %71, %78 : i32
      %80 = scf.if %75 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c1, %arg6 + %c1, %c1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %81 = affine.load %arg1[0, %c1, %c1, %c1] : memref<1x3x3x3xi32>
      %82 = arith.muli %81, %80 : i32
      %83 = arith.addi %79, %82 : i32
      %84 = scf.if %75 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c1, %arg6 + %c1, %c2] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %85 = affine.load %arg1[0, %c1, %c1, %c2] : memref<1x3x3x3xi32>
      %86 = arith.muli %85, %84 : i32
      %87 = arith.addi %83, %86 : i32
      %88 = arith.index_cast %c2 : index to i32
      %89 = arith.addi %1, %88 : i32
      %90 = scf.if %55 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi slt, %89, %c0_i32 : i32
        scf.yield %159 : i1
      }
      %91 = scf.if %90 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %89, %c224_i32 : i32
        scf.yield %159 : i1
      }
      %92 = scf.if %91 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c1, %arg6 + %c2, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %93 = affine.load %arg1[0, %c1, %c2, %c0_1] : memref<1x3x3x3xi32>
      %94 = arith.muli %93, %92 : i32
      %95 = arith.addi %87, %94 : i32
      %96 = scf.if %91 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c1, %arg6 + %c2, %c1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %97 = affine.load %arg1[0, %c1, %c2, %c1] : memref<1x3x3x3xi32>
      %98 = arith.muli %97, %96 : i32
      %99 = arith.addi %95, %98 : i32
      %100 = scf.if %91 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c1, %arg6 + %c2, %c2] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %101 = affine.load %arg1[0, %c1, %c2, %c2] : memref<1x3x3x3xi32>
      %102 = arith.muli %101, %100 : i32
      %103 = arith.addi %99, %102 : i32
      %104 = arith.index_cast %c2 : index to i32
      %105 = arith.addi %0, %104 : i32
      %106 = affine.if affine_set<(d0) : (-d0 - 3 >= 0)>(%arg5) -> i1 {
        affine.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %105, %c224_i32 : i32
        affine.yield %159 : i1
      }
      %107 = arith.index_cast %c0_0 : index to i32
      %108 = arith.addi %1, %107 : i32
      %109 = scf.if %106 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi slt, %108, %c0_i32 : i32
        scf.yield %159 : i1
      }
      %110 = scf.if %109 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %108, %c224_i32 : i32
        scf.yield %159 : i1
      }
      %111 = scf.if %110 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c2, %arg6 + %c0_0, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %112 = affine.load %arg1[0, %c2, %c0_0, %c0_1] : memref<1x3x3x3xi32>
      %113 = arith.muli %112, %111 : i32
      %114 = arith.addi %103, %113 : i32
      %115 = scf.if %110 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c2, %arg6 + %c0_0, %c1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %116 = affine.load %arg1[0, %c2, %c0_0, %c1] : memref<1x3x3x3xi32>
      %117 = arith.muli %116, %115 : i32
      %118 = arith.addi %114, %117 : i32
      %119 = scf.if %110 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c2, %arg6 + %c0_0, %c2] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %120 = affine.load %arg1[0, %c2, %c0_0, %c2] : memref<1x3x3x3xi32>
      %121 = arith.muli %120, %119 : i32
      %122 = arith.addi %118, %121 : i32
      %123 = arith.index_cast %c1 : index to i32
      %124 = arith.addi %1, %123 : i32
      %125 = scf.if %106 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi slt, %124, %c0_i32 : i32
        scf.yield %159 : i1
      }
      %126 = scf.if %125 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %124, %c224_i32 : i32
        scf.yield %159 : i1
      }
      %127 = scf.if %126 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c2, %arg6 + %c1, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %128 = affine.load %arg1[0, %c2, %c1, %c0_1] : memref<1x3x3x3xi32>
      %129 = arith.muli %128, %127 : i32
      %130 = arith.addi %122, %129 : i32
      %131 = scf.if %126 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c2, %arg6 + %c1, %c1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %132 = affine.load %arg1[0, %c2, %c1, %c1] : memref<1x3x3x3xi32>
      %133 = arith.muli %132, %131 : i32
      %134 = arith.addi %130, %133 : i32
      %135 = scf.if %126 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c2, %arg6 + %c1, %c2] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %136 = affine.load %arg1[0, %c2, %c1, %c2] : memref<1x3x3x3xi32>
      %137 = arith.muli %136, %135 : i32
      %138 = arith.addi %134, %137 : i32
      %139 = arith.index_cast %c2 : index to i32
      %140 = arith.addi %1, %139 : i32
      %141 = scf.if %106 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi slt, %140, %c0_i32 : i32
        scf.yield %159 : i1
      }
      %142 = scf.if %141 -> (i1) {
        scf.yield %true : i1
      } else {
        %159 = arith.cmpi sge, %140, %c224_i32 : i32
        scf.yield %159 : i1
      }
      %143 = scf.if %142 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c2, %arg6 + %c2, %c0_1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %144 = affine.load %arg1[0, %c2, %c2, %c0_1] : memref<1x3x3x3xi32>
      %145 = arith.muli %144, %143 : i32
      %146 = arith.addi %138, %145 : i32
      %147 = scf.if %142 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c2, %arg6 + %c2, %c1] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %148 = affine.load %arg1[0, %c2, %c2, %c1] : memref<1x3x3x3xi32>
      %149 = arith.muli %148, %147 : i32
      %150 = arith.addi %146, %149 : i32
      %151 = scf.if %142 -> (i32) {
        scf.yield %c0_i32 : i32
      } else {
        %159 = affine.load %arg0[0, %arg5 + %c2, %arg6 + %c2, %c2] : memref<1x5x224x3xi32>
        scf.yield %159 : i32
      }
      %152 = affine.load %arg1[0, %c2, %c2, %c2] : memref<1x3x3x3xi32>
      %153 = arith.muli %152, %151 : i32
      %154 = arith.addi %150, %153 : i32
      %155 = arith.addi %154, %arg2 : i32
      %156 = arith.cmpi sgt, %155, %c2147483647_i32 : i32
      %157 = scf.if %156 -> (i64) {
        scf.yield %c2147483647_i64 : i64
      } else {
        %159 = arith.extsi %155 : i32 to i64
        %160 = arith.cmpi slt, %159, %c-2147483648_i64 : i64
        %161 = arith.select %160, %c-2147483648_i64, %159 : i64
        scf.yield %161 : i64
      }
      %158 = arith.trunci %157 : i64 to i32
      affine.store %158, %arg3[0, %arg5, %arg6, %arg4] : memref<1x3x222x1xi32>
    }
  }
  return
}

// -----// IR Dump After Canonicalizer (canonicalize) //----- //
#set0 = affine_set<(d0) : (-d0 - 1 >= 0)>
#set1 = affine_set<(d0) : (-d0 - 2 >= 0)>
#set2 = affine_set<(d0) : (-d0 - 3 >= 0)>
module {
  func.func @conv_kernel_0(%arg0: memref<1x5x224x3xi32>, %arg1: memref<1x3x3x3xi32>, %arg2: i32, %arg3: memref<1x3x222x1xi32>, %arg4: index) attributes {Kernel, conv_kernel_0} {
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %c-2147483648_i64 = arith.constant -2147483648 : i64
    %c2147483647_i64 = arith.constant 2147483647 : i64
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %c0_i32 = arith.constant 0 : i32
    %c224_i32 = arith.constant 224 : i32
    %true = arith.constant true
    affine.for %arg5 = 0 to 3 {
      %0 = arith.index_cast %arg5 : index to i32
      affine.for %arg6 = 0 to 222 {
        %1 = arith.index_cast %arg6 : index to i32
        %2 = affine.if #set0(%arg5) -> i1 {
          affine.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %0, %c224_i32 : i32
          affine.yield %142 : i1
        }
        %3 = scf.if %2 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi slt, %1, %c0_i32 : i32
          scf.yield %142 : i1
        }
        %4 = scf.if %3 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %1, %c224_i32 : i32
          scf.yield %142 : i1
        }
        %5 = scf.if %4 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5, %arg6, 0] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %6 = affine.load %arg1[0, 0, 0, 0] : memref<1x3x3x3xi32>
        %7 = arith.muli %6, %5 : i32
        %8 = scf.if %4 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5, %arg6, 1] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %9 = affine.load %arg1[0, 0, 0, 1] : memref<1x3x3x3xi32>
        %10 = arith.muli %9, %8 : i32
        %11 = arith.addi %7, %10 : i32
        %12 = scf.if %4 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5, %arg6, 2] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %13 = affine.load %arg1[0, 0, 0, 2] : memref<1x3x3x3xi32>
        %14 = arith.muli %13, %12 : i32
        %15 = arith.addi %11, %14 : i32
        %16 = arith.addi %1, %c1_i32 : i32
        %17 = scf.if %2 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi slt, %16, %c0_i32 : i32
          scf.yield %142 : i1
        }
        %18 = scf.if %17 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %16, %c224_i32 : i32
          scf.yield %142 : i1
        }
        %19 = scf.if %18 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5, %arg6 + 1, 0] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %20 = affine.load %arg1[0, 0, 1, 0] : memref<1x3x3x3xi32>
        %21 = arith.muli %20, %19 : i32
        %22 = arith.addi %15, %21 : i32
        %23 = scf.if %18 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5, %arg6 + 1, 1] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %24 = affine.load %arg1[0, 0, 1, 1] : memref<1x3x3x3xi32>
        %25 = arith.muli %24, %23 : i32
        %26 = arith.addi %22, %25 : i32
        %27 = scf.if %18 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5, %arg6 + 1, 2] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %28 = affine.load %arg1[0, 0, 1, 2] : memref<1x3x3x3xi32>
        %29 = arith.muli %28, %27 : i32
        %30 = arith.addi %26, %29 : i32
        %31 = arith.addi %1, %c2_i32 : i32
        %32 = scf.if %2 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi slt, %31, %c0_i32 : i32
          scf.yield %142 : i1
        }
        %33 = scf.if %32 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %31, %c224_i32 : i32
          scf.yield %142 : i1
        }
        %34 = scf.if %33 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5, %arg6 + 2, 0] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %35 = affine.load %arg1[0, 0, 2, 0] : memref<1x3x3x3xi32>
        %36 = arith.muli %35, %34 : i32
        %37 = arith.addi %30, %36 : i32
        %38 = scf.if %33 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5, %arg6 + 2, 1] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %39 = affine.load %arg1[0, 0, 2, 1] : memref<1x3x3x3xi32>
        %40 = arith.muli %39, %38 : i32
        %41 = arith.addi %37, %40 : i32
        %42 = scf.if %33 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5, %arg6 + 2, 2] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %43 = affine.load %arg1[0, 0, 2, 2] : memref<1x3x3x3xi32>
        %44 = arith.muli %43, %42 : i32
        %45 = arith.addi %41, %44 : i32
        %46 = arith.addi %0, %c1_i32 : i32
        %47 = affine.if #set1(%arg5) -> i1 {
          affine.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %46, %c224_i32 : i32
          affine.yield %142 : i1
        }
        %48 = scf.if %47 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi slt, %1, %c0_i32 : i32
          scf.yield %142 : i1
        }
        %49 = scf.if %48 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %1, %c224_i32 : i32
          scf.yield %142 : i1
        }
        %50 = scf.if %49 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 1, %arg6, 0] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %51 = affine.load %arg1[0, 1, 0, 0] : memref<1x3x3x3xi32>
        %52 = arith.muli %51, %50 : i32
        %53 = arith.addi %45, %52 : i32
        %54 = scf.if %49 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 1, %arg6, 1] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %55 = affine.load %arg1[0, 1, 0, 1] : memref<1x3x3x3xi32>
        %56 = arith.muli %55, %54 : i32
        %57 = arith.addi %53, %56 : i32
        %58 = scf.if %49 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 1, %arg6, 2] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %59 = affine.load %arg1[0, 1, 0, 2] : memref<1x3x3x3xi32>
        %60 = arith.muli %59, %58 : i32
        %61 = arith.addi %57, %60 : i32
        %62 = arith.addi %1, %c1_i32 : i32
        %63 = scf.if %47 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi slt, %62, %c0_i32 : i32
          scf.yield %142 : i1
        }
        %64 = scf.if %63 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %62, %c224_i32 : i32
          scf.yield %142 : i1
        }
        %65 = scf.if %64 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 1, %arg6 + 1, 0] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %66 = affine.load %arg1[0, 1, 1, 0] : memref<1x3x3x3xi32>
        %67 = arith.muli %66, %65 : i32
        %68 = arith.addi %61, %67 : i32
        %69 = scf.if %64 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 1, %arg6 + 1, 1] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %70 = affine.load %arg1[0, 1, 1, 1] : memref<1x3x3x3xi32>
        %71 = arith.muli %70, %69 : i32
        %72 = arith.addi %68, %71 : i32
        %73 = scf.if %64 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 1, %arg6 + 1, 2] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %74 = affine.load %arg1[0, 1, 1, 2] : memref<1x3x3x3xi32>
        %75 = arith.muli %74, %73 : i32
        %76 = arith.addi %72, %75 : i32
        %77 = arith.addi %1, %c2_i32 : i32
        %78 = scf.if %47 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi slt, %77, %c0_i32 : i32
          scf.yield %142 : i1
        }
        %79 = scf.if %78 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %77, %c224_i32 : i32
          scf.yield %142 : i1
        }
        %80 = scf.if %79 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 1, %arg6 + 2, 0] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %81 = affine.load %arg1[0, 1, 2, 0] : memref<1x3x3x3xi32>
        %82 = arith.muli %81, %80 : i32
        %83 = arith.addi %76, %82 : i32
        %84 = scf.if %79 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 1, %arg6 + 2, 1] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %85 = affine.load %arg1[0, 1, 2, 1] : memref<1x3x3x3xi32>
        %86 = arith.muli %85, %84 : i32
        %87 = arith.addi %83, %86 : i32
        %88 = scf.if %79 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 1, %arg6 + 2, 2] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %89 = affine.load %arg1[0, 1, 2, 2] : memref<1x3x3x3xi32>
        %90 = arith.muli %89, %88 : i32
        %91 = arith.addi %87, %90 : i32
        %92 = arith.addi %0, %c2_i32 : i32
        %93 = affine.if #set2(%arg5) -> i1 {
          affine.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %92, %c224_i32 : i32
          affine.yield %142 : i1
        }
        %94 = scf.if %93 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi slt, %1, %c0_i32 : i32
          scf.yield %142 : i1
        }
        %95 = scf.if %94 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %1, %c224_i32 : i32
          scf.yield %142 : i1
        }
        %96 = scf.if %95 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 2, %arg6, 0] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %97 = affine.load %arg1[0, 2, 0, 0] : memref<1x3x3x3xi32>
        %98 = arith.muli %97, %96 : i32
        %99 = arith.addi %91, %98 : i32
        %100 = scf.if %95 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 2, %arg6, 1] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %101 = affine.load %arg1[0, 2, 0, 1] : memref<1x3x3x3xi32>
        %102 = arith.muli %101, %100 : i32
        %103 = arith.addi %99, %102 : i32
        %104 = scf.if %95 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 2, %arg6, 2] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %105 = affine.load %arg1[0, 2, 0, 2] : memref<1x3x3x3xi32>
        %106 = arith.muli %105, %104 : i32
        %107 = arith.addi %103, %106 : i32
        %108 = arith.addi %1, %c1_i32 : i32
        %109 = scf.if %93 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi slt, %108, %c0_i32 : i32
          scf.yield %142 : i1
        }
        %110 = scf.if %109 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %108, %c224_i32 : i32
          scf.yield %142 : i1
        }
        %111 = scf.if %110 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 2, %arg6 + 1, 0] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %112 = affine.load %arg1[0, 2, 1, 0] : memref<1x3x3x3xi32>
        %113 = arith.muli %112, %111 : i32
        %114 = arith.addi %107, %113 : i32
        %115 = scf.if %110 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 2, %arg6 + 1, 1] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %116 = affine.load %arg1[0, 2, 1, 1] : memref<1x3x3x3xi32>
        %117 = arith.muli %116, %115 : i32
        %118 = arith.addi %114, %117 : i32
        %119 = scf.if %110 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 2, %arg6 + 1, 2] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %120 = affine.load %arg1[0, 2, 1, 2] : memref<1x3x3x3xi32>
        %121 = arith.muli %120, %119 : i32
        %122 = arith.addi %118, %121 : i32
        %123 = arith.addi %1, %c2_i32 : i32
        %124 = scf.if %93 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi slt, %123, %c0_i32 : i32
          scf.yield %142 : i1
        }
        %125 = scf.if %124 -> (i1) {
          scf.yield %true : i1
        } else {
          %142 = arith.cmpi sge, %123, %c224_i32 : i32
          scf.yield %142 : i1
        }
        %126 = scf.if %125 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 2, %arg6 + 2, 0] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %127 = affine.load %arg1[0, 2, 2, 0] : memref<1x3x3x3xi32>
        %128 = arith.muli %127, %126 : i32
        %129 = arith.addi %122, %128 : i32
        %130 = scf.if %125 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 2, %arg6 + 2, 1] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %131 = affine.load %arg1[0, 2, 2, 1] : memref<1x3x3x3xi32>
        %132 = arith.muli %131, %130 : i32
        %133 = arith.addi %129, %132 : i32
        %134 = scf.if %125 -> (i32) {
          scf.yield %c0_i32 : i32
        } else {
          %142 = affine.load %arg0[0, %arg5 + 2, %arg6 + 2, 2] : memref<1x5x224x3xi32>
          scf.yield %142 : i32
        }
        %135 = affine.load %arg1[0, 2, 2, 2] : memref<1x3x3x3xi32>
        %136 = arith.muli %135, %134 : i32
        %137 = arith.addi %133, %136 : i32
        %138 = arith.addi %137, %arg2 : i32
        %139 = arith.cmpi sgt, %138, %c2147483647_i32 : i32
        %140 = scf.if %139 -> (i64) {
          scf.yield %c2147483647_i64 : i64
        } else {
          %142 = arith.extsi %138 : i32 to i64
          %143 = arith.cmpi slt, %142, %c-2147483648_i64 : i64
          %144 = arith.select %143, %c-2147483648_i64, %142 : i64
          scf.yield %144 : i64
        }
        %141 = arith.trunci %140 : i64 to i32
        affine.store %141, %arg3[0, %arg5, %arg6, symbol(%arg4)] : memref<1x3x222x1xi32>
      }
    }
    return
  }
}



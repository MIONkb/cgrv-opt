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


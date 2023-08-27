#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 2)>
#map2 = affine_map<(d0) -> (d0 + 3)>
#map3 = affine_map<(d0) -> (d0 + 4)>
#map4 = affine_map<(d0) -> (d0 + 5)>
#map5 = affine_map<(d0) -> (d0 + 6)>
#map6 = affine_map<(d0) -> (d0 + 7)>
#map7 = affine_map<(d0) -> (d0 + 8)>
#map8 = affine_map<(d0) -> (d0 + 9)>
#map9 = affine_map<(d0) -> (d0 + 10)>
#map10 = affine_map<(d0) -> (d0 + 11)>
#map11 = affine_map<(d0) -> (d0 + 12)>
#map12 = affine_map<(d0) -> (d0 + 13)>
#map13 = affine_map<(d0) -> (d0 + 14)>
#map14 = affine_map<(d0) -> (d0 + 15)>
#map15 = affine_map<(d0) -> (d0 + 16)>
#map16 = affine_map<(d0) -> (d0 + 17)>
#map17 = affine_map<(d0) -> (d0 + 18)>
#map18 = affine_map<(d0) -> (d0 + 19)>
#map19 = affine_map<(d0) -> (d0 + 20)>
#map20 = affine_map<(d0) -> (d0 + 21)>
#map21 = affine_map<(d0) -> (d0 + 22)>
#map22 = affine_map<(d0) -> (d0 + 23)>
#map23 = affine_map<(d0) -> (d0 + 24)>
#map24 = affine_map<(d0) -> (d0 + 25)>
#map25 = affine_map<(d0) -> (d0 + 26)>
#map26 = affine_map<(d0) -> (d0 + 27)>
#map27 = affine_map<(d0) -> (d0 + 28)>
#map28 = affine_map<(d0) -> (d0 + 29)>
#map29 = affine_map<(d0) -> (d0 + 30)>
#map30 = affine_map<(d0) -> (d0 + 31)>
#map31 = affine_map<(d0) -> (d0 + 32)>
#map32 = affine_map<(d0) -> (d0 + 33)>
#map33 = affine_map<(d0) -> (d0 + 34)>
#map34 = affine_map<(d0) -> (d0 + 35)>
#map35 = affine_map<(d0) -> (d0 + 36)>
#map36 = affine_map<(d0) -> (d0 + 37)>
#map37 = affine_map<(d0) -> (d0 + 38)>
#map38 = affine_map<(d0) -> (d0 + 39)>
#map39 = affine_map<(d0) -> (d0 + 40)>
#map40 = affine_map<(d0) -> (d0 + 41)>
#map41 = affine_map<(d0) -> (d0 + 42)>
#map42 = affine_map<(d0) -> (d0 + 43)>
#map43 = affine_map<(d0) -> (d0 + 44)>
#map44 = affine_map<(d0) -> (d0 + 45)>
#map45 = affine_map<(d0) -> (d0 + 46)>
#map46 = affine_map<(d0) -> (d0 + 47)>
#map47 = affine_map<(d0) -> (d0 + 48)>
#map48 = affine_map<(d0) -> (d0 + 49)>
#map49 = affine_map<(d0) -> (d0 + 50)>
#map50 = affine_map<(d0) -> (d0 + 51)>
#map51 = affine_map<(d0) -> (d0 + 52)>
#map52 = affine_map<(d0) -> (d0 + 53)>
#map53 = affine_map<(d0) -> (d0 + 54)>
#map54 = affine_map<(d0) -> (d0 + 55)>
module {
  func.func @forward_kernel_2(%arg0: memref<1x64x112x112xf32>, %arg1: memref<1x64x112x112xf32>) attributes {Kernel, forward_kernel_2} {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 16 {
      affine.for %arg3 = 0 to 112 step 56 {
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
        %27 = affine.apply #map6(%arg3)
        %28 = affine.load %arg0[0, 0, %arg2, %27] : memref<1x64x112x112xf32>
        %29 = arith.cmpf ugt, %28, %cst : f32
        %30 = arith.select %29, %28, %cst : f32
        affine.store %30, %arg1[0, 0, %arg2, %27] : memref<1x64x112x112xf32>
        %31 = affine.apply #map7(%arg3)
        %32 = affine.load %arg0[0, 0, %arg2, %31] : memref<1x64x112x112xf32>
        %33 = arith.cmpf ugt, %32, %cst : f32
        %34 = arith.select %33, %32, %cst : f32
        affine.store %34, %arg1[0, 0, %arg2, %31] : memref<1x64x112x112xf32>
        %35 = affine.apply #map8(%arg3)
        %36 = affine.load %arg0[0, 0, %arg2, %35] : memref<1x64x112x112xf32>
        %37 = arith.cmpf ugt, %36, %cst : f32
        %38 = arith.select %37, %36, %cst : f32
        affine.store %38, %arg1[0, 0, %arg2, %35] : memref<1x64x112x112xf32>
        %39 = affine.apply #map9(%arg3)
        %40 = affine.load %arg0[0, 0, %arg2, %39] : memref<1x64x112x112xf32>
        %41 = arith.cmpf ugt, %40, %cst : f32
        %42 = arith.select %41, %40, %cst : f32
        affine.store %42, %arg1[0, 0, %arg2, %39] : memref<1x64x112x112xf32>
        %43 = affine.apply #map10(%arg3)
        %44 = affine.load %arg0[0, 0, %arg2, %43] : memref<1x64x112x112xf32>
        %45 = arith.cmpf ugt, %44, %cst : f32
        %46 = arith.select %45, %44, %cst : f32
        affine.store %46, %arg1[0, 0, %arg2, %43] : memref<1x64x112x112xf32>
        %47 = affine.apply #map11(%arg3)
        %48 = affine.load %arg0[0, 0, %arg2, %47] : memref<1x64x112x112xf32>
        %49 = arith.cmpf ugt, %48, %cst : f32
        %50 = arith.select %49, %48, %cst : f32
        affine.store %50, %arg1[0, 0, %arg2, %47] : memref<1x64x112x112xf32>
        %51 = affine.apply #map12(%arg3)
        %52 = affine.load %arg0[0, 0, %arg2, %51] : memref<1x64x112x112xf32>
        %53 = arith.cmpf ugt, %52, %cst : f32
        %54 = arith.select %53, %52, %cst : f32
        affine.store %54, %arg1[0, 0, %arg2, %51] : memref<1x64x112x112xf32>
        %55 = affine.apply #map13(%arg3)
        %56 = affine.load %arg0[0, 0, %arg2, %55] : memref<1x64x112x112xf32>
        %57 = arith.cmpf ugt, %56, %cst : f32
        %58 = arith.select %57, %56, %cst : f32
        affine.store %58, %arg1[0, 0, %arg2, %55] : memref<1x64x112x112xf32>
        %59 = affine.apply #map14(%arg3)
        %60 = affine.load %arg0[0, 0, %arg2, %59] : memref<1x64x112x112xf32>
        %61 = arith.cmpf ugt, %60, %cst : f32
        %62 = arith.select %61, %60, %cst : f32
        affine.store %62, %arg1[0, 0, %arg2, %59] : memref<1x64x112x112xf32>
        %63 = affine.apply #map15(%arg3)
        %64 = affine.load %arg0[0, 0, %arg2, %63] : memref<1x64x112x112xf32>
        %65 = arith.cmpf ugt, %64, %cst : f32
        %66 = arith.select %65, %64, %cst : f32
        affine.store %66, %arg1[0, 0, %arg2, %63] : memref<1x64x112x112xf32>
        %67 = affine.apply #map16(%arg3)
        %68 = affine.load %arg0[0, 0, %arg2, %67] : memref<1x64x112x112xf32>
        %69 = arith.cmpf ugt, %68, %cst : f32
        %70 = arith.select %69, %68, %cst : f32
        affine.store %70, %arg1[0, 0, %arg2, %67] : memref<1x64x112x112xf32>
        %71 = affine.apply #map17(%arg3)
        %72 = affine.load %arg0[0, 0, %arg2, %71] : memref<1x64x112x112xf32>
        %73 = arith.cmpf ugt, %72, %cst : f32
        %74 = arith.select %73, %72, %cst : f32
        affine.store %74, %arg1[0, 0, %arg2, %71] : memref<1x64x112x112xf32>
        %75 = affine.apply #map18(%arg3)
        %76 = affine.load %arg0[0, 0, %arg2, %75] : memref<1x64x112x112xf32>
        %77 = arith.cmpf ugt, %76, %cst : f32
        %78 = arith.select %77, %76, %cst : f32
        affine.store %78, %arg1[0, 0, %arg2, %75] : memref<1x64x112x112xf32>
        %79 = affine.apply #map19(%arg3)
        %80 = affine.load %arg0[0, 0, %arg2, %79] : memref<1x64x112x112xf32>
        %81 = arith.cmpf ugt, %80, %cst : f32
        %82 = arith.select %81, %80, %cst : f32
        affine.store %82, %arg1[0, 0, %arg2, %79] : memref<1x64x112x112xf32>
        %83 = affine.apply #map20(%arg3)
        %84 = affine.load %arg0[0, 0, %arg2, %83] : memref<1x64x112x112xf32>
        %85 = arith.cmpf ugt, %84, %cst : f32
        %86 = arith.select %85, %84, %cst : f32
        affine.store %86, %arg1[0, 0, %arg2, %83] : memref<1x64x112x112xf32>
        %87 = affine.apply #map21(%arg3)
        %88 = affine.load %arg0[0, 0, %arg2, %87] : memref<1x64x112x112xf32>
        %89 = arith.cmpf ugt, %88, %cst : f32
        %90 = arith.select %89, %88, %cst : f32
        affine.store %90, %arg1[0, 0, %arg2, %87] : memref<1x64x112x112xf32>
        %91 = affine.apply #map22(%arg3)
        %92 = affine.load %arg0[0, 0, %arg2, %91] : memref<1x64x112x112xf32>
        %93 = arith.cmpf ugt, %92, %cst : f32
        %94 = arith.select %93, %92, %cst : f32
        affine.store %94, %arg1[0, 0, %arg2, %91] : memref<1x64x112x112xf32>
        %95 = affine.apply #map23(%arg3)
        %96 = affine.load %arg0[0, 0, %arg2, %95] : memref<1x64x112x112xf32>
        %97 = arith.cmpf ugt, %96, %cst : f32
        %98 = arith.select %97, %96, %cst : f32
        affine.store %98, %arg1[0, 0, %arg2, %95] : memref<1x64x112x112xf32>
        %99 = affine.apply #map24(%arg3)
        %100 = affine.load %arg0[0, 0, %arg2, %99] : memref<1x64x112x112xf32>
        %101 = arith.cmpf ugt, %100, %cst : f32
        %102 = arith.select %101, %100, %cst : f32
        affine.store %102, %arg1[0, 0, %arg2, %99] : memref<1x64x112x112xf32>
        %103 = affine.apply #map25(%arg3)
        %104 = affine.load %arg0[0, 0, %arg2, %103] : memref<1x64x112x112xf32>
        %105 = arith.cmpf ugt, %104, %cst : f32
        %106 = arith.select %105, %104, %cst : f32
        affine.store %106, %arg1[0, 0, %arg2, %103] : memref<1x64x112x112xf32>
        %107 = affine.apply #map26(%arg3)
        %108 = affine.load %arg0[0, 0, %arg2, %107] : memref<1x64x112x112xf32>
        %109 = arith.cmpf ugt, %108, %cst : f32
        %110 = arith.select %109, %108, %cst : f32
        affine.store %110, %arg1[0, 0, %arg2, %107] : memref<1x64x112x112xf32>
        %111 = affine.apply #map27(%arg3)
        %112 = affine.load %arg0[0, 0, %arg2, %111] : memref<1x64x112x112xf32>
        %113 = arith.cmpf ugt, %112, %cst : f32
        %114 = arith.select %113, %112, %cst : f32
        affine.store %114, %arg1[0, 0, %arg2, %111] : memref<1x64x112x112xf32>
        %115 = affine.apply #map28(%arg3)
        %116 = affine.load %arg0[0, 0, %arg2, %115] : memref<1x64x112x112xf32>
        %117 = arith.cmpf ugt, %116, %cst : f32
        %118 = arith.select %117, %116, %cst : f32
        affine.store %118, %arg1[0, 0, %arg2, %115] : memref<1x64x112x112xf32>
        %119 = affine.apply #map29(%arg3)
        %120 = affine.load %arg0[0, 0, %arg2, %119] : memref<1x64x112x112xf32>
        %121 = arith.cmpf ugt, %120, %cst : f32
        %122 = arith.select %121, %120, %cst : f32
        affine.store %122, %arg1[0, 0, %arg2, %119] : memref<1x64x112x112xf32>
        %123 = affine.apply #map30(%arg3)
        %124 = affine.load %arg0[0, 0, %arg2, %123] : memref<1x64x112x112xf32>
        %125 = arith.cmpf ugt, %124, %cst : f32
        %126 = arith.select %125, %124, %cst : f32
        affine.store %126, %arg1[0, 0, %arg2, %123] : memref<1x64x112x112xf32>
        %127 = affine.apply #map31(%arg3)
        %128 = affine.load %arg0[0, 0, %arg2, %127] : memref<1x64x112x112xf32>
        %129 = arith.cmpf ugt, %128, %cst : f32
        %130 = arith.select %129, %128, %cst : f32
        affine.store %130, %arg1[0, 0, %arg2, %127] : memref<1x64x112x112xf32>
        %131 = affine.apply #map32(%arg3)
        %132 = affine.load %arg0[0, 0, %arg2, %131] : memref<1x64x112x112xf32>
        %133 = arith.cmpf ugt, %132, %cst : f32
        %134 = arith.select %133, %132, %cst : f32
        affine.store %134, %arg1[0, 0, %arg2, %131] : memref<1x64x112x112xf32>
        %135 = affine.apply #map33(%arg3)
        %136 = affine.load %arg0[0, 0, %arg2, %135] : memref<1x64x112x112xf32>
        %137 = arith.cmpf ugt, %136, %cst : f32
        %138 = arith.select %137, %136, %cst : f32
        affine.store %138, %arg1[0, 0, %arg2, %135] : memref<1x64x112x112xf32>
        %139 = affine.apply #map34(%arg3)
        %140 = affine.load %arg0[0, 0, %arg2, %139] : memref<1x64x112x112xf32>
        %141 = arith.cmpf ugt, %140, %cst : f32
        %142 = arith.select %141, %140, %cst : f32
        affine.store %142, %arg1[0, 0, %arg2, %139] : memref<1x64x112x112xf32>
        %143 = affine.apply #map35(%arg3)
        %144 = affine.load %arg0[0, 0, %arg2, %143] : memref<1x64x112x112xf32>
        %145 = arith.cmpf ugt, %144, %cst : f32
        %146 = arith.select %145, %144, %cst : f32
        affine.store %146, %arg1[0, 0, %arg2, %143] : memref<1x64x112x112xf32>
        %147 = affine.apply #map36(%arg3)
        %148 = affine.load %arg0[0, 0, %arg2, %147] : memref<1x64x112x112xf32>
        %149 = arith.cmpf ugt, %148, %cst : f32
        %150 = arith.select %149, %148, %cst : f32
        affine.store %150, %arg1[0, 0, %arg2, %147] : memref<1x64x112x112xf32>
        %151 = affine.apply #map37(%arg3)
        %152 = affine.load %arg0[0, 0, %arg2, %151] : memref<1x64x112x112xf32>
        %153 = arith.cmpf ugt, %152, %cst : f32
        %154 = arith.select %153, %152, %cst : f32
        affine.store %154, %arg1[0, 0, %arg2, %151] : memref<1x64x112x112xf32>
        %155 = affine.apply #map38(%arg3)
        %156 = affine.load %arg0[0, 0, %arg2, %155] : memref<1x64x112x112xf32>
        %157 = arith.cmpf ugt, %156, %cst : f32
        %158 = arith.select %157, %156, %cst : f32
        affine.store %158, %arg1[0, 0, %arg2, %155] : memref<1x64x112x112xf32>
        %159 = affine.apply #map39(%arg3)
        %160 = affine.load %arg0[0, 0, %arg2, %159] : memref<1x64x112x112xf32>
        %161 = arith.cmpf ugt, %160, %cst : f32
        %162 = arith.select %161, %160, %cst : f32
        affine.store %162, %arg1[0, 0, %arg2, %159] : memref<1x64x112x112xf32>
        %163 = affine.apply #map40(%arg3)
        %164 = affine.load %arg0[0, 0, %arg2, %163] : memref<1x64x112x112xf32>
        %165 = arith.cmpf ugt, %164, %cst : f32
        %166 = arith.select %165, %164, %cst : f32
        affine.store %166, %arg1[0, 0, %arg2, %163] : memref<1x64x112x112xf32>
        %167 = affine.apply #map41(%arg3)
        %168 = affine.load %arg0[0, 0, %arg2, %167] : memref<1x64x112x112xf32>
        %169 = arith.cmpf ugt, %168, %cst : f32
        %170 = arith.select %169, %168, %cst : f32
        affine.store %170, %arg1[0, 0, %arg2, %167] : memref<1x64x112x112xf32>
        %171 = affine.apply #map42(%arg3)
        %172 = affine.load %arg0[0, 0, %arg2, %171] : memref<1x64x112x112xf32>
        %173 = arith.cmpf ugt, %172, %cst : f32
        %174 = arith.select %173, %172, %cst : f32
        affine.store %174, %arg1[0, 0, %arg2, %171] : memref<1x64x112x112xf32>
        %175 = affine.apply #map43(%arg3)
        %176 = affine.load %arg0[0, 0, %arg2, %175] : memref<1x64x112x112xf32>
        %177 = arith.cmpf ugt, %176, %cst : f32
        %178 = arith.select %177, %176, %cst : f32
        affine.store %178, %arg1[0, 0, %arg2, %175] : memref<1x64x112x112xf32>
        %179 = affine.apply #map44(%arg3)
        %180 = affine.load %arg0[0, 0, %arg2, %179] : memref<1x64x112x112xf32>
        %181 = arith.cmpf ugt, %180, %cst : f32
        %182 = arith.select %181, %180, %cst : f32
        affine.store %182, %arg1[0, 0, %arg2, %179] : memref<1x64x112x112xf32>
        %183 = affine.apply #map45(%arg3)
        %184 = affine.load %arg0[0, 0, %arg2, %183] : memref<1x64x112x112xf32>
        %185 = arith.cmpf ugt, %184, %cst : f32
        %186 = arith.select %185, %184, %cst : f32
        affine.store %186, %arg1[0, 0, %arg2, %183] : memref<1x64x112x112xf32>
        %187 = affine.apply #map46(%arg3)
        %188 = affine.load %arg0[0, 0, %arg2, %187] : memref<1x64x112x112xf32>
        %189 = arith.cmpf ugt, %188, %cst : f32
        %190 = arith.select %189, %188, %cst : f32
        affine.store %190, %arg1[0, 0, %arg2, %187] : memref<1x64x112x112xf32>
        %191 = affine.apply #map47(%arg3)
        %192 = affine.load %arg0[0, 0, %arg2, %191] : memref<1x64x112x112xf32>
        %193 = arith.cmpf ugt, %192, %cst : f32
        %194 = arith.select %193, %192, %cst : f32
        affine.store %194, %arg1[0, 0, %arg2, %191] : memref<1x64x112x112xf32>
        %195 = affine.apply #map48(%arg3)
        %196 = affine.load %arg0[0, 0, %arg2, %195] : memref<1x64x112x112xf32>
        %197 = arith.cmpf ugt, %196, %cst : f32
        %198 = arith.select %197, %196, %cst : f32
        affine.store %198, %arg1[0, 0, %arg2, %195] : memref<1x64x112x112xf32>
        %199 = affine.apply #map49(%arg3)
        %200 = affine.load %arg0[0, 0, %arg2, %199] : memref<1x64x112x112xf32>
        %201 = arith.cmpf ugt, %200, %cst : f32
        %202 = arith.select %201, %200, %cst : f32
        affine.store %202, %arg1[0, 0, %arg2, %199] : memref<1x64x112x112xf32>
        %203 = affine.apply #map50(%arg3)
        %204 = affine.load %arg0[0, 0, %arg2, %203] : memref<1x64x112x112xf32>
        %205 = arith.cmpf ugt, %204, %cst : f32
        %206 = arith.select %205, %204, %cst : f32
        affine.store %206, %arg1[0, 0, %arg2, %203] : memref<1x64x112x112xf32>
        %207 = affine.apply #map51(%arg3)
        %208 = affine.load %arg0[0, 0, %arg2, %207] : memref<1x64x112x112xf32>
        %209 = arith.cmpf ugt, %208, %cst : f32
        %210 = arith.select %209, %208, %cst : f32
        affine.store %210, %arg1[0, 0, %arg2, %207] : memref<1x64x112x112xf32>
        %211 = affine.apply #map52(%arg3)
        %212 = affine.load %arg0[0, 0, %arg2, %211] : memref<1x64x112x112xf32>
        %213 = arith.cmpf ugt, %212, %cst : f32
        %214 = arith.select %213, %212, %cst : f32
        affine.store %214, %arg1[0, 0, %arg2, %211] : memref<1x64x112x112xf32>
        %215 = affine.apply #map53(%arg3)
        %216 = affine.load %arg0[0, 0, %arg2, %215] : memref<1x64x112x112xf32>
        %217 = arith.cmpf ugt, %216, %cst : f32
        %218 = arith.select %217, %216, %cst : f32
        affine.store %218, %arg1[0, 0, %arg2, %215] : memref<1x64x112x112xf32>
        %219 = affine.apply #map54(%arg3)
        %220 = affine.load %arg0[0, 0, %arg2, %219] : memref<1x64x112x112xf32>
        %221 = arith.cmpf ugt, %220, %cst : f32
        %222 = arith.select %221, %220, %cst : f32
        affine.store %222, %arg1[0, 0, %arg2, %219] : memref<1x64x112x112xf32>
      }
    }
    return
  }
}

; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

declare ptr @malloc(i64)

declare void @free(ptr)

define ptr @forward(ptr %0, ptr %1) {
  %3 = call ptr @malloc(i64 add (i64 ptrtoint (ptr getelementptr (float, ptr null, i32 15) to i64), i64 64))
  %4 = ptrtoint ptr %3 to i64
  %5 = add i64 %4, 63
  %6 = urem i64 %5, 64
  %7 = sub i64 %5, %6
  %8 = inttoptr i64 %7 to ptr
  %9 = getelementptr float, ptr %0, i64 0
  %10 = getelementptr float, ptr %1, i64 0
  %11 = getelementptr float, ptr %8, i64 0
  call void @forward_kernel_0(ptr %9, ptr %10, ptr %11)
  ret ptr %3
}

declare void @forward_kernel_0(ptr, ptr, ptr)

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

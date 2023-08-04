; ModuleID = '/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/2_kernels_llvm/forward_kernel_0.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(argmem: write)
define void @forward_kernel_0(ptr nocapture writeonly %0) local_unnamed_addr #0 {
.preheader2:
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(634800) %0, i8 0, i64 634800, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { mustprogress nofree nosync nounwind willreturn memory(argmem: write) }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}

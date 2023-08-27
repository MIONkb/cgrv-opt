; ModuleID = 'forward_kernel_0_1_7_1_1_1_1_1_1.ll'
source_filename = "LLVMDialectModule"

; Function Attrs: argmemonly nofree norecurse nosync nounwind
define void @forward_kernel_0(ptr nocapture readonly %0, ptr nocapture readonly %1, ptr nocapture readonly %2, ptr nocapture writeonly %3) local_unnamed_addr #0 !dbg !3 {
  br label %5, !dbg !7

5:                                                ; preds = %4, %87
  %6 = phi i64 [ 0, %4 ], [ %89, %87 ]
  %7 = getelementptr float, ptr %0, i64 %6, !dbg !9
  %8 = load float, ptr %7, align 4, !dbg !10
  %9 = shl nuw i64 %6, 1
  br label %.preheader, !dbg !11

.preheader:                                       ; preds = %5, %84
  %10 = phi float [ %8, %5 ], [ %81, %84 ]
  %11 = phi i64 [ 0, %5 ], [ %85, %84 ]
  %12 = mul nuw nsw i64 %11, 52900
  %13 = mul nuw nsw i64 %11, 49
  br label %14, !dbg !12

14:                                               ; preds = %.preheader, %14
  %15 = phi float [ %10, %.preheader ], [ %81, %14 ]
  %16 = phi i64 [ 0, %.preheader ], [ %82, %14 ]
  %17 = mul nuw nsw i64 %16, 230, !dbg !13
  %18 = add nuw nsw i64 %17, %12, !dbg !14
  %19 = add nuw nsw i64 %18, %9, !dbg !15
  %20 = getelementptr float, ptr %1, i64 %19, !dbg !16
  %21 = load float, ptr %20, align 4, !dbg !17
  %22 = mul nuw nsw i64 %16, 7, !dbg !18
  %23 = add nuw nsw i64 %22, %13, !dbg !19
  %24 = getelementptr float, ptr %2, i64 %23, !dbg !20
  %25 = load float, ptr %24, align 4, !dbg !21
  %26 = fmul float %21, %25, !dbg !22
  %27 = fadd float %15, %26, !dbg !23
  %28 = add nuw nsw i64 %18, %9, !dbg !24
  %29 = or i64 %28, 1, !dbg !25
  %30 = getelementptr float, ptr %1, i64 %29, !dbg !26
  %31 = load float, ptr %30, align 4, !dbg !27
  %32 = add nuw nsw i64 %23, 1, !dbg !28
  %33 = getelementptr float, ptr %2, i64 %32, !dbg !29
  %34 = load float, ptr %33, align 4, !dbg !30
  %35 = fmul float %31, %34, !dbg !31
  %36 = fadd float %27, %35, !dbg !32
  %37 = add nuw nsw i64 %18, %9, !dbg !33
  %38 = add nuw nsw i64 %37, 2, !dbg !34
  %39 = getelementptr float, ptr %1, i64 %38, !dbg !35
  %40 = load float, ptr %39, align 4, !dbg !36
  %41 = add nuw nsw i64 %23, 2, !dbg !37
  %42 = getelementptr float, ptr %2, i64 %41, !dbg !38
  %43 = load float, ptr %42, align 4, !dbg !39
  %44 = fmul float %40, %43, !dbg !40
  %45 = fadd float %36, %44, !dbg !41
  %46 = add nuw nsw i64 %18, %9, !dbg !42
  %47 = add nuw nsw i64 %46, 3, !dbg !43
  %48 = getelementptr float, ptr %1, i64 %47, !dbg !44
  %49 = load float, ptr %48, align 4, !dbg !45
  %50 = add nuw nsw i64 %23, 3, !dbg !46
  %51 = getelementptr float, ptr %2, i64 %50, !dbg !47
  %52 = load float, ptr %51, align 4, !dbg !48
  %53 = fmul float %49, %52, !dbg !49
  %54 = fadd float %45, %53, !dbg !50
  %55 = add nuw nsw i64 %18, %9, !dbg !51
  %56 = add nuw nsw i64 %55, 4, !dbg !52
  %57 = getelementptr float, ptr %1, i64 %56, !dbg !53
  %58 = load float, ptr %57, align 4, !dbg !54
  %59 = add nuw nsw i64 %23, 4, !dbg !55
  %60 = getelementptr float, ptr %2, i64 %59, !dbg !56
  %61 = load float, ptr %60, align 4, !dbg !57
  %62 = fmul float %58, %61, !dbg !58
  %63 = fadd float %54, %62, !dbg !59
  %64 = add nuw nsw i64 %18, %9, !dbg !60
  %65 = add nuw nsw i64 %64, 5, !dbg !61
  %66 = getelementptr float, ptr %1, i64 %65, !dbg !62
  %67 = load float, ptr %66, align 4, !dbg !63
  %68 = add nuw nsw i64 %23, 5, !dbg !64
  %69 = getelementptr float, ptr %2, i64 %68, !dbg !65
  %70 = load float, ptr %69, align 4, !dbg !66
  %71 = fmul float %67, %70, !dbg !67
  %72 = fadd float %63, %71, !dbg !68
  %73 = add nuw nsw i64 %18, %9, !dbg !69
  %74 = add nuw nsw i64 %73, 6, !dbg !70
  %75 = getelementptr float, ptr %1, i64 %74, !dbg !71
  %76 = load float, ptr %75, align 4, !dbg !72
  %77 = add nuw nsw i64 %23, 6, !dbg !73
  %78 = getelementptr float, ptr %2, i64 %77, !dbg !74
  %79 = load float, ptr %78, align 4, !dbg !75
  %80 = fmul float %76, %79, !dbg !76
  %81 = fadd float %72, %80, !dbg !77
  %82 = add nuw nsw i64 %16, 1, !dbg !78
  %83 = icmp ult i64 %16, 6, !dbg !79
  br i1 %83, label %14, label %84, !dbg !12

84:                                               ; preds = %14
  %85 = add nuw nsw i64 %11, 1, !dbg !80
  %86 = icmp ult i64 %11, 2, !dbg !81
  br i1 %86, label %.preheader, label %87, !dbg !11

87:                                               ; preds = %84
  %88 = getelementptr float, ptr %3, i64 %6, !dbg !82
  store float %81, ptr %88, align 4, !dbg !83
  %89 = add nuw nsw i64 %6, 1, !dbg !84
  %90 = icmp ult i64 %6, 7, !dbg !85
  br i1 %90, label %5, label %91, !dbg !7

91:                                               ; preds = %87
  ret void, !dbg !86
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward_kernel_0", linkageName: "forward_kernel_0", scope: null, file: !4, line: 2, type: !5, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "forward_kernel_0_1_7_1_1_1_1_1_1_ll.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/ResnetSingleBLock/kernels/DesignSpace")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 25, column: 5, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 33, column: 11, scope: !8)
!10 = !DILocation(line: 34, column: 11, scope: !8)
!11 = !DILocation(line: 38, column: 5, scope: !8)
!12 = !DILocation(line: 43, column: 5, scope: !8)
!13 = !DILocation(line: 49, column: 11, scope: !8)
!14 = !DILocation(line: 50, column: 11, scope: !8)
!15 = !DILocation(line: 51, column: 11, scope: !8)
!16 = !DILocation(line: 52, column: 11, scope: !8)
!17 = !DILocation(line: 53, column: 11, scope: !8)
!18 = !DILocation(line: 57, column: 11, scope: !8)
!19 = !DILocation(line: 58, column: 11, scope: !8)
!20 = !DILocation(line: 60, column: 11, scope: !8)
!21 = !DILocation(line: 61, column: 11, scope: !8)
!22 = !DILocation(line: 62, column: 11, scope: !8)
!23 = !DILocation(line: 63, column: 11, scope: !8)
!24 = !DILocation(line: 65, column: 11, scope: !8)
!25 = !DILocation(line: 71, column: 11, scope: !8)
!26 = !DILocation(line: 72, column: 11, scope: !8)
!27 = !DILocation(line: 73, column: 11, scope: !8)
!28 = !DILocation(line: 79, column: 11, scope: !8)
!29 = !DILocation(line: 80, column: 11, scope: !8)
!30 = !DILocation(line: 81, column: 11, scope: !8)
!31 = !DILocation(line: 82, column: 11, scope: !8)
!32 = !DILocation(line: 83, column: 11, scope: !8)
!33 = !DILocation(line: 85, column: 11, scope: !8)
!34 = !DILocation(line: 91, column: 11, scope: !8)
!35 = !DILocation(line: 92, column: 11, scope: !8)
!36 = !DILocation(line: 93, column: 11, scope: !8)
!37 = !DILocation(line: 99, column: 11, scope: !8)
!38 = !DILocation(line: 100, column: 11, scope: !8)
!39 = !DILocation(line: 101, column: 11, scope: !8)
!40 = !DILocation(line: 102, column: 11, scope: !8)
!41 = !DILocation(line: 103, column: 11, scope: !8)
!42 = !DILocation(line: 105, column: 11, scope: !8)
!43 = !DILocation(line: 111, column: 11, scope: !8)
!44 = !DILocation(line: 112, column: 12, scope: !8)
!45 = !DILocation(line: 113, column: 12, scope: !8)
!46 = !DILocation(line: 119, column: 12, scope: !8)
!47 = !DILocation(line: 120, column: 12, scope: !8)
!48 = !DILocation(line: 121, column: 12, scope: !8)
!49 = !DILocation(line: 122, column: 12, scope: !8)
!50 = !DILocation(line: 123, column: 12, scope: !8)
!51 = !DILocation(line: 125, column: 12, scope: !8)
!52 = !DILocation(line: 131, column: 12, scope: !8)
!53 = !DILocation(line: 132, column: 12, scope: !8)
!54 = !DILocation(line: 133, column: 12, scope: !8)
!55 = !DILocation(line: 139, column: 12, scope: !8)
!56 = !DILocation(line: 140, column: 12, scope: !8)
!57 = !DILocation(line: 141, column: 12, scope: !8)
!58 = !DILocation(line: 142, column: 12, scope: !8)
!59 = !DILocation(line: 143, column: 12, scope: !8)
!60 = !DILocation(line: 145, column: 12, scope: !8)
!61 = !DILocation(line: 151, column: 12, scope: !8)
!62 = !DILocation(line: 152, column: 12, scope: !8)
!63 = !DILocation(line: 153, column: 12, scope: !8)
!64 = !DILocation(line: 159, column: 12, scope: !8)
!65 = !DILocation(line: 160, column: 12, scope: !8)
!66 = !DILocation(line: 161, column: 12, scope: !8)
!67 = !DILocation(line: 162, column: 12, scope: !8)
!68 = !DILocation(line: 163, column: 12, scope: !8)
!69 = !DILocation(line: 165, column: 12, scope: !8)
!70 = !DILocation(line: 171, column: 12, scope: !8)
!71 = !DILocation(line: 172, column: 12, scope: !8)
!72 = !DILocation(line: 173, column: 12, scope: !8)
!73 = !DILocation(line: 179, column: 12, scope: !8)
!74 = !DILocation(line: 180, column: 12, scope: !8)
!75 = !DILocation(line: 181, column: 12, scope: !8)
!76 = !DILocation(line: 182, column: 12, scope: !8)
!77 = !DILocation(line: 183, column: 12, scope: !8)
!78 = !DILocation(line: 184, column: 12, scope: !8)
!79 = !DILocation(line: 42, column: 11, scope: !8)
!80 = !DILocation(line: 187, column: 12, scope: !8)
!81 = !DILocation(line: 37, column: 11, scope: !8)
!82 = !DILocation(line: 196, column: 12, scope: !8)
!83 = !DILocation(line: 197, column: 5, scope: !8)
!84 = !DILocation(line: 198, column: 12, scope: !8)
!85 = !DILocation(line: 24, column: 11, scope: !8)
!86 = !DILocation(line: 201, column: 5, scope: !8)

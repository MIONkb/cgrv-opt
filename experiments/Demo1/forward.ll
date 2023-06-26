; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@__constant_12x3xf32 = private constant [12 x [3 x float]] [[3 x float] [float 0x3FD1D35760000000, float 0x3FDB6A40C0000000, float 0x3FC0615E00000000], [3 x float] [float 0xBFCCBBA8A0000000, float 0x3FDABA3C80000000, float 0x3FE15A4400000000], [3 x float] [float 0xBFE21A3520000000, float 0xBFDEED83E0000000, float 0xBFD73DBD60000000], [3 x float] [float 0xBFCDEEF4A0000000, float 0xBFD88FF6E0000000, float 0x3FA3B01400000000], [3 x float] [float 0x3FB6CB3AC0000000, float 0xBFD2479CC0000000, float 0x3FDED324A0000000], [3 x float] [float 0x3FC89A8B40000000, float 0xBFC3113520000000, float 0x3FDAC088C0000000], [3 x float] [float 0xBFB2CB02A0000000, float 0xBFD3597080000000, float 0x3FD5B07800000000], [3 x float] [float 0xBFDE0E6C20000000, float 0xBFB656A8A0000000, float 0xBFD4B39040000000], [3 x float] [float 0x3FE0EB06C0000000, float 0xBFE1154DC0000000, float 0x3F90EFA140000000], [3 x float] [float 0xBFCE0994E0000000, float 0xBFBF908920000000, float 0x3FD2AE9AE0000000], [3 x float] [float 0xBFC2ED7920000000, float 0xBFE0159A00000000, float 0xBFDA680740000000], [3 x float] [float 0xBFC55F10E0000000, float 0x3FB85A0660000000, float 0xBFB7D2B560000000]]
@__constant_3x12xf32 = private constant [3 x [12 x float]] [[12 x float] [float 0xBFB3627A00000000, float 0xBFBD4FB280000000, float 0xBFC058D5E0000000, float 0xBFBE086660000000, float 0x3FC9DF0740000000, float 0xBFD0A378C0000000, float 0xBFC6CBDCA0000000, float 0xBFC1EEE2A0000000, float 0xBFBE590320000000, float 0xBFD01B2C40000000, float 0xBFBBD49440000000, float 0xBFD0DB0BE0000000], [12 x float] [float 0x3FCD33FAE0000000, float 0x3FCDEAA140000000, float 0x3FD150FE40000000, float 0x3FBA1C1E00000000, float 0xBFBA8DCD00000000, float 0x3F6B89E140000000, float 0xBFB42EE760000000, float 0x3FCDDF08A0000000, float 0x3FB3436EC0000000, float 0x3FC88E1FC0000000, float 0xBFD17EB320000000, float 0xBFD1FD6460000000], [12 x float] [float 0xBFA1B0C580000000, float 0x3FCF04B640000000, float 0xBFC7A06180000000, float 0x3FD108FB40000000, float 0xBFC23C1900000000, float 0xBFCDB1EDA0000000, float 0xBFCE71E7E0000000, float 0x3FCD214040000000, float 0x3FCF6E75E0000000, float 0xBFA5EF36C0000000, float 0x3FC18DCC00000000, float 0x3FB83C0D80000000]]

declare ptr @malloc(i64)

declare void @free(ptr)

define ptr @forward(ptr %0) !dbg !3 {
  %2 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %0, 0, !dbg !7
  %3 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %2, ptr %0, 1, !dbg !9
  %4 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %3, i64 0, 2, !dbg !10
  %5 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %4, i64 4, 3, 0, !dbg !11
  %6 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, i64 3, 4, 0, !dbg !12
  %7 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %6, i64 3, 3, 1, !dbg !13
  %8 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %7, i64 1, 4, 1, !dbg !14
  %9 = alloca float, i64 ptrtoint (ptr getelementptr (float, ptr null, i32 36) to i64), align 64, !dbg !15
  %10 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %9, 0, !dbg !16
  %11 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %10, ptr %9, 1, !dbg !17
  %12 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %11, i64 0, 2, !dbg !18
  %13 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %12, i64 3, 3, 0, !dbg !19
  %14 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, i64 12, 3, 1, !dbg !20
  %15 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %14, i64 12, 4, 0, !dbg !21
  %16 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %15, i64 1, 4, 1, !dbg !22
  %17 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !23
  call void @forward_kernel_0(ptr @__constant_12x3xf32, ptr %17), !dbg !24
  %18 = alloca float, i64 ptrtoint (ptr getelementptr (float, ptr null, i32 48) to i64), align 4, !dbg !25
  %19 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %18, 0, !dbg !26
  %20 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %19, ptr %18, 1, !dbg !27
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %20, i64 0, 2, !dbg !28
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, i64 4, 3, 0, !dbg !29
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 12, 3, 1, !dbg !30
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 12, 4, 0, !dbg !31
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 1, 4, 1, !dbg !32
  %26 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, 1, !dbg !33
  call void @forward_kernel_1(ptr %26), !dbg !34
  %27 = alloca float, i64 ptrtoint (ptr getelementptr (float, ptr null, i32 48) to i64), align 4, !dbg !35
  %28 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %27, 0, !dbg !36
  %29 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %28, ptr %27, 1, !dbg !37
  %30 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, i64 0, 2, !dbg !38
  %31 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %30, i64 4, 3, 0, !dbg !39
  %32 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %31, i64 12, 3, 1, !dbg !40
  %33 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %32, i64 12, 4, 0, !dbg !41
  %34 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %33, i64 1, 4, 1, !dbg !42
  %35 = getelementptr float, ptr %18, i64 0, !dbg !43
  %36 = getelementptr float, ptr %27, i64 0, !dbg !44
  call void @llvm.memcpy.p0.p0.i64(ptr %36, ptr %35, i64 mul (i64 ptrtoint (ptr getelementptr (float, ptr null, i32 1) to i64), i64 48), i1 false), !dbg !45
  %37 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %16, 1, !dbg !46
  %38 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %34, 1, !dbg !47
  call void @forward_kernel_2(ptr %0, ptr %37, ptr %38), !dbg !48
  %39 = alloca float, i64 ptrtoint (ptr getelementptr (float, ptr null, i32 36) to i64), align 64, !dbg !49
  %40 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %39, 0, !dbg !50
  %41 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %40, ptr %39, 1, !dbg !51
  %42 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %41, i64 0, 2, !dbg !52
  %43 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %42, i64 12, 3, 0, !dbg !53
  %44 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %43, i64 3, 3, 1, !dbg !54
  %45 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %44, i64 3, 4, 0, !dbg !55
  %46 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %45, i64 1, 4, 1, !dbg !56
  %47 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %46, 1, !dbg !57
  call void @forward_kernel_3(ptr @__constant_3x12xf32, ptr %47), !dbg !58
  %48 = alloca float, i64 ptrtoint (ptr getelementptr (float, ptr null, i32 12) to i64), align 4, !dbg !59
  %49 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %48, 0, !dbg !60
  %50 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %49, ptr %48, 1, !dbg !61
  %51 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %50, i64 0, 2, !dbg !62
  %52 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %51, i64 4, 3, 0, !dbg !63
  %53 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %52, i64 3, 3, 1, !dbg !64
  %54 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %53, i64 3, 4, 0, !dbg !65
  %55 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %54, i64 1, 4, 1, !dbg !66
  %56 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %55, 1, !dbg !67
  call void @forward_kernel_4(ptr %56), !dbg !68
  %57 = call ptr @malloc(i64 add (i64 ptrtoint (ptr getelementptr (float, ptr null, i32 12) to i64), i64 64)), !dbg !69
  %58 = ptrtoint ptr %57 to i64, !dbg !70
  %59 = add i64 %58, 63, !dbg !71
  %60 = urem i64 %59, 64, !dbg !72
  %61 = sub i64 %59, %60, !dbg !73
  %62 = inttoptr i64 %61 to ptr, !dbg !74
  %63 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %57, 0, !dbg !75
  %64 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %63, ptr %62, 1, !dbg !76
  %65 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %64, i64 0, 2, !dbg !77
  %66 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %65, i64 4, 3, 0, !dbg !78
  %67 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %66, i64 3, 3, 1, !dbg !79
  %68 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %67, i64 3, 4, 0, !dbg !80
  %69 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %68, i64 1, 4, 1, !dbg !81
  %70 = getelementptr float, ptr %48, i64 0, !dbg !82
  %71 = getelementptr float, ptr %62, i64 0, !dbg !83
  call void @llvm.memcpy.p0.p0.i64(ptr %71, ptr %70, i64 mul (i64 ptrtoint (ptr getelementptr (float, ptr null, i32 1) to i64), i64 12), i1 false), !dbg !84
  %72 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %34, 1, !dbg !85
  %73 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %46, 1, !dbg !86
  %74 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %69, 1, !dbg !87
  call void @forward_kernel_5(ptr %72, ptr %73, ptr %74), !dbg !88
  %75 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %69, 1, !dbg !89
  ret ptr %75, !dbg !90
}

declare void @forward_kernel_0(ptr, ptr)

declare void @forward_kernel_1(ptr)

declare void @forward_kernel_2(ptr, ptr, ptr)

declare void @forward_kernel_3(ptr, ptr)

declare void @forward_kernel_4(ptr)

declare void @forward_kernel_5(ptr, ptr, ptr)

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #0

attributes #0 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "mlir", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!1 = !DIFile(filename: "LLVMDialectModule", directory: "/")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = distinct !DISubprogram(name: "forward", linkageName: "forward", scope: null, file: !4, line: 5, type: !5, scopeLine: 5, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !6)
!4 = !DIFile(filename: "3_forward_llvm.mlir", directory: "/home/tianyi/fdra/app-compiler/cgra-opt/experiments/Demo1")
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 7, column: 10, scope: !8)
!8 = !DILexicalBlockFile(scope: !3, file: !4, discriminator: 0)
!9 = !DILocation(line: 8, column: 10, scope: !8)
!10 = !DILocation(line: 10, column: 10, scope: !8)
!11 = !DILocation(line: 12, column: 10, scope: !8)
!12 = !DILocation(line: 14, column: 10, scope: !8)
!13 = !DILocation(line: 16, column: 11, scope: !8)
!14 = !DILocation(line: 18, column: 11, scope: !8)
!15 = !DILocation(line: 66, column: 11, scope: !8)
!16 = !DILocation(line: 68, column: 11, scope: !8)
!17 = !DILocation(line: 69, column: 11, scope: !8)
!18 = !DILocation(line: 71, column: 11, scope: !8)
!19 = !DILocation(line: 72, column: 11, scope: !8)
!20 = !DILocation(line: 73, column: 11, scope: !8)
!21 = !DILocation(line: 74, column: 11, scope: !8)
!22 = !DILocation(line: 75, column: 11, scope: !8)
!23 = !DILocation(line: 77, column: 11, scope: !8)
!24 = !DILocation(line: 78, column: 5, scope: !8)
!25 = !DILocation(line: 86, column: 11, scope: !8)
!26 = !DILocation(line: 88, column: 11, scope: !8)
!27 = !DILocation(line: 89, column: 11, scope: !8)
!28 = !DILocation(line: 91, column: 11, scope: !8)
!29 = !DILocation(line: 92, column: 11, scope: !8)
!30 = !DILocation(line: 93, column: 11, scope: !8)
!31 = !DILocation(line: 94, column: 11, scope: !8)
!32 = !DILocation(line: 95, column: 11, scope: !8)
!33 = !DILocation(line: 96, column: 11, scope: !8)
!34 = !DILocation(line: 97, column: 5, scope: !8)
!35 = !DILocation(line: 105, column: 11, scope: !8)
!36 = !DILocation(line: 107, column: 11, scope: !8)
!37 = !DILocation(line: 108, column: 12, scope: !8)
!38 = !DILocation(line: 110, column: 12, scope: !8)
!39 = !DILocation(line: 111, column: 12, scope: !8)
!40 = !DILocation(line: 112, column: 12, scope: !8)
!41 = !DILocation(line: 113, column: 12, scope: !8)
!42 = !DILocation(line: 114, column: 12, scope: !8)
!43 = !DILocation(line: 122, column: 12, scope: !8)
!44 = !DILocation(line: 123, column: 12, scope: !8)
!45 = !DILocation(line: 125, column: 5, scope: !8)
!46 = !DILocation(line: 126, column: 12, scope: !8)
!47 = !DILocation(line: 127, column: 12, scope: !8)
!48 = !DILocation(line: 128, column: 5, scope: !8)
!49 = !DILocation(line: 136, column: 12, scope: !8)
!50 = !DILocation(line: 138, column: 12, scope: !8)
!51 = !DILocation(line: 139, column: 12, scope: !8)
!52 = !DILocation(line: 141, column: 12, scope: !8)
!53 = !DILocation(line: 142, column: 12, scope: !8)
!54 = !DILocation(line: 143, column: 12, scope: !8)
!55 = !DILocation(line: 144, column: 12, scope: !8)
!56 = !DILocation(line: 145, column: 12, scope: !8)
!57 = !DILocation(line: 147, column: 12, scope: !8)
!58 = !DILocation(line: 148, column: 5, scope: !8)
!59 = !DILocation(line: 156, column: 12, scope: !8)
!60 = !DILocation(line: 158, column: 12, scope: !8)
!61 = !DILocation(line: 159, column: 12, scope: !8)
!62 = !DILocation(line: 161, column: 12, scope: !8)
!63 = !DILocation(line: 162, column: 12, scope: !8)
!64 = !DILocation(line: 163, column: 12, scope: !8)
!65 = !DILocation(line: 164, column: 12, scope: !8)
!66 = !DILocation(line: 165, column: 12, scope: !8)
!67 = !DILocation(line: 166, column: 12, scope: !8)
!68 = !DILocation(line: 167, column: 5, scope: !8)
!69 = !DILocation(line: 177, column: 12, scope: !8)
!70 = !DILocation(line: 179, column: 12, scope: !8)
!71 = !DILocation(line: 182, column: 12, scope: !8)
!72 = !DILocation(line: 183, column: 12, scope: !8)
!73 = !DILocation(line: 184, column: 12, scope: !8)
!74 = !DILocation(line: 185, column: 12, scope: !8)
!75 = !DILocation(line: 187, column: 12, scope: !8)
!76 = !DILocation(line: 188, column: 12, scope: !8)
!77 = !DILocation(line: 190, column: 12, scope: !8)
!78 = !DILocation(line: 191, column: 12, scope: !8)
!79 = !DILocation(line: 192, column: 12, scope: !8)
!80 = !DILocation(line: 193, column: 12, scope: !8)
!81 = !DILocation(line: 194, column: 12, scope: !8)
!82 = !DILocation(line: 202, column: 12, scope: !8)
!83 = !DILocation(line: 203, column: 12, scope: !8)
!84 = !DILocation(line: 205, column: 5, scope: !8)
!85 = !DILocation(line: 206, column: 12, scope: !8)
!86 = !DILocation(line: 207, column: 12, scope: !8)
!87 = !DILocation(line: 208, column: 12, scope: !8)
!88 = !DILocation(line: 209, column: 5, scope: !8)
!89 = !DILocation(line: 210, column: 12, scope: !8)
!90 = !DILocation(line: 211, column: 5, scope: !8)

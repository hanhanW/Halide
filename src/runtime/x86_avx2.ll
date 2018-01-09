define weak_odr <16 x i16>  @packssdwx16(<16 x i32> %arg) nounwind alwaysinline {
  %1 = shufflevector <16 x i32> %arg, <16 x i32> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 10, i32 11>
  %2 = shufflevector <16 x i32> %arg, <16 x i32> undef, <8 x i32> <i32 4, i32 5, i32 6, i32 7, i32 12, i32 13, i32 14, i32 15>
  %3 = tail call <16 x i16> @llvm.x86.avx2.packssdw(<8 x i32> %1, <8 x i32> %2)
  ret <16 x i16> %3
}
declare <16 x i16> @llvm.x86.avx2.packssdw(<8 x i32>, <8 x i32>)

define weak_odr <32 x i8> @packuswbx32(<32 x i16> %arg) nounwind alwaysinline {
 %1 = shufflevector <32 x i16> %arg, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23>
 %2 = shufflevector <32 x i16> %arg, <32 x i16> undef, <16 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
 %3 = call <32 x i8> @llvm.x86.avx2.packuswb(<16 x i16> %1, <16 x i16> %2)
 ret <32 x i8> %3
}
declare <32 x i8> @llvm.x86.avx2.packuswb(<16 x i16>, <16 x i16>)

define weak_odr <32 x i8> @packsswbx32(<32 x i16> %arg) nounwind alwaysinline {
 %1 = shufflevector <32 x i16> %arg, <32 x i16> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23>
 %2 = shufflevector <32 x i16> %arg, <32 x i16> undef, <16 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
 %3 = call <32 x i8> @llvm.x86.avx2.packsswb(<16 x i16> %1, <16 x i16> %2)
 ret <32 x i8> %3
}
declare <32 x i8> @llvm.x86.avx2.packsswb(<16 x i16>, <16 x i16>)

; ModuleID = 'mp5_testcases/nsieve-bits_c.ll'
source_filename = "mp5_testcases/nsieve-bits.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Primes up to %8d %8d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = zext i32 5120000 to i64
  %4 = add i64 %3, 4
  %5 = call noalias ptr @malloc(i64 noundef %4) #5
  %6 = icmp ne ptr %5, null
  br i1 %6, label %.preheader, label %59

.preheader:                                       ; preds = %2, %55
  %.03 = phi i32 [ %57, %55 ], [ 0, %2 ]
  %7 = icmp ule i32 %.03, 2
  br i1 %7, label %8, label %58

8:                                                ; preds = %.preheader
  %9 = lshr i32 40960000, %.03
  %10 = udiv i32 %9, 8
  %11 = zext i32 %10 to i64
  %12 = add i64 %11, 4
  call void @llvm.memset.p0.i64(ptr align 4 %5, i8 -1, i64 %12, i1 false)
  br label %13

13:                                               ; preds = %.loopexit, %8
  %.04 = phi i32 [ 2, %8 ], [ %54, %.loopexit ]
  %.01 = phi i32 [ 0, %8 ], [ %.1, %.loopexit ]
  %14 = icmp ule i32 %.04, %9
  br i1 %14, label %15, label %55

15:                                               ; preds = %13
  %16 = zext i32 %.04 to i64
  %17 = udiv i64 %16, 32
  %18 = getelementptr inbounds i32, ptr %5, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = zext i32 %.04 to i64
  %21 = urem i64 %20, 32
  %22 = trunc i64 %21 to i32
  %23 = shl i32 1, %22
  %24 = and i32 %19, %23
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %.loopexit

26:                                               ; preds = %15
  %27 = add i32 %.01, 1
  %28 = add i32 %.04, %.04
  br label %29

29:                                               ; preds = %52, %26
  %.02 = phi i32 [ %28, %26 ], [ %53, %52 ]
  %30 = icmp ule i32 %.02, %9
  br i1 %30, label %31, label %.loopexit

31:                                               ; preds = %29
  %32 = zext i32 %.02 to i64
  %33 = udiv i64 %32, 32
  %34 = getelementptr inbounds i32, ptr %5, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = zext i32 %.02 to i64
  %37 = urem i64 %36, 32
  %38 = trunc i64 %37 to i32
  %39 = shl i32 1, %38
  %40 = and i32 %35, %39
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %52

42:                                               ; preds = %31
  %43 = zext i32 %.02 to i64
  %44 = urem i64 %43, 32
  %45 = trunc i64 %44 to i32
  %46 = shl i32 1, %45
  %47 = zext i32 %.02 to i64
  %48 = udiv i64 %47, 32
  %49 = getelementptr inbounds i32, ptr %5, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = xor i32 %50, %46
  store i32 %51, ptr %49, align 4
  br label %52

52:                                               ; preds = %31, %42
  %53 = add i32 %.02, %.04
  br label %29, !llvm.loop !6

.loopexit:                                        ; preds = %29, %15
  %.1 = phi i32 [ %.01, %15 ], [ %27, %29 ]
  %54 = add i32 %.04, 1
  br label %13, !llvm.loop !8

55:                                               ; preds = %13
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %9, i32 noundef %.01)
  %57 = add i32 %.03, 1
  br label %.preheader, !llvm.loop !9

58:                                               ; preds = %.preheader
  call void @free(ptr noundef %5) #6
  br label %59

59:                                               ; preds = %2, %58
  %.0 = phi i32 [ 0, %58 ], [ 1, %2 ]
  ret i32 %.0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}

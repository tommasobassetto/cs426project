; ModuleID = 'mp5_testcases/nsieve-bits_c.ll'
source_filename = "mp5_testcases/nsieve-bits.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Primes up to %8d %8d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = udiv i32 40960000, 8
  %4 = zext i32 %3 to i64
  %5 = add i64 %4, 4
  %6 = call noalias ptr @malloc(i64 noundef %5) #5
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %53

8:                                                ; preds = %2, %49
  %.03 = phi i32 [ %51, %49 ], [ 0, %2 ]
  %9 = icmp ule i32 %.03, 2
  br i1 %9, label %10, label %52

10:                                               ; preds = %8
  %11 = lshr i32 40960000, %.03
  %12 = udiv i32 %11, 8
  %13 = zext i32 %12 to i64
  %14 = add i64 %13, 4
  call void @llvm.memset.p0.i64(ptr align 4 %6, i8 -1, i64 %14, i1 false)
  br label %15

15:                                               ; preds = %47, %10
  %.04 = phi i32 [ 2, %10 ], [ %48, %47 ]
  %.01 = phi i32 [ 0, %10 ], [ %.1, %47 ]
  %16 = icmp ule i32 %.04, %11
  br i1 %16, label %17, label %49

17:                                               ; preds = %15
  %18 = zext i32 %.04 to i64
  %19 = udiv i64 %18, 32
  %20 = getelementptr inbounds i32, ptr %6, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = urem i64 %18, 32
  %23 = trunc i64 %22 to i32
  %24 = shl i32 1, %23
  %25 = and i32 %21, %24
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %47

27:                                               ; preds = %17
  %28 = add i32 %.01, 1
  %29 = add i32 %.04, %.04
  br label %30

30:                                               ; preds = %45, %27
  %.02 = phi i32 [ %29, %27 ], [ %46, %45 ]
  %31 = icmp ule i32 %.02, %11
  br i1 %31, label %32, label %47

32:                                               ; preds = %30
  %33 = zext i32 %.02 to i64
  %34 = udiv i64 %33, 32
  %35 = getelementptr inbounds i32, ptr %6, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = urem i64 %33, 32
  %38 = trunc i64 %37 to i32
  %39 = shl i32 1, %38
  %40 = and i32 %36, %39
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %45

42:                                               ; preds = %32
  %43 = load i32, ptr %35, align 4
  %44 = xor i32 %43, %39
  store i32 %44, ptr %35, align 4
  br label %45

45:                                               ; preds = %32, %42
  %46 = add i32 %.02, %.04
  br label %30, !llvm.loop !6

47:                                               ; preds = %17, %30
  %.1 = phi i32 [ %.01, %17 ], [ %28, %30 ]
  %48 = add i32 %.04, 1
  br label %15, !llvm.loop !8

49:                                               ; preds = %15
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11, i32 noundef %.01)
  %51 = add i32 %.03, 1
  br label %8, !llvm.loop !9

52:                                               ; preds = %8
  call void @free(ptr noundef %6) #6
  br label %53

53:                                               ; preds = %2, %52
  %.0 = phi i32 [ 0, %52 ], [ 1, %2 ]
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

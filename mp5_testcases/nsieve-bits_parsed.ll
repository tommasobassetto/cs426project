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
  br i1 %6, label %7, label %61

7:                                                ; preds = %2, %57
  %.03 = phi i32 [ %59, %57 ], [ 0, %2 ]
  %8 = icmp ule i32 %.03, 2
  br i1 %8, label %9, label %60

9:                                                ; preds = %7
  %10 = lshr i32 40960000, %.03
  %11 = udiv i32 %10, 8
  %12 = zext i32 %11 to i64
  %13 = add i64 %12, 4
  call void @llvm.memset.p0.i64(ptr align 4 %5, i8 -1, i64 %13, i1 false)
  br label %14

14:                                               ; preds = %55, %9
  %.04 = phi i32 [ 2, %9 ], [ %56, %55 ]
  %.01 = phi i32 [ 0, %9 ], [ %.1, %55 ]
  %15 = icmp ule i32 %.04, %10
  br i1 %15, label %16, label %57

16:                                               ; preds = %14
  %17 = zext i32 %.04 to i64
  %18 = udiv i64 %17, 32
  %19 = getelementptr inbounds i32, ptr %5, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = zext i32 %.04 to i64
  %22 = urem i64 %21, 32
  %23 = trunc i64 %22 to i32
  %24 = shl i32 1, %23
  %25 = and i32 %20, %24
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %55

27:                                               ; preds = %16
  %28 = add i32 %.01, 1
  %29 = add i32 %.04, %.04
  br label %30

30:                                               ; preds = %53, %27
  %.02 = phi i32 [ %29, %27 ], [ %54, %53 ]
  %31 = icmp ule i32 %.02, %10
  br i1 %31, label %32, label %55

32:                                               ; preds = %30
  %33 = zext i32 %.02 to i64
  %34 = udiv i64 %33, 32
  %35 = getelementptr inbounds i32, ptr %5, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = zext i32 %.02 to i64
  %38 = urem i64 %37, 32
  %39 = trunc i64 %38 to i32
  %40 = shl i32 1, %39
  %41 = and i32 %36, %40
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %53

43:                                               ; preds = %32
  %44 = zext i32 %.02 to i64
  %45 = urem i64 %44, 32
  %46 = trunc i64 %45 to i32
  %47 = shl i32 1, %46
  %48 = zext i32 %.02 to i64
  %49 = udiv i64 %48, 32
  %50 = getelementptr inbounds i32, ptr %5, i64 %49
  %51 = load i32, ptr %50, align 4
  %52 = xor i32 %51, %47
  store i32 %52, ptr %50, align 4
  br label %53

53:                                               ; preds = %32, %43
  %54 = add i32 %.02, %.04
  br label %30, !llvm.loop !6

55:                                               ; preds = %16, %30
  %.1 = phi i32 [ %.01, %16 ], [ %28, %30 ]
  %56 = add i32 %.04, 1
  br label %14, !llvm.loop !8

57:                                               ; preds = %14
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %10, i32 noundef %.01)
  %59 = add i32 %.03, 1
  br label %7, !llvm.loop !9

60:                                               ; preds = %7
  call void @free(ptr noundef %5) #6
  br label %61

61:                                               ; preds = %2, %60
  %.0 = phi i32 [ 0, %60 ], [ 1, %2 ]
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

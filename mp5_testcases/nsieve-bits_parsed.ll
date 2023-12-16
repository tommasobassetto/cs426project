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
  br i1 %6, label %.preheader, label %58

.preheader:                                       ; preds = %2, %54
  %.03 = phi i32 [ %56, %54 ], [ 0, %2 ]
  %7 = icmp ule i32 %.03, 2
  br i1 %7, label %8, label %57

8:                                                ; preds = %.preheader
  %9 = lshr i32 40960000, %.03
  %10 = zext i32 5120000 to i64
  %11 = add i64 %10, 4
  call void @llvm.memset.p0.i64(ptr align 4 %5, i8 -1, i64 %11, i1 false)
  br label %12

12:                                               ; preds = %.loopexit, %8
  %.04 = phi i32 [ 2, %8 ], [ %53, %.loopexit ]
  %.01 = phi i32 [ 0, %8 ], [ %.1, %.loopexit ]
  %13 = icmp ule i32 %.04, %9
  br i1 %13, label %14, label %54

14:                                               ; preds = %12
  %15 = zext i32 %.04 to i64
  %16 = udiv i64 %15, 32
  %17 = getelementptr inbounds i32, ptr %5, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = zext i32 %.04 to i64
  %20 = urem i64 %19, 32
  %21 = trunc i64 %20 to i32
  %22 = shl i32 1, %21
  %23 = and i32 %18, %22
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %.loopexit

25:                                               ; preds = %14
  %26 = add i32 %.01, 1
  %27 = add i32 %.04, %.04
  br label %28

28:                                               ; preds = %51, %25
  %.02 = phi i32 [ %27, %25 ], [ %52, %51 ]
  %29 = icmp ule i32 %.02, %9
  br i1 %29, label %30, label %.loopexit

30:                                               ; preds = %28
  %31 = zext i32 %.02 to i64
  %32 = udiv i64 %31, 32
  %33 = getelementptr inbounds i32, ptr %5, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = zext i32 %.02 to i64
  %36 = urem i64 %35, 32
  %37 = trunc i64 %36 to i32
  %38 = shl i32 1, %37
  %39 = and i32 %34, %38
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %51

41:                                               ; preds = %30
  %42 = zext i32 %.02 to i64
  %43 = urem i64 %42, 32
  %44 = trunc i64 %43 to i32
  %45 = shl i32 1, %44
  %46 = zext i32 %.02 to i64
  %47 = udiv i64 %46, 32
  %48 = getelementptr inbounds i32, ptr %5, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = xor i32 %49, %45
  store i32 %50, ptr %48, align 4
  br label %51

51:                                               ; preds = %30, %41
  %52 = add i32 %.02, %.04
  br label %28, !llvm.loop !6

.loopexit:                                        ; preds = %28, %14
  %.1 = phi i32 [ %.01, %14 ], [ %26, %28 ]
  %53 = add i32 %.04, 1
  br label %12, !llvm.loop !8

54:                                               ; preds = %12
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %9, i32 noundef %.01)
  %56 = add i32 %.03, 1
  br label %.preheader, !llvm.loop !9

57:                                               ; preds = %.preheader
  call void @free(ptr noundef %5) #6
  br label %58

58:                                               ; preds = %2, %57
  %.0 = phi i32 [ 0, %57 ], [ 1, %2 ]
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

; ModuleID = 'mp5_testcases/spectral-norm_c.ll'
source_filename = "mp5_testcases/spectral-norm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%0.9f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @eval_A(i32 noundef %0, i32 noundef %1) #0 {
  %3 = add nsw i32 %0, %1
  %4 = add nsw i32 %0, %1
  %5 = add nsw i32 %4, 1
  %6 = mul nsw i32 %3, %5
  %7 = sdiv i32 %6, 2
  %8 = add nsw i32 %7, %0
  %9 = add nsw i32 %8, 1
  %10 = sitofp i32 %9 to double
  %11 = fdiv double 1.000000e+00, %10
  ret double %11
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_A_times_u(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %21, %3
  %.01 = phi i32 [ 0, %3 ], [ %22, %21 ]
  %5 = icmp slt i32 %.01, %0
  br i1 %5, label %6, label %23

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds double, ptr %2, i64 %7
  store double 0.000000e+00, ptr %8, align 8
  br label %9

9:                                                ; preds = %11, %6
  %.0 = phi i32 [ 0, %6 ], [ %20, %11 ]
  %10 = icmp slt i32 %.0, %0
  br i1 %10, label %11, label %21

11:                                               ; preds = %9
  %12 = call double @eval_A(i32 noundef %.01, i32 noundef %.0)
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds double, ptr %1, i64 %13
  %15 = load double, ptr %14, align 8
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds double, ptr %2, i64 %16
  %18 = load double, ptr %17, align 8
  %19 = call double @llvm.fmuladd.f64(double %12, double %15, double %18)
  store double %19, ptr %17, align 8
  %20 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !6

21:                                               ; preds = %9
  %22 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !8

23:                                               ; preds = %4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_At_times_u(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %21, %3
  %.01 = phi i32 [ 0, %3 ], [ %22, %21 ]
  %5 = icmp slt i32 %.01, %0
  br i1 %5, label %6, label %23

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds double, ptr %2, i64 %7
  store double 0.000000e+00, ptr %8, align 8
  br label %9

9:                                                ; preds = %11, %6
  %.0 = phi i32 [ 0, %6 ], [ %20, %11 ]
  %10 = icmp slt i32 %.0, %0
  br i1 %10, label %11, label %21

11:                                               ; preds = %9
  %12 = call double @eval_A(i32 noundef %.0, i32 noundef %.01)
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds double, ptr %1, i64 %13
  %15 = load double, ptr %14, align 8
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds double, ptr %2, i64 %16
  %18 = load double, ptr %17, align 8
  %19 = call double @llvm.fmuladd.f64(double %12, double %15, double %18)
  store double %19, ptr %17, align 8
  %20 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !9

21:                                               ; preds = %9
  %22 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !10

23:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @eval_AtA_times_u(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = zext i32 %0 to i64
  %5 = call ptr @llvm.stacksave()
  %6 = alloca double, i64 %4, align 16
  call void @eval_A_times_u(i32 noundef %0, ptr noundef %1, ptr noundef %6)
  call void @eval_At_times_u(i32 noundef %0, ptr noundef %6, ptr noundef %2)
  call void @llvm.stackrestore(ptr %5)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp eq i32 %0, 2
  br i1 %3, label %4, label %8

4:                                                ; preds = %2
  %5 = getelementptr inbounds ptr, ptr %1, i64 1
  %6 = load ptr, ptr %5, align 8
  %7 = call i32 @atoi(ptr noundef %6) #6
  br label %8

8:                                                ; preds = %2, %4
  %9 = phi i32 [ %7, %4 ], [ 2000, %2 ]
  %10 = zext i32 %9 to i64
  %11 = call ptr @llvm.stacksave()
  %12 = alloca double, i64 %10, align 16
  %13 = zext i32 %9 to i64
  %14 = alloca double, i64 %13, align 16
  br label %15

15:                                               ; preds = %17, %8
  %.02 = phi i32 [ 0, %8 ], [ %20, %17 ]
  %16 = icmp slt i32 %.02, %9
  br i1 %16, label %17, label %21

17:                                               ; preds = %15
  %18 = sext i32 %.02 to i64
  %19 = getelementptr inbounds double, ptr %12, i64 %18
  store double 1.000000e+00, ptr %19, align 8
  %20 = add nsw i32 %.02, 1
  br label %15, !llvm.loop !11

21:                                               ; preds = %15, %23
  %.1 = phi i32 [ %24, %23 ], [ 0, %15 ]
  %22 = icmp slt i32 %.1, 10
  br i1 %22, label %23, label %25

23:                                               ; preds = %21
  call void @eval_AtA_times_u(i32 noundef %9, ptr noundef %12, ptr noundef %14)
  call void @eval_AtA_times_u(i32 noundef %9, ptr noundef %14, ptr noundef %12)
  %24 = add nsw i32 %.1, 1
  br label %21, !llvm.loop !12

25:                                               ; preds = %21, %27
  %.2 = phi i32 [ %42, %27 ], [ 0, %21 ]
  %.01 = phi double [ %34, %27 ], [ 0.000000e+00, %21 ]
  %.0 = phi double [ %41, %27 ], [ 0.000000e+00, %21 ]
  %26 = icmp slt i32 %.2, %9
  br i1 %26, label %27, label %43

27:                                               ; preds = %25
  %28 = sext i32 %.2 to i64
  %29 = getelementptr inbounds double, ptr %12, i64 %28
  %30 = load double, ptr %29, align 8
  %31 = sext i32 %.2 to i64
  %32 = getelementptr inbounds double, ptr %14, i64 %31
  %33 = load double, ptr %32, align 8
  %34 = call double @llvm.fmuladd.f64(double %30, double %33, double %.01)
  %35 = sext i32 %.2 to i64
  %36 = getelementptr inbounds double, ptr %14, i64 %35
  %37 = load double, ptr %36, align 8
  %38 = sext i32 %.2 to i64
  %39 = getelementptr inbounds double, ptr %14, i64 %38
  %40 = load double, ptr %39, align 8
  %41 = call double @llvm.fmuladd.f64(double %37, double %40, double %.0)
  %42 = add nsw i32 %.2, 1
  br label %25, !llvm.loop !13

43:                                               ; preds = %25
  %44 = fdiv double %.01, %.0
  %45 = call double @sqrt(double noundef %44) #7
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %45)
  call void @llvm.stackrestore(ptr %11)
  ret i32 0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @atoi(ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare double @sqrt(double noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}

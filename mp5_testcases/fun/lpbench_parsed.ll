; ModuleID = 'mp5_testcases/fun/lpbench_c.ll'
source_filename = "mp5_testcases/fun/lpbench.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"-ga\00", align 1
@stdout = external global ptr, align 8
@.str.1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"\0Alpbench (Std. C) run time: %f\0A\0A\00", align 1
@seed = internal global i64 1325, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @matgen(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %15, %2
  %.01 = phi i32 [ 0, %2 ], [ %16, %15 ]
  %4 = icmp slt i32 %.01, 2000
  br i1 %4, label %5, label %17

5:                                                ; preds = %3, %7
  %.0 = phi i32 [ %14, %7 ], [ 0, %3 ]
  %6 = icmp slt i32 %.0, 2000
  br i1 %6, label %7, label %15

7:                                                ; preds = %5
  %8 = call double @random_double()
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds ptr, ptr %0, i64 %9
  %11 = load ptr, ptr %10, align 8
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds double, ptr %11, i64 %12
  store double %8, ptr %13, align 8
  %14 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

15:                                               ; preds = %5
  %16 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !8

17:                                               ; preds = %3, %19
  %.12 = phi i32 [ %22, %19 ], [ 0, %3 ]
  %18 = icmp slt i32 %.12, 2000
  br i1 %18, label %19, label %23

19:                                               ; preds = %17
  %20 = sext i32 %.12 to i64
  %21 = getelementptr inbounds double, ptr %1, i64 %20
  store double 0.000000e+00, ptr %21, align 8
  %22 = add nsw i32 %.12, 1
  br label %17, !llvm.loop !9

23:                                               ; preds = %17, %39
  %.1 = phi i32 [ %40, %39 ], [ 0, %17 ]
  %24 = icmp slt i32 %.1, 2000
  br i1 %24, label %25, label %41

25:                                               ; preds = %23, %27
  %.2 = phi i32 [ %38, %27 ], [ 0, %23 ]
  %26 = icmp slt i32 %.2, 2000
  br i1 %26, label %27, label %39

27:                                               ; preds = %25
  %28 = sext i32 %.1 to i64
  %29 = getelementptr inbounds ptr, ptr %0, i64 %28
  %30 = load ptr, ptr %29, align 8
  %31 = sext i32 %.2 to i64
  %32 = getelementptr inbounds double, ptr %30, i64 %31
  %33 = load double, ptr %32, align 8
  %34 = sext i32 %.2 to i64
  %35 = getelementptr inbounds double, ptr %1, i64 %34
  %36 = load double, ptr %35, align 8
  %37 = fadd double %36, %33
  store double %37, ptr %35, align 8
  %38 = add nsw i32 %.2, 1
  br label %25, !llvm.loop !10

39:                                               ; preds = %25
  %40 = add nsw i32 %.1, 1
  br label %23, !llvm.loop !11

41:                                               ; preds = %23
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @idamax(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = icmp slt i32 %0, 1
  br i1 %5, label %42, label %6

6:                                                ; preds = %4
  %7 = icmp eq i32 %0, 1
  br i1 %7, label %42, label %8

8:                                                ; preds = %6
  %9 = icmp ne i32 %3, 1
  br i1 %9, label %10, label %27

10:                                               ; preds = %8
  %11 = sext i32 %2 to i64
  %12 = getelementptr inbounds double, ptr %1, i64 %11
  %13 = load double, ptr %12, align 8
  %14 = call double @llvm.fabs.f64(double %13)
  %15 = add nsw i32 1, %3
  br label %16

16:                                               ; preds = %18, %10
  %.04 = phi double [ %14, %10 ], [ %.15, %18 ]
  %.02 = phi i32 [ 1, %10 ], [ %26, %18 ]
  %.01 = phi i32 [ %15, %10 ], [ %25, %18 ]
  %.0 = phi i32 [ 0, %10 ], [ %.1, %18 ]
  %17 = icmp slt i32 %.02, %0
  br i1 %17, label %18, label %42

18:                                               ; preds = %16
  %19 = add nsw i32 %.01, %2
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds double, ptr %1, i64 %20
  %22 = load double, ptr %21, align 8
  %23 = call double @llvm.fabs.f64(double %22)
  %24 = fcmp ogt double %23, %.04
  %.15 = select i1 %24, double %23, double %.04
  %.1 = select i1 %24, i32 %.02, i32 %.0
  %25 = add nsw i32 %.01, %3
  %26 = add nsw i32 %.02, 1
  br label %16, !llvm.loop !12

27:                                               ; preds = %8
  %28 = sext i32 %2 to i64
  %29 = getelementptr inbounds double, ptr %1, i64 %28
  %30 = load double, ptr %29, align 8
  %31 = call double @llvm.fabs.f64(double %30)
  br label %32

32:                                               ; preds = %34, %27
  %.26 = phi double [ %31, %27 ], [ %.37, %34 ]
  %.13 = phi i32 [ 1, %27 ], [ %41, %34 ]
  %.2 = phi i32 [ 0, %27 ], [ %.3, %34 ]
  %33 = icmp slt i32 %.13, %0
  br i1 %33, label %34, label %42

34:                                               ; preds = %32
  %35 = add nsw i32 %.13, %2
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds double, ptr %1, i64 %36
  %38 = load double, ptr %37, align 8
  %39 = call double @llvm.fabs.f64(double %38)
  %40 = fcmp ogt double %39, %.26
  %.37 = select i1 %40, double %39, double %.26
  %.3 = select i1 %40, i32 %.13, i32 %.2
  %41 = add nsw i32 %.13, 1
  br label %32, !llvm.loop !13

42:                                               ; preds = %6, %32, %16, %4
  %.6 = phi i32 [ -1, %4 ], [ 0, %6 ], [ %.0, %16 ], [ %.2, %32 ]
  ret i32 %.6
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @dscal(i32 noundef %0, double noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %7, label %29

7:                                                ; preds = %5
  %8 = icmp ne i32 %4, 1
  br i1 %8, label %9, label %20

9:                                                ; preds = %7
  %10 = mul nsw i32 %0, %4
  br label %11

11:                                               ; preds = %13, %9
  %.0 = phi i32 [ 0, %9 ], [ %19, %13 ]
  %12 = icmp slt i32 %.0, %10
  br i1 %12, label %13, label %29

13:                                               ; preds = %11
  %14 = add nsw i32 %.0, %3
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds double, ptr %2, i64 %15
  %17 = load double, ptr %16, align 8
  %18 = fmul double %17, %1
  store double %18, ptr %16, align 8
  %19 = add nsw i32 %.0, %4
  br label %11, !llvm.loop !14

20:                                               ; preds = %7, %22
  %.1 = phi i32 [ %28, %22 ], [ 0, %7 ]
  %21 = icmp slt i32 %.1, %0
  br i1 %21, label %22, label %29

22:                                               ; preds = %20
  %23 = add nsw i32 %.1, %3
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double, ptr %2, i64 %24
  %26 = load double, ptr %25, align 8
  %27 = fmul double %26, %1
  store double %27, ptr %25, align 8
  %28 = add nsw i32 %.1, 1
  br label %20, !llvm.loop !15

29:                                               ; preds = %11, %20, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @daxpy(i32 noundef %0, double noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7) #0 {
  %9 = icmp sgt i32 %0, 0
  %10 = fcmp une double %1, 0.000000e+00
  %or.cond = and i1 %9, %10
  br i1 %or.cond, label %11, label %49

11:                                               ; preds = %8
  %12 = icmp ne i32 %4, 1
  %13 = icmp ne i32 %7, 1
  %or.cond1 = or i1 %12, %13
  br i1 %or.cond1, label %14, label %36

14:                                               ; preds = %11
  %15 = icmp slt i32 %4, 0
  %16 = sub nsw i32 1, %0
  %17 = mul nsw i32 %16, %4
  %.01 = select i1 %15, i32 %17, i32 0
  %18 = icmp slt i32 %7, 0
  %19 = sub nsw i32 1, %0
  %20 = mul nsw i32 %19, %7
  %.0 = select i1 %18, i32 %20, i32 0
  br label %21

21:                                               ; preds = %23, %14
  %.03 = phi i32 [ 0, %14 ], [ %35, %23 ]
  %.12 = phi i32 [ %.01, %14 ], [ %33, %23 ]
  %.1 = phi i32 [ %.0, %14 ], [ %34, %23 ]
  %22 = icmp slt i32 %.03, %0
  br i1 %22, label %23, label %49

23:                                               ; preds = %21
  %24 = add nsw i32 %.12, %3
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds double, ptr %2, i64 %25
  %27 = load double, ptr %26, align 8
  %28 = add nsw i32 %.1, %6
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, ptr %5, i64 %29
  %31 = load double, ptr %30, align 8
  %32 = call double @llvm.fmuladd.f64(double %1, double %27, double %31)
  store double %32, ptr %30, align 8
  %33 = add nsw i32 %.12, %4
  %34 = add nsw i32 %.1, %7
  %35 = add nsw i32 %.03, 1
  br label %21, !llvm.loop !16

36:                                               ; preds = %11, %38
  %.14 = phi i32 [ %48, %38 ], [ 0, %11 ]
  %37 = icmp slt i32 %.14, %0
  br i1 %37, label %38, label %49

38:                                               ; preds = %36
  %39 = add nsw i32 %.14, %3
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, ptr %2, i64 %40
  %42 = load double, ptr %41, align 8
  %43 = add nsw i32 %.14, %6
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, ptr %5, i64 %44
  %46 = load double, ptr %45, align 8
  %47 = call double @llvm.fmuladd.f64(double %1, double %42, double %46)
  store double %47, ptr %45, align 8
  %48 = add nsw i32 %.14, 1
  br label %36, !llvm.loop !17

49:                                               ; preds = %36, %21, %8
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @dgefa(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %59, %2
  %.01 = phi i32 [ 0, %2 ], [ %60, %59 ]
  %4 = icmp slt i32 %.01, 1999
  br i1 %4, label %5, label %61

5:                                                ; preds = %3
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds ptr, ptr %0, i64 %6
  %8 = load ptr, ptr %7, align 8
  %9 = add nsw i32 %.01, 1
  %10 = sub nsw i32 2000, %.01
  %11 = call i32 @idamax(i32 noundef %10, ptr noundef %8, i32 noundef %.01, i32 noundef 1)
  %12 = add nsw i32 %11, %.01
  %13 = sext i32 %.01 to i64
  %14 = getelementptr inbounds i32, ptr %1, i64 %13
  store i32 %12, ptr %14, align 4
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds double, ptr %8, i64 %15
  %17 = load double, ptr %16, align 8
  %18 = fcmp une double %17, 0.000000e+00
  br i1 %18, label %19, label %59

19:                                               ; preds = %5
  %20 = icmp ne i32 %12, %.01
  br i1 %20, label %21, label %32

21:                                               ; preds = %19
  %22 = sext i32 %12 to i64
  %23 = getelementptr inbounds double, ptr %8, i64 %22
  %24 = load double, ptr %23, align 8
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds double, ptr %8, i64 %25
  %27 = load double, ptr %26, align 8
  %28 = sext i32 %12 to i64
  %29 = getelementptr inbounds double, ptr %8, i64 %28
  store double %27, ptr %29, align 8
  %30 = sext i32 %.01 to i64
  %31 = getelementptr inbounds double, ptr %8, i64 %30
  store double %24, ptr %31, align 8
  br label %32

32:                                               ; preds = %21, %19
  %33 = sext i32 %.01 to i64
  %34 = getelementptr inbounds double, ptr %8, i64 %33
  %35 = load double, ptr %34, align 8
  %36 = fdiv double -1.000000e+00, %35
  %37 = sub nsw i32 2000, %9
  call void @dscal(i32 noundef %37, double noundef %36, ptr noundef %8, i32 noundef %9, i32 noundef 1)
  br label %38

38:                                               ; preds = %56, %32
  %.0 = phi i32 [ %9, %32 ], [ %58, %56 ]
  %39 = icmp slt i32 %.0, 2000
  br i1 %39, label %40, label %59

40:                                               ; preds = %38
  %41 = sext i32 %.0 to i64
  %42 = getelementptr inbounds ptr, ptr %0, i64 %41
  %43 = load ptr, ptr %42, align 8
  %44 = sext i32 %12 to i64
  %45 = getelementptr inbounds double, ptr %43, i64 %44
  %46 = load double, ptr %45, align 8
  %47 = icmp ne i32 %12, %.01
  br i1 %47, label %48, label %56

48:                                               ; preds = %40
  %49 = sext i32 %.01 to i64
  %50 = getelementptr inbounds double, ptr %43, i64 %49
  %51 = load double, ptr %50, align 8
  %52 = sext i32 %12 to i64
  %53 = getelementptr inbounds double, ptr %43, i64 %52
  store double %51, ptr %53, align 8
  %54 = sext i32 %.01 to i64
  %55 = getelementptr inbounds double, ptr %43, i64 %54
  store double %46, ptr %55, align 8
  br label %56

56:                                               ; preds = %48, %40
  %57 = sub nsw i32 2000, %9
  call void @daxpy(i32 noundef %57, double noundef %46, ptr noundef %8, i32 noundef %9, i32 noundef 1, ptr noundef %43, i32 noundef %9, i32 noundef 1)
  %58 = add nsw i32 %.0, 1
  br label %38, !llvm.loop !18

59:                                               ; preds = %5, %38
  %60 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !19

61:                                               ; preds = %3
  %62 = getelementptr inbounds i32, ptr %1, i64 1999
  store i32 1999, ptr %62, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dgesl(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %22, %3
  %.01 = phi i32 [ 0, %3 ], [ %28, %22 ]
  %5 = icmp slt i32 %.01, 1999
  br i1 %5, label %6, label %29

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds i32, ptr %1, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds double, ptr %2, i64 %10
  %12 = load double, ptr %11, align 8
  %13 = icmp ne i32 %9, %.01
  br i1 %13, label %14, label %22

14:                                               ; preds = %6
  %15 = sext i32 %.01 to i64
  %16 = getelementptr inbounds double, ptr %2, i64 %15
  %17 = load double, ptr %16, align 8
  %18 = sext i32 %9 to i64
  %19 = getelementptr inbounds double, ptr %2, i64 %18
  store double %17, ptr %19, align 8
  %20 = sext i32 %.01 to i64
  %21 = getelementptr inbounds double, ptr %2, i64 %20
  store double %12, ptr %21, align 8
  br label %22

22:                                               ; preds = %14, %6
  %23 = add nsw i32 %.01, 1
  %24 = sub nsw i32 2000, %23
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds ptr, ptr %0, i64 %25
  %27 = load ptr, ptr %26, align 8
  call void @daxpy(i32 noundef %24, double noundef %12, ptr noundef %27, i32 noundef %23, i32 noundef 1, ptr noundef %2, i32 noundef %23, i32 noundef 1)
  %28 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !20

29:                                               ; preds = %4, %31
  %.0 = phi i32 [ %51, %31 ], [ 0, %4 ]
  %30 = icmp slt i32 %.0, 2000
  br i1 %30, label %31, label %52

31:                                               ; preds = %29
  %32 = add nsw i32 %.0, 1
  %33 = sub nsw i32 2000, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds ptr, ptr %0, i64 %34
  %36 = load ptr, ptr %35, align 8
  %37 = sext i32 %33 to i64
  %38 = getelementptr inbounds double, ptr %36, i64 %37
  %39 = load double, ptr %38, align 8
  %40 = sext i32 %33 to i64
  %41 = getelementptr inbounds double, ptr %2, i64 %40
  %42 = load double, ptr %41, align 8
  %43 = fdiv double %42, %39
  store double %43, ptr %41, align 8
  %44 = sext i32 %33 to i64
  %45 = getelementptr inbounds double, ptr %2, i64 %44
  %46 = load double, ptr %45, align 8
  %47 = fneg double %46
  %48 = sext i32 %33 to i64
  %49 = getelementptr inbounds ptr, ptr %0, i64 %48
  %50 = load ptr, ptr %49, align 8
  call void @daxpy(i32 noundef %33, double noundef %47, ptr noundef %50, i32 noundef 0, i32 noundef 1, ptr noundef %2, i32 noundef 0, i32 noundef 1)
  %51 = add nsw i32 %.0, 1
  br label %29, !llvm.loop !21

52:                                               ; preds = %29
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp sgt i32 %0, 1
  br i1 %3, label %4, label %.loopexit

4:                                                ; preds = %2, %11
  %.01 = phi i32 [ %12, %11 ], [ 1, %2 ]
  %5 = icmp slt i32 %.01, %0
  br i1 %5, label %6, label %.loopexit

6:                                                ; preds = %4
  %7 = getelementptr inbounds ptr, ptr %1, i64 1
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 @strcmp(ptr noundef %8, ptr noundef @.str) #6
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %.loopexit

11:                                               ; preds = %6
  %12 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !22

.loopexit:                                        ; preds = %6, %4, %2
  %.1 = phi i8 [ 0, %2 ], [ 1, %6 ], [ 0, %4 ]
  %13 = call noalias ptr @malloc(i64 noundef 16000) #7
  br label %14

14:                                               ; preds = %16, %.loopexit
  %.12 = phi i32 [ 0, %.loopexit ], [ %20, %16 ]
  %15 = icmp slt i32 %.12, 2000
  br i1 %15, label %16, label %21

16:                                               ; preds = %14
  %17 = call noalias ptr @malloc(i64 noundef 16008) #7
  %18 = sext i32 %.12 to i64
  %19 = getelementptr inbounds ptr, ptr %13, i64 %18
  store ptr %17, ptr %19, align 8
  %20 = add nsw i32 %.12, 1
  br label %14, !llvm.loop !23

21:                                               ; preds = %14
  %22 = call noalias ptr @malloc(i64 noundef 16000) #7
  %23 = call noalias ptr @malloc(i64 noundef 16000) #7
  %24 = call noalias ptr @malloc(i64 noundef 8000) #7
  call void @matgen(ptr noundef %13, ptr noundef %22)
  call void @dgefa(ptr noundef %13, ptr noundef %24)
  call void @dgesl(ptr noundef %13, ptr noundef %24, ptr noundef %22)
  call void @free(ptr noundef %24) #8
  call void @free(ptr noundef %23) #8
  call void @free(ptr noundef %22) #8
  br label %25

25:                                               ; preds = %27, %21
  %.2 = phi i32 [ 0, %21 ], [ %31, %27 ]
  %26 = icmp slt i32 %.2, 2000
  br i1 %26, label %27, label %32

27:                                               ; preds = %25
  %28 = sext i32 %.2 to i64
  %29 = getelementptr inbounds ptr, ptr %13, i64 %28
  %30 = load ptr, ptr %29, align 8
  call void @free(ptr noundef %30) #8
  %31 = add nsw i32 %.2, 1
  br label %25, !llvm.loop !24

32:                                               ; preds = %25
  call void @free(ptr noundef %13) #8
  %33 = trunc i8 %.1 to i1
  br i1 %33, label %34, label %37

34:                                               ; preds = %32
  %35 = load ptr, ptr @stdout, align 8
  %36 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %35, ptr noundef @.str.1, double noundef 0.000000e+00)
  br label %40

37:                                               ; preds = %32
  %38 = load ptr, ptr @stdout, align 8
  %39 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %38, ptr noundef @.str.2, double noundef 0.000000e+00)
  br label %40

40:                                               ; preds = %37, %34
  %41 = load ptr, ptr @stdout, align 8
  %42 = call i32 @fflush(ptr noundef %41)
  ret i32 0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #5

declare i32 @fflush(ptr noundef) #5

; Function Attrs: noinline nounwind uwtable
define internal double @random_double() #0 {
  %1 = load i64, ptr @seed, align 8
  %2 = xor i64 %1, 123459876
  store i64 %2, ptr @seed, align 8
  %3 = load i64, ptr @seed, align 8
  %4 = sdiv i64 %3, 127773
  %5 = load i64, ptr @seed, align 8
  %6 = mul nsw i64 %4, 127773
  %7 = sub nsw i64 %5, %6
  %8 = mul nsw i64 16807, %7
  %9 = mul nsw i64 2836, %4
  %10 = sub nsw i64 %8, %9
  store i64 %10, ptr @seed, align 8
  %11 = load i64, ptr @seed, align 8
  %12 = icmp slt i64 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %0
  %14 = load i64, ptr @seed, align 8
  %15 = add nsw i64 %14, 2147483647
  store i64 %15, ptr @seed, align 8
  br label %16

16:                                               ; preds = %13, %0
  %17 = load i64, ptr @seed, align 8
  %18 = sitofp i64 %17 to double
  %19 = fmul double 0x3E00000000200FE1, %18
  %20 = load i64, ptr @seed, align 8
  %21 = xor i64 %20, 123459876
  store i64 %21, ptr @seed, align 8
  ret double %19
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind allocsize(0) }
attributes #8 = { nounwind }

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
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}

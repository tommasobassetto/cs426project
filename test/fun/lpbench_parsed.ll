; ModuleID = 'test/fun/lpbench.ll'
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
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %28, %2
  %8 = load i32, ptr %5, align 4
  %9 = icmp slt i32 %8, 2000
  br i1 %9, label %10, label %31

10:                                               ; preds = %7
  store i32 0, ptr %6, align 4
  br label %11

11:                                               ; preds = %24, %10
  %12 = load i32, ptr %6, align 4
  %13 = icmp slt i32 %12, 2000
  br i1 %13, label %14, label %27

14:                                               ; preds = %11
  %15 = call double @random_double()
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds ptr, ptr %16, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = load i32, ptr %5, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds double, ptr %20, i64 %22
  store double %15, ptr %23, align 8
  br label %24

24:                                               ; preds = %14
  %25 = load i32, ptr %6, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %6, align 4
  br label %11, !llvm.loop !6

27:                                               ; preds = %11
  br label %28

28:                                               ; preds = %27
  %29 = load i32, ptr %5, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %5, align 4
  br label %7, !llvm.loop !8

31:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %32

32:                                               ; preds = %40, %31
  %33 = load i32, ptr %5, align 4
  %34 = icmp slt i32 %33, 2000
  br i1 %34, label %35, label %43

35:                                               ; preds = %32
  %36 = load ptr, ptr %4, align 8
  %37 = load i32, ptr %5, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, ptr %36, i64 %38
  store double 0.000000e+00, ptr %39, align 8
  br label %40

40:                                               ; preds = %35
  %41 = load i32, ptr %5, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %5, align 4
  br label %32, !llvm.loop !9

43:                                               ; preds = %32
  store i32 0, ptr %6, align 4
  br label %44

44:                                               ; preds = %71, %43
  %45 = load i32, ptr %6, align 4
  %46 = icmp slt i32 %45, 2000
  br i1 %46, label %47, label %74

47:                                               ; preds = %44
  store i32 0, ptr %5, align 4
  br label %48

48:                                               ; preds = %67, %47
  %49 = load i32, ptr %5, align 4
  %50 = icmp slt i32 %49, 2000
  br i1 %50, label %51, label %70

51:                                               ; preds = %48
  %52 = load ptr, ptr %3, align 8
  %53 = load i32, ptr %6, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds ptr, ptr %52, i64 %54
  %56 = load ptr, ptr %55, align 8
  %57 = load i32, ptr %5, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, ptr %56, i64 %58
  %60 = load double, ptr %59, align 8
  %61 = load ptr, ptr %4, align 8
  %62 = load i32, ptr %5, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, ptr %61, i64 %63
  %65 = load double, ptr %64, align 8
  %66 = fadd double %65, %60
  store double %66, ptr %64, align 8
  br label %67

67:                                               ; preds = %51
  %68 = load i32, ptr %5, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %5, align 4
  br label %48, !llvm.loop !10

70:                                               ; preds = %48
  br label %71

71:                                               ; preds = %70
  %72 = load i32, ptr %6, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, ptr %6, align 4
  br label %44, !llvm.loop !11

74:                                               ; preds = %44
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @idamax(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %13, align 4
  %14 = load i32, ptr %5, align 4
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %17

16:                                               ; preds = %4
  store i32 -1, ptr %13, align 4
  br label %93

17:                                               ; preds = %4
  %18 = load i32, ptr %5, align 4
  %19 = icmp eq i32 %18, 1
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  store i32 0, ptr %13, align 4
  br label %92

21:                                               ; preds = %17
  %22 = load i32, ptr %8, align 4
  %23 = icmp ne i32 %22, 1
  br i1 %23, label %24, label %60

24:                                               ; preds = %21
  %25 = load ptr, ptr %6, align 8
  %26 = load i32, ptr %7, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds double, ptr %25, i64 %27
  %29 = load double, ptr %28, align 8
  %30 = call double @llvm.fabs.f64(double %29)
  store double %30, ptr %9, align 8
  %31 = load i32, ptr %8, align 4
  %32 = add nsw i32 1, %31
  store i32 %32, ptr %12, align 4
  store i32 1, ptr %11, align 4
  br label %33

33:                                               ; preds = %56, %24
  %34 = load i32, ptr %11, align 4
  %35 = load i32, ptr %5, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %59

37:                                               ; preds = %33
  %38 = load ptr, ptr %6, align 8
  %39 = load i32, ptr %12, align 4
  %40 = load i32, ptr %7, align 4
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, ptr %38, i64 %42
  %44 = load double, ptr %43, align 8
  %45 = call double @llvm.fabs.f64(double %44)
  store double %45, ptr %10, align 8
  %46 = load double, ptr %10, align 8
  %47 = load double, ptr %9, align 8
  %48 = fcmp ogt double %46, %47
  br i1 %48, label %49, label %52

49:                                               ; preds = %37
  %50 = load i32, ptr %11, align 4
  store i32 %50, ptr %13, align 4
  %51 = load double, ptr %10, align 8
  store double %51, ptr %9, align 8
  br label %52

52:                                               ; preds = %49, %37
  %53 = load i32, ptr %8, align 4
  %54 = load i32, ptr %12, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, ptr %12, align 4
  br label %56

56:                                               ; preds = %52
  %57 = load i32, ptr %11, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %11, align 4
  br label %33, !llvm.loop !12

59:                                               ; preds = %33
  br label %91

60:                                               ; preds = %21
  store i32 0, ptr %13, align 4
  %61 = load ptr, ptr %6, align 8
  %62 = load i32, ptr %7, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, ptr %61, i64 %63
  %65 = load double, ptr %64, align 8
  %66 = call double @llvm.fabs.f64(double %65)
  store double %66, ptr %9, align 8
  store i32 1, ptr %11, align 4
  br label %67

67:                                               ; preds = %87, %60
  %68 = load i32, ptr %11, align 4
  %69 = load i32, ptr %5, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %90

71:                                               ; preds = %67
  %72 = load ptr, ptr %6, align 8
  %73 = load i32, ptr %11, align 4
  %74 = load i32, ptr %7, align 4
  %75 = add nsw i32 %73, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, ptr %72, i64 %76
  %78 = load double, ptr %77, align 8
  %79 = call double @llvm.fabs.f64(double %78)
  store double %79, ptr %10, align 8
  %80 = load double, ptr %10, align 8
  %81 = load double, ptr %9, align 8
  %82 = fcmp ogt double %80, %81
  br i1 %82, label %83, label %86

83:                                               ; preds = %71
  %84 = load i32, ptr %11, align 4
  store i32 %84, ptr %13, align 4
  %85 = load double, ptr %10, align 8
  store double %85, ptr %9, align 8
  br label %86

86:                                               ; preds = %83, %71
  br label %87

87:                                               ; preds = %86
  %88 = load i32, ptr %11, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr %11, align 4
  br label %67, !llvm.loop !13

90:                                               ; preds = %67
  br label %91

91:                                               ; preds = %90, %59
  br label %92

92:                                               ; preds = %91, %20
  br label %93

93:                                               ; preds = %92, %16
  %94 = load i32, ptr %13, align 4
  ret i32 %94
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @dscal(i32 noundef %0, double noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store double %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  %13 = load i32, ptr %6, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %61

15:                                               ; preds = %5
  %16 = load i32, ptr %10, align 4
  %17 = icmp ne i32 %16, 1
  br i1 %17, label %18, label %41

18:                                               ; preds = %15
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %10, align 4
  %21 = mul nsw i32 %19, %20
  store i32 %21, ptr %12, align 4
  store i32 0, ptr %11, align 4
  br label %22

22:                                               ; preds = %36, %18
  %23 = load i32, ptr %11, align 4
  %24 = load i32, ptr %12, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %40

26:                                               ; preds = %22
  %27 = load double, ptr %7, align 8
  %28 = load ptr, ptr %8, align 8
  %29 = load i32, ptr %11, align 4
  %30 = load i32, ptr %9, align 4
  %31 = add nsw i32 %29, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, ptr %28, i64 %32
  %34 = load double, ptr %33, align 8
  %35 = fmul double %34, %27
  store double %35, ptr %33, align 8
  br label %36

36:                                               ; preds = %26
  %37 = load i32, ptr %10, align 4
  %38 = load i32, ptr %11, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, ptr %11, align 4
  br label %22, !llvm.loop !14

40:                                               ; preds = %22
  br label %60

41:                                               ; preds = %15
  store i32 0, ptr %11, align 4
  br label %42

42:                                               ; preds = %56, %41
  %43 = load i32, ptr %11, align 4
  %44 = load i32, ptr %6, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %59

46:                                               ; preds = %42
  %47 = load double, ptr %7, align 8
  %48 = load ptr, ptr %8, align 8
  %49 = load i32, ptr %11, align 4
  %50 = load i32, ptr %9, align 4
  %51 = add nsw i32 %49, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, ptr %48, i64 %52
  %54 = load double, ptr %53, align 8
  %55 = fmul double %54, %47
  store double %55, ptr %53, align 8
  br label %56

56:                                               ; preds = %46
  %57 = load i32, ptr %11, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %11, align 4
  br label %42, !llvm.loop !15

59:                                               ; preds = %42
  br label %60

60:                                               ; preds = %59, %40
  br label %61

61:                                               ; preds = %60, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @daxpy(i32 noundef %0, double noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef %5, i32 noundef %6, i32 noundef %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, ptr %9, align 4
  store double %1, ptr %10, align 8
  store ptr %2, ptr %11, align 8
  store i32 %3, ptr %12, align 4
  store i32 %4, ptr %13, align 4
  store ptr %5, ptr %14, align 8
  store i32 %6, ptr %15, align 4
  store i32 %7, ptr %16, align 4
  %20 = load i32, ptr %9, align 4
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %22, label %106

22:                                               ; preds = %8
  %23 = load double, ptr %10, align 8
  %24 = fcmp une double %23, 0.000000e+00
  br i1 %24, label %25, label %106

25:                                               ; preds = %22
  %26 = load i32, ptr %13, align 4
  %27 = icmp ne i32 %26, 1
  br i1 %27, label %31, label %28

28:                                               ; preds = %25
  %29 = load i32, ptr %16, align 4
  %30 = icmp ne i32 %29, 1
  br i1 %30, label %31, label %79

31:                                               ; preds = %28, %25
  store i32 0, ptr %18, align 4
  store i32 0, ptr %19, align 4
  %32 = load i32, ptr %13, align 4
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %34, label %39

34:                                               ; preds = %31
  %35 = load i32, ptr %9, align 4
  %36 = sub nsw i32 1, %35
  %37 = load i32, ptr %13, align 4
  %38 = mul nsw i32 %36, %37
  store i32 %38, ptr %18, align 4
  br label %39

39:                                               ; preds = %34, %31
  %40 = load i32, ptr %16, align 4
  %41 = icmp slt i32 %40, 0
  br i1 %41, label %42, label %47

42:                                               ; preds = %39
  %43 = load i32, ptr %9, align 4
  %44 = sub nsw i32 1, %43
  %45 = load i32, ptr %16, align 4
  %46 = mul nsw i32 %44, %45
  store i32 %46, ptr %19, align 4
  br label %47

47:                                               ; preds = %42, %39
  store i32 0, ptr %17, align 4
  br label %48

48:                                               ; preds = %75, %47
  %49 = load i32, ptr %17, align 4
  %50 = load i32, ptr %9, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %78

52:                                               ; preds = %48
  %53 = load double, ptr %10, align 8
  %54 = load ptr, ptr %11, align 8
  %55 = load i32, ptr %18, align 4
  %56 = load i32, ptr %12, align 4
  %57 = add nsw i32 %55, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, ptr %54, i64 %58
  %60 = load double, ptr %59, align 8
  %61 = load ptr, ptr %14, align 8
  %62 = load i32, ptr %19, align 4
  %63 = load i32, ptr %15, align 4
  %64 = add nsw i32 %62, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds double, ptr %61, i64 %65
  %67 = load double, ptr %66, align 8
  %68 = call double @llvm.fmuladd.f64(double %53, double %60, double %67)
  store double %68, ptr %66, align 8
  %69 = load i32, ptr %13, align 4
  %70 = load i32, ptr %18, align 4
  %71 = add nsw i32 %70, %69
  store i32 %71, ptr %18, align 4
  %72 = load i32, ptr %16, align 4
  %73 = load i32, ptr %19, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, ptr %19, align 4
  br label %75

75:                                               ; preds = %52
  %76 = load i32, ptr %17, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %17, align 4
  br label %48, !llvm.loop !16

78:                                               ; preds = %48
  br label %106

79:                                               ; preds = %28
  store i32 0, ptr %17, align 4
  br label %80

80:                                               ; preds = %101, %79
  %81 = load i32, ptr %17, align 4
  %82 = load i32, ptr %9, align 4
  %83 = icmp slt i32 %81, %82
  br i1 %83, label %84, label %104

84:                                               ; preds = %80
  %85 = load double, ptr %10, align 8
  %86 = load ptr, ptr %11, align 8
  %87 = load i32, ptr %17, align 4
  %88 = load i32, ptr %12, align 4
  %89 = add nsw i32 %87, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, ptr %86, i64 %90
  %92 = load double, ptr %91, align 8
  %93 = load ptr, ptr %14, align 8
  %94 = load i32, ptr %17, align 4
  %95 = load i32, ptr %15, align 4
  %96 = add nsw i32 %94, %95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, ptr %93, i64 %97
  %99 = load double, ptr %98, align 8
  %100 = call double @llvm.fmuladd.f64(double %85, double %92, double %99)
  store double %100, ptr %98, align 8
  br label %101

101:                                              ; preds = %84
  %102 = load i32, ptr %17, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, ptr %17, align 4
  br label %80, !llvm.loop !17

104:                                              ; preds = %80
  br label %105

105:                                              ; preds = %104
  br label %106

106:                                              ; preds = %105, %78, %22, %8
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @dgefa(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %123, %2
  %13 = load i32, ptr %6, align 4
  %14 = icmp slt i32 %13, 1999
  br i1 %14, label %15, label %126

15:                                               ; preds = %12
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds ptr, ptr %16, i64 %18
  %20 = load ptr, ptr %19, align 8
  store ptr %20, ptr %8, align 8
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %9, align 4
  %23 = load i32, ptr %6, align 4
  %24 = sub nsw i32 2000, %23
  %25 = load ptr, ptr %8, align 8
  %26 = load i32, ptr %6, align 4
  %27 = call i32 @idamax(i32 noundef %24, ptr noundef %25, i32 noundef %26, i32 noundef 1)
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %27, %28
  store i32 %29, ptr %10, align 4
  %30 = load i32, ptr %10, align 4
  %31 = load ptr, ptr %4, align 8
  %32 = load i32, ptr %6, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, ptr %31, i64 %33
  store i32 %30, ptr %34, align 4
  %35 = load ptr, ptr %8, align 8
  %36 = load i32, ptr %10, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, ptr %35, i64 %37
  %39 = load double, ptr %38, align 8
  %40 = fcmp une double %39, 0.000000e+00
  br i1 %40, label %41, label %122

41:                                               ; preds = %15
  %42 = load i32, ptr %10, align 4
  %43 = load i32, ptr %6, align 4
  %44 = icmp ne i32 %42, %43
  br i1 %44, label %45, label %65

45:                                               ; preds = %41
  %46 = load ptr, ptr %8, align 8
  %47 = load i32, ptr %10, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, ptr %46, i64 %48
  %50 = load double, ptr %49, align 8
  store double %50, ptr %5, align 8
  %51 = load ptr, ptr %8, align 8
  %52 = load i32, ptr %6, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, ptr %51, i64 %53
  %55 = load double, ptr %54, align 8
  %56 = load ptr, ptr %8, align 8
  %57 = load i32, ptr %10, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, ptr %56, i64 %58
  store double %55, ptr %59, align 8
  %60 = load double, ptr %5, align 8
  %61 = load ptr, ptr %8, align 8
  %62 = load i32, ptr %6, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, ptr %61, i64 %63
  store double %60, ptr %64, align 8
  br label %65

65:                                               ; preds = %45, %41
  %66 = load ptr, ptr %8, align 8
  %67 = load i32, ptr %6, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, ptr %66, i64 %68
  %70 = load double, ptr %69, align 8
  %71 = fdiv double -1.000000e+00, %70
  store double %71, ptr %5, align 8
  %72 = load i32, ptr %9, align 4
  %73 = sub nsw i32 2000, %72
  %74 = load double, ptr %5, align 8
  %75 = load ptr, ptr %8, align 8
  %76 = load i32, ptr %9, align 4
  call void @dscal(i32 noundef %73, double noundef %74, ptr noundef %75, i32 noundef %76, i32 noundef 1)
  %77 = load i32, ptr %9, align 4
  store i32 %77, ptr %7, align 4
  br label %78

78:                                               ; preds = %118, %65
  %79 = load i32, ptr %7, align 4
  %80 = icmp slt i32 %79, 2000
  br i1 %80, label %81, label %121

81:                                               ; preds = %78
  %82 = load ptr, ptr %3, align 8
  %83 = load i32, ptr %7, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds ptr, ptr %82, i64 %84
  %86 = load ptr, ptr %85, align 8
  store ptr %86, ptr %11, align 8
  %87 = load ptr, ptr %11, align 8
  %88 = load i32, ptr %10, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds double, ptr %87, i64 %89
  %91 = load double, ptr %90, align 8
  store double %91, ptr %5, align 8
  %92 = load i32, ptr %10, align 4
  %93 = load i32, ptr %6, align 4
  %94 = icmp ne i32 %92, %93
  br i1 %94, label %95, label %110

95:                                               ; preds = %81
  %96 = load ptr, ptr %11, align 8
  %97 = load i32, ptr %6, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds double, ptr %96, i64 %98
  %100 = load double, ptr %99, align 8
  %101 = load ptr, ptr %11, align 8
  %102 = load i32, ptr %10, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double, ptr %101, i64 %103
  store double %100, ptr %104, align 8
  %105 = load double, ptr %5, align 8
  %106 = load ptr, ptr %11, align 8
  %107 = load i32, ptr %6, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds double, ptr %106, i64 %108
  store double %105, ptr %109, align 8
  br label %110

110:                                              ; preds = %95, %81
  %111 = load i32, ptr %9, align 4
  %112 = sub nsw i32 2000, %111
  %113 = load double, ptr %5, align 8
  %114 = load ptr, ptr %8, align 8
  %115 = load i32, ptr %9, align 4
  %116 = load ptr, ptr %11, align 8
  %117 = load i32, ptr %9, align 4
  call void @daxpy(i32 noundef %112, double noundef %113, ptr noundef %114, i32 noundef %115, i32 noundef 1, ptr noundef %116, i32 noundef %117, i32 noundef 1)
  br label %118

118:                                              ; preds = %110
  %119 = load i32, ptr %7, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, ptr %7, align 4
  br label %78, !llvm.loop !18

121:                                              ; preds = %78
  br label %122

122:                                              ; preds = %121, %15
  br label %123

123:                                              ; preds = %122
  %124 = load i32, ptr %6, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, ptr %6, align 4
  br label %12, !llvm.loop !19

126:                                              ; preds = %12
  %127 = load ptr, ptr %4, align 8
  %128 = getelementptr inbounds i32, ptr %127, i64 1999
  store i32 1999, ptr %128, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dgesl(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %8, align 4
  br label %12

12:                                               ; preds = %58, %3
  %13 = load i32, ptr %8, align 4
  %14 = icmp slt i32 %13, 1999
  br i1 %14, label %15, label %61

15:                                               ; preds = %12
  %16 = load ptr, ptr %5, align 8
  %17 = load i32, ptr %8, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr %16, i64 %18
  %20 = load i32, ptr %19, align 4
  store i32 %20, ptr %10, align 4
  %21 = load ptr, ptr %6, align 8
  %22 = load i32, ptr %10, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds double, ptr %21, i64 %23
  %25 = load double, ptr %24, align 8
  store double %25, ptr %7, align 8
  %26 = load i32, ptr %10, align 4
  %27 = load i32, ptr %8, align 4
  %28 = icmp ne i32 %26, %27
  br i1 %28, label %29, label %44

29:                                               ; preds = %15
  %30 = load ptr, ptr %6, align 8
  %31 = load i32, ptr %8, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, ptr %30, i64 %32
  %34 = load double, ptr %33, align 8
  %35 = load ptr, ptr %6, align 8
  %36 = load i32, ptr %10, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, ptr %35, i64 %37
  store double %34, ptr %38, align 8
  %39 = load double, ptr %7, align 8
  %40 = load ptr, ptr %6, align 8
  %41 = load i32, ptr %8, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds double, ptr %40, i64 %42
  store double %39, ptr %43, align 8
  br label %44

44:                                               ; preds = %29, %15
  %45 = load i32, ptr %8, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %11, align 4
  %47 = load i32, ptr %11, align 4
  %48 = sub nsw i32 2000, %47
  %49 = load double, ptr %7, align 8
  %50 = load ptr, ptr %4, align 8
  %51 = load i32, ptr %8, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds ptr, ptr %50, i64 %52
  %54 = load ptr, ptr %53, align 8
  %55 = load i32, ptr %11, align 4
  %56 = load ptr, ptr %6, align 8
  %57 = load i32, ptr %11, align 4
  call void @daxpy(i32 noundef %48, double noundef %49, ptr noundef %54, i32 noundef %55, i32 noundef 1, ptr noundef %56, i32 noundef %57, i32 noundef 1)
  br label %58

58:                                               ; preds = %44
  %59 = load i32, ptr %8, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %8, align 4
  br label %12, !llvm.loop !20

61:                                               ; preds = %12
  store i32 0, ptr %9, align 4
  br label %62

62:                                               ; preds = %98, %61
  %63 = load i32, ptr %9, align 4
  %64 = icmp slt i32 %63, 2000
  br i1 %64, label %65, label %101

65:                                               ; preds = %62
  %66 = load i32, ptr %9, align 4
  %67 = add nsw i32 %66, 1
  %68 = sub nsw i32 2000, %67
  store i32 %68, ptr %8, align 4
  %69 = load ptr, ptr %4, align 8
  %70 = load i32, ptr %8, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds ptr, ptr %69, i64 %71
  %73 = load ptr, ptr %72, align 8
  %74 = load i32, ptr %8, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, ptr %73, i64 %75
  %77 = load double, ptr %76, align 8
  %78 = load ptr, ptr %6, align 8
  %79 = load i32, ptr %8, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, ptr %78, i64 %80
  %82 = load double, ptr %81, align 8
  %83 = fdiv double %82, %77
  store double %83, ptr %81, align 8
  %84 = load ptr, ptr %6, align 8
  %85 = load i32, ptr %8, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, ptr %84, i64 %86
  %88 = load double, ptr %87, align 8
  %89 = fneg double %88
  store double %89, ptr %7, align 8
  %90 = load i32, ptr %8, align 4
  %91 = load double, ptr %7, align 8
  %92 = load ptr, ptr %4, align 8
  %93 = load i32, ptr %8, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds ptr, ptr %92, i64 %94
  %96 = load ptr, ptr %95, align 8
  %97 = load ptr, ptr %6, align 8
  call void @daxpy(i32 noundef %90, double noundef %91, ptr noundef %96, i32 noundef 0, i32 noundef 1, ptr noundef %97, i32 noundef 0, i32 noundef 1)
  br label %98

98:                                               ; preds = %65
  %99 = load i32, ptr %9, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, ptr %9, align 4
  br label %62, !llvm.loop !21

101:                                              ; preds = %62
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i8 0, ptr %7, align 1
  %14 = load i32, ptr %4, align 4
  %15 = icmp sgt i32 %14, 1
  br i1 %15, label %16, label %33

16:                                               ; preds = %2
  store i32 1, ptr %6, align 4
  br label %17

17:                                               ; preds = %29, %16
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %4, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %32

21:                                               ; preds = %17
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds ptr, ptr %22, i64 1
  %24 = load ptr, ptr %23, align 8
  %25 = call i32 @strcmp(ptr noundef %24, ptr noundef @.str) #6
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %28, label %27

27:                                               ; preds = %21
  store i8 1, ptr %7, align 1
  br label %32

28:                                               ; preds = %21
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %6, align 4
  br label %17, !llvm.loop !22

32:                                               ; preds = %27, %17
  br label %33

33:                                               ; preds = %32, %2
  %34 = call noalias ptr @malloc(i64 noundef 16000) #7
  store ptr %34, ptr %8, align 8
  store i32 0, ptr %6, align 4
  br label %35

35:                                               ; preds = %44, %33
  %36 = load i32, ptr %6, align 4
  %37 = icmp slt i32 %36, 2000
  br i1 %37, label %38, label %47

38:                                               ; preds = %35
  %39 = call noalias ptr @malloc(i64 noundef 16008) #7
  %40 = load ptr, ptr %8, align 8
  %41 = load i32, ptr %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds ptr, ptr %40, i64 %42
  store ptr %39, ptr %43, align 8
  br label %44

44:                                               ; preds = %38
  %45 = load i32, ptr %6, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %6, align 4
  br label %35, !llvm.loop !23

47:                                               ; preds = %35
  %48 = call noalias ptr @malloc(i64 noundef 16000) #7
  store ptr %48, ptr %9, align 8
  %49 = call noalias ptr @malloc(i64 noundef 16000) #7
  store ptr %49, ptr %10, align 8
  %50 = call noalias ptr @malloc(i64 noundef 8000) #7
  store ptr %50, ptr %11, align 8
  store double 0x41F3E5E475555555, ptr %12, align 8
  %51 = load ptr, ptr %8, align 8
  %52 = load ptr, ptr %9, align 8
  call void @matgen(ptr noundef %51, ptr noundef %52)
  %53 = load ptr, ptr %8, align 8
  %54 = load ptr, ptr %11, align 8
  call void @dgefa(ptr noundef %53, ptr noundef %54)
  %55 = load ptr, ptr %8, align 8
  %56 = load ptr, ptr %11, align 8
  %57 = load ptr, ptr %9, align 8
  call void @dgesl(ptr noundef %55, ptr noundef %56, ptr noundef %57)
  store double 0.000000e+00, ptr %13, align 8
  %58 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %58) #8
  %59 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %59) #8
  %60 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %60) #8
  store i32 0, ptr %6, align 4
  br label %61

61:                                               ; preds = %70, %47
  %62 = load i32, ptr %6, align 4
  %63 = icmp slt i32 %62, 2000
  br i1 %63, label %64, label %73

64:                                               ; preds = %61
  %65 = load ptr, ptr %8, align 8
  %66 = load i32, ptr %6, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds ptr, ptr %65, i64 %67
  %69 = load ptr, ptr %68, align 8
  call void @free(ptr noundef %69) #8
  br label %70

70:                                               ; preds = %64
  %71 = load i32, ptr %6, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %6, align 4
  br label %61, !llvm.loop !24

73:                                               ; preds = %61
  %74 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %74) #8
  %75 = load i8, ptr %7, align 1
  %76 = trunc i8 %75 to i1
  br i1 %76, label %77, label %81

77:                                               ; preds = %73
  %78 = load ptr, ptr @stdout, align 8
  %79 = load double, ptr %13, align 8
  %80 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %78, ptr noundef @.str.1, double noundef %79)
  br label %85

81:                                               ; preds = %73
  %82 = load ptr, ptr @stdout, align 8
  %83 = load double, ptr %13, align 8
  %84 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %82, ptr noundef @.str.2, double noundef %83)
  br label %85

85:                                               ; preds = %81, %77
  %86 = load ptr, ptr @stdout, align 8
  %87 = call i32 @fflush(ptr noundef %86)
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
  %1 = alloca i64, align 8
  %2 = alloca double, align 8
  %3 = load i64, ptr @seed, align 8
  %4 = xor i64 %3, 123459876
  store i64 %4, ptr @seed, align 8
  %5 = load i64, ptr @seed, align 8
  %6 = sdiv i64 %5, 127773
  store i64 %6, ptr %1, align 8
  %7 = load i64, ptr @seed, align 8
  %8 = load i64, ptr %1, align 8
  %9 = mul nsw i64 %8, 127773
  %10 = sub nsw i64 %7, %9
  %11 = mul nsw i64 16807, %10
  %12 = load i64, ptr %1, align 8
  %13 = mul nsw i64 2836, %12
  %14 = sub nsw i64 %11, %13
  store i64 %14, ptr @seed, align 8
  %15 = load i64, ptr @seed, align 8
  %16 = icmp slt i64 %15, 0
  br i1 %16, label %17, label %20

17:                                               ; preds = %0
  %18 = load i64, ptr @seed, align 8
  %19 = add nsw i64 %18, 2147483647
  store i64 %19, ptr @seed, align 8
  br label %20

20:                                               ; preds = %17, %0
  %21 = load i64, ptr @seed, align 8
  %22 = sitofp i64 %21 to double
  %23 = fmul double 0x3E00000000200FE1, %22
  store double %23, ptr %2, align 8
  %24 = load i64, ptr @seed, align 8
  %25 = xor i64 %24, 123459876
  store i64 %25, ptr @seed, align 8
  %26 = load double, ptr %2, align 8
  ret double %26
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

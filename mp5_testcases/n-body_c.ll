; ModuleID = 'mp5_testcases/n-body.ll'
source_filename = "mp5_testcases/n-body.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies = dso_local global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @advance(i32 noundef %0, ptr noundef %1, double noundef %2) #0 {
  br label %4

4:                                                ; preds = %79, %3
  %.01 = phi i32 [ 0, %3 ], [ %80, %79 ]
  %5 = icmp slt i32 %.01, %0
  br i1 %5, label %6, label %81

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds %struct.planet, ptr %1, i64 %7
  %9 = add nsw i32 %.01, 1
  br label %10

10:                                               ; preds = %76, %6
  %.0 = phi i32 [ %9, %6 ], [ %77, %76 ]
  %11 = icmp slt i32 %.0, %0
  br i1 %11, label %12, label %78

12:                                               ; preds = %10
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds %struct.planet, ptr %1, i64 %13
  %15 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 0
  %16 = load double, ptr %15, align 8
  %17 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 0
  %18 = load double, ptr %17, align 8
  %19 = fsub double %16, %18
  %20 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 1
  %21 = load double, ptr %20, align 8
  %22 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 1
  %23 = load double, ptr %22, align 8
  %24 = fsub double %21, %23
  %25 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 2
  %26 = load double, ptr %25, align 8
  %27 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 2
  %28 = load double, ptr %27, align 8
  %29 = fsub double %26, %28
  %30 = fmul double %24, %24
  %31 = call double @llvm.fmuladd.f64(double %19, double %19, double %30)
  %32 = call double @llvm.fmuladd.f64(double %29, double %29, double %31)
  %33 = call double @sqrt(double noundef %32) #4
  %34 = fmul double %33, %33
  %35 = fmul double %34, %33
  %36 = fdiv double %2, %35
  %37 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 6
  %38 = load double, ptr %37, align 8
  %39 = fmul double %19, %38
  %40 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 3
  %41 = load double, ptr %40, align 8
  %42 = fneg double %39
  %43 = call double @llvm.fmuladd.f64(double %42, double %36, double %41)
  store double %43, ptr %40, align 8
  %44 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 6
  %45 = load double, ptr %44, align 8
  %46 = fmul double %24, %45
  %47 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 4
  %48 = load double, ptr %47, align 8
  %49 = fneg double %46
  %50 = call double @llvm.fmuladd.f64(double %49, double %36, double %48)
  store double %50, ptr %47, align 8
  %51 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 6
  %52 = load double, ptr %51, align 8
  %53 = fmul double %29, %52
  %54 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 5
  %55 = load double, ptr %54, align 8
  %56 = fneg double %53
  %57 = call double @llvm.fmuladd.f64(double %56, double %36, double %55)
  store double %57, ptr %54, align 8
  %58 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 6
  %59 = load double, ptr %58, align 8
  %60 = fmul double %19, %59
  %61 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 3
  %62 = load double, ptr %61, align 8
  %63 = call double @llvm.fmuladd.f64(double %60, double %36, double %62)
  store double %63, ptr %61, align 8
  %64 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 6
  %65 = load double, ptr %64, align 8
  %66 = fmul double %24, %65
  %67 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 4
  %68 = load double, ptr %67, align 8
  %69 = call double @llvm.fmuladd.f64(double %66, double %36, double %68)
  store double %69, ptr %67, align 8
  %70 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 6
  %71 = load double, ptr %70, align 8
  %72 = fmul double %29, %71
  %73 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 5
  %74 = load double, ptr %73, align 8
  %75 = call double @llvm.fmuladd.f64(double %72, double %36, double %74)
  store double %75, ptr %73, align 8
  br label %76

76:                                               ; preds = %12
  %77 = add nsw i32 %.0, 1
  br label %10, !llvm.loop !6

78:                                               ; preds = %10
  br label %79

79:                                               ; preds = %78
  %80 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !8

81:                                               ; preds = %4
  br label %82

82:                                               ; preds = %102, %81
  %.1 = phi i32 [ 0, %81 ], [ %103, %102 ]
  %83 = icmp slt i32 %.1, %0
  br i1 %83, label %84, label %104

84:                                               ; preds = %82
  %85 = sext i32 %.1 to i64
  %86 = getelementptr inbounds %struct.planet, ptr %1, i64 %85
  %87 = getelementptr inbounds %struct.planet, ptr %86, i32 0, i32 3
  %88 = load double, ptr %87, align 8
  %89 = getelementptr inbounds %struct.planet, ptr %86, i32 0, i32 0
  %90 = load double, ptr %89, align 8
  %91 = call double @llvm.fmuladd.f64(double %2, double %88, double %90)
  store double %91, ptr %89, align 8
  %92 = getelementptr inbounds %struct.planet, ptr %86, i32 0, i32 4
  %93 = load double, ptr %92, align 8
  %94 = getelementptr inbounds %struct.planet, ptr %86, i32 0, i32 1
  %95 = load double, ptr %94, align 8
  %96 = call double @llvm.fmuladd.f64(double %2, double %93, double %95)
  store double %96, ptr %94, align 8
  %97 = getelementptr inbounds %struct.planet, ptr %86, i32 0, i32 5
  %98 = load double, ptr %97, align 8
  %99 = getelementptr inbounds %struct.planet, ptr %86, i32 0, i32 2
  %100 = load double, ptr %99, align 8
  %101 = call double @llvm.fmuladd.f64(double %2, double %98, double %100)
  store double %101, ptr %99, align 8
  br label %102

102:                                              ; preds = %84
  %103 = add nsw i32 %.1, 1
  br label %82, !llvm.loop !9

104:                                              ; preds = %82
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @energy(i32 noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %62, %2
  %.02 = phi double [ 0.000000e+00, %2 ], [ %.1, %62 ]
  %.01 = phi i32 [ 0, %2 ], [ %63, %62 ]
  %4 = icmp slt i32 %.01, %0
  br i1 %4, label %5, label %64

5:                                                ; preds = %3
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds %struct.planet, ptr %1, i64 %6
  %8 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 6
  %9 = load double, ptr %8, align 8
  %10 = fmul double 5.000000e-01, %9
  %11 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 3
  %12 = load double, ptr %11, align 8
  %13 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 3
  %14 = load double, ptr %13, align 8
  %15 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 4
  %16 = load double, ptr %15, align 8
  %17 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 4
  %18 = load double, ptr %17, align 8
  %19 = fmul double %16, %18
  %20 = call double @llvm.fmuladd.f64(double %12, double %14, double %19)
  %21 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 5
  %22 = load double, ptr %21, align 8
  %23 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 5
  %24 = load double, ptr %23, align 8
  %25 = call double @llvm.fmuladd.f64(double %22, double %24, double %20)
  %26 = call double @llvm.fmuladd.f64(double %10, double %25, double %.02)
  %27 = add nsw i32 %.01, 1
  br label %28

28:                                               ; preds = %59, %5
  %.1 = phi double [ %26, %5 ], [ %58, %59 ]
  %.0 = phi i32 [ %27, %5 ], [ %60, %59 ]
  %29 = icmp slt i32 %.0, %0
  br i1 %29, label %30, label %61

30:                                               ; preds = %28
  %31 = sext i32 %.0 to i64
  %32 = getelementptr inbounds %struct.planet, ptr %1, i64 %31
  %33 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 0
  %34 = load double, ptr %33, align 8
  %35 = getelementptr inbounds %struct.planet, ptr %32, i32 0, i32 0
  %36 = load double, ptr %35, align 8
  %37 = fsub double %34, %36
  %38 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 1
  %39 = load double, ptr %38, align 8
  %40 = getelementptr inbounds %struct.planet, ptr %32, i32 0, i32 1
  %41 = load double, ptr %40, align 8
  %42 = fsub double %39, %41
  %43 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 2
  %44 = load double, ptr %43, align 8
  %45 = getelementptr inbounds %struct.planet, ptr %32, i32 0, i32 2
  %46 = load double, ptr %45, align 8
  %47 = fsub double %44, %46
  %48 = fmul double %42, %42
  %49 = call double @llvm.fmuladd.f64(double %37, double %37, double %48)
  %50 = call double @llvm.fmuladd.f64(double %47, double %47, double %49)
  %51 = call double @sqrt(double noundef %50) #4
  %52 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 6
  %53 = load double, ptr %52, align 8
  %54 = getelementptr inbounds %struct.planet, ptr %32, i32 0, i32 6
  %55 = load double, ptr %54, align 8
  %56 = fmul double %53, %55
  %57 = fdiv double %56, %51
  %58 = fsub double %.1, %57
  br label %59

59:                                               ; preds = %30
  %60 = add nsw i32 %.0, 1
  br label %28, !llvm.loop !10

61:                                               ; preds = %28
  br label %62

62:                                               ; preds = %61
  %63 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !11

64:                                               ; preds = %3
  ret double %.02
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @offset_momentum(i32 noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %33, %2
  %.03 = phi double [ 0.000000e+00, %2 ], [ %23, %33 ]
  %.02 = phi double [ 0.000000e+00, %2 ], [ %14, %33 ]
  %.01 = phi double [ 0.000000e+00, %2 ], [ %32, %33 ]
  %.0 = phi i32 [ 0, %2 ], [ %34, %33 ]
  %4 = icmp slt i32 %.0, %0
  br i1 %4, label %5, label %35

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds %struct.planet, ptr %1, i64 %6
  %8 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 3
  %9 = load double, ptr %8, align 8
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds %struct.planet, ptr %1, i64 %10
  %12 = getelementptr inbounds %struct.planet, ptr %11, i32 0, i32 6
  %13 = load double, ptr %12, align 8
  %14 = call double @llvm.fmuladd.f64(double %9, double %13, double %.02)
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds %struct.planet, ptr %1, i64 %15
  %17 = getelementptr inbounds %struct.planet, ptr %16, i32 0, i32 4
  %18 = load double, ptr %17, align 8
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds %struct.planet, ptr %1, i64 %19
  %21 = getelementptr inbounds %struct.planet, ptr %20, i32 0, i32 6
  %22 = load double, ptr %21, align 8
  %23 = call double @llvm.fmuladd.f64(double %18, double %22, double %.03)
  %24 = sext i32 %.0 to i64
  %25 = getelementptr inbounds %struct.planet, ptr %1, i64 %24
  %26 = getelementptr inbounds %struct.planet, ptr %25, i32 0, i32 5
  %27 = load double, ptr %26, align 8
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds %struct.planet, ptr %1, i64 %28
  %30 = getelementptr inbounds %struct.planet, ptr %29, i32 0, i32 6
  %31 = load double, ptr %30, align 8
  %32 = call double @llvm.fmuladd.f64(double %27, double %31, double %.01)
  br label %33

33:                                               ; preds = %5
  %34 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !12

35:                                               ; preds = %3
  %36 = fneg double %.02
  %37 = fdiv double %36, 0x4043BD3CC9BE45DE
  %38 = getelementptr inbounds %struct.planet, ptr %1, i64 0
  %39 = getelementptr inbounds %struct.planet, ptr %38, i32 0, i32 3
  store double %37, ptr %39, align 8
  %40 = fneg double %.03
  %41 = fdiv double %40, 0x4043BD3CC9BE45DE
  %42 = getelementptr inbounds %struct.planet, ptr %1, i64 0
  %43 = getelementptr inbounds %struct.planet, ptr %42, i32 0, i32 4
  store double %41, ptr %43, align 8
  %44 = fneg double %.01
  %45 = fdiv double %44, 0x4043BD3CC9BE45DE
  %46 = getelementptr inbounds %struct.planet, ptr %1, i64 0
  %47 = getelementptr inbounds %struct.planet, ptr %46, i32 0, i32 5
  store double %45, ptr %47, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  call void @offset_momentum(i32 noundef 5, ptr noundef @bodies)
  %3 = call double @energy(i32 noundef 5, ptr noundef @bodies)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %3)
  br label %5

5:                                                ; preds = %8, %2
  %.0 = phi i32 [ 1, %2 ], [ %9, %8 ]
  %6 = icmp sle i32 %.0, 5000000
  br i1 %6, label %7, label %10

7:                                                ; preds = %5
  call void @advance(i32 noundef 5, ptr noundef @bodies, double noundef 1.000000e-02)
  br label %8

8:                                                ; preds = %7
  %9 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !13

10:                                               ; preds = %5
  %11 = call double @energy(i32 noundef 5, ptr noundef @bodies)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %11)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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

; ModuleID = 'mp5_testcases/n-body_c.ll'
source_filename = "mp5_testcases/n-body.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies = dso_local global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @advance(i32 noundef %0, ptr noundef %1, double noundef %2) #0 {
  br label %4

4:                                                ; preds = %10, %3
  %.01 = phi i32 [ 0, %3 ], [ %9, %10 ]
  %5 = icmp slt i32 %.01, %0
  br i1 %5, label %6, label %73

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds %struct.planet, ptr %1, i64 %7
  %9 = add nsw i32 %.01, 1
  br label %10

10:                                               ; preds = %12, %6
  %.0 = phi i32 [ %9, %6 ], [ %72, %12 ]
  %11 = icmp slt i32 %.0, %0
  br i1 %11, label %12, label %4, !llvm.loop !6

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
  %44 = load double, ptr %37, align 8
  %45 = fmul double %24, %44
  %46 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 4
  %47 = load double, ptr %46, align 8
  %48 = fneg double %45
  %49 = call double @llvm.fmuladd.f64(double %48, double %36, double %47)
  store double %49, ptr %46, align 8
  %50 = load double, ptr %37, align 8
  %51 = fmul double %29, %50
  %52 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 5
  %53 = load double, ptr %52, align 8
  %54 = fneg double %51
  %55 = call double @llvm.fmuladd.f64(double %54, double %36, double %53)
  store double %55, ptr %52, align 8
  %56 = getelementptr inbounds %struct.planet, ptr %8, i32 0, i32 6
  %57 = load double, ptr %56, align 8
  %58 = fmul double %19, %57
  %59 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 3
  %60 = load double, ptr %59, align 8
  %61 = call double @llvm.fmuladd.f64(double %58, double %36, double %60)
  store double %61, ptr %59, align 8
  %62 = load double, ptr %56, align 8
  %63 = fmul double %24, %62
  %64 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 4
  %65 = load double, ptr %64, align 8
  %66 = call double @llvm.fmuladd.f64(double %63, double %36, double %65)
  store double %66, ptr %64, align 8
  %67 = load double, ptr %56, align 8
  %68 = fmul double %29, %67
  %69 = getelementptr inbounds %struct.planet, ptr %14, i32 0, i32 5
  %70 = load double, ptr %69, align 8
  %71 = call double @llvm.fmuladd.f64(double %68, double %36, double %70)
  store double %71, ptr %69, align 8
  %72 = add nsw i32 %.0, 1
  br label %10, !llvm.loop !8

73:                                               ; preds = %4, %75
  %.1 = phi i32 [ %93, %75 ], [ 0, %4 ]
  %74 = icmp slt i32 %.1, %0
  br i1 %74, label %75, label %94

75:                                               ; preds = %73
  %76 = sext i32 %.1 to i64
  %77 = getelementptr inbounds %struct.planet, ptr %1, i64 %76
  %78 = getelementptr inbounds %struct.planet, ptr %77, i32 0, i32 3
  %79 = load double, ptr %78, align 8
  %80 = getelementptr inbounds %struct.planet, ptr %77, i32 0, i32 0
  %81 = load double, ptr %80, align 8
  %82 = call double @llvm.fmuladd.f64(double %2, double %79, double %81)
  store double %82, ptr %80, align 8
  %83 = getelementptr inbounds %struct.planet, ptr %77, i32 0, i32 4
  %84 = load double, ptr %83, align 8
  %85 = getelementptr inbounds %struct.planet, ptr %77, i32 0, i32 1
  %86 = load double, ptr %85, align 8
  %87 = call double @llvm.fmuladd.f64(double %2, double %84, double %86)
  store double %87, ptr %85, align 8
  %88 = getelementptr inbounds %struct.planet, ptr %77, i32 0, i32 5
  %89 = load double, ptr %88, align 8
  %90 = getelementptr inbounds %struct.planet, ptr %77, i32 0, i32 2
  %91 = load double, ptr %90, align 8
  %92 = call double @llvm.fmuladd.f64(double %2, double %89, double %91)
  store double %92, ptr %90, align 8
  %93 = add nsw i32 %.1, 1
  br label %73, !llvm.loop !9

94:                                               ; preds = %73
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @energy(i32 noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %25, %2
  %.02 = phi double [ 0.000000e+00, %2 ], [ %.1, %25 ]
  %.01 = phi i32 [ 0, %2 ], [ %24, %25 ]
  %4 = icmp slt i32 %.01, %0
  br i1 %4, label %5, label %56

5:                                                ; preds = %3
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds %struct.planet, ptr %1, i64 %6
  %8 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 6
  %9 = load double, ptr %8, align 8
  %10 = fmul double 5.000000e-01, %9
  %11 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 3
  %12 = load double, ptr %11, align 8
  %13 = load double, ptr %11, align 8
  %14 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 4
  %15 = load double, ptr %14, align 8
  %16 = load double, ptr %14, align 8
  %17 = fmul double %15, %16
  %18 = call double @llvm.fmuladd.f64(double %12, double %13, double %17)
  %19 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 5
  %20 = load double, ptr %19, align 8
  %21 = load double, ptr %19, align 8
  %22 = call double @llvm.fmuladd.f64(double %20, double %21, double %18)
  %23 = call double @llvm.fmuladd.f64(double %10, double %22, double %.02)
  %24 = add nsw i32 %.01, 1
  br label %25

25:                                               ; preds = %27, %5
  %.1 = phi double [ %23, %5 ], [ %54, %27 ]
  %.0 = phi i32 [ %24, %5 ], [ %55, %27 ]
  %26 = icmp slt i32 %.0, %0
  br i1 %26, label %27, label %3, !llvm.loop !10

27:                                               ; preds = %25
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds %struct.planet, ptr %1, i64 %28
  %30 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 0
  %31 = load double, ptr %30, align 8
  %32 = getelementptr inbounds %struct.planet, ptr %29, i32 0, i32 0
  %33 = load double, ptr %32, align 8
  %34 = fsub double %31, %33
  %35 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 1
  %36 = load double, ptr %35, align 8
  %37 = getelementptr inbounds %struct.planet, ptr %29, i32 0, i32 1
  %38 = load double, ptr %37, align 8
  %39 = fsub double %36, %38
  %40 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 2
  %41 = load double, ptr %40, align 8
  %42 = getelementptr inbounds %struct.planet, ptr %29, i32 0, i32 2
  %43 = load double, ptr %42, align 8
  %44 = fsub double %41, %43
  %45 = fmul double %39, %39
  %46 = call double @llvm.fmuladd.f64(double %34, double %34, double %45)
  %47 = call double @llvm.fmuladd.f64(double %44, double %44, double %46)
  %48 = call double @sqrt(double noundef %47) #4
  %49 = load double, ptr %8, align 8
  %50 = getelementptr inbounds %struct.planet, ptr %29, i32 0, i32 6
  %51 = load double, ptr %50, align 8
  %52 = fmul double %49, %51
  %53 = fdiv double %52, %48
  %54 = fsub double %.1, %53
  %55 = add nsw i32 %.0, 1
  br label %25, !llvm.loop !11

56:                                               ; preds = %3
  ret double %.02
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @offset_momentum(i32 noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %5, %2
  %.03 = phi double [ 0.000000e+00, %2 ], [ %16, %5 ]
  %.02 = phi double [ 0.000000e+00, %2 ], [ %12, %5 ]
  %.01 = phi double [ 0.000000e+00, %2 ], [ %20, %5 ]
  %.0 = phi i32 [ 0, %2 ], [ %21, %5 ]
  %4 = icmp slt i32 %.0, %0
  br i1 %4, label %5, label %22

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds %struct.planet, ptr %1, i64 %6
  %8 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 3
  %9 = load double, ptr %8, align 8
  %10 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 6
  %11 = load double, ptr %10, align 8
  %12 = call double @llvm.fmuladd.f64(double %9, double %11, double %.02)
  %13 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 4
  %14 = load double, ptr %13, align 8
  %15 = load double, ptr %10, align 8
  %16 = call double @llvm.fmuladd.f64(double %14, double %15, double %.03)
  %17 = getelementptr inbounds %struct.planet, ptr %7, i32 0, i32 5
  %18 = load double, ptr %17, align 8
  %19 = load double, ptr %10, align 8
  %20 = call double @llvm.fmuladd.f64(double %18, double %19, double %.01)
  %21 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !12

22:                                               ; preds = %3
  %23 = fneg double %.02
  %24 = fdiv double %23, 0x4043BD3CC9BE45DE
  %25 = getelementptr inbounds %struct.planet, ptr %1, i64 0
  %26 = getelementptr inbounds %struct.planet, ptr %25, i32 0, i32 3
  store double %24, ptr %26, align 8
  %27 = fneg double %.03
  %28 = fdiv double %27, 0x4043BD3CC9BE45DE
  %29 = getelementptr inbounds %struct.planet, ptr %25, i32 0, i32 4
  store double %28, ptr %29, align 8
  %30 = fneg double %.01
  %31 = fdiv double %30, 0x4043BD3CC9BE45DE
  %32 = getelementptr inbounds %struct.planet, ptr %25, i32 0, i32 5
  store double %31, ptr %32, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  call void @offset_momentum(i32 noundef 5, ptr noundef @bodies)
  %3 = call double @energy(i32 noundef 5, ptr noundef @bodies)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %3)
  br label %5

5:                                                ; preds = %7, %2
  %.0 = phi i32 [ 1, %2 ], [ %8, %7 ]
  %6 = icmp sle i32 %.0, 5000000
  br i1 %6, label %7, label %9

7:                                                ; preds = %5
  call void @advance(i32 noundef 5, ptr noundef @bodies, double noundef 1.000000e-02)
  %8 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !13

9:                                                ; preds = %5
  %10 = call double @energy(i32 noundef 5, ptr noundef @bodies)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %10)
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

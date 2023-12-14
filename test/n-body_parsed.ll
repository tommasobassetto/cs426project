; ModuleID = 'test/n-body.ll'
source_filename = "mp5_testcases/n-body.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.planet = type { double, double, double, double, double, double, double }

@bodies = dso_local global [5 x %struct.planet] [%struct.planet { double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0x4043BD3CC9BE45DE }, %struct.planet { double 0x40135DA0343CD92C, double 0xBFF290ABC01FDB7C, double 0xBFBA86F96C25EBF0, double 0x3FE367069B93CCBC, double 0x40067EF2F57D949B, double 0xBF99D2D79A5A0715, double 0x3FA34C95D9AB33D8 }, %struct.planet { double 0x4020AFCDC332CA67, double 0x40107FCB31DE01B0, double 0xBFD9D353E1EB467C, double 0xBFF02C21B8879442, double 0x3FFD35E9BF1F8F13, double 0x3F813C485F1123B4, double 0x3F871D490D07C637 }, %struct.planet { double 0x4029C9EACEA7D9CF, double 0xC02E38E8D626667E, double 0xBFCC9557BE257DA0, double 0x3FF1531CA9911BEF, double 0x3FEBCC7F3E54BBC5, double 0xBF862F6BFAF23E7C, double 0x3F5C3DD29CF41EB3 }, %struct.planet { double 0x402EC267A905572A, double 0xC039EB5833C8A220, double 0x3FC6F1F393ABE540, double 0x3FEF54B61659BC4A, double 0x3FE307C631C4FBA3, double 0xBFA1CB88587665F6, double 0x3F60A8F3531799AC }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%.9f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @advance(i32 noundef %0, ptr noundef %1, double noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store double %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %17

17:                                               ; preds = %142, %3
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %4, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %145

21:                                               ; preds = %17
  %22 = load ptr, ptr %5, align 8
  %23 = load i32, ptr %7, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.planet, ptr %22, i64 %24
  store ptr %25, ptr %9, align 8
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %8, align 4
  br label %28

28:                                               ; preds = %138, %21
  %29 = load i32, ptr %8, align 4
  %30 = load i32, ptr %4, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %141

32:                                               ; preds = %28
  %33 = load ptr, ptr %5, align 8
  %34 = load i32, ptr %8, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds %struct.planet, ptr %33, i64 %35
  store ptr %36, ptr %10, align 8
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr inbounds %struct.planet, ptr %37, i32 0, i32 0
  %39 = load double, ptr %38, align 8
  %40 = load ptr, ptr %10, align 8
  %41 = getelementptr inbounds %struct.planet, ptr %40, i32 0, i32 0
  %42 = load double, ptr %41, align 8
  %43 = fsub double %39, %42
  store double %43, ptr %11, align 8
  %44 = load ptr, ptr %9, align 8
  %45 = getelementptr inbounds %struct.planet, ptr %44, i32 0, i32 1
  %46 = load double, ptr %45, align 8
  %47 = load ptr, ptr %10, align 8
  %48 = getelementptr inbounds %struct.planet, ptr %47, i32 0, i32 1
  %49 = load double, ptr %48, align 8
  %50 = fsub double %46, %49
  store double %50, ptr %12, align 8
  %51 = load ptr, ptr %9, align 8
  %52 = getelementptr inbounds %struct.planet, ptr %51, i32 0, i32 2
  %53 = load double, ptr %52, align 8
  %54 = load ptr, ptr %10, align 8
  %55 = getelementptr inbounds %struct.planet, ptr %54, i32 0, i32 2
  %56 = load double, ptr %55, align 8
  %57 = fsub double %53, %56
  store double %57, ptr %13, align 8
  %58 = load double, ptr %11, align 8
  %59 = load double, ptr %11, align 8
  %60 = load double, ptr %12, align 8
  %61 = load double, ptr %12, align 8
  %62 = fmul double %60, %61
  %63 = call double @llvm.fmuladd.f64(double %58, double %59, double %62)
  %64 = load double, ptr %13, align 8
  %65 = load double, ptr %13, align 8
  %66 = call double @llvm.fmuladd.f64(double %64, double %65, double %63)
  %67 = call double @sqrt(double noundef %66) #4
  store double %67, ptr %14, align 8
  %68 = load double, ptr %6, align 8
  %69 = load double, ptr %14, align 8
  %70 = load double, ptr %14, align 8
  %71 = fmul double %69, %70
  %72 = load double, ptr %14, align 8
  %73 = fmul double %71, %72
  %74 = fdiv double %68, %73
  store double %74, ptr %15, align 8
  %75 = load double, ptr %11, align 8
  %76 = load ptr, ptr %10, align 8
  %77 = getelementptr inbounds %struct.planet, ptr %76, i32 0, i32 6
  %78 = load double, ptr %77, align 8
  %79 = fmul double %75, %78
  %80 = load double, ptr %15, align 8
  %81 = load ptr, ptr %9, align 8
  %82 = getelementptr inbounds %struct.planet, ptr %81, i32 0, i32 3
  %83 = load double, ptr %82, align 8
  %84 = fneg double %79
  %85 = call double @llvm.fmuladd.f64(double %84, double %80, double %83)
  store double %85, ptr %82, align 8
  %86 = load double, ptr %12, align 8
  %87 = load ptr, ptr %10, align 8
  %88 = getelementptr inbounds %struct.planet, ptr %87, i32 0, i32 6
  %89 = load double, ptr %88, align 8
  %90 = fmul double %86, %89
  %91 = load double, ptr %15, align 8
  %92 = load ptr, ptr %9, align 8
  %93 = getelementptr inbounds %struct.planet, ptr %92, i32 0, i32 4
  %94 = load double, ptr %93, align 8
  %95 = fneg double %90
  %96 = call double @llvm.fmuladd.f64(double %95, double %91, double %94)
  store double %96, ptr %93, align 8
  %97 = load double, ptr %13, align 8
  %98 = load ptr, ptr %10, align 8
  %99 = getelementptr inbounds %struct.planet, ptr %98, i32 0, i32 6
  %100 = load double, ptr %99, align 8
  %101 = fmul double %97, %100
  %102 = load double, ptr %15, align 8
  %103 = load ptr, ptr %9, align 8
  %104 = getelementptr inbounds %struct.planet, ptr %103, i32 0, i32 5
  %105 = load double, ptr %104, align 8
  %106 = fneg double %101
  %107 = call double @llvm.fmuladd.f64(double %106, double %102, double %105)
  store double %107, ptr %104, align 8
  %108 = load double, ptr %11, align 8
  %109 = load ptr, ptr %9, align 8
  %110 = getelementptr inbounds %struct.planet, ptr %109, i32 0, i32 6
  %111 = load double, ptr %110, align 8
  %112 = fmul double %108, %111
  %113 = load double, ptr %15, align 8
  %114 = load ptr, ptr %10, align 8
  %115 = getelementptr inbounds %struct.planet, ptr %114, i32 0, i32 3
  %116 = load double, ptr %115, align 8
  %117 = call double @llvm.fmuladd.f64(double %112, double %113, double %116)
  store double %117, ptr %115, align 8
  %118 = load double, ptr %12, align 8
  %119 = load ptr, ptr %9, align 8
  %120 = getelementptr inbounds %struct.planet, ptr %119, i32 0, i32 6
  %121 = load double, ptr %120, align 8
  %122 = fmul double %118, %121
  %123 = load double, ptr %15, align 8
  %124 = load ptr, ptr %10, align 8
  %125 = getelementptr inbounds %struct.planet, ptr %124, i32 0, i32 4
  %126 = load double, ptr %125, align 8
  %127 = call double @llvm.fmuladd.f64(double %122, double %123, double %126)
  store double %127, ptr %125, align 8
  %128 = load double, ptr %13, align 8
  %129 = load ptr, ptr %9, align 8
  %130 = getelementptr inbounds %struct.planet, ptr %129, i32 0, i32 6
  %131 = load double, ptr %130, align 8
  %132 = fmul double %128, %131
  %133 = load double, ptr %15, align 8
  %134 = load ptr, ptr %10, align 8
  %135 = getelementptr inbounds %struct.planet, ptr %134, i32 0, i32 5
  %136 = load double, ptr %135, align 8
  %137 = call double @llvm.fmuladd.f64(double %132, double %133, double %136)
  store double %137, ptr %135, align 8
  br label %138

138:                                              ; preds = %32
  %139 = load i32, ptr %8, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, ptr %8, align 4
  br label %28, !llvm.loop !6

141:                                              ; preds = %28
  br label %142

142:                                              ; preds = %141
  %143 = load i32, ptr %7, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, ptr %7, align 4
  br label %17, !llvm.loop !8

145:                                              ; preds = %17
  store i32 0, ptr %7, align 4
  br label %146

146:                                              ; preds = %179, %145
  %147 = load i32, ptr %7, align 4
  %148 = load i32, ptr %4, align 4
  %149 = icmp slt i32 %147, %148
  br i1 %149, label %150, label %182

150:                                              ; preds = %146
  %151 = load ptr, ptr %5, align 8
  %152 = load i32, ptr %7, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds %struct.planet, ptr %151, i64 %153
  store ptr %154, ptr %16, align 8
  %155 = load double, ptr %6, align 8
  %156 = load ptr, ptr %16, align 8
  %157 = getelementptr inbounds %struct.planet, ptr %156, i32 0, i32 3
  %158 = load double, ptr %157, align 8
  %159 = load ptr, ptr %16, align 8
  %160 = getelementptr inbounds %struct.planet, ptr %159, i32 0, i32 0
  %161 = load double, ptr %160, align 8
  %162 = call double @llvm.fmuladd.f64(double %155, double %158, double %161)
  store double %162, ptr %160, align 8
  %163 = load double, ptr %6, align 8
  %164 = load ptr, ptr %16, align 8
  %165 = getelementptr inbounds %struct.planet, ptr %164, i32 0, i32 4
  %166 = load double, ptr %165, align 8
  %167 = load ptr, ptr %16, align 8
  %168 = getelementptr inbounds %struct.planet, ptr %167, i32 0, i32 1
  %169 = load double, ptr %168, align 8
  %170 = call double @llvm.fmuladd.f64(double %163, double %166, double %169)
  store double %170, ptr %168, align 8
  %171 = load double, ptr %6, align 8
  %172 = load ptr, ptr %16, align 8
  %173 = getelementptr inbounds %struct.planet, ptr %172, i32 0, i32 5
  %174 = load double, ptr %173, align 8
  %175 = load ptr, ptr %16, align 8
  %176 = getelementptr inbounds %struct.planet, ptr %175, i32 0, i32 2
  %177 = load double, ptr %176, align 8
  %178 = call double @llvm.fmuladd.f64(double %171, double %174, double %177)
  store double %178, ptr %176, align 8
  br label %179

179:                                              ; preds = %150
  %180 = load i32, ptr %7, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, ptr %7, align 4
  br label %146, !llvm.loop !9

182:                                              ; preds = %146
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @energy(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store double 0.000000e+00, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %14

14:                                               ; preds = %107, %2
  %15 = load i32, ptr %6, align 4
  %16 = load i32, ptr %3, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %110

18:                                               ; preds = %14
  %19 = load ptr, ptr %4, align 8
  %20 = load i32, ptr %6, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct.planet, ptr %19, i64 %21
  store ptr %22, ptr %8, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds %struct.planet, ptr %23, i32 0, i32 6
  %25 = load double, ptr %24, align 8
  %26 = fmul double 5.000000e-01, %25
  %27 = load ptr, ptr %8, align 8
  %28 = getelementptr inbounds %struct.planet, ptr %27, i32 0, i32 3
  %29 = load double, ptr %28, align 8
  %30 = load ptr, ptr %8, align 8
  %31 = getelementptr inbounds %struct.planet, ptr %30, i32 0, i32 3
  %32 = load double, ptr %31, align 8
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds %struct.planet, ptr %33, i32 0, i32 4
  %35 = load double, ptr %34, align 8
  %36 = load ptr, ptr %8, align 8
  %37 = getelementptr inbounds %struct.planet, ptr %36, i32 0, i32 4
  %38 = load double, ptr %37, align 8
  %39 = fmul double %35, %38
  %40 = call double @llvm.fmuladd.f64(double %29, double %32, double %39)
  %41 = load ptr, ptr %8, align 8
  %42 = getelementptr inbounds %struct.planet, ptr %41, i32 0, i32 5
  %43 = load double, ptr %42, align 8
  %44 = load ptr, ptr %8, align 8
  %45 = getelementptr inbounds %struct.planet, ptr %44, i32 0, i32 5
  %46 = load double, ptr %45, align 8
  %47 = call double @llvm.fmuladd.f64(double %43, double %46, double %40)
  %48 = load double, ptr %5, align 8
  %49 = call double @llvm.fmuladd.f64(double %26, double %47, double %48)
  store double %49, ptr %5, align 8
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %7, align 4
  br label %52

52:                                               ; preds = %103, %18
  %53 = load i32, ptr %7, align 4
  %54 = load i32, ptr %3, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %106

56:                                               ; preds = %52
  %57 = load ptr, ptr %4, align 8
  %58 = load i32, ptr %7, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds %struct.planet, ptr %57, i64 %59
  store ptr %60, ptr %9, align 8
  %61 = load ptr, ptr %8, align 8
  %62 = getelementptr inbounds %struct.planet, ptr %61, i32 0, i32 0
  %63 = load double, ptr %62, align 8
  %64 = load ptr, ptr %9, align 8
  %65 = getelementptr inbounds %struct.planet, ptr %64, i32 0, i32 0
  %66 = load double, ptr %65, align 8
  %67 = fsub double %63, %66
  store double %67, ptr %10, align 8
  %68 = load ptr, ptr %8, align 8
  %69 = getelementptr inbounds %struct.planet, ptr %68, i32 0, i32 1
  %70 = load double, ptr %69, align 8
  %71 = load ptr, ptr %9, align 8
  %72 = getelementptr inbounds %struct.planet, ptr %71, i32 0, i32 1
  %73 = load double, ptr %72, align 8
  %74 = fsub double %70, %73
  store double %74, ptr %11, align 8
  %75 = load ptr, ptr %8, align 8
  %76 = getelementptr inbounds %struct.planet, ptr %75, i32 0, i32 2
  %77 = load double, ptr %76, align 8
  %78 = load ptr, ptr %9, align 8
  %79 = getelementptr inbounds %struct.planet, ptr %78, i32 0, i32 2
  %80 = load double, ptr %79, align 8
  %81 = fsub double %77, %80
  store double %81, ptr %12, align 8
  %82 = load double, ptr %10, align 8
  %83 = load double, ptr %10, align 8
  %84 = load double, ptr %11, align 8
  %85 = load double, ptr %11, align 8
  %86 = fmul double %84, %85
  %87 = call double @llvm.fmuladd.f64(double %82, double %83, double %86)
  %88 = load double, ptr %12, align 8
  %89 = load double, ptr %12, align 8
  %90 = call double @llvm.fmuladd.f64(double %88, double %89, double %87)
  %91 = call double @sqrt(double noundef %90) #4
  store double %91, ptr %13, align 8
  %92 = load ptr, ptr %8, align 8
  %93 = getelementptr inbounds %struct.planet, ptr %92, i32 0, i32 6
  %94 = load double, ptr %93, align 8
  %95 = load ptr, ptr %9, align 8
  %96 = getelementptr inbounds %struct.planet, ptr %95, i32 0, i32 6
  %97 = load double, ptr %96, align 8
  %98 = fmul double %94, %97
  %99 = load double, ptr %13, align 8
  %100 = fdiv double %98, %99
  %101 = load double, ptr %5, align 8
  %102 = fsub double %101, %100
  store double %102, ptr %5, align 8
  br label %103

103:                                              ; preds = %56
  %104 = load i32, ptr %7, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, ptr %7, align 4
  br label %52, !llvm.loop !10

106:                                              ; preds = %52
  br label %107

107:                                              ; preds = %106
  %108 = load i32, ptr %6, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %6, align 4
  br label %14, !llvm.loop !11

110:                                              ; preds = %14
  %111 = load double, ptr %5, align 8
  ret double %111
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @offset_momentum(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store double 0.000000e+00, ptr %5, align 8
  store double 0.000000e+00, ptr %6, align 8
  store double 0.000000e+00, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %9

9:                                                ; preds = %56, %2
  %10 = load i32, ptr %8, align 4
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %59

13:                                               ; preds = %9
  %14 = load ptr, ptr %4, align 8
  %15 = load i32, ptr %8, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.planet, ptr %14, i64 %16
  %18 = getelementptr inbounds %struct.planet, ptr %17, i32 0, i32 3
  %19 = load double, ptr %18, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = load i32, ptr %8, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.planet, ptr %20, i64 %22
  %24 = getelementptr inbounds %struct.planet, ptr %23, i32 0, i32 6
  %25 = load double, ptr %24, align 8
  %26 = load double, ptr %5, align 8
  %27 = call double @llvm.fmuladd.f64(double %19, double %25, double %26)
  store double %27, ptr %5, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = load i32, ptr %8, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.planet, ptr %28, i64 %30
  %32 = getelementptr inbounds %struct.planet, ptr %31, i32 0, i32 4
  %33 = load double, ptr %32, align 8
  %34 = load ptr, ptr %4, align 8
  %35 = load i32, ptr %8, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %struct.planet, ptr %34, i64 %36
  %38 = getelementptr inbounds %struct.planet, ptr %37, i32 0, i32 6
  %39 = load double, ptr %38, align 8
  %40 = load double, ptr %6, align 8
  %41 = call double @llvm.fmuladd.f64(double %33, double %39, double %40)
  store double %41, ptr %6, align 8
  %42 = load ptr, ptr %4, align 8
  %43 = load i32, ptr %8, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.planet, ptr %42, i64 %44
  %46 = getelementptr inbounds %struct.planet, ptr %45, i32 0, i32 5
  %47 = load double, ptr %46, align 8
  %48 = load ptr, ptr %4, align 8
  %49 = load i32, ptr %8, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds %struct.planet, ptr %48, i64 %50
  %52 = getelementptr inbounds %struct.planet, ptr %51, i32 0, i32 6
  %53 = load double, ptr %52, align 8
  %54 = load double, ptr %7, align 8
  %55 = call double @llvm.fmuladd.f64(double %47, double %53, double %54)
  store double %55, ptr %7, align 8
  br label %56

56:                                               ; preds = %13
  %57 = load i32, ptr %8, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %8, align 4
  br label %9, !llvm.loop !12

59:                                               ; preds = %9
  %60 = load double, ptr %5, align 8
  %61 = fneg double %60
  %62 = fdiv double %61, 0x4043BD3CC9BE45DE
  %63 = load ptr, ptr %4, align 8
  %64 = getelementptr inbounds %struct.planet, ptr %63, i64 0
  %65 = getelementptr inbounds %struct.planet, ptr %64, i32 0, i32 3
  store double %62, ptr %65, align 8
  %66 = load double, ptr %6, align 8
  %67 = fneg double %66
  %68 = fdiv double %67, 0x4043BD3CC9BE45DE
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds %struct.planet, ptr %69, i64 0
  %71 = getelementptr inbounds %struct.planet, ptr %70, i32 0, i32 4
  store double %68, ptr %71, align 8
  %72 = load double, ptr %7, align 8
  %73 = fneg double %72
  %74 = fdiv double %73, 0x4043BD3CC9BE45DE
  %75 = load ptr, ptr %4, align 8
  %76 = getelementptr inbounds %struct.planet, ptr %75, i64 0
  %77 = getelementptr inbounds %struct.planet, ptr %76, i32 0, i32 5
  store double %74, ptr %77, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 5000000, ptr %6, align 4
  call void @offset_momentum(i32 noundef 5, ptr noundef @bodies)
  %8 = call double @energy(i32 noundef 5, ptr noundef @bodies)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %8)
  store i32 1, ptr %7, align 4
  br label %10

10:                                               ; preds = %15, %2
  %11 = load i32, ptr %7, align 4
  %12 = load i32, ptr %6, align 4
  %13 = icmp sle i32 %11, %12
  br i1 %13, label %14, label %18

14:                                               ; preds = %10
  call void @advance(i32 noundef 5, ptr noundef @bodies, double noundef 1.000000e-02)
  br label %15

15:                                               ; preds = %14
  %16 = load i32, ptr %7, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %7, align 4
  br label %10, !llvm.loop !13

18:                                               ; preds = %10
  %19 = call double @energy(i32 noundef 5, ptr noundef @bodies)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %19)
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

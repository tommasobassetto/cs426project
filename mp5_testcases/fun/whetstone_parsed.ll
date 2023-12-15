; ModuleID = 'mp5_testcases/fun/whetstone_c.ll'
source_filename = "mp5_testcases/fun/whetstone.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [28 x i8] c"usage: whetdc [-c] [loops]\0A\00", align 1
@T = dso_local global double 0.000000e+00, align 8
@T1 = dso_local global double 0.000000e+00, align 8
@T2 = dso_local global double 0.000000e+00, align 8
@E1 = dso_local global [5 x double] zeroinitializer, align 16
@J = dso_local global i32 0, align 4
@K = dso_local global i32 0, align 4
@L = dso_local global i32 0, align 4
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [44 x i8] c"%7ld %7ld %7ld %12.4e %12.4e %12.4e %12.4e\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca double, align 8
  br label %4

4:                                                ; preds = %34, %2
  %.07 = phi i32 [ 1, %2 ], [ %35, %34 ]
  %.02 = phi i64 [ 100000, %2 ], [ %.13, %34 ]
  %.01 = phi i32 [ 0, %2 ], [ %.1, %34 ]
  %5 = icmp slt i32 %.07, %0
  br i1 %5, label %6, label %36

6:                                                ; preds = %4
  %7 = sext i32 %.07 to i64
  %8 = getelementptr inbounds ptr, ptr %1, i64 %7
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 @strncmp(ptr noundef %9, ptr noundef @.str, i64 noundef 2) #4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %34, label %12

12:                                               ; preds = %6
  %13 = sext i32 %.07 to i64
  %14 = getelementptr inbounds ptr, ptr %1, i64 %13
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds i8, ptr %15, i64 0
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp eq i32 %18, 99
  br i1 %19, label %34, label %20

20:                                               ; preds = %12
  %21 = sext i32 %.07 to i64
  %22 = getelementptr inbounds ptr, ptr %1, i64 %21
  %23 = load ptr, ptr %22, align 8
  %24 = call i64 @atol(ptr noundef %23) #4
  %25 = icmp sgt i64 %24, 0
  br i1 %25, label %26, label %31

26:                                               ; preds = %20
  %27 = sext i32 %.07 to i64
  %28 = getelementptr inbounds ptr, ptr %1, i64 %27
  %29 = load ptr, ptr %28, align 8
  %30 = call i64 @atol(ptr noundef %29) #4
  br label %34

31:                                               ; preds = %20
  %32 = load ptr, ptr @stderr, align 8
  %33 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %32, ptr noundef @.str.1)
  br label %346

34:                                               ; preds = %6, %12, %26
  %.13 = phi i64 [ %30, %26 ], [ %.02, %12 ], [ %.02, %6 ]
  %.1 = phi i32 [ %.01, %26 ], [ 1, %12 ], [ 1, %6 ]
  %35 = add nsw i32 %.07, 1
  br label %4, !llvm.loop !6

36:                                               ; preds = %342, %4
  %37 = call i64 @time(ptr noundef null) #5
  store double 4.999750e-01, ptr @T, align 8
  store double 5.002500e-01, ptr @T1, align 8
  store double 2.000000e+00, ptr @T2, align 8
  br label %38

38:                                               ; preds = %339, %36
  %.06 = phi i32 [ 1, %36 ], [ %340, %339 ]
  %39 = mul nsw i64 12, %.02
  %40 = mul nsw i64 14, %.02
  %41 = mul nsw i64 345, %.02
  %42 = mul nsw i64 210, %.02
  %43 = mul nsw i64 32, %.02
  %44 = mul nsw i64 899, %.02
  %45 = mul nsw i64 616, %.02
  %46 = mul nsw i64 93, %.02
  br label %47

47:                                               ; preds = %49, %38
  %.014 = phi double [ 1.000000e+00, %38 ], [ %54, %49 ]
  %.013 = phi double [ -1.000000e+00, %38 ], [ %59, %49 ]
  %.012 = phi double [ -1.000000e+00, %38 ], [ %64, %49 ]
  %.011 = phi double [ -1.000000e+00, %38 ], [ %70, %49 ]
  %.04 = phi i64 [ 1, %38 ], [ %71, %49 ]
  %48 = icmp sle i64 %.04, 0
  br i1 %48, label %49, label %72

49:                                               ; preds = %47
  %50 = fadd double %.014, %.013
  %51 = fadd double %50, %.012
  %52 = fsub double %51, %.011
  %53 = load double, ptr @T, align 8
  %54 = fmul double %52, %53
  %55 = fadd double %54, %.013
  %56 = fsub double %55, %.012
  %57 = fadd double %56, %.011
  %58 = load double, ptr @T, align 8
  %59 = fmul double %57, %58
  %60 = fsub double %54, %59
  %61 = fadd double %60, %.012
  %62 = fadd double %61, %.011
  %63 = load double, ptr @T, align 8
  %64 = fmul double %62, %63
  %65 = fneg double %54
  %66 = fadd double %65, %59
  %67 = fadd double %66, %64
  %68 = fadd double %67, %.011
  %69 = load double, ptr @T, align 8
  %70 = fmul double %68, %69
  %71 = add nsw i64 %.04, 1
  br label %47, !llvm.loop !8

72:                                               ; preds = %47
  %73 = icmp eq i32 %.06, 1
  br i1 %73, label %74, label %75

74:                                               ; preds = %72
  call void @POUT(i64 noundef 0, i64 noundef 0, i64 noundef 0, double noundef %.014, double noundef %.013, double noundef %.012, double noundef %.011)
  br label %75

75:                                               ; preds = %74, %72
  store double 1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  br label %76

76:                                               ; preds = %78, %75
  %.15 = phi i64 [ 1, %75 ], [ %116, %78 ]
  %77 = icmp sle i64 %.15, %39
  br i1 %77, label %78, label %117

78:                                               ; preds = %76
  %79 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %80 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %81 = fadd double %79, %80
  %82 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %83 = fadd double %81, %82
  %84 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %85 = fsub double %83, %84
  %86 = load double, ptr @T, align 8
  %87 = fmul double %85, %86
  store double %87, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %88 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %89 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %90 = fadd double %88, %89
  %91 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %92 = fsub double %90, %91
  %93 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %94 = fadd double %92, %93
  %95 = load double, ptr @T, align 8
  %96 = fmul double %94, %95
  store double %96, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %97 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %98 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %99 = fsub double %97, %98
  %100 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %101 = fadd double %99, %100
  %102 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %103 = fadd double %101, %102
  %104 = load double, ptr @T, align 8
  %105 = fmul double %103, %104
  store double %105, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %106 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %107 = fneg double %106
  %108 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %109 = fadd double %107, %108
  %110 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %111 = fadd double %109, %110
  %112 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %113 = fadd double %111, %112
  %114 = load double, ptr @T, align 8
  %115 = fmul double %113, %114
  store double %115, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %116 = add nsw i64 %.15, 1
  br label %76, !llvm.loop !9

117:                                              ; preds = %76
  %118 = icmp eq i32 %.06, 1
  br i1 %118, label %119, label %124

119:                                              ; preds = %117
  %120 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %121 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %122 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %123 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %39, i64 noundef %40, i64 noundef %39, double noundef %120, double noundef %121, double noundef %122, double noundef %123)
  br label %124

124:                                              ; preds = %119, %117
  br label %125

125:                                              ; preds = %127, %124
  %.2 = phi i64 [ 1, %124 ], [ %128, %127 ]
  %126 = icmp sle i64 %.2, %40
  br i1 %126, label %127, label %129

127:                                              ; preds = %125
  call void @PA(ptr noundef @E1)
  %128 = add nsw i64 %.2, 1
  br label %125, !llvm.loop !10

129:                                              ; preds = %125
  %130 = icmp eq i32 %.06, 1
  br i1 %130, label %131, label %136

131:                                              ; preds = %129
  %132 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %133 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %134 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %135 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %40, i64 noundef %39, i64 noundef %39, double noundef %132, double noundef %133, double noundef %134, double noundef %135)
  br label %136

136:                                              ; preds = %131, %129
  store i32 1, ptr @J, align 4
  br label %137

137:                                              ; preds = %154, %136
  %.3 = phi i64 [ 1, %136 ], [ %155, %154 ]
  %138 = icmp sle i64 %.3, %41
  br i1 %138, label %139, label %156

139:                                              ; preds = %137
  %140 = load i32, ptr @J, align 4
  %141 = icmp eq i32 %140, 1
  br i1 %141, label %142, label %143

142:                                              ; preds = %139
  store i32 2, ptr @J, align 4
  br label %144

143:                                              ; preds = %139
  store i32 3, ptr @J, align 4
  br label %144

144:                                              ; preds = %143, %142
  %145 = load i32, ptr @J, align 4
  %146 = icmp sgt i32 %145, 2
  br i1 %146, label %147, label %148

147:                                              ; preds = %144
  store i32 0, ptr @J, align 4
  br label %149

148:                                              ; preds = %144
  store i32 1, ptr @J, align 4
  br label %149

149:                                              ; preds = %148, %147
  %150 = load i32, ptr @J, align 4
  %151 = icmp slt i32 %150, 1
  br i1 %151, label %152, label %153

152:                                              ; preds = %149
  store i32 1, ptr @J, align 4
  br label %154

153:                                              ; preds = %149
  store i32 0, ptr @J, align 4
  br label %154

154:                                              ; preds = %152, %153
  %155 = add nsw i64 %.3, 1
  br label %137, !llvm.loop !11

156:                                              ; preds = %137
  %157 = icmp eq i32 %.06, 1
  br i1 %157, label %158, label %163

158:                                              ; preds = %156
  %159 = load i32, ptr @J, align 4
  %160 = sext i32 %159 to i64
  %161 = load i32, ptr @J, align 4
  %162 = sext i32 %161 to i64
  call void @POUT(i64 noundef %41, i64 noundef %160, i64 noundef %162, double noundef %.014, double noundef %.013, double noundef %.012, double noundef %.011)
  br label %163

163:                                              ; preds = %158, %156
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  br label %164

164:                                              ; preds = %166, %163
  %.4 = phi i64 [ 1, %163 ], [ %212, %166 ]
  %165 = icmp sle i64 %.4, %42
  br i1 %165, label %166, label %213

166:                                              ; preds = %164
  %167 = load i32, ptr @J, align 4
  %168 = load i32, ptr @K, align 4
  %169 = load i32, ptr @J, align 4
  %170 = sub nsw i32 %168, %169
  %171 = mul nsw i32 %167, %170
  %172 = load i32, ptr @L, align 4
  %173 = load i32, ptr @K, align 4
  %174 = sub nsw i32 %172, %173
  %175 = mul nsw i32 %171, %174
  store i32 %175, ptr @J, align 4
  %176 = load i32, ptr @L, align 4
  %177 = load i32, ptr @K, align 4
  %178 = mul nsw i32 %176, %177
  %179 = load i32, ptr @L, align 4
  %180 = load i32, ptr @J, align 4
  %181 = sub nsw i32 %179, %180
  %182 = load i32, ptr @K, align 4
  %183 = mul nsw i32 %181, %182
  %184 = sub nsw i32 %178, %183
  store i32 %184, ptr @K, align 4
  %185 = load i32, ptr @L, align 4
  %186 = load i32, ptr @K, align 4
  %187 = sub nsw i32 %185, %186
  %188 = load i32, ptr @K, align 4
  %189 = load i32, ptr @J, align 4
  %190 = add nsw i32 %188, %189
  %191 = mul nsw i32 %187, %190
  store i32 %191, ptr @L, align 4
  %192 = load i32, ptr @J, align 4
  %193 = load i32, ptr @K, align 4
  %194 = add nsw i32 %192, %193
  %195 = load i32, ptr @L, align 4
  %196 = add nsw i32 %194, %195
  %197 = sitofp i32 %196 to double
  %198 = load i32, ptr @L, align 4
  %199 = sub nsw i32 %198, 1
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %200
  store double %197, ptr %201, align 8
  %202 = load i32, ptr @J, align 4
  %203 = load i32, ptr @K, align 4
  %204 = mul nsw i32 %202, %203
  %205 = load i32, ptr @L, align 4
  %206 = mul nsw i32 %204, %205
  %207 = sitofp i32 %206 to double
  %208 = load i32, ptr @K, align 4
  %209 = sub nsw i32 %208, 1
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %210
  store double %207, ptr %211, align 8
  %212 = add nsw i64 %.4, 1
  br label %164, !llvm.loop !12

213:                                              ; preds = %164
  %214 = icmp eq i32 %.06, 1
  br i1 %214, label %215, label %224

215:                                              ; preds = %213
  %216 = load i32, ptr @J, align 4
  %217 = sext i32 %216 to i64
  %218 = load i32, ptr @K, align 4
  %219 = sext i32 %218 to i64
  %220 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %221 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %222 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %223 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %42, i64 noundef %217, i64 noundef %219, double noundef %220, double noundef %221, double noundef %222, double noundef %223)
  br label %224

224:                                              ; preds = %215, %213
  br label %225

225:                                              ; preds = %227, %224
  %.09 = phi double [ 5.000000e-01, %224 ], [ %242, %227 ]
  %.08 = phi double [ 5.000000e-01, %224 ], [ %257, %227 ]
  %.5 = phi i64 [ 1, %224 ], [ %258, %227 ]
  %226 = icmp sle i64 %.5, %43
  br i1 %226, label %227, label %259

227:                                              ; preds = %225
  %228 = load double, ptr @T, align 8
  %229 = load double, ptr @T2, align 8
  %230 = call double @sin(double noundef %.09) #5
  %231 = fmul double %229, %230
  %232 = call double @cos(double noundef %.09) #5
  %233 = fmul double %231, %232
  %234 = fadd double %.09, %.08
  %235 = call double @cos(double noundef %234) #5
  %236 = fsub double %.09, %.08
  %237 = call double @cos(double noundef %236) #5
  %238 = fadd double %235, %237
  %239 = fsub double %238, 1.000000e+00
  %240 = fdiv double %233, %239
  %241 = call double @atan(double noundef %240) #5
  %242 = fmul double %228, %241
  %243 = load double, ptr @T, align 8
  %244 = load double, ptr @T2, align 8
  %245 = call double @sin(double noundef %.08) #5
  %246 = fmul double %244, %245
  %247 = call double @cos(double noundef %.08) #5
  %248 = fmul double %246, %247
  %249 = fadd double %242, %.08
  %250 = call double @cos(double noundef %249) #5
  %251 = fsub double %242, %.08
  %252 = call double @cos(double noundef %251) #5
  %253 = fadd double %250, %252
  %254 = fsub double %253, 1.000000e+00
  %255 = fdiv double %248, %254
  %256 = call double @atan(double noundef %255) #5
  %257 = fmul double %243, %256
  %258 = add nsw i64 %.5, 1
  br label %225, !llvm.loop !13

259:                                              ; preds = %225
  %260 = icmp eq i32 %.06, 1
  br i1 %260, label %261, label %266

261:                                              ; preds = %259
  %262 = load i32, ptr @J, align 4
  %263 = sext i32 %262 to i64
  %264 = load i32, ptr @K, align 4
  %265 = sext i32 %264 to i64
  call void @POUT(i64 noundef %43, i64 noundef %263, i64 noundef %265, double noundef %.09, double noundef %.09, double noundef %.08, double noundef %.08)
  br label %266

266:                                              ; preds = %261, %259
  store double 1.000000e+00, ptr %3, align 8
  br label %267

267:                                              ; preds = %269, %266
  %.6 = phi i64 [ 1, %266 ], [ %270, %269 ]
  %268 = icmp sle i64 %.6, %44
  br i1 %268, label %269, label %271

269:                                              ; preds = %267
  call void @P3(double noundef 1.000000e+00, double noundef 1.000000e+00, ptr noundef %3)
  %270 = add nsw i64 %.6, 1
  br label %267, !llvm.loop !14

271:                                              ; preds = %267
  %272 = icmp eq i32 %.06, 1
  br i1 %272, label %273, label %280

273:                                              ; preds = %271
  %274 = load i32, ptr @J, align 4
  %275 = sext i32 %274 to i64
  %276 = load i32, ptr @K, align 4
  %277 = sext i32 %276 to i64
  %278 = load double, ptr %3, align 8
  %279 = load double, ptr %3, align 8
  call void @POUT(i64 noundef %44, i64 noundef %275, i64 noundef %277, double noundef 1.000000e+00, double noundef 1.000000e+00, double noundef %278, double noundef %279)
  br label %280

280:                                              ; preds = %273, %271
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  store double 1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  store double 2.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  store double 3.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  br label %281

281:                                              ; preds = %283, %280
  %.7 = phi i64 [ 1, %280 ], [ %284, %283 ]
  %282 = icmp sle i64 %.7, %45
  br i1 %282, label %283, label %285

283:                                              ; preds = %281
  call void @P0()
  %284 = add nsw i64 %.7, 1
  br label %281, !llvm.loop !15

285:                                              ; preds = %281
  %286 = icmp eq i32 %.06, 1
  br i1 %286, label %287, label %296

287:                                              ; preds = %285
  %288 = load i32, ptr @J, align 4
  %289 = sext i32 %288 to i64
  %290 = load i32, ptr @K, align 4
  %291 = sext i32 %290 to i64
  %292 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %293 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %294 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %295 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %45, i64 noundef %289, i64 noundef %291, double noundef %292, double noundef %293, double noundef %294, double noundef %295)
  br label %296

296:                                              ; preds = %287, %285
  store i32 2, ptr @J, align 4
  store i32 3, ptr @K, align 4
  br label %297

297:                                              ; preds = %299, %296
  %.8 = phi i64 [ 1, %296 ], [ %314, %299 ]
  %298 = icmp sle i64 %.8, 0
  br i1 %298, label %299, label %315

299:                                              ; preds = %297
  %300 = load i32, ptr @J, align 4
  %301 = load i32, ptr @K, align 4
  %302 = add nsw i32 %300, %301
  store i32 %302, ptr @J, align 4
  %303 = load i32, ptr @J, align 4
  %304 = load i32, ptr @K, align 4
  %305 = add nsw i32 %303, %304
  store i32 %305, ptr @K, align 4
  %306 = load i32, ptr @K, align 4
  %307 = load i32, ptr @J, align 4
  %308 = sub nsw i32 %306, %307
  store i32 %308, ptr @J, align 4
  %309 = load i32, ptr @K, align 4
  %310 = load i32, ptr @J, align 4
  %311 = sub nsw i32 %309, %310
  %312 = load i32, ptr @J, align 4
  %313 = sub nsw i32 %311, %312
  store i32 %313, ptr @K, align 4
  %314 = add nsw i64 %.8, 1
  br label %297, !llvm.loop !16

315:                                              ; preds = %297
  %316 = icmp eq i32 %.06, 1
  br i1 %316, label %317, label %322

317:                                              ; preds = %315
  %318 = load i32, ptr @J, align 4
  %319 = sext i32 %318 to i64
  %320 = load i32, ptr @K, align 4
  %321 = sext i32 %320 to i64
  call void @POUT(i64 noundef 0, i64 noundef %319, i64 noundef %321, double noundef %.014, double noundef %.013, double noundef %.012, double noundef %.011)
  br label %322

322:                                              ; preds = %317, %315
  br label %323

323:                                              ; preds = %325, %322
  %.110 = phi double [ 7.500000e-01, %322 ], [ %330, %325 ]
  %.9 = phi i64 [ 1, %322 ], [ %331, %325 ]
  %324 = icmp sle i64 %.9, %46
  br i1 %324, label %325, label %332

325:                                              ; preds = %323
  %326 = call double @log(double noundef %.110) #5
  %327 = load double, ptr @T1, align 8
  %328 = fdiv double %326, %327
  %329 = call double @exp(double noundef %328) #5
  %330 = call double @sqrt(double noundef %329) #5
  %331 = add nsw i64 %.9, 1
  br label %323, !llvm.loop !17

332:                                              ; preds = %323
  %333 = icmp eq i32 %.06, 1
  br i1 %333, label %334, label %339

334:                                              ; preds = %332
  %335 = load i32, ptr @J, align 4
  %336 = sext i32 %335 to i64
  %337 = load i32, ptr @K, align 4
  %338 = sext i32 %337 to i64
  call void @POUT(i64 noundef %46, i64 noundef %336, i64 noundef %338, double noundef %.110, double noundef %.110, double noundef %.110, double noundef %.110)
  br label %339

339:                                              ; preds = %334, %332
  %340 = add nsw i32 %.06, 1
  %341 = icmp sle i32 %340, 1
  br i1 %341, label %38, label %342

342:                                              ; preds = %339
  %343 = call i64 @time(ptr noundef null) #5
  %344 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %345 = icmp ne i32 %.01, 0
  br i1 %345, label %36, label %346

346:                                              ; preds = %342, %31
  %.0 = phi i32 [ 1, %31 ], [ 0, %342 ]
  ret i32 %.0
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: nounwind readonly willreturn
declare i64 @atol(ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @POUT(i64 noundef %0, i64 noundef %1, i64 noundef %2, double noundef %3, double noundef %4, double noundef %5, double noundef %6) #0 {
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i64 noundef %0, i64 noundef %1, i64 noundef %2, double noundef %3, double noundef %4, double noundef %5, double noundef %6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @PA(ptr noundef %0) #0 {
  store i32 0, ptr @J, align 4
  br label %2

2:                                                ; preds = %2, %1
  %3 = getelementptr inbounds double, ptr %0, i64 1
  %4 = load double, ptr %3, align 8
  %5 = getelementptr inbounds double, ptr %0, i64 2
  %6 = load double, ptr %5, align 8
  %7 = fadd double %4, %6
  %8 = getelementptr inbounds double, ptr %0, i64 3
  %9 = load double, ptr %8, align 8
  %10 = fadd double %7, %9
  %11 = getelementptr inbounds double, ptr %0, i64 4
  %12 = load double, ptr %11, align 8
  %13 = fsub double %10, %12
  %14 = load double, ptr @T, align 8
  %15 = fmul double %13, %14
  %16 = getelementptr inbounds double, ptr %0, i64 1
  store double %15, ptr %16, align 8
  %17 = getelementptr inbounds double, ptr %0, i64 1
  %18 = load double, ptr %17, align 8
  %19 = getelementptr inbounds double, ptr %0, i64 2
  %20 = load double, ptr %19, align 8
  %21 = fadd double %18, %20
  %22 = getelementptr inbounds double, ptr %0, i64 3
  %23 = load double, ptr %22, align 8
  %24 = fsub double %21, %23
  %25 = getelementptr inbounds double, ptr %0, i64 4
  %26 = load double, ptr %25, align 8
  %27 = fadd double %24, %26
  %28 = load double, ptr @T, align 8
  %29 = fmul double %27, %28
  %30 = getelementptr inbounds double, ptr %0, i64 2
  store double %29, ptr %30, align 8
  %31 = getelementptr inbounds double, ptr %0, i64 1
  %32 = load double, ptr %31, align 8
  %33 = getelementptr inbounds double, ptr %0, i64 2
  %34 = load double, ptr %33, align 8
  %35 = fsub double %32, %34
  %36 = getelementptr inbounds double, ptr %0, i64 3
  %37 = load double, ptr %36, align 8
  %38 = fadd double %35, %37
  %39 = getelementptr inbounds double, ptr %0, i64 4
  %40 = load double, ptr %39, align 8
  %41 = fadd double %38, %40
  %42 = load double, ptr @T, align 8
  %43 = fmul double %41, %42
  %44 = getelementptr inbounds double, ptr %0, i64 3
  store double %43, ptr %44, align 8
  %45 = getelementptr inbounds double, ptr %0, i64 1
  %46 = load double, ptr %45, align 8
  %47 = fneg double %46
  %48 = getelementptr inbounds double, ptr %0, i64 2
  %49 = load double, ptr %48, align 8
  %50 = fadd double %47, %49
  %51 = getelementptr inbounds double, ptr %0, i64 3
  %52 = load double, ptr %51, align 8
  %53 = fadd double %50, %52
  %54 = getelementptr inbounds double, ptr %0, i64 4
  %55 = load double, ptr %54, align 8
  %56 = fadd double %53, %55
  %57 = load double, ptr @T2, align 8
  %58 = fdiv double %56, %57
  %59 = getelementptr inbounds double, ptr %0, i64 4
  store double %58, ptr %59, align 8
  %60 = load i32, ptr @J, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr @J, align 4
  %62 = load i32, ptr @J, align 4
  %63 = icmp slt i32 %62, 6
  br i1 %63, label %2, label %64

64:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind
declare double @atan(double noundef) #3

; Function Attrs: nounwind
declare double @sin(double noundef) #3

; Function Attrs: nounwind
declare double @cos(double noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @P3(double noundef %0, double noundef %1, ptr noundef %2) #0 {
  %4 = load double, ptr @T, align 8
  %5 = fadd double %0, %1
  %6 = fmul double %4, %5
  %7 = load double, ptr @T, align 8
  %8 = fadd double %6, %1
  %9 = fmul double %7, %8
  %10 = fadd double %6, %9
  %11 = load double, ptr @T2, align 8
  %12 = fdiv double %10, %11
  store double %12, ptr %2, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @P0() #0 {
  %1 = load i32, ptr @K, align 4
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %2
  %4 = load double, ptr %3, align 8
  %5 = load i32, ptr @J, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %6
  store double %4, ptr %7, align 8
  %8 = load i32, ptr @L, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %9
  %11 = load double, ptr %10, align 8
  %12 = load i32, ptr @K, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %13
  store double %11, ptr %14, align 8
  %15 = load i32, ptr @J, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %16
  %18 = load double, ptr %17, align 8
  %19 = load i32, ptr @L, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %20
  store double %18, ptr %21, align 8
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #3

; Function Attrs: nounwind
declare double @exp(double noundef) #3

; Function Attrs: nounwind
declare double @log(double noundef) #3

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }
attributes #5 = { nounwind }

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

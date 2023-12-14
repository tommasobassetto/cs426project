; ModuleID = 'test/fun/whetstone.ll'
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
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca i64, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i64, align 8
  %28 = alloca i64, align 8
  %29 = alloca i64, align 8
  %30 = alloca float, align 4
  %31 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i64 100000, ptr %27, align 8
  store i32 0, ptr %31, align 4
  store i32 1, ptr %25, align 4
  br label %32

32:                                               ; preds = %74, %2
  %33 = load i32, ptr %25, align 4
  %34 = load i32, ptr %4, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %77

36:                                               ; preds = %32
  %37 = load ptr, ptr %5, align 8
  %38 = load i32, ptr %25, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds ptr, ptr %37, i64 %39
  %41 = load ptr, ptr %40, align 8
  %42 = call i32 @strncmp(ptr noundef %41, ptr noundef @.str, i64 noundef 2) #4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %54, label %44

44:                                               ; preds = %36
  %45 = load ptr, ptr %5, align 8
  %46 = load i32, ptr %25, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds ptr, ptr %45, i64 %47
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds i8, ptr %49, i64 0
  %51 = load i8, ptr %50, align 1
  %52 = sext i8 %51 to i32
  %53 = icmp eq i32 %52, 99
  br i1 %53, label %54, label %55

54:                                               ; preds = %44, %36
  store i32 1, ptr %31, align 4
  br label %74

55:                                               ; preds = %44
  %56 = load ptr, ptr %5, align 8
  %57 = load i32, ptr %25, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds ptr, ptr %56, i64 %58
  %60 = load ptr, ptr %59, align 8
  %61 = call i64 @atol(ptr noundef %60) #4
  %62 = icmp sgt i64 %61, 0
  br i1 %62, label %63, label %70

63:                                               ; preds = %55
  %64 = load ptr, ptr %5, align 8
  %65 = load i32, ptr %25, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds ptr, ptr %64, i64 %66
  %68 = load ptr, ptr %67, align 8
  %69 = call i64 @atol(ptr noundef %68) #4
  store i64 %69, ptr %27, align 8
  br label %73

70:                                               ; preds = %55
  %71 = load ptr, ptr @stderr, align 8
  %72 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %71, ptr noundef @.str.1)
  store i32 1, ptr %3, align 4
  br label %532

73:                                               ; preds = %63
  br label %74

74:                                               ; preds = %73, %54
  %75 = load i32, ptr %25, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %25, align 4
  br label %32, !llvm.loop !6

77:                                               ; preds = %32
  br label %78

78:                                               ; preds = %530, %77
  %79 = call i64 @time(ptr noundef null) #5
  store i64 %79, ptr %28, align 8
  store double 4.999750e-01, ptr @T, align 8
  store double 5.002500e-01, ptr @T1, align 8
  store double 2.000000e+00, ptr @T2, align 8
  %80 = load i64, ptr %27, align 8
  store i64 %80, ptr %24, align 8
  store i32 1, ptr %25, align 4
  store i32 1, ptr %26, align 4
  br label %81

81:                                               ; preds = %524, %78
  store i64 0, ptr %7, align 8
  %82 = load i64, ptr %24, align 8
  %83 = mul nsw i64 12, %82
  store i64 %83, ptr %8, align 8
  %84 = load i64, ptr %24, align 8
  %85 = mul nsw i64 14, %84
  store i64 %85, ptr %9, align 8
  %86 = load i64, ptr %24, align 8
  %87 = mul nsw i64 345, %86
  store i64 %87, ptr %10, align 8
  %88 = load i64, ptr %24, align 8
  %89 = mul nsw i64 210, %88
  store i64 %89, ptr %11, align 8
  %90 = load i64, ptr %24, align 8
  %91 = mul nsw i64 32, %90
  store i64 %91, ptr %12, align 8
  %92 = load i64, ptr %24, align 8
  %93 = mul nsw i64 899, %92
  store i64 %93, ptr %13, align 8
  %94 = load i64, ptr %24, align 8
  %95 = mul nsw i64 616, %94
  store i64 %95, ptr %14, align 8
  store i64 0, ptr %15, align 8
  %96 = load i64, ptr %24, align 8
  %97 = mul nsw i64 93, %96
  store i64 %97, ptr %16, align 8
  store double 1.000000e+00, ptr %17, align 8
  store double -1.000000e+00, ptr %18, align 8
  store double -1.000000e+00, ptr %19, align 8
  store double -1.000000e+00, ptr %20, align 8
  store i64 1, ptr %6, align 8
  br label %98

98:                                               ; preds = %140, %81
  %99 = load i64, ptr %6, align 8
  %100 = load i64, ptr %7, align 8
  %101 = icmp sle i64 %99, %100
  br i1 %101, label %102, label %143

102:                                              ; preds = %98
  %103 = load double, ptr %17, align 8
  %104 = load double, ptr %18, align 8
  %105 = fadd double %103, %104
  %106 = load double, ptr %19, align 8
  %107 = fadd double %105, %106
  %108 = load double, ptr %20, align 8
  %109 = fsub double %107, %108
  %110 = load double, ptr @T, align 8
  %111 = fmul double %109, %110
  store double %111, ptr %17, align 8
  %112 = load double, ptr %17, align 8
  %113 = load double, ptr %18, align 8
  %114 = fadd double %112, %113
  %115 = load double, ptr %19, align 8
  %116 = fsub double %114, %115
  %117 = load double, ptr %20, align 8
  %118 = fadd double %116, %117
  %119 = load double, ptr @T, align 8
  %120 = fmul double %118, %119
  store double %120, ptr %18, align 8
  %121 = load double, ptr %17, align 8
  %122 = load double, ptr %18, align 8
  %123 = fsub double %121, %122
  %124 = load double, ptr %19, align 8
  %125 = fadd double %123, %124
  %126 = load double, ptr %20, align 8
  %127 = fadd double %125, %126
  %128 = load double, ptr @T, align 8
  %129 = fmul double %127, %128
  store double %129, ptr %19, align 8
  %130 = load double, ptr %17, align 8
  %131 = fneg double %130
  %132 = load double, ptr %18, align 8
  %133 = fadd double %131, %132
  %134 = load double, ptr %19, align 8
  %135 = fadd double %133, %134
  %136 = load double, ptr %20, align 8
  %137 = fadd double %135, %136
  %138 = load double, ptr @T, align 8
  %139 = fmul double %137, %138
  store double %139, ptr %20, align 8
  br label %140

140:                                              ; preds = %102
  %141 = load i64, ptr %6, align 8
  %142 = add nsw i64 %141, 1
  store i64 %142, ptr %6, align 8
  br label %98, !llvm.loop !8

143:                                              ; preds = %98
  %144 = load i32, ptr %26, align 4
  %145 = load i32, ptr %25, align 4
  %146 = icmp eq i32 %144, %145
  br i1 %146, label %147, label %155

147:                                              ; preds = %143
  %148 = load i64, ptr %7, align 8
  %149 = load i64, ptr %7, align 8
  %150 = load i64, ptr %7, align 8
  %151 = load double, ptr %17, align 8
  %152 = load double, ptr %18, align 8
  %153 = load double, ptr %19, align 8
  %154 = load double, ptr %20, align 8
  call void @POUT(i64 noundef %148, i64 noundef %149, i64 noundef %150, double noundef %151, double noundef %152, double noundef %153, double noundef %154)
  br label %155

155:                                              ; preds = %147, %143
  store double 1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  store double -1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  store i64 1, ptr %6, align 8
  br label %156

156:                                              ; preds = %198, %155
  %157 = load i64, ptr %6, align 8
  %158 = load i64, ptr %8, align 8
  %159 = icmp sle i64 %157, %158
  br i1 %159, label %160, label %201

160:                                              ; preds = %156
  %161 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %162 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %163 = fadd double %161, %162
  %164 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %165 = fadd double %163, %164
  %166 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %167 = fsub double %165, %166
  %168 = load double, ptr @T, align 8
  %169 = fmul double %167, %168
  store double %169, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %170 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %171 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %172 = fadd double %170, %171
  %173 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %174 = fsub double %172, %173
  %175 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %176 = fadd double %174, %175
  %177 = load double, ptr @T, align 8
  %178 = fmul double %176, %177
  store double %178, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %179 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %180 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %181 = fsub double %179, %180
  %182 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %183 = fadd double %181, %182
  %184 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %185 = fadd double %183, %184
  %186 = load double, ptr @T, align 8
  %187 = fmul double %185, %186
  store double %187, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %188 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %189 = fneg double %188
  %190 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %191 = fadd double %189, %190
  %192 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %193 = fadd double %191, %192
  %194 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  %195 = fadd double %193, %194
  %196 = load double, ptr @T, align 8
  %197 = fmul double %195, %196
  store double %197, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  br label %198

198:                                              ; preds = %160
  %199 = load i64, ptr %6, align 8
  %200 = add nsw i64 %199, 1
  store i64 %200, ptr %6, align 8
  br label %156, !llvm.loop !9

201:                                              ; preds = %156
  %202 = load i32, ptr %26, align 4
  %203 = load i32, ptr %25, align 4
  %204 = icmp eq i32 %202, %203
  br i1 %204, label %205, label %213

205:                                              ; preds = %201
  %206 = load i64, ptr %8, align 8
  %207 = load i64, ptr %9, align 8
  %208 = load i64, ptr %8, align 8
  %209 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %210 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %211 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %212 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %206, i64 noundef %207, i64 noundef %208, double noundef %209, double noundef %210, double noundef %211, double noundef %212)
  br label %213

213:                                              ; preds = %205, %201
  store i64 1, ptr %6, align 8
  br label %214

214:                                              ; preds = %219, %213
  %215 = load i64, ptr %6, align 8
  %216 = load i64, ptr %9, align 8
  %217 = icmp sle i64 %215, %216
  br i1 %217, label %218, label %222

218:                                              ; preds = %214
  call void @PA(ptr noundef @E1)
  br label %219

219:                                              ; preds = %218
  %220 = load i64, ptr %6, align 8
  %221 = add nsw i64 %220, 1
  store i64 %221, ptr %6, align 8
  br label %214, !llvm.loop !10

222:                                              ; preds = %214
  %223 = load i32, ptr %26, align 4
  %224 = load i32, ptr %25, align 4
  %225 = icmp eq i32 %223, %224
  br i1 %225, label %226, label %234

226:                                              ; preds = %222
  %227 = load i64, ptr %9, align 8
  %228 = load i64, ptr %8, align 8
  %229 = load i64, ptr %8, align 8
  %230 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %231 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %232 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %233 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %227, i64 noundef %228, i64 noundef %229, double noundef %230, double noundef %231, double noundef %232, double noundef %233)
  br label %234

234:                                              ; preds = %226, %222
  store i32 1, ptr @J, align 4
  store i64 1, ptr %6, align 8
  br label %235

235:                                              ; preds = %255, %234
  %236 = load i64, ptr %6, align 8
  %237 = load i64, ptr %10, align 8
  %238 = icmp sle i64 %236, %237
  br i1 %238, label %239, label %258

239:                                              ; preds = %235
  %240 = load i32, ptr @J, align 4
  %241 = icmp eq i32 %240, 1
  br i1 %241, label %242, label %243

242:                                              ; preds = %239
  store i32 2, ptr @J, align 4
  br label %244

243:                                              ; preds = %239
  store i32 3, ptr @J, align 4
  br label %244

244:                                              ; preds = %243, %242
  %245 = load i32, ptr @J, align 4
  %246 = icmp sgt i32 %245, 2
  br i1 %246, label %247, label %248

247:                                              ; preds = %244
  store i32 0, ptr @J, align 4
  br label %249

248:                                              ; preds = %244
  store i32 1, ptr @J, align 4
  br label %249

249:                                              ; preds = %248, %247
  %250 = load i32, ptr @J, align 4
  %251 = icmp slt i32 %250, 1
  br i1 %251, label %252, label %253

252:                                              ; preds = %249
  store i32 1, ptr @J, align 4
  br label %254

253:                                              ; preds = %249
  store i32 0, ptr @J, align 4
  br label %254

254:                                              ; preds = %253, %252
  br label %255

255:                                              ; preds = %254
  %256 = load i64, ptr %6, align 8
  %257 = add nsw i64 %256, 1
  store i64 %257, ptr %6, align 8
  br label %235, !llvm.loop !11

258:                                              ; preds = %235
  %259 = load i32, ptr %26, align 4
  %260 = load i32, ptr %25, align 4
  %261 = icmp eq i32 %259, %260
  br i1 %261, label %262, label %272

262:                                              ; preds = %258
  %263 = load i64, ptr %10, align 8
  %264 = load i32, ptr @J, align 4
  %265 = sext i32 %264 to i64
  %266 = load i32, ptr @J, align 4
  %267 = sext i32 %266 to i64
  %268 = load double, ptr %17, align 8
  %269 = load double, ptr %18, align 8
  %270 = load double, ptr %19, align 8
  %271 = load double, ptr %20, align 8
  call void @POUT(i64 noundef %263, i64 noundef %265, i64 noundef %267, double noundef %268, double noundef %269, double noundef %270, double noundef %271)
  br label %272

272:                                              ; preds = %262, %258
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  store i64 1, ptr %6, align 8
  br label %273

273:                                              ; preds = %323, %272
  %274 = load i64, ptr %6, align 8
  %275 = load i64, ptr %11, align 8
  %276 = icmp sle i64 %274, %275
  br i1 %276, label %277, label %326

277:                                              ; preds = %273
  %278 = load i32, ptr @J, align 4
  %279 = load i32, ptr @K, align 4
  %280 = load i32, ptr @J, align 4
  %281 = sub nsw i32 %279, %280
  %282 = mul nsw i32 %278, %281
  %283 = load i32, ptr @L, align 4
  %284 = load i32, ptr @K, align 4
  %285 = sub nsw i32 %283, %284
  %286 = mul nsw i32 %282, %285
  store i32 %286, ptr @J, align 4
  %287 = load i32, ptr @L, align 4
  %288 = load i32, ptr @K, align 4
  %289 = mul nsw i32 %287, %288
  %290 = load i32, ptr @L, align 4
  %291 = load i32, ptr @J, align 4
  %292 = sub nsw i32 %290, %291
  %293 = load i32, ptr @K, align 4
  %294 = mul nsw i32 %292, %293
  %295 = sub nsw i32 %289, %294
  store i32 %295, ptr @K, align 4
  %296 = load i32, ptr @L, align 4
  %297 = load i32, ptr @K, align 4
  %298 = sub nsw i32 %296, %297
  %299 = load i32, ptr @K, align 4
  %300 = load i32, ptr @J, align 4
  %301 = add nsw i32 %299, %300
  %302 = mul nsw i32 %298, %301
  store i32 %302, ptr @L, align 4
  %303 = load i32, ptr @J, align 4
  %304 = load i32, ptr @K, align 4
  %305 = add nsw i32 %303, %304
  %306 = load i32, ptr @L, align 4
  %307 = add nsw i32 %305, %306
  %308 = sitofp i32 %307 to double
  %309 = load i32, ptr @L, align 4
  %310 = sub nsw i32 %309, 1
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %311
  store double %308, ptr %312, align 8
  %313 = load i32, ptr @J, align 4
  %314 = load i32, ptr @K, align 4
  %315 = mul nsw i32 %313, %314
  %316 = load i32, ptr @L, align 4
  %317 = mul nsw i32 %315, %316
  %318 = sitofp i32 %317 to double
  %319 = load i32, ptr @K, align 4
  %320 = sub nsw i32 %319, 1
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds [5 x double], ptr @E1, i64 0, i64 %321
  store double %318, ptr %322, align 8
  br label %323

323:                                              ; preds = %277
  %324 = load i64, ptr %6, align 8
  %325 = add nsw i64 %324, 1
  store i64 %325, ptr %6, align 8
  br label %273, !llvm.loop !12

326:                                              ; preds = %273
  %327 = load i32, ptr %26, align 4
  %328 = load i32, ptr %25, align 4
  %329 = icmp eq i32 %327, %328
  br i1 %329, label %330, label %340

330:                                              ; preds = %326
  %331 = load i64, ptr %11, align 8
  %332 = load i32, ptr @J, align 4
  %333 = sext i32 %332 to i64
  %334 = load i32, ptr @K, align 4
  %335 = sext i32 %334 to i64
  %336 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %337 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %338 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %339 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %331, i64 noundef %333, i64 noundef %335, double noundef %336, double noundef %337, double noundef %338, double noundef %339)
  br label %340

340:                                              ; preds = %330, %326
  store double 5.000000e-01, ptr %21, align 8
  store double 5.000000e-01, ptr %22, align 8
  store i64 1, ptr %6, align 8
  br label %341

341:                                              ; preds = %388, %340
  %342 = load i64, ptr %6, align 8
  %343 = load i64, ptr %12, align 8
  %344 = icmp sle i64 %342, %343
  br i1 %344, label %345, label %391

345:                                              ; preds = %341
  %346 = load double, ptr @T, align 8
  %347 = load double, ptr @T2, align 8
  %348 = load double, ptr %21, align 8
  %349 = call double @sin(double noundef %348) #5
  %350 = fmul double %347, %349
  %351 = load double, ptr %21, align 8
  %352 = call double @cos(double noundef %351) #5
  %353 = fmul double %350, %352
  %354 = load double, ptr %21, align 8
  %355 = load double, ptr %22, align 8
  %356 = fadd double %354, %355
  %357 = call double @cos(double noundef %356) #5
  %358 = load double, ptr %21, align 8
  %359 = load double, ptr %22, align 8
  %360 = fsub double %358, %359
  %361 = call double @cos(double noundef %360) #5
  %362 = fadd double %357, %361
  %363 = fsub double %362, 1.000000e+00
  %364 = fdiv double %353, %363
  %365 = call double @atan(double noundef %364) #5
  %366 = fmul double %346, %365
  store double %366, ptr %21, align 8
  %367 = load double, ptr @T, align 8
  %368 = load double, ptr @T2, align 8
  %369 = load double, ptr %22, align 8
  %370 = call double @sin(double noundef %369) #5
  %371 = fmul double %368, %370
  %372 = load double, ptr %22, align 8
  %373 = call double @cos(double noundef %372) #5
  %374 = fmul double %371, %373
  %375 = load double, ptr %21, align 8
  %376 = load double, ptr %22, align 8
  %377 = fadd double %375, %376
  %378 = call double @cos(double noundef %377) #5
  %379 = load double, ptr %21, align 8
  %380 = load double, ptr %22, align 8
  %381 = fsub double %379, %380
  %382 = call double @cos(double noundef %381) #5
  %383 = fadd double %378, %382
  %384 = fsub double %383, 1.000000e+00
  %385 = fdiv double %374, %384
  %386 = call double @atan(double noundef %385) #5
  %387 = fmul double %367, %386
  store double %387, ptr %22, align 8
  br label %388

388:                                              ; preds = %345
  %389 = load i64, ptr %6, align 8
  %390 = add nsw i64 %389, 1
  store i64 %390, ptr %6, align 8
  br label %341, !llvm.loop !13

391:                                              ; preds = %341
  %392 = load i32, ptr %26, align 4
  %393 = load i32, ptr %25, align 4
  %394 = icmp eq i32 %392, %393
  br i1 %394, label %395, label %405

395:                                              ; preds = %391
  %396 = load i64, ptr %12, align 8
  %397 = load i32, ptr @J, align 4
  %398 = sext i32 %397 to i64
  %399 = load i32, ptr @K, align 4
  %400 = sext i32 %399 to i64
  %401 = load double, ptr %21, align 8
  %402 = load double, ptr %21, align 8
  %403 = load double, ptr %22, align 8
  %404 = load double, ptr %22, align 8
  call void @POUT(i64 noundef %396, i64 noundef %398, i64 noundef %400, double noundef %401, double noundef %402, double noundef %403, double noundef %404)
  br label %405

405:                                              ; preds = %395, %391
  store double 1.000000e+00, ptr %21, align 8
  store double 1.000000e+00, ptr %22, align 8
  store double 1.000000e+00, ptr %23, align 8
  store i64 1, ptr %6, align 8
  br label %406

406:                                              ; preds = %413, %405
  %407 = load i64, ptr %6, align 8
  %408 = load i64, ptr %13, align 8
  %409 = icmp sle i64 %407, %408
  br i1 %409, label %410, label %416

410:                                              ; preds = %406
  %411 = load double, ptr %21, align 8
  %412 = load double, ptr %22, align 8
  call void @P3(double noundef %411, double noundef %412, ptr noundef %23)
  br label %413

413:                                              ; preds = %410
  %414 = load i64, ptr %6, align 8
  %415 = add nsw i64 %414, 1
  store i64 %415, ptr %6, align 8
  br label %406, !llvm.loop !14

416:                                              ; preds = %406
  %417 = load i32, ptr %26, align 4
  %418 = load i32, ptr %25, align 4
  %419 = icmp eq i32 %417, %418
  br i1 %419, label %420, label %430

420:                                              ; preds = %416
  %421 = load i64, ptr %13, align 8
  %422 = load i32, ptr @J, align 4
  %423 = sext i32 %422 to i64
  %424 = load i32, ptr @K, align 4
  %425 = sext i32 %424 to i64
  %426 = load double, ptr %21, align 8
  %427 = load double, ptr %22, align 8
  %428 = load double, ptr %23, align 8
  %429 = load double, ptr %23, align 8
  call void @POUT(i64 noundef %421, i64 noundef %423, i64 noundef %425, double noundef %426, double noundef %427, double noundef %428, double noundef %429)
  br label %430

430:                                              ; preds = %420, %416
  store i32 1, ptr @J, align 4
  store i32 2, ptr @K, align 4
  store i32 3, ptr @L, align 4
  store double 1.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  store double 2.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  store double 3.000000e+00, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  store i64 1, ptr %6, align 8
  br label %431

431:                                              ; preds = %436, %430
  %432 = load i64, ptr %6, align 8
  %433 = load i64, ptr %14, align 8
  %434 = icmp sle i64 %432, %433
  br i1 %434, label %435, label %439

435:                                              ; preds = %431
  call void @P0()
  br label %436

436:                                              ; preds = %435
  %437 = load i64, ptr %6, align 8
  %438 = add nsw i64 %437, 1
  store i64 %438, ptr %6, align 8
  br label %431, !llvm.loop !15

439:                                              ; preds = %431
  %440 = load i32, ptr %26, align 4
  %441 = load i32, ptr %25, align 4
  %442 = icmp eq i32 %440, %441
  br i1 %442, label %443, label %453

443:                                              ; preds = %439
  %444 = load i64, ptr %14, align 8
  %445 = load i32, ptr @J, align 4
  %446 = sext i32 %445 to i64
  %447 = load i32, ptr @K, align 4
  %448 = sext i32 %447 to i64
  %449 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 1), align 8
  %450 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 2), align 16
  %451 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 3), align 8
  %452 = load double, ptr getelementptr inbounds ([5 x double], ptr @E1, i64 0, i64 4), align 16
  call void @POUT(i64 noundef %444, i64 noundef %446, i64 noundef %448, double noundef %449, double noundef %450, double noundef %451, double noundef %452)
  br label %453

453:                                              ; preds = %443, %439
  store i32 2, ptr @J, align 4
  store i32 3, ptr @K, align 4
  store i64 1, ptr %6, align 8
  br label %454

454:                                              ; preds = %473, %453
  %455 = load i64, ptr %6, align 8
  %456 = load i64, ptr %15, align 8
  %457 = icmp sle i64 %455, %456
  br i1 %457, label %458, label %476

458:                                              ; preds = %454
  %459 = load i32, ptr @J, align 4
  %460 = load i32, ptr @K, align 4
  %461 = add nsw i32 %459, %460
  store i32 %461, ptr @J, align 4
  %462 = load i32, ptr @J, align 4
  %463 = load i32, ptr @K, align 4
  %464 = add nsw i32 %462, %463
  store i32 %464, ptr @K, align 4
  %465 = load i32, ptr @K, align 4
  %466 = load i32, ptr @J, align 4
  %467 = sub nsw i32 %465, %466
  store i32 %467, ptr @J, align 4
  %468 = load i32, ptr @K, align 4
  %469 = load i32, ptr @J, align 4
  %470 = sub nsw i32 %468, %469
  %471 = load i32, ptr @J, align 4
  %472 = sub nsw i32 %470, %471
  store i32 %472, ptr @K, align 4
  br label %473

473:                                              ; preds = %458
  %474 = load i64, ptr %6, align 8
  %475 = add nsw i64 %474, 1
  store i64 %475, ptr %6, align 8
  br label %454, !llvm.loop !16

476:                                              ; preds = %454
  %477 = load i32, ptr %26, align 4
  %478 = load i32, ptr %25, align 4
  %479 = icmp eq i32 %477, %478
  br i1 %479, label %480, label %490

480:                                              ; preds = %476
  %481 = load i64, ptr %15, align 8
  %482 = load i32, ptr @J, align 4
  %483 = sext i32 %482 to i64
  %484 = load i32, ptr @K, align 4
  %485 = sext i32 %484 to i64
  %486 = load double, ptr %17, align 8
  %487 = load double, ptr %18, align 8
  %488 = load double, ptr %19, align 8
  %489 = load double, ptr %20, align 8
  call void @POUT(i64 noundef %481, i64 noundef %483, i64 noundef %485, double noundef %486, double noundef %487, double noundef %488, double noundef %489)
  br label %490

490:                                              ; preds = %480, %476
  store double 7.500000e-01, ptr %21, align 8
  store i64 1, ptr %6, align 8
  br label %491

491:                                              ; preds = %502, %490
  %492 = load i64, ptr %6, align 8
  %493 = load i64, ptr %16, align 8
  %494 = icmp sle i64 %492, %493
  br i1 %494, label %495, label %505

495:                                              ; preds = %491
  %496 = load double, ptr %21, align 8
  %497 = call double @log(double noundef %496) #5
  %498 = load double, ptr @T1, align 8
  %499 = fdiv double %497, %498
  %500 = call double @exp(double noundef %499) #5
  %501 = call double @sqrt(double noundef %500) #5
  store double %501, ptr %21, align 8
  br label %502

502:                                              ; preds = %495
  %503 = load i64, ptr %6, align 8
  %504 = add nsw i64 %503, 1
  store i64 %504, ptr %6, align 8
  br label %491, !llvm.loop !17

505:                                              ; preds = %491
  %506 = load i32, ptr %26, align 4
  %507 = load i32, ptr %25, align 4
  %508 = icmp eq i32 %506, %507
  br i1 %508, label %509, label %519

509:                                              ; preds = %505
  %510 = load i64, ptr %16, align 8
  %511 = load i32, ptr @J, align 4
  %512 = sext i32 %511 to i64
  %513 = load i32, ptr @K, align 4
  %514 = sext i32 %513 to i64
  %515 = load double, ptr %21, align 8
  %516 = load double, ptr %21, align 8
  %517 = load double, ptr %21, align 8
  %518 = load double, ptr %21, align 8
  call void @POUT(i64 noundef %510, i64 noundef %512, i64 noundef %514, double noundef %515, double noundef %516, double noundef %517, double noundef %518)
  br label %519

519:                                              ; preds = %509, %505
  %520 = load i32, ptr %26, align 4
  %521 = add nsw i32 %520, 1
  store i32 %521, ptr %26, align 4
  %522 = load i32, ptr %25, align 4
  %523 = icmp sle i32 %521, %522
  br i1 %523, label %524, label %525

524:                                              ; preds = %519
  br label %81

525:                                              ; preds = %519
  %526 = call i64 @time(ptr noundef null) #5
  store i64 %526, ptr %29, align 8
  %527 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %528 = load i32, ptr %31, align 4
  %529 = icmp ne i32 %528, 0
  br i1 %529, label %530, label %531

530:                                              ; preds = %525
  br label %78

531:                                              ; preds = %525
  store i32 0, ptr %3, align 4
  br label %532

532:                                              ; preds = %531, %70
  %533 = load i32, ptr %3, align 4
  ret i32 %533
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
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  store i64 %0, ptr %8, align 8
  store i64 %1, ptr %9, align 8
  store i64 %2, ptr %10, align 8
  store double %3, ptr %11, align 8
  store double %4, ptr %12, align 8
  store double %5, ptr %13, align 8
  store double %6, ptr %14, align 8
  %15 = load i64, ptr %8, align 8
  %16 = load i64, ptr %9, align 8
  %17 = load i64, ptr %10, align 8
  %18 = load double, ptr %11, align 8
  %19 = load double, ptr %12, align 8
  %20 = load double, ptr %13, align 8
  %21 = load double, ptr %14, align 8
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i64 noundef %15, i64 noundef %16, i64 noundef %17, double noundef %18, double noundef %19, double noundef %20, double noundef %21)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @PA(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr @J, align 4
  br label %3

3:                                                ; preds = %85, %1
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds double, ptr %4, i64 1
  %6 = load double, ptr %5, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds double, ptr %7, i64 2
  %9 = load double, ptr %8, align 8
  %10 = fadd double %6, %9
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds double, ptr %11, i64 3
  %13 = load double, ptr %12, align 8
  %14 = fadd double %10, %13
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds double, ptr %15, i64 4
  %17 = load double, ptr %16, align 8
  %18 = fsub double %14, %17
  %19 = load double, ptr @T, align 8
  %20 = fmul double %18, %19
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds double, ptr %21, i64 1
  store double %20, ptr %22, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds double, ptr %23, i64 1
  %25 = load double, ptr %24, align 8
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds double, ptr %26, i64 2
  %28 = load double, ptr %27, align 8
  %29 = fadd double %25, %28
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds double, ptr %30, i64 3
  %32 = load double, ptr %31, align 8
  %33 = fsub double %29, %32
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds double, ptr %34, i64 4
  %36 = load double, ptr %35, align 8
  %37 = fadd double %33, %36
  %38 = load double, ptr @T, align 8
  %39 = fmul double %37, %38
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds double, ptr %40, i64 2
  store double %39, ptr %41, align 8
  %42 = load ptr, ptr %2, align 8
  %43 = getelementptr inbounds double, ptr %42, i64 1
  %44 = load double, ptr %43, align 8
  %45 = load ptr, ptr %2, align 8
  %46 = getelementptr inbounds double, ptr %45, i64 2
  %47 = load double, ptr %46, align 8
  %48 = fsub double %44, %47
  %49 = load ptr, ptr %2, align 8
  %50 = getelementptr inbounds double, ptr %49, i64 3
  %51 = load double, ptr %50, align 8
  %52 = fadd double %48, %51
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds double, ptr %53, i64 4
  %55 = load double, ptr %54, align 8
  %56 = fadd double %52, %55
  %57 = load double, ptr @T, align 8
  %58 = fmul double %56, %57
  %59 = load ptr, ptr %2, align 8
  %60 = getelementptr inbounds double, ptr %59, i64 3
  store double %58, ptr %60, align 8
  %61 = load ptr, ptr %2, align 8
  %62 = getelementptr inbounds double, ptr %61, i64 1
  %63 = load double, ptr %62, align 8
  %64 = fneg double %63
  %65 = load ptr, ptr %2, align 8
  %66 = getelementptr inbounds double, ptr %65, i64 2
  %67 = load double, ptr %66, align 8
  %68 = fadd double %64, %67
  %69 = load ptr, ptr %2, align 8
  %70 = getelementptr inbounds double, ptr %69, i64 3
  %71 = load double, ptr %70, align 8
  %72 = fadd double %68, %71
  %73 = load ptr, ptr %2, align 8
  %74 = getelementptr inbounds double, ptr %73, i64 4
  %75 = load double, ptr %74, align 8
  %76 = fadd double %72, %75
  %77 = load double, ptr @T2, align 8
  %78 = fdiv double %76, %77
  %79 = load ptr, ptr %2, align 8
  %80 = getelementptr inbounds double, ptr %79, i64 4
  store double %78, ptr %80, align 8
  %81 = load i32, ptr @J, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr @J, align 4
  %83 = load i32, ptr @J, align 4
  %84 = icmp slt i32 %83, 6
  br i1 %84, label %85, label %86

85:                                               ; preds = %3
  br label %3

86:                                               ; preds = %3
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
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca ptr, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  store double %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load double, ptr %4, align 8
  store double %9, ptr %7, align 8
  %10 = load double, ptr %5, align 8
  store double %10, ptr %8, align 8
  %11 = load double, ptr @T, align 8
  %12 = load double, ptr %7, align 8
  %13 = load double, ptr %8, align 8
  %14 = fadd double %12, %13
  %15 = fmul double %11, %14
  store double %15, ptr %7, align 8
  %16 = load double, ptr @T, align 8
  %17 = load double, ptr %7, align 8
  %18 = load double, ptr %8, align 8
  %19 = fadd double %17, %18
  %20 = fmul double %16, %19
  store double %20, ptr %8, align 8
  %21 = load double, ptr %7, align 8
  %22 = load double, ptr %8, align 8
  %23 = fadd double %21, %22
  %24 = load double, ptr @T2, align 8
  %25 = fdiv double %23, %24
  %26 = load ptr, ptr %6, align 8
  store double %25, ptr %26, align 8
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

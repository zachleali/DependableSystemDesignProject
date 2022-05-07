; ModuleID = 'HJM_Swaption_Blocking.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: uwtable
define i32 @_Z21HJM_Swaption_BlockingPddddddiidS_PS_llii(double* %pdSwaptionPrice, double %dStrike, double %dCompounding, double %dMaturity, double %dTenor, double %dPaymentInterval, i32 %iN, i32 %iFactors, double %dYears, double* %pdYield, double** %ppdFactors, i64 %iRndSeed, i64 %lTrials, i32 %BLOCKSIZE, i32 %tid) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double*, align 8
  %12 = alloca double**, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %iSuccess = alloca i32, align 4
  %i = alloca i32, align 4
  %b = alloca i32, align 4
  %l = alloca i64, align 8
  %ddelt = alloca double, align 8
  %iFreqRatio = alloca i32, align 4
  %dStrikeCont = alloca double, align 8
  %iSwapVectorLength = alloca i32, align 4
  %ppdHJMPath = alloca double**, align 8
  %pdForward = alloca double*, align 8
  %ppdDrifts = alloca double**, align 8
  %pdTotalDrift = alloca double*, align 8
  %pdDiscountingRatePath = alloca double*, align 8
  %pdPayoffDiscountFactors = alloca double*, align 8
  %pdSwapRatePath = alloca double*, align 8
  %pdSwapDiscountFactors = alloca double*, align 8
  %pdSwapPayoffs = alloca double*, align 8
  %iSwapStartTimeIndex = alloca i32, align 4
  %iSwapTimePoints = alloca i32, align 4
  %dSwapVectorYears = alloca double, align 8
  %dSwaptionPayoff = alloca double, align 8
  %dDiscSwaptionPayoff = alloca double, align 8
  %dFixedLegValue = alloca double, align 8
  %dSumSimSwaptionPrice = alloca double, align 8
  %dSumSquareSimSwaptionPrice = alloca double, align 8
  %dSimSwaptionMeanPrice = alloca double, align 8
  %dSimSwaptionStdError = alloca double, align 8
  store double* %pdSwaptionPrice, double** %2, align 8
  store double %dStrike, double* %3, align 8
  store double %dCompounding, double* %4, align 8
  store double %dMaturity, double* %5, align 8
  store double %dTenor, double* %6, align 8
  store double %dPaymentInterval, double* %7, align 8
  store i32 %iN, i32* %8, align 4
  store i32 %iFactors, i32* %9, align 4
  store double %dYears, double* %10, align 8
  store double* %pdYield, double** %11, align 8
  store double** %ppdFactors, double*** %12, align 8
  store i64 %iRndSeed, i64* %13, align 8
  store i64 %lTrials, i64* %14, align 8
  store i32 %BLOCKSIZE, i32* %15, align 4
  store i32 %tid, i32* %16, align 4
  store i32 0, i32* %iSuccess, align 4
  %17 = load double* %10, align 8
  %18 = load i32* %8, align 4
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %17, %19
  store double %20, double* %ddelt, align 8
  %21 = load double* %7, align 8
  %22 = load double* %ddelt, align 8
  %23 = fdiv double %21, %22
  %24 = fadd double %23, 5.000000e-01
  %25 = fptosi double %24 to i32
  store i32 %25, i32* %iFreqRatio, align 4
  %26 = load double* %4, align 8
  %27 = fcmp oeq double %26, 0.000000e+00
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %0
  %29 = load double* %3, align 8
  store double %29, double* %dStrikeCont, align 8
  br label %39

; <label>:30                                      ; preds = %0
  %31 = load double* %4, align 8
  %32 = fdiv double 1.000000e+00, %31
  %33 = load double* %3, align 8
  %34 = load double* %4, align 8
  %35 = fmul double %33, %34
  %36 = fadd double 1.000000e+00, %35
  %37 = call double @log(double %36) #3
  %38 = fmul double %32, %37
  store double %38, double* %dStrikeCont, align 8
  br label %39

; <label>:39                                      ; preds = %30, %28
  %40 = load i32* %8, align 4
  %41 = sub nsw i32 %40, 1
  %42 = sext i32 %41 to i64
  %43 = load i32* %8, align 4
  %44 = load i32* %15, align 4
  %45 = mul nsw i32 %43, %44
  %46 = sub nsw i32 %45, 1
  %47 = sext i32 %46 to i64
  %48 = call double** @_Z7dmatrixllll(i64 0, i64 %42, i64 0, i64 %47)
  store double** %48, double*** %ppdHJMPath, align 8
  %49 = load i32* %8, align 4
  %50 = sub nsw i32 %49, 1
  %51 = sext i32 %50 to i64
  %52 = call double* @_Z7dvectorll(i64 0, i64 %51)
  store double* %52, double** %pdForward, align 8
  %53 = load i32* %9, align 4
  %54 = sub nsw i32 %53, 1
  %55 = sext i32 %54 to i64
  %56 = load i32* %8, align 4
  %57 = sub nsw i32 %56, 2
  %58 = sext i32 %57 to i64
  %59 = call double** @_Z7dmatrixllll(i64 0, i64 %55, i64 0, i64 %58)
  store double** %59, double*** %ppdDrifts, align 8
  %60 = load i32* %8, align 4
  %61 = sub nsw i32 %60, 2
  %62 = sext i32 %61 to i64
  %63 = call double* @_Z7dvectorll(i64 0, i64 %62)
  store double* %63, double** %pdTotalDrift, align 8
  %64 = load i32* %8, align 4
  %65 = load i32* %15, align 4
  %66 = mul nsw i32 %64, %65
  %67 = sub nsw i32 %66, 1
  %68 = sext i32 %67 to i64
  %69 = call double* @_Z7dvectorll(i64 0, i64 %68)
  store double* %69, double** %pdPayoffDiscountFactors, align 8
  %70 = load i32* %8, align 4
  %71 = load i32* %15, align 4
  %72 = mul nsw i32 %70, %71
  %73 = sub nsw i32 %72, 1
  %74 = sext i32 %73 to i64
  %75 = call double* @_Z7dvectorll(i64 0, i64 %74)
  store double* %75, double** %pdDiscountingRatePath, align 8
  %76 = load i32* %8, align 4
  %77 = sitofp i32 %76 to double
  %78 = load double* %5, align 8
  %79 = load double* %ddelt, align 8
  %80 = fdiv double %78, %79
  %81 = fsub double %77, %80
  %82 = fadd double %81, 5.000000e-01
  %83 = fptosi double %82 to i32
  store i32 %83, i32* %iSwapVectorLength, align 4
  %84 = load i32* %iSwapVectorLength, align 4
  %85 = load i32* %15, align 4
  %86 = mul nsw i32 %84, %85
  %87 = sub nsw i32 %86, 1
  %88 = sext i32 %87 to i64
  %89 = call double* @_Z7dvectorll(i64 0, i64 %88)
  store double* %89, double** %pdSwapRatePath, align 8
  %90 = load i32* %iSwapVectorLength, align 4
  %91 = load i32* %15, align 4
  %92 = mul nsw i32 %90, %91
  %93 = sub nsw i32 %92, 1
  %94 = sext i32 %93 to i64
  %95 = call double* @_Z7dvectorll(i64 0, i64 %94)
  store double* %95, double** %pdSwapDiscountFactors, align 8
  %96 = load i32* %iSwapVectorLength, align 4
  %97 = sub nsw i32 %96, 1
  %98 = sext i32 %97 to i64
  %99 = call double* @_Z7dvectorll(i64 0, i64 %98)
  store double* %99, double** %pdSwapPayoffs, align 8
  %100 = load double* %5, align 8
  %101 = load double* %ddelt, align 8
  %102 = fdiv double %100, %101
  %103 = fadd double %102, 5.000000e-01
  %104 = fptosi double %103 to i32
  store i32 %104, i32* %iSwapStartTimeIndex, align 4
  %105 = load double* %6, align 8
  %106 = load double* %ddelt, align 8
  %107 = fdiv double %105, %106
  %108 = fadd double %107, 5.000000e-01
  %109 = fptosi double %108 to i32
  store i32 %109, i32* %iSwapTimePoints, align 4
  %110 = load i32* %iSwapVectorLength, align 4
  %111 = sitofp i32 %110 to double
  %112 = load double* %ddelt, align 8
  %113 = fmul double %111, %112
  store double %113, double* %dSwapVectorYears, align 8
  store i32 0, i32* %i, align 4
  br label %114

; <label>:114                                     ; preds = %124, %39
  %115 = load i32* %i, align 4
  %116 = load i32* %iSwapVectorLength, align 4
  %117 = sub nsw i32 %116, 1
  %118 = icmp sle i32 %115, %117
  br i1 %118, label %119, label %127

; <label>:119                                     ; preds = %114
  %120 = load i32* %i, align 4
  %121 = sext i32 %120 to i64
  %122 = load double** %pdSwapPayoffs, align 8
  %123 = getelementptr inbounds double* %122, i64 %121
  store double 0.000000e+00, double* %123, align 8
  br label %124

; <label>:124                                     ; preds = %119
  %125 = load i32* %i, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %i, align 4
  br label %114

; <label>:127                                     ; preds = %114
  %128 = load i32* %iFreqRatio, align 4
  store i32 %128, i32* %i, align 4
  br label %129

; <label>:129                                     ; preds = %161, %127
  %130 = load i32* %i, align 4
  %131 = load i32* %iSwapTimePoints, align 4
  %132 = icmp sle i32 %130, %131
  br i1 %132, label %133, label %165

; <label>:133                                     ; preds = %129
  %134 = load i32* %i, align 4
  %135 = load i32* %iSwapTimePoints, align 4
  %136 = icmp ne i32 %134, %135
  br i1 %136, label %137, label %147

; <label>:137                                     ; preds = %133
  %138 = load double* %dStrikeCont, align 8
  %139 = load double* %7, align 8
  %140 = fmul double %138, %139
  %141 = call double @exp(double %140) #3
  %142 = fsub double %141, 1.000000e+00
  %143 = load i32* %i, align 4
  %144 = sext i32 %143 to i64
  %145 = load double** %pdSwapPayoffs, align 8
  %146 = getelementptr inbounds double* %145, i64 %144
  store double %142, double* %146, align 8
  br label %147

; <label>:147                                     ; preds = %137, %133
  %148 = load i32* %i, align 4
  %149 = load i32* %iSwapTimePoints, align 4
  %150 = icmp eq i32 %148, %149
  br i1 %150, label %151, label %160

; <label>:151                                     ; preds = %147
  %152 = load double* %dStrikeCont, align 8
  %153 = load double* %7, align 8
  %154 = fmul double %152, %153
  %155 = call double @exp(double %154) #3
  %156 = load i32* %i, align 4
  %157 = sext i32 %156 to i64
  %158 = load double** %pdSwapPayoffs, align 8
  %159 = getelementptr inbounds double* %158, i64 %157
  store double %155, double* %159, align 8
  br label %160

; <label>:160                                     ; preds = %151, %147
  br label %161

; <label>:161                                     ; preds = %160
  %162 = load i32* %iFreqRatio, align 4
  %163 = load i32* %i, align 4
  %164 = add nsw i32 %163, %162
  store i32 %164, i32* %i, align 4
  br label %129

; <label>:165                                     ; preds = %129
  %166 = load double** %pdForward, align 8
  %167 = load i32* %8, align 4
  %168 = load double** %11, align 8
  %169 = call i32 @_Z20HJM_Yield_to_ForwardPdiS_(double* %166, i32 %167, double* %168)
  store i32 %169, i32* %iSuccess, align 4
  %170 = load i32* %iSuccess, align 4
  %171 = icmp ne i32 %170, 1
  br i1 %171, label %172, label %174

; <label>:172                                     ; preds = %165
  %173 = load i32* %iSuccess, align 4
  store i32 %173, i32* %1
  br label %399

; <label>:174                                     ; preds = %165
  %175 = load double** %pdTotalDrift, align 8
  %176 = load double*** %ppdDrifts, align 8
  %177 = load i32* %8, align 4
  %178 = load i32* %9, align 4
  %179 = load double* %10, align 8
  %180 = load double*** %12, align 8
  %181 = call i32 @_Z10HJM_DriftsPdPS_iidS0_(double* %175, double** %176, i32 %177, i32 %178, double %179, double** %180)
  store i32 %181, i32* %iSuccess, align 4
  %182 = load i32* %iSuccess, align 4
  %183 = icmp ne i32 %182, 1
  br i1 %183, label %184, label %186

; <label>:184                                     ; preds = %174
  %185 = load i32* %iSuccess, align 4
  store i32 %185, i32* %1
  br label %399

; <label>:186                                     ; preds = %174
  store double 0.000000e+00, double* %dSumSimSwaptionPrice, align 8
  store double 0.000000e+00, double* %dSumSquareSimSwaptionPrice, align 8
  store i64 0, i64* %l, align 8
  br label %187

; <label>:187                                     ; preds = %365, %186
  %188 = load i64* %l, align 8
  %189 = load i64* %14, align 8
  %190 = sub nsw i64 %189, 1
  %191 = icmp sle i64 %188, %190
  br i1 %191, label %192, label %370

; <label>:192                                     ; preds = %187
  %193 = load double*** %ppdHJMPath, align 8
  %194 = load i32* %8, align 4
  %195 = load i32* %9, align 4
  %196 = load double* %10, align 8
  %197 = load double** %pdForward, align 8
  %198 = load double** %pdTotalDrift, align 8
  %199 = load double*** %12, align 8
  %200 = load i32* %15, align 4
  %201 = call i32 @_Z28HJM_SimPath_Forward_BlockingPPdiidS_S_S0_Pli(double** %193, i32 %194, i32 %195, double %196, double* %197, double* %198, double** %199, i64* %13, i32 %200)
  store i32 %201, i32* %iSuccess, align 4
  %202 = load i32* %iSuccess, align 4
  %203 = icmp ne i32 %202, 1
  br i1 %203, label %204, label %206

; <label>:204                                     ; preds = %192
  %205 = load i32* %iSuccess, align 4
  store i32 %205, i32* %1
  br label %399

; <label>:206                                     ; preds = %192
  store i32 0, i32* %i, align 4
  br label %207

; <label>:207                                     ; preds = %241, %206
  %208 = load i32* %i, align 4
  %209 = load i32* %8, align 4
  %210 = sub nsw i32 %209, 1
  %211 = icmp sle i32 %208, %210
  br i1 %211, label %212, label %244

; <label>:212                                     ; preds = %207
  store i32 0, i32* %b, align 4
  br label %213

; <label>:213                                     ; preds = %237, %212
  %214 = load i32* %b, align 4
  %215 = load i32* %15, align 4
  %216 = sub nsw i32 %215, 1
  %217 = icmp sle i32 %214, %216
  br i1 %217, label %218, label %240

; <label>:218                                     ; preds = %213
  %219 = load i32* %b, align 4
  %220 = add nsw i32 0, %219
  %221 = sext i32 %220 to i64
  %222 = load i32* %i, align 4
  %223 = sext i32 %222 to i64
  %224 = load double*** %ppdHJMPath, align 8
  %225 = getelementptr inbounds double** %224, i64 %223
  %226 = load double** %225, align 8
  %227 = getelementptr inbounds double* %226, i64 %221
  %228 = load double* %227, align 8
  %229 = load i32* %15, align 4
  %230 = load i32* %i, align 4
  %231 = mul nsw i32 %229, %230
  %232 = load i32* %b, align 4
  %233 = add nsw i32 %231, %232
  %234 = sext i32 %233 to i64
  %235 = load double** %pdDiscountingRatePath, align 8
  %236 = getelementptr inbounds double* %235, i64 %234
  store double %228, double* %236, align 8
  br label %237

; <label>:237                                     ; preds = %218
  %238 = load i32* %b, align 4
  %239 = add nsw i32 %238, 1
  store i32 %239, i32* %b, align 4
  br label %213

; <label>:240                                     ; preds = %213
  br label %241

; <label>:241                                     ; preds = %240
  %242 = load i32* %i, align 4
  %243 = add nsw i32 %242, 1
  store i32 %243, i32* %i, align 4
  br label %207

; <label>:244                                     ; preds = %207
  %245 = load double** %pdPayoffDiscountFactors, align 8
  %246 = load i32* %8, align 4
  %247 = load double* %10, align 8
  %248 = load double** %pdDiscountingRatePath, align 8
  %249 = load i32* %15, align 4
  %250 = call i32 @_Z25Discount_Factors_BlockingPdidS_i(double* %245, i32 %246, double %247, double* %248, i32 %249)
  store i32 %250, i32* %iSuccess, align 4
  %251 = load i32* %iSuccess, align 4
  %252 = icmp ne i32 %251, 1
  br i1 %252, label %253, label %255

; <label>:253                                     ; preds = %244
  %254 = load i32* %iSuccess, align 4
  store i32 %254, i32* %1
  br label %399

; <label>:255                                     ; preds = %244
  store i32 0, i32* %i, align 4
  br label %256

; <label>:256                                     ; preds = %292, %255
  %257 = load i32* %i, align 4
  %258 = load i32* %iSwapVectorLength, align 4
  %259 = sub nsw i32 %258, 1
  %260 = icmp sle i32 %257, %259
  br i1 %260, label %261, label %295

; <label>:261                                     ; preds = %256
  store i32 0, i32* %b, align 4
  br label %262

; <label>:262                                     ; preds = %288, %261
  %263 = load i32* %b, align 4
  %264 = load i32* %15, align 4
  %265 = icmp slt i32 %263, %264
  br i1 %265, label %266, label %291

; <label>:266                                     ; preds = %262
  %267 = load i32* %i, align 4
  %268 = load i32* %15, align 4
  %269 = mul nsw i32 %267, %268
  %270 = load i32* %b, align 4
  %271 = add nsw i32 %269, %270
  %272 = sext i32 %271 to i64
  %273 = load i32* %iSwapStartTimeIndex, align 4
  %274 = sext i32 %273 to i64
  %275 = load double*** %ppdHJMPath, align 8
  %276 = getelementptr inbounds double** %275, i64 %274
  %277 = load double** %276, align 8
  %278 = getelementptr inbounds double* %277, i64 %272
  %279 = load double* %278, align 8
  %280 = load i32* %i, align 4
  %281 = load i32* %15, align 4
  %282 = mul nsw i32 %280, %281
  %283 = load i32* %b, align 4
  %284 = add nsw i32 %282, %283
  %285 = sext i32 %284 to i64
  %286 = load double** %pdSwapRatePath, align 8
  %287 = getelementptr inbounds double* %286, i64 %285
  store double %279, double* %287, align 8
  br label %288

; <label>:288                                     ; preds = %266
  %289 = load i32* %b, align 4
  %290 = add nsw i32 %289, 1
  store i32 %290, i32* %b, align 4
  br label %262

; <label>:291                                     ; preds = %262
  br label %292

; <label>:292                                     ; preds = %291
  %293 = load i32* %i, align 4
  %294 = add nsw i32 %293, 1
  store i32 %294, i32* %i, align 4
  br label %256

; <label>:295                                     ; preds = %256
  %296 = load double** %pdSwapDiscountFactors, align 8
  %297 = load i32* %iSwapVectorLength, align 4
  %298 = load double* %dSwapVectorYears, align 8
  %299 = load double** %pdSwapRatePath, align 8
  %300 = load i32* %15, align 4
  %301 = call i32 @_Z25Discount_Factors_BlockingPdidS_i(double* %296, i32 %297, double %298, double* %299, i32 %300)
  store i32 %301, i32* %iSuccess, align 4
  %302 = load i32* %iSuccess, align 4
  %303 = icmp ne i32 %302, 1
  br i1 %303, label %304, label %306

; <label>:304                                     ; preds = %295
  %305 = load i32* %iSuccess, align 4
  store i32 %305, i32* %1
  br label %399

; <label>:306                                     ; preds = %295
  store i32 0, i32* %b, align 4
  br label %307

; <label>:307                                     ; preds = %361, %306
  %308 = load i32* %b, align 4
  %309 = load i32* %15, align 4
  %310 = icmp slt i32 %308, %309
  br i1 %310, label %311, label %364

; <label>:311                                     ; preds = %307
  store double 0.000000e+00, double* %dFixedLegValue, align 8
  store i32 0, i32* %i, align 4
  br label %312

; <label>:312                                     ; preds = %335, %311
  %313 = load i32* %i, align 4
  %314 = load i32* %iSwapVectorLength, align 4
  %315 = sub nsw i32 %314, 1
  %316 = icmp sle i32 %313, %315
  br i1 %316, label %317, label %338

; <label>:317                                     ; preds = %312
  %318 = load i32* %i, align 4
  %319 = sext i32 %318 to i64
  %320 = load double** %pdSwapPayoffs, align 8
  %321 = getelementptr inbounds double* %320, i64 %319
  %322 = load double* %321, align 8
  %323 = load i32* %i, align 4
  %324 = load i32* %15, align 4
  %325 = mul nsw i32 %323, %324
  %326 = load i32* %b, align 4
  %327 = add nsw i32 %325, %326
  %328 = sext i32 %327 to i64
  %329 = load double** %pdSwapDiscountFactors, align 8
  %330 = getelementptr inbounds double* %329, i64 %328
  %331 = load double* %330, align 8
  %332 = fmul double %322, %331
  %333 = load double* %dFixedLegValue, align 8
  %334 = fadd double %333, %332
  store double %334, double* %dFixedLegValue, align 8
  br label %335

; <label>:335                                     ; preds = %317
  %336 = load i32* %i, align 4
  %337 = add nsw i32 %336, 1
  store i32 %337, i32* %i, align 4
  br label %312

; <label>:338                                     ; preds = %312
  %339 = load double* %dFixedLegValue, align 8
  %340 = fsub double %339, 1.000000e+00
  %341 = call double @_Z4dMaxdd(double %340, double 0.000000e+00)
  store double %341, double* %dSwaptionPayoff, align 8
  %342 = load double* %dSwaptionPayoff, align 8
  %343 = load i32* %iSwapStartTimeIndex, align 4
  %344 = load i32* %15, align 4
  %345 = mul nsw i32 %343, %344
  %346 = load i32* %b, align 4
  %347 = add nsw i32 %345, %346
  %348 = sext i32 %347 to i64
  %349 = load double** %pdPayoffDiscountFactors, align 8
  %350 = getelementptr inbounds double* %349, i64 %348
  %351 = load double* %350, align 8
  %352 = fmul double %342, %351
  store double %352, double* %dDiscSwaptionPayoff, align 8
  %353 = load double* %dDiscSwaptionPayoff, align 8
  %354 = load double* %dSumSimSwaptionPrice, align 8
  %355 = fadd double %354, %353
  store double %355, double* %dSumSimSwaptionPrice, align 8
  %356 = load double* %dDiscSwaptionPayoff, align 8
  %357 = load double* %dDiscSwaptionPayoff, align 8
  %358 = fmul double %356, %357
  %359 = load double* %dSumSquareSimSwaptionPrice, align 8
  %360 = fadd double %359, %358
  store double %360, double* %dSumSquareSimSwaptionPrice, align 8
  br label %361

; <label>:361                                     ; preds = %338
  %362 = load i32* %b, align 4
  %363 = add nsw i32 %362, 1
  store i32 %363, i32* %b, align 4
  br label %307

; <label>:364                                     ; preds = %307
  br label %365

; <label>:365                                     ; preds = %364
  %366 = load i32* %15, align 4
  %367 = sext i32 %366 to i64
  %368 = load i64* %l, align 8
  %369 = add nsw i64 %368, %367
  store i64 %369, i64* %l, align 8
  br label %187

; <label>:370                                     ; preds = %187
  %371 = load double* %dSumSimSwaptionPrice, align 8
  %372 = load i64* %14, align 8
  %373 = sitofp i64 %372 to double
  %374 = fdiv double %371, %373
  store double %374, double* %dSimSwaptionMeanPrice, align 8
  %375 = load double* %dSumSquareSimSwaptionPrice, align 8
  %376 = load double* %dSumSimSwaptionPrice, align 8
  %377 = load double* %dSumSimSwaptionPrice, align 8
  %378 = fmul double %376, %377
  %379 = load i64* %14, align 8
  %380 = sitofp i64 %379 to double
  %381 = fdiv double %378, %380
  %382 = fsub double %375, %381
  %383 = load i64* %14, align 8
  %384 = sitofp i64 %383 to double
  %385 = fsub double %384, 1.000000e+00
  %386 = fdiv double %382, %385
  %387 = call double @sqrt(double %386) #3
  %388 = load i64* %14, align 8
  %389 = sitofp i64 %388 to double
  %390 = call double @sqrt(double %389) #3
  %391 = fdiv double %387, %390
  store double %391, double* %dSimSwaptionStdError, align 8
  %392 = load double* %dSimSwaptionMeanPrice, align 8
  %393 = load double** %2, align 8
  %394 = getelementptr inbounds double* %393, i64 0
  store double %392, double* %394, align 8
  %395 = load double* %dSimSwaptionStdError, align 8
  %396 = load double** %2, align 8
  %397 = getelementptr inbounds double* %396, i64 1
  store double %395, double* %397, align 8
  store i32 1, i32* %iSuccess, align 4
  %398 = load i32* %iSuccess, align 4
  store i32 %398, i32* %1
  br label %399

; <label>:399                                     ; preds = %370, %304, %253, %204, %184, %172
  %400 = load i32* %1
  ret i32 %400
}

; Function Attrs: nounwind
declare double @log(double) #1

declare double** @_Z7dmatrixllll(i64, i64, i64, i64) #2

declare double* @_Z7dvectorll(i64, i64) #2

; Function Attrs: nounwind
declare double @exp(double) #1

declare i32 @_Z20HJM_Yield_to_ForwardPdiS_(double*, i32, double*) #2

declare i32 @_Z10HJM_DriftsPdPS_iidS0_(double*, double**, i32, i32, double, double**) #2

declare i32 @_Z28HJM_SimPath_Forward_BlockingPPdiidS_S_S0_Pli(double**, i32, i32, double, double*, double*, double**, i64*, i32) #2

declare i32 @_Z25Discount_Factors_BlockingPdidS_i(double*, i32, double, double*, i32) #2

declare double @_Z4dMaxdd(double, double) #2

; Function Attrs: nounwind
declare double @sqrt(double) #1

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}

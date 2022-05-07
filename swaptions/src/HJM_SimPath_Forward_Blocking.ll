; ModuleID = 'HJM_SimPath_Forward_Blocking.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: uwtable
define void @_Z7serialBPPdS0_iii(double** %pdZ, double** %randZ, i32 %BLOCKSIZE, i32 %iN, i32 %iFactors) #0 {
  %1 = alloca double**, align 8
  %2 = alloca double**, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %l = alloca i32, align 4
  %b = alloca i32, align 4
  %j = alloca i32, align 4
  store double** %pdZ, double*** %1, align 8
  store double** %randZ, double*** %2, align 8
  store i32 %BLOCKSIZE, i32* %3, align 4
  store i32 %iN, i32* %4, align 4
  store i32 %iFactors, i32* %5, align 4
  store i32 0, i32* %l, align 4
  br label %6

; <label>:6                                       ; preds = %57, %0
  %7 = load i32* %l, align 4
  %8 = load i32* %5, align 4
  %9 = sub nsw i32 %8, 1
  %10 = icmp sle i32 %7, %9
  br i1 %10, label %11, label %60

; <label>:11                                      ; preds = %6
  store i32 0, i32* %b, align 4
  br label %12

; <label>:12                                      ; preds = %53, %11
  %13 = load i32* %b, align 4
  %14 = load i32* %3, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %56

; <label>:16                                      ; preds = %12
  store i32 1, i32* %j, align 4
  br label %17

; <label>:17                                      ; preds = %49, %16
  %18 = load i32* %j, align 4
  %19 = load i32* %4, align 4
  %20 = sub nsw i32 %19, 1
  %21 = icmp sle i32 %18, %20
  br i1 %21, label %22, label %52

; <label>:22                                      ; preds = %17
  %23 = load i32* %3, align 4
  %24 = load i32* %j, align 4
  %25 = mul nsw i32 %23, %24
  %26 = load i32* %b, align 4
  %27 = add nsw i32 %25, %26
  %28 = sext i32 %27 to i64
  %29 = load i32* %l, align 4
  %30 = sext i32 %29 to i64
  %31 = load double*** %2, align 8
  %32 = getelementptr inbounds double** %31, i64 %30
  %33 = load double** %32, align 8
  %34 = getelementptr inbounds double* %33, i64 %28
  %35 = load double* %34, align 8
  %36 = call double @_Z12CumNormalInvd(double %35)
  %37 = load i32* %3, align 4
  %38 = load i32* %j, align 4
  %39 = mul nsw i32 %37, %38
  %40 = load i32* %b, align 4
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = load i32* %l, align 4
  %44 = sext i32 %43 to i64
  %45 = load double*** %1, align 8
  %46 = getelementptr inbounds double** %45, i64 %44
  %47 = load double** %46, align 8
  %48 = getelementptr inbounds double* %47, i64 %42
  store double %36, double* %48, align 8
  br label %49

; <label>:49                                      ; preds = %22
  %50 = load i32* %j, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %j, align 4
  br label %17

; <label>:52                                      ; preds = %17
  br label %53

; <label>:53                                      ; preds = %52
  %54 = load i32* %b, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %b, align 4
  br label %12

; <label>:56                                      ; preds = %12
  br label %57

; <label>:57                                      ; preds = %56
  %58 = load i32* %l, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %l, align 4
  br label %6

; <label>:60                                      ; preds = %6
  ret void
}

declare double @_Z12CumNormalInvd(double) #1

; Function Attrs: uwtable
define i32 @_Z28HJM_SimPath_Forward_BlockingPPdiidS_S_S0_Pli(double** %ppdHJMPath, i32 %iN, i32 %iFactors, double %dYears, double* %pdForward, double* %pdTotalDrift, double** %ppdFactors, i64* %lRndSeed, i32 %BLOCKSIZE) #0 {
  %1 = alloca double**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca double**, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i32, align 4
  %iSuccess = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l = alloca i32, align 4
  %pdZ = alloca double**, align 8
  %randZ = alloca double**, align 8
  %dTotalShock = alloca double, align 8
  %ddelt = alloca double, align 8
  %sqrt_ddelt = alloca double, align 8
  %b = alloca i32, align 4
  %b1 = alloca i32, align 4
  %s = alloca i32, align 4
  %b2 = alloca i32, align 4
  store double** %ppdHJMPath, double*** %1, align 8
  store i32 %iN, i32* %2, align 4
  store i32 %iFactors, i32* %3, align 4
  store double %dYears, double* %4, align 8
  store double* %pdForward, double** %5, align 8
  store double* %pdTotalDrift, double** %6, align 8
  store double** %ppdFactors, double*** %7, align 8
  store i64* %lRndSeed, i64** %8, align 8
  store i32 %BLOCKSIZE, i32* %9, align 4
  store i32 0, i32* %iSuccess, align 4
  %10 = load double* %4, align 8
  %11 = load i32* %2, align 4
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %10, %12
  store double %13, double* %ddelt, align 8
  %14 = load double* %ddelt, align 8
  %15 = call double @sqrt(double %14) #3
  store double %15, double* %sqrt_ddelt, align 8
  %16 = load i32* %3, align 4
  %17 = sub nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = load i32* %2, align 4
  %20 = load i32* %9, align 4
  %21 = mul nsw i32 %19, %20
  %22 = sub nsw i32 %21, 1
  %23 = sext i32 %22 to i64
  %24 = call double** @_Z7dmatrixllll(i64 0, i64 %18, i64 0, i64 %23)
  store double** %24, double*** %pdZ, align 8
  %25 = load i32* %3, align 4
  %26 = sub nsw i32 %25, 1
  %27 = sext i32 %26 to i64
  %28 = load i32* %2, align 4
  %29 = load i32* %9, align 4
  %30 = mul nsw i32 %28, %29
  %31 = sub nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = call double** @_Z7dmatrixllll(i64 0, i64 %27, i64 0, i64 %32)
  store double** %33, double*** %randZ, align 8
  store i32 0, i32* %b, align 4
  br label %34

; <label>:34                                      ; preds = %86, %0
  %35 = load i32* %b, align 4
  %36 = load i32* %9, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %89

; <label>:38                                      ; preds = %34
  store i32 0, i32* %j, align 4
  br label %39

; <label>:39                                      ; preds = %82, %38
  %40 = load i32* %j, align 4
  %41 = load i32* %2, align 4
  %42 = sub nsw i32 %41, 1
  %43 = icmp sle i32 %40, %42
  br i1 %43, label %44, label %85

; <label>:44                                      ; preds = %39
  %45 = load i32* %j, align 4
  %46 = sext i32 %45 to i64
  %47 = load double** %5, align 8
  %48 = getelementptr inbounds double* %47, i64 %46
  %49 = load double* %48, align 8
  %50 = load i32* %9, align 4
  %51 = load i32* %j, align 4
  %52 = mul nsw i32 %50, %51
  %53 = load i32* %b, align 4
  %54 = add nsw i32 %52, %53
  %55 = sext i32 %54 to i64
  %56 = load double*** %1, align 8
  %57 = getelementptr inbounds double** %56, i64 0
  %58 = load double** %57, align 8
  %59 = getelementptr inbounds double* %58, i64 %55
  store double %49, double* %59, align 8
  store i32 1, i32* %i, align 4
  br label %60

; <label>:60                                      ; preds = %78, %44
  %61 = load i32* %i, align 4
  %62 = load i32* %2, align 4
  %63 = sub nsw i32 %62, 1
  %64 = icmp sle i32 %61, %63
  br i1 %64, label %65, label %81

; <label>:65                                      ; preds = %60
  %66 = load i32* %9, align 4
  %67 = load i32* %j, align 4
  %68 = mul nsw i32 %66, %67
  %69 = load i32* %b, align 4
  %70 = add nsw i32 %68, %69
  %71 = sext i32 %70 to i64
  %72 = load i32* %i, align 4
  %73 = sext i32 %72 to i64
  %74 = load double*** %1, align 8
  %75 = getelementptr inbounds double** %74, i64 %73
  %76 = load double** %75, align 8
  %77 = getelementptr inbounds double* %76, i64 %71
  store double 0.000000e+00, double* %77, align 8
  br label %78

; <label>:78                                      ; preds = %65
  %79 = load i32* %i, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %i, align 4
  br label %60

; <label>:81                                      ; preds = %60
  br label %82

; <label>:82                                      ; preds = %81
  %83 = load i32* %j, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %j, align 4
  br label %39

; <label>:85                                      ; preds = %39
  br label %86

; <label>:86                                      ; preds = %85
  %87 = load i32* %b, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %b, align 4
  br label %34

; <label>:89                                      ; preds = %34
  store i32 0, i32* %b1, align 4
  br label %90

; <label>:90                                      ; preds = %139, %89
  %91 = load i32* %b1, align 4
  %92 = load i32* %9, align 4
  %93 = icmp slt i32 %91, %92
  br i1 %93, label %94, label %142

; <label>:94                                      ; preds = %90
  store i32 0, i32* %s, align 4
  br label %95

; <label>:95                                      ; preds = %135, %94
  %96 = load i32* %s, align 4
  %97 = icmp slt i32 %96, 1
  br i1 %97, label %98, label %138

; <label>:98                                      ; preds = %95
  store i32 1, i32* %j, align 4
  br label %99

; <label>:99                                      ; preds = %131, %98
  %100 = load i32* %j, align 4
  %101 = load i32* %2, align 4
  %102 = sub nsw i32 %101, 1
  %103 = icmp sle i32 %100, %102
  br i1 %103, label %104, label %134

; <label>:104                                     ; preds = %99
  store i32 0, i32* %l, align 4
  br label %105

; <label>:105                                     ; preds = %127, %104
  %106 = load i32* %l, align 4
  %107 = load i32* %3, align 4
  %108 = sub nsw i32 %107, 1
  %109 = icmp sle i32 %106, %108
  br i1 %109, label %110, label %130

; <label>:110                                     ; preds = %105
  %111 = load i64** %8, align 8
  %112 = call double @_Z7RanUnifPl(i64* %111)
  %113 = load i32* %9, align 4
  %114 = load i32* %j, align 4
  %115 = mul nsw i32 %113, %114
  %116 = load i32* %b1, align 4
  %117 = add nsw i32 %115, %116
  %118 = load i32* %s, align 4
  %119 = add nsw i32 %117, %118
  %120 = sext i32 %119 to i64
  %121 = load i32* %l, align 4
  %122 = sext i32 %121 to i64
  %123 = load double*** %randZ, align 8
  %124 = getelementptr inbounds double** %123, i64 %122
  %125 = load double** %124, align 8
  %126 = getelementptr inbounds double* %125, i64 %120
  store double %112, double* %126, align 8
  br label %127

; <label>:127                                     ; preds = %110
  %128 = load i32* %l, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %l, align 4
  br label %105

; <label>:130                                     ; preds = %105
  br label %131

; <label>:131                                     ; preds = %130
  %132 = load i32* %j, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %j, align 4
  br label %99

; <label>:134                                     ; preds = %99
  br label %135

; <label>:135                                     ; preds = %134
  %136 = load i32* %s, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %s, align 4
  br label %95

; <label>:138                                     ; preds = %95
  br label %139

; <label>:139                                     ; preds = %138
  %140 = load i32* %b1, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, i32* %b1, align 4
  br label %90

; <label>:142                                     ; preds = %90
  %143 = load double*** %pdZ, align 8
  %144 = load double*** %randZ, align 8
  %145 = load i32* %9, align 4
  %146 = load i32* %2, align 4
  %147 = load i32* %3, align 4
  call void @_Z7serialBPPdS0_iii(double** %143, double** %144, i32 %145, i32 %146, i32 %147)
  store i32 0, i32* %b2, align 4
  br label %148

; <label>:148                                     ; preds = %249, %142
  %149 = load i32* %b2, align 4
  %150 = load i32* %9, align 4
  %151 = icmp slt i32 %149, %150
  br i1 %151, label %152, label %252

; <label>:152                                     ; preds = %148
  store i32 1, i32* %j, align 4
  br label %153

; <label>:153                                     ; preds = %245, %152
  %154 = load i32* %j, align 4
  %155 = load i32* %2, align 4
  %156 = sub nsw i32 %155, 1
  %157 = icmp sle i32 %154, %156
  br i1 %157, label %158, label %248

; <label>:158                                     ; preds = %153
  store i32 0, i32* %l, align 4
  br label %159

; <label>:159                                     ; preds = %241, %158
  %160 = load i32* %l, align 4
  %161 = load i32* %2, align 4
  %162 = load i32* %j, align 4
  %163 = add nsw i32 %162, 1
  %164 = sub nsw i32 %161, %163
  %165 = icmp sle i32 %160, %164
  br i1 %165, label %166, label %244

; <label>:166                                     ; preds = %159
  store double 0.000000e+00, double* %dTotalShock, align 8
  store i32 0, i32* %i, align 4
  br label %167

; <label>:167                                     ; preds = %198, %166
  %168 = load i32* %i, align 4
  %169 = load i32* %3, align 4
  %170 = sub nsw i32 %169, 1
  %171 = icmp sle i32 %168, %170
  br i1 %171, label %172, label %201

; <label>:172                                     ; preds = %167
  %173 = load i32* %l, align 4
  %174 = sext i32 %173 to i64
  %175 = load i32* %i, align 4
  %176 = sext i32 %175 to i64
  %177 = load double*** %7, align 8
  %178 = getelementptr inbounds double** %177, i64 %176
  %179 = load double** %178, align 8
  %180 = getelementptr inbounds double* %179, i64 %174
  %181 = load double* %180, align 8
  %182 = load i32* %9, align 4
  %183 = load i32* %j, align 4
  %184 = mul nsw i32 %182, %183
  %185 = load i32* %b2, align 4
  %186 = add nsw i32 %184, %185
  %187 = sext i32 %186 to i64
  %188 = load i32* %i, align 4
  %189 = sext i32 %188 to i64
  %190 = load double*** %pdZ, align 8
  %191 = getelementptr inbounds double** %190, i64 %189
  %192 = load double** %191, align 8
  %193 = getelementptr inbounds double* %192, i64 %187
  %194 = load double* %193, align 8
  %195 = fmul double %181, %194
  %196 = load double* %dTotalShock, align 8
  %197 = fadd double %196, %195
  store double %197, double* %dTotalShock, align 8
  br label %198

; <label>:198                                     ; preds = %172
  %199 = load i32* %i, align 4
  %200 = add nsw i32 %199, 1
  store i32 %200, i32* %i, align 4
  br label %167

; <label>:201                                     ; preds = %167
  %202 = load i32* %9, align 4
  %203 = load i32* %l, align 4
  %204 = add nsw i32 %203, 1
  %205 = mul nsw i32 %202, %204
  %206 = load i32* %b2, align 4
  %207 = add nsw i32 %205, %206
  %208 = sext i32 %207 to i64
  %209 = load i32* %j, align 4
  %210 = sub nsw i32 %209, 1
  %211 = sext i32 %210 to i64
  %212 = load double*** %1, align 8
  %213 = getelementptr inbounds double** %212, i64 %211
  %214 = load double** %213, align 8
  %215 = getelementptr inbounds double* %214, i64 %208
  %216 = load double* %215, align 8
  %217 = load i32* %l, align 4
  %218 = sext i32 %217 to i64
  %219 = load double** %6, align 8
  %220 = getelementptr inbounds double* %219, i64 %218
  %221 = load double* %220, align 8
  %222 = load double* %ddelt, align 8
  %223 = fmul double %221, %222
  %224 = fadd double %216, %223
  %225 = load double* %sqrt_ddelt, align 8
  %226 = load double* %dTotalShock, align 8
  %227 = fmul double %225, %226
  %228 = fadd double %224, %227
  %229 = load i32* %9, align 4
  %230 = load i32* %l, align 4
  %231 = mul nsw i32 %229, %230
  %232 = load i32* %b2, align 4
  %233 = add nsw i32 %231, %232
  %234 = sext i32 %233 to i64
  %235 = load i32* %j, align 4
  %236 = sext i32 %235 to i64
  %237 = load double*** %1, align 8
  %238 = getelementptr inbounds double** %237, i64 %236
  %239 = load double** %238, align 8
  %240 = getelementptr inbounds double* %239, i64 %234
  store double %228, double* %240, align 8
  br label %241

; <label>:241                                     ; preds = %201
  %242 = load i32* %l, align 4
  %243 = add nsw i32 %242, 1
  store i32 %243, i32* %l, align 4
  br label %159

; <label>:244                                     ; preds = %159
  br label %245

; <label>:245                                     ; preds = %244
  %246 = load i32* %j, align 4
  %247 = add nsw i32 %246, 1
  store i32 %247, i32* %j, align 4
  br label %153

; <label>:248                                     ; preds = %153
  br label %249

; <label>:249                                     ; preds = %248
  %250 = load i32* %b2, align 4
  %251 = add nsw i32 %250, 1
  store i32 %251, i32* %b2, align 4
  br label %148

; <label>:252                                     ; preds = %148
  %253 = load double*** %pdZ, align 8
  %254 = load i32* %3, align 4
  %255 = sub nsw i32 %254, 1
  %256 = sext i32 %255 to i64
  %257 = load i32* %2, align 4
  %258 = load i32* %9, align 4
  %259 = mul nsw i32 %257, %258
  %260 = sub nsw i32 %259, 1
  %261 = sext i32 %260 to i64
  call void @_Z12free_dmatrixPPdllll(double** %253, i64 0, i64 %256, i64 0, i64 %261)
  %262 = load double*** %randZ, align 8
  %263 = load i32* %3, align 4
  %264 = sub nsw i32 %263, 1
  %265 = sext i32 %264 to i64
  %266 = load i32* %2, align 4
  %267 = load i32* %9, align 4
  %268 = mul nsw i32 %266, %267
  %269 = sub nsw i32 %268, 1
  %270 = sext i32 %269 to i64
  call void @_Z12free_dmatrixPPdllll(double** %262, i64 0, i64 %265, i64 0, i64 %270)
  store i32 1, i32* %iSuccess, align 4
  %271 = load i32* %iSuccess, align 4
  ret i32 %271
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

declare double** @_Z7dmatrixllll(i64, i64, i64, i64) #1

declare double @_Z7RanUnifPl(i64*) #1

declare void @_Z12free_dmatrixPPdllll(double**, i64, i64, i64, i64) #1

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}

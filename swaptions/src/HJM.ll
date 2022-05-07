; ModuleID = 'HJM.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: uwtable
define i32 @_Z17HJM_SimPath_YieldPPdiidS_S0_Pl(double** %ppdHJMPath, i32 %iN, i32 %iFactors, double %dYears, double* %pdYield, double** %ppdFactors, i64* %lRndSeed) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double**, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca double*, align 8
  %7 = alloca double**, align 8
  %8 = alloca i64*, align 8
  %iSuccess = alloca i32, align 4
  %pdForward = alloca double*, align 8
  %ppdDrifts = alloca double**, align 8
  %pdTotalDrift = alloca double*, align 8
  store double** %ppdHJMPath, double*** %2, align 8
  store i32 %iN, i32* %3, align 4
  store i32 %iFactors, i32* %4, align 4
  store double %dYears, double* %5, align 8
  store double* %pdYield, double** %6, align 8
  store double** %ppdFactors, double*** %7, align 8
  store i64* %lRndSeed, i64** %8, align 8
  store i32 0, i32* %iSuccess, align 4
  %9 = load i32* %3, align 4
  %10 = sub nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = call double* @_Z7dvectorll(i64 0, i64 %11)
  store double* %12, double** %pdForward, align 8
  %13 = load i32* %4, align 4
  %14 = sub nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = load i32* %3, align 4
  %17 = sub nsw i32 %16, 2
  %18 = sext i32 %17 to i64
  %19 = call double** @_Z7dmatrixllll(i64 0, i64 %15, i64 0, i64 %18)
  store double** %19, double*** %ppdDrifts, align 8
  %20 = load i32* %3, align 4
  %21 = sub nsw i32 %20, 2
  %22 = sext i32 %21 to i64
  %23 = call double* @_Z7dvectorll(i64 0, i64 %22)
  store double* %23, double** %pdTotalDrift, align 8
  %24 = load double** %pdForward, align 8
  %25 = load i32* %3, align 4
  %26 = load double** %6, align 8
  %27 = call i32 @_Z20HJM_Yield_to_ForwardPdiS_(double* %24, i32 %25, double* %26)
  store i32 %27, i32* %iSuccess, align 4
  %28 = load i32* %iSuccess, align 4
  %29 = icmp ne i32 %28, 1
  br i1 %29, label %30, label %47

; <label>:30                                      ; preds = %0
  %31 = load double** %pdForward, align 8
  %32 = load i32* %3, align 4
  %33 = sub nsw i32 %32, 1
  %34 = sext i32 %33 to i64
  call void @_Z12free_dvectorPdll(double* %31, i64 0, i64 %34)
  %35 = load double*** %ppdDrifts, align 8
  %36 = load i32* %4, align 4
  %37 = sub nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = load i32* %3, align 4
  %40 = sub nsw i32 %39, 2
  %41 = sext i32 %40 to i64
  call void @_Z12free_dmatrixPPdllll(double** %35, i64 0, i64 %38, i64 0, i64 %41)
  %42 = load double** %pdTotalDrift, align 8
  %43 = load i32* %3, align 4
  %44 = sub nsw i32 %43, 1
  %45 = sext i32 %44 to i64
  call void @_Z12free_dvectorPdll(double* %42, i64 0, i64 %45)
  %46 = load i32* %iSuccess, align 4
  store i32 %46, i32* %1
  br label %120

; <label>:47                                      ; preds = %0
  %48 = load double** %pdTotalDrift, align 8
  %49 = load double*** %ppdDrifts, align 8
  %50 = load i32* %3, align 4
  %51 = load i32* %4, align 4
  %52 = load double* %5, align 8
  %53 = load double*** %7, align 8
  %54 = call i32 @_Z10HJM_DriftsPdPS_iidS0_(double* %48, double** %49, i32 %50, i32 %51, double %52, double** %53)
  store i32 %54, i32* %iSuccess, align 4
  %55 = load i32* %iSuccess, align 4
  %56 = icmp ne i32 %55, 1
  br i1 %56, label %57, label %74

; <label>:57                                      ; preds = %47
  %58 = load double** %pdForward, align 8
  %59 = load i32* %3, align 4
  %60 = sub nsw i32 %59, 1
  %61 = sext i32 %60 to i64
  call void @_Z12free_dvectorPdll(double* %58, i64 0, i64 %61)
  %62 = load double*** %ppdDrifts, align 8
  %63 = load i32* %4, align 4
  %64 = sub nsw i32 %63, 1
  %65 = sext i32 %64 to i64
  %66 = load i32* %3, align 4
  %67 = sub nsw i32 %66, 2
  %68 = sext i32 %67 to i64
  call void @_Z12free_dmatrixPPdllll(double** %62, i64 0, i64 %65, i64 0, i64 %68)
  %69 = load double** %pdTotalDrift, align 8
  %70 = load i32* %3, align 4
  %71 = sub nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  call void @_Z12free_dvectorPdll(double* %69, i64 0, i64 %72)
  %73 = load i32* %iSuccess, align 4
  store i32 %73, i32* %1
  br label %120

; <label>:74                                      ; preds = %47
  %75 = load double*** %2, align 8
  %76 = load i32* %3, align 4
  %77 = load i32* %4, align 4
  %78 = load double* %5, align 8
  %79 = load double** %pdForward, align 8
  %80 = load double** %pdTotalDrift, align 8
  %81 = load double*** %7, align 8
  %82 = load i64** %8, align 8
  %83 = call i32 @_Z19HJM_SimPath_ForwardPPdiidS_S_S0_Pl(double** %75, i32 %76, i32 %77, double %78, double* %79, double* %80, double** %81, i64* %82)
  store i32 %83, i32* %iSuccess, align 4
  %84 = load i32* %iSuccess, align 4
  %85 = icmp ne i32 %84, 1
  br i1 %85, label %86, label %103

; <label>:86                                      ; preds = %74
  %87 = load double** %pdForward, align 8
  %88 = load i32* %3, align 4
  %89 = sub nsw i32 %88, 1
  %90 = sext i32 %89 to i64
  call void @_Z12free_dvectorPdll(double* %87, i64 0, i64 %90)
  %91 = load double*** %ppdDrifts, align 8
  %92 = load i32* %4, align 4
  %93 = sub nsw i32 %92, 1
  %94 = sext i32 %93 to i64
  %95 = load i32* %3, align 4
  %96 = sub nsw i32 %95, 2
  %97 = sext i32 %96 to i64
  call void @_Z12free_dmatrixPPdllll(double** %91, i64 0, i64 %94, i64 0, i64 %97)
  %98 = load double** %pdTotalDrift, align 8
  %99 = load i32* %3, align 4
  %100 = sub nsw i32 %99, 1
  %101 = sext i32 %100 to i64
  call void @_Z12free_dvectorPdll(double* %98, i64 0, i64 %101)
  %102 = load i32* %iSuccess, align 4
  store i32 %102, i32* %1
  br label %120

; <label>:103                                     ; preds = %74
  %104 = load double** %pdForward, align 8
  %105 = load i32* %3, align 4
  %106 = sub nsw i32 %105, 1
  %107 = sext i32 %106 to i64
  call void @_Z12free_dvectorPdll(double* %104, i64 0, i64 %107)
  %108 = load double*** %ppdDrifts, align 8
  %109 = load i32* %4, align 4
  %110 = sub nsw i32 %109, 1
  %111 = sext i32 %110 to i64
  %112 = load i32* %3, align 4
  %113 = sub nsw i32 %112, 2
  %114 = sext i32 %113 to i64
  call void @_Z12free_dmatrixPPdllll(double** %108, i64 0, i64 %111, i64 0, i64 %114)
  %115 = load double** %pdTotalDrift, align 8
  %116 = load i32* %3, align 4
  %117 = sub nsw i32 %116, 1
  %118 = sext i32 %117 to i64
  call void @_Z12free_dvectorPdll(double* %115, i64 0, i64 %118)
  store i32 1, i32* %iSuccess, align 4
  %119 = load i32* %iSuccess, align 4
  store i32 %119, i32* %1
  br label %120

; <label>:120                                     ; preds = %103, %86, %57, %30
  %121 = load i32* %1
  ret i32 %121
}

declare double* @_Z7dvectorll(i64, i64) #1

declare double** @_Z7dmatrixllll(i64, i64, i64, i64) #1

; Function Attrs: nounwind uwtable
define i32 @_Z20HJM_Yield_to_ForwardPdiS_(double* %pdForward, i32 %iN, double* %pdYield) #2 {
  %1 = alloca double*, align 8
  %2 = alloca i32, align 4
  %3 = alloca double*, align 8
  %iSuccess = alloca i32, align 4
  %i = alloca i32, align 4
  store double* %pdForward, double** %1, align 8
  store i32 %iN, i32* %2, align 4
  store double* %pdYield, double** %3, align 8
  store i32 0, i32* %iSuccess, align 4
  %4 = load double** %3, align 8
  %5 = getelementptr inbounds double* %4, i64 0
  %6 = load double* %5, align 8
  %7 = load double** %1, align 8
  %8 = getelementptr inbounds double* %7, i64 0
  store double %6, double* %8, align 8
  store i32 1, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %38, %0
  %10 = load i32* %i, align 4
  %11 = load i32* %2, align 4
  %12 = sub nsw i32 %11, 1
  %13 = icmp sle i32 %10, %12
  br i1 %13, label %14, label %41

; <label>:14                                      ; preds = %9
  %15 = load i32* %i, align 4
  %16 = add nsw i32 %15, 1
  %17 = sitofp i32 %16 to double
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = load double** %3, align 8
  %21 = getelementptr inbounds double* %20, i64 %19
  %22 = load double* %21, align 8
  %23 = fmul double %17, %22
  %24 = load i32* %i, align 4
  %25 = sitofp i32 %24 to double
  %26 = load i32* %i, align 4
  %27 = sub nsw i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = load double** %3, align 8
  %30 = getelementptr inbounds double* %29, i64 %28
  %31 = load double* %30, align 8
  %32 = fmul double %25, %31
  %33 = fsub double %23, %32
  %34 = load i32* %i, align 4
  %35 = sext i32 %34 to i64
  %36 = load double** %1, align 8
  %37 = getelementptr inbounds double* %36, i64 %35
  store double %33, double* %37, align 8
  br label %38

; <label>:38                                      ; preds = %14
  %39 = load i32* %i, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %i, align 4
  br label %9

; <label>:41                                      ; preds = %9
  store i32 1, i32* %iSuccess, align 4
  %42 = load i32* %iSuccess, align 4
  ret i32 %42
}

declare void @_Z12free_dvectorPdll(double*, i64, i64) #1

declare void @_Z12free_dmatrixPPdllll(double**, i64, i64, i64, i64) #1

; Function Attrs: nounwind uwtable
define i32 @_Z10HJM_DriftsPdPS_iidS0_(double* %pdTotalDrift, double** %ppdDrifts, i32 %iN, i32 %iFactors, double %dYears, double** %ppdFactors) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double**, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca double**, align 8
  %iSuccess = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l = alloca i32, align 4
  %ddelt = alloca double, align 8
  %dSumVol = alloca double, align 8
  store double* %pdTotalDrift, double** %1, align 8
  store double** %ppdDrifts, double*** %2, align 8
  store i32 %iN, i32* %3, align 4
  store i32 %iFactors, i32* %4, align 4
  store double %dYears, double* %5, align 8
  store double** %ppdFactors, double*** %6, align 8
  store i32 0, i32* %iSuccess, align 4
  %7 = load double* %5, align 8
  %8 = load i32* %3, align 4
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %7, %9
  store double %10, double* %ddelt, align 8
  store i32 0, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %41, %0
  %12 = load i32* %i, align 4
  %13 = load i32* %4, align 4
  %14 = sub nsw i32 %13, 1
  %15 = icmp sle i32 %12, %14
  br i1 %15, label %16, label %44

; <label>:16                                      ; preds = %11
  %17 = load double* %ddelt, align 8
  %18 = fmul double 5.000000e-01, %17
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = load double*** %6, align 8
  %22 = getelementptr inbounds double** %21, i64 %20
  %23 = load double** %22, align 8
  %24 = getelementptr inbounds double* %23, i64 0
  %25 = load double* %24, align 8
  %26 = fmul double %18, %25
  %27 = load i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = load double*** %6, align 8
  %30 = getelementptr inbounds double** %29, i64 %28
  %31 = load double** %30, align 8
  %32 = getelementptr inbounds double* %31, i64 0
  %33 = load double* %32, align 8
  %34 = fmul double %26, %33
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = load double*** %2, align 8
  %38 = getelementptr inbounds double** %37, i64 %36
  %39 = load double** %38, align 8
  %40 = getelementptr inbounds double* %39, i64 0
  store double %34, double* %40, align 8
  br label %41

; <label>:41                                      ; preds = %16
  %42 = load i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %11

; <label>:44                                      ; preds = %11
  store i32 0, i32* %i, align 4
  br label %45

; <label>:45                                      ; preds = %134, %44
  %46 = load i32* %i, align 4
  %47 = load i32* %4, align 4
  %48 = sub nsw i32 %47, 1
  %49 = icmp sle i32 %46, %48
  br i1 %49, label %50, label %137

; <label>:50                                      ; preds = %45
  store i32 1, i32* %j, align 4
  br label %51

; <label>:51                                      ; preds = %130, %50
  %52 = load i32* %j, align 4
  %53 = load i32* %3, align 4
  %54 = sub nsw i32 %53, 2
  %55 = icmp sle i32 %52, %54
  br i1 %55, label %56, label %133

; <label>:56                                      ; preds = %51
  %57 = load i32* %j, align 4
  %58 = sext i32 %57 to i64
  %59 = load i32* %i, align 4
  %60 = sext i32 %59 to i64
  %61 = load double*** %2, align 8
  %62 = getelementptr inbounds double** %61, i64 %60
  %63 = load double** %62, align 8
  %64 = getelementptr inbounds double* %63, i64 %58
  store double 0.000000e+00, double* %64, align 8
  store i32 0, i32* %l, align 4
  br label %65

; <label>:65                                      ; preds = %90, %56
  %66 = load i32* %l, align 4
  %67 = load i32* %j, align 4
  %68 = sub nsw i32 %67, 1
  %69 = icmp sle i32 %66, %68
  br i1 %69, label %70, label %93

; <label>:70                                      ; preds = %65
  %71 = load i32* %l, align 4
  %72 = sext i32 %71 to i64
  %73 = load i32* %i, align 4
  %74 = sext i32 %73 to i64
  %75 = load double*** %2, align 8
  %76 = getelementptr inbounds double** %75, i64 %74
  %77 = load double** %76, align 8
  %78 = getelementptr inbounds double* %77, i64 %72
  %79 = load double* %78, align 8
  %80 = load i32* %j, align 4
  %81 = sext i32 %80 to i64
  %82 = load i32* %i, align 4
  %83 = sext i32 %82 to i64
  %84 = load double*** %2, align 8
  %85 = getelementptr inbounds double** %84, i64 %83
  %86 = load double** %85, align 8
  %87 = getelementptr inbounds double* %86, i64 %81
  %88 = load double* %87, align 8
  %89 = fsub double %88, %79
  store double %89, double* %87, align 8
  br label %90

; <label>:90                                      ; preds = %70
  %91 = load i32* %l, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %l, align 4
  br label %65

; <label>:93                                      ; preds = %65
  store double 0.000000e+00, double* %dSumVol, align 8
  store i32 0, i32* %l, align 4
  br label %94

; <label>:94                                      ; preds = %110, %93
  %95 = load i32* %l, align 4
  %96 = load i32* %j, align 4
  %97 = icmp sle i32 %95, %96
  br i1 %97, label %98, label %113

; <label>:98                                      ; preds = %94
  %99 = load i32* %l, align 4
  %100 = sext i32 %99 to i64
  %101 = load i32* %i, align 4
  %102 = sext i32 %101 to i64
  %103 = load double*** %6, align 8
  %104 = getelementptr inbounds double** %103, i64 %102
  %105 = load double** %104, align 8
  %106 = getelementptr inbounds double* %105, i64 %100
  %107 = load double* %106, align 8
  %108 = load double* %dSumVol, align 8
  %109 = fadd double %108, %107
  store double %109, double* %dSumVol, align 8
  br label %110

; <label>:110                                     ; preds = %98
  %111 = load i32* %l, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %l, align 4
  br label %94

; <label>:113                                     ; preds = %94
  %114 = load double* %ddelt, align 8
  %115 = fmul double 5.000000e-01, %114
  %116 = load double* %dSumVol, align 8
  %117 = fmul double %115, %116
  %118 = load double* %dSumVol, align 8
  %119 = fmul double %117, %118
  %120 = load i32* %j, align 4
  %121 = sext i32 %120 to i64
  %122 = load i32* %i, align 4
  %123 = sext i32 %122 to i64
  %124 = load double*** %2, align 8
  %125 = getelementptr inbounds double** %124, i64 %123
  %126 = load double** %125, align 8
  %127 = getelementptr inbounds double* %126, i64 %121
  %128 = load double* %127, align 8
  %129 = fadd double %128, %119
  store double %129, double* %127, align 8
  br label %130

; <label>:130                                     ; preds = %113
  %131 = load i32* %j, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %j, align 4
  br label %51

; <label>:133                                     ; preds = %51
  br label %134

; <label>:134                                     ; preds = %133
  %135 = load i32* %i, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, i32* %i, align 4
  br label %45

; <label>:137                                     ; preds = %45
  store i32 0, i32* %i, align 4
  br label %138

; <label>:138                                     ; preds = %173, %137
  %139 = load i32* %i, align 4
  %140 = load i32* %3, align 4
  %141 = sub nsw i32 %140, 2
  %142 = icmp sle i32 %139, %141
  br i1 %142, label %143, label %176

; <label>:143                                     ; preds = %138
  %144 = load i32* %i, align 4
  %145 = sext i32 %144 to i64
  %146 = load double** %1, align 8
  %147 = getelementptr inbounds double* %146, i64 %145
  store double 0.000000e+00, double* %147, align 8
  store i32 0, i32* %j, align 4
  br label %148

; <label>:148                                     ; preds = %169, %143
  %149 = load i32* %j, align 4
  %150 = load i32* %4, align 4
  %151 = sub nsw i32 %150, 1
  %152 = icmp sle i32 %149, %151
  br i1 %152, label %153, label %172

; <label>:153                                     ; preds = %148
  %154 = load i32* %i, align 4
  %155 = sext i32 %154 to i64
  %156 = load i32* %j, align 4
  %157 = sext i32 %156 to i64
  %158 = load double*** %2, align 8
  %159 = getelementptr inbounds double** %158, i64 %157
  %160 = load double** %159, align 8
  %161 = getelementptr inbounds double* %160, i64 %155
  %162 = load double* %161, align 8
  %163 = load i32* %i, align 4
  %164 = sext i32 %163 to i64
  %165 = load double** %1, align 8
  %166 = getelementptr inbounds double* %165, i64 %164
  %167 = load double* %166, align 8
  %168 = fadd double %167, %162
  store double %168, double* %166, align 8
  br label %169

; <label>:169                                     ; preds = %153
  %170 = load i32* %j, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %j, align 4
  br label %148

; <label>:172                                     ; preds = %148
  br label %173

; <label>:173                                     ; preds = %172
  %174 = load i32* %i, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, i32* %i, align 4
  br label %138

; <label>:176                                     ; preds = %138
  store i32 1, i32* %iSuccess, align 4
  %177 = load i32* %iSuccess, align 4
  ret i32 %177
}

; Function Attrs: uwtable
define i32 @_Z19HJM_SimPath_ForwardPPdiidS_S_S0_Pl(double** %ppdHJMPath, i32 %iN, i32 %iFactors, double %dYears, double* %pdForward, double* %pdTotalDrift, double** %ppdFactors, i64* %lRndSeed) #0 {
  %1 = alloca double**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca double**, align 8
  %8 = alloca i64*, align 8
  %iSuccess = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l = alloca i32, align 4
  %ddelt = alloca double, align 8
  %dTotalShock = alloca double, align 8
  %pdZ = alloca double*, align 8
  store double** %ppdHJMPath, double*** %1, align 8
  store i32 %iN, i32* %2, align 4
  store i32 %iFactors, i32* %3, align 4
  store double %dYears, double* %4, align 8
  store double* %pdForward, double** %5, align 8
  store double* %pdTotalDrift, double** %6, align 8
  store double** %ppdFactors, double*** %7, align 8
  store i64* %lRndSeed, i64** %8, align 8
  store i32 0, i32* %iSuccess, align 4
  %9 = load double* %4, align 8
  %10 = load i32* %2, align 4
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %9, %11
  store double %12, double* %ddelt, align 8
  %13 = load i32* %3, align 4
  %14 = sub nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = call double* @_Z7dvectorll(i64 0, i64 %15)
  store double* %16, double** %pdZ, align 8
  store i32 0, i32* %i, align 4
  br label %17

; <label>:17                                      ; preds = %41, %0
  %18 = load i32* %i, align 4
  %19 = load i32* %2, align 4
  %20 = sub nsw i32 %19, 1
  %21 = icmp sle i32 %18, %20
  br i1 %21, label %22, label %44

; <label>:22                                      ; preds = %17
  store i32 0, i32* %j, align 4
  br label %23

; <label>:23                                      ; preds = %37, %22
  %24 = load i32* %j, align 4
  %25 = load i32* %2, align 4
  %26 = sub nsw i32 %25, 1
  %27 = icmp sle i32 %24, %26
  br i1 %27, label %28, label %40

; <label>:28                                      ; preds = %23
  %29 = load i32* %j, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = load double*** %1, align 8
  %34 = getelementptr inbounds double** %33, i64 %32
  %35 = load double** %34, align 8
  %36 = getelementptr inbounds double* %35, i64 %30
  store double 0.000000e+00, double* %36, align 8
  br label %37

; <label>:37                                      ; preds = %28
  %38 = load i32* %j, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %j, align 4
  br label %23

; <label>:40                                      ; preds = %23
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %17

; <label>:44                                      ; preds = %17
  store i32 0, i32* %i, align 4
  br label %45

; <label>:45                                      ; preds = %62, %44
  %46 = load i32* %i, align 4
  %47 = load i32* %2, align 4
  %48 = sub nsw i32 %47, 1
  %49 = icmp sle i32 %46, %48
  br i1 %49, label %50, label %65

; <label>:50                                      ; preds = %45
  %51 = load i32* %i, align 4
  %52 = sext i32 %51 to i64
  %53 = load double** %5, align 8
  %54 = getelementptr inbounds double* %53, i64 %52
  %55 = load double* %54, align 8
  %56 = load i32* %i, align 4
  %57 = sext i32 %56 to i64
  %58 = load double*** %1, align 8
  %59 = getelementptr inbounds double** %58, i64 0
  %60 = load double** %59, align 8
  %61 = getelementptr inbounds double* %60, i64 %57
  store double %55, double* %61, align 8
  br label %62

; <label>:62                                      ; preds = %50
  %63 = load i32* %i, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %i, align 4
  br label %45

; <label>:65                                      ; preds = %45
  store i32 1, i32* %j, align 4
  br label %66

; <label>:66                                      ; preds = %160, %65
  %67 = load i32* %j, align 4
  %68 = load i32* %2, align 4
  %69 = sub nsw i32 %68, 1
  %70 = icmp sle i32 %67, %69
  br i1 %70, label %71, label %163

; <label>:71                                      ; preds = %66
  store i32 0, i32* %l, align 4
  br label %72

; <label>:72                                      ; preds = %85, %71
  %73 = load i32* %l, align 4
  %74 = load i32* %3, align 4
  %75 = sub nsw i32 %74, 1
  %76 = icmp sle i32 %73, %75
  br i1 %76, label %77, label %88

; <label>:77                                      ; preds = %72
  %78 = load i64** %8, align 8
  %79 = call double @_Z7RanUnifPl(i64* %78)
  %80 = call double @_Z12CumNormalInvd(double %79)
  %81 = load i32* %l, align 4
  %82 = sext i32 %81 to i64
  %83 = load double** %pdZ, align 8
  %84 = getelementptr inbounds double* %83, i64 %82
  store double %80, double* %84, align 8
  br label %85

; <label>:85                                      ; preds = %77
  %86 = load i32* %l, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %l, align 4
  br label %72

; <label>:88                                      ; preds = %72
  store i32 0, i32* %l, align 4
  br label %89

; <label>:89                                      ; preds = %156, %88
  %90 = load i32* %l, align 4
  %91 = load i32* %2, align 4
  %92 = load i32* %j, align 4
  %93 = add nsw i32 %92, 1
  %94 = sub nsw i32 %91, %93
  %95 = icmp sle i32 %90, %94
  br i1 %95, label %96, label %159

; <label>:96                                      ; preds = %89
  store double 0.000000e+00, double* %dTotalShock, align 8
  store i32 0, i32* %i, align 4
  br label %97

; <label>:97                                      ; preds = %120, %96
  %98 = load i32* %i, align 4
  %99 = load i32* %3, align 4
  %100 = sub nsw i32 %99, 1
  %101 = icmp sle i32 %98, %100
  br i1 %101, label %102, label %123

; <label>:102                                     ; preds = %97
  %103 = load i32* %l, align 4
  %104 = sext i32 %103 to i64
  %105 = load i32* %i, align 4
  %106 = sext i32 %105 to i64
  %107 = load double*** %7, align 8
  %108 = getelementptr inbounds double** %107, i64 %106
  %109 = load double** %108, align 8
  %110 = getelementptr inbounds double* %109, i64 %104
  %111 = load double* %110, align 8
  %112 = load i32* %i, align 4
  %113 = sext i32 %112 to i64
  %114 = load double** %pdZ, align 8
  %115 = getelementptr inbounds double* %114, i64 %113
  %116 = load double* %115, align 8
  %117 = fmul double %111, %116
  %118 = load double* %dTotalShock, align 8
  %119 = fadd double %118, %117
  store double %119, double* %dTotalShock, align 8
  br label %120

; <label>:120                                     ; preds = %102
  %121 = load i32* %i, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, i32* %i, align 4
  br label %97

; <label>:123                                     ; preds = %97
  %124 = load i32* %l, align 4
  %125 = add nsw i32 %124, 1
  %126 = sext i32 %125 to i64
  %127 = load i32* %j, align 4
  %128 = sub nsw i32 %127, 1
  %129 = sext i32 %128 to i64
  %130 = load double*** %1, align 8
  %131 = getelementptr inbounds double** %130, i64 %129
  %132 = load double** %131, align 8
  %133 = getelementptr inbounds double* %132, i64 %126
  %134 = load double* %133, align 8
  %135 = load i32* %l, align 4
  %136 = sext i32 %135 to i64
  %137 = load double** %6, align 8
  %138 = getelementptr inbounds double* %137, i64 %136
  %139 = load double* %138, align 8
  %140 = load double* %ddelt, align 8
  %141 = fmul double %139, %140
  %142 = fadd double %134, %141
  %143 = load double* %ddelt, align 8
  %144 = call double @sqrt(double %143) #4
  %145 = load double* %dTotalShock, align 8
  %146 = fmul double %144, %145
  %147 = fadd double %142, %146
  %148 = load i32* %l, align 4
  %149 = sext i32 %148 to i64
  %150 = load i32* %j, align 4
  %151 = sext i32 %150 to i64
  %152 = load double*** %1, align 8
  %153 = getelementptr inbounds double** %152, i64 %151
  %154 = load double** %153, align 8
  %155 = getelementptr inbounds double* %154, i64 %149
  store double %147, double* %155, align 8
  br label %156

; <label>:156                                     ; preds = %123
  %157 = load i32* %l, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, i32* %l, align 4
  br label %89

; <label>:159                                     ; preds = %89
  br label %160

; <label>:160                                     ; preds = %159
  %161 = load i32* %j, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %j, align 4
  br label %66

; <label>:163                                     ; preds = %66
  %164 = load double** %pdZ, align 8
  %165 = load i32* %3, align 4
  %166 = sub nsw i32 %165, 1
  %167 = sext i32 %166 to i64
  call void @_Z12free_dvectorPdll(double* %164, i64 0, i64 %167)
  store i32 1, i32* %iSuccess, align 4
  %168 = load i32* %iSuccess, align 4
  ret i32 %168
}

; Function Attrs: nounwind uwtable
define i32 @_Z11HJM_FactorsPPdiiS_S0_(double** %ppdFactors, i32 %iN, i32 %iFactors, double* %pdVol, double** %ppdFacBreak) #2 {
  %1 = alloca double**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double*, align 8
  %5 = alloca double**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %iSuccess = alloca i32, align 4
  store double** %ppdFactors, double*** %1, align 8
  store i32 %iN, i32* %2, align 4
  store i32 %iFactors, i32* %3, align 4
  store double* %pdVol, double** %4, align 8
  store double** %ppdFacBreak, double*** %5, align 8
  store i32 0, i32* %iSuccess, align 4
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %52, %0
  %7 = load i32* %i, align 4
  %8 = load i32* %3, align 4
  %9 = sub nsw i32 %8, 1
  %10 = icmp sle i32 %7, %9
  br i1 %10, label %11, label %55

; <label>:11                                      ; preds = %6
  store i32 0, i32* %j, align 4
  br label %12

; <label>:12                                      ; preds = %48, %11
  %13 = load i32* %j, align 4
  %14 = load i32* %2, align 4
  %15 = sub nsw i32 %14, 2
  %16 = icmp sle i32 %13, %15
  br i1 %16, label %17, label %51

; <label>:17                                      ; preds = %12
  %18 = load i32* %j, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load double*** %5, align 8
  %23 = getelementptr inbounds double** %22, i64 %21
  %24 = load double** %23, align 8
  %25 = getelementptr inbounds double* %24, i64 %19
  %26 = load double* %25, align 8
  %27 = load i32* %j, align 4
  %28 = sext i32 %27 to i64
  %29 = load double** %4, align 8
  %30 = getelementptr inbounds double* %29, i64 %28
  %31 = load double* %30, align 8
  %32 = fmul double %26, %31
  %33 = load i32* %j, align 4
  %34 = sext i32 %33 to i64
  %35 = load double** %4, align 8
  %36 = getelementptr inbounds double* %35, i64 %34
  %37 = load double* %36, align 8
  %38 = fmul double %32, %37
  %39 = call double @sqrt(double %38) #4
  %40 = load i32* %j, align 4
  %41 = sext i32 %40 to i64
  %42 = load i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = load double*** %1, align 8
  %45 = getelementptr inbounds double** %44, i64 %43
  %46 = load double** %45, align 8
  %47 = getelementptr inbounds double* %46, i64 %41
  store double %39, double* %47, align 8
  br label %48

; <label>:48                                      ; preds = %17
  %49 = load i32* %j, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %j, align 4
  br label %12

; <label>:51                                      ; preds = %12
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i32* %i, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %i, align 4
  br label %6

; <label>:55                                      ; preds = %6
  store i32 1, i32* %iSuccess, align 4
  %56 = load i32* %iSuccess, align 4
  ret i32 %56
}

; Function Attrs: nounwind
declare double @sqrt(double) #3

declare double @_Z12CumNormalInvd(double) #1

declare double @_Z7RanUnifPl(i64*) #1

; Function Attrs: uwtable
define i32 @_Z16HJM_CorrelationsPPdiiS0_(double** %ppdHJMCorr, i32 %iN, i32 %iFactors, double** %ppdFactors) #0 {
  %1 = alloca double**, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double**, align 8
  %iSuccess = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l = alloca i32, align 4
  %pdTotalVol = alloca double*, align 8
  %ppdWeights = alloca double**, align 8
  store double** %ppdHJMCorr, double*** %1, align 8
  store i32 %iN, i32* %2, align 4
  store i32 %iFactors, i32* %3, align 4
  store double** %ppdFactors, double*** %4, align 8
  store i32 0, i32* %iSuccess, align 4
  %5 = load i32* %2, align 4
  %6 = sub nsw i32 %5, 2
  %7 = sext i32 %6 to i64
  %8 = call double* @_Z7dvectorll(i64 0, i64 %7)
  store double* %8, double** %pdTotalVol, align 8
  %9 = load i32* %3, align 4
  %10 = sub nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = load i32* %2, align 4
  %13 = sub nsw i32 %12, 2
  %14 = sext i32 %13 to i64
  %15 = call double** @_Z7dmatrixllll(i64 0, i64 %11, i64 0, i64 %14)
  store double** %15, double*** %ppdWeights, align 8
  store i32 0, i32* %i, align 4
  br label %16

; <label>:16                                      ; preds = %71, %0
  %17 = load i32* %i, align 4
  %18 = load i32* %2, align 4
  %19 = sub nsw i32 %18, 2
  %20 = icmp sle i32 %17, %19
  br i1 %20, label %21, label %74

; <label>:21                                      ; preds = %16
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = load double** %pdTotalVol, align 8
  %25 = getelementptr inbounds double* %24, i64 %23
  store double 0.000000e+00, double* %25, align 8
  store i32 0, i32* %j, align 4
  br label %26

; <label>:26                                      ; preds = %57, %21
  %27 = load i32* %j, align 4
  %28 = load i32* %3, align 4
  %29 = sub nsw i32 %28, 1
  %30 = icmp sle i32 %27, %29
  br i1 %30, label %31, label %60

; <label>:31                                      ; preds = %26
  %32 = load i32* %i, align 4
  %33 = sext i32 %32 to i64
  %34 = load i32* %j, align 4
  %35 = sext i32 %34 to i64
  %36 = load double*** %4, align 8
  %37 = getelementptr inbounds double** %36, i64 %35
  %38 = load double** %37, align 8
  %39 = getelementptr inbounds double* %38, i64 %33
  %40 = load double* %39, align 8
  %41 = load i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = load i32* %j, align 4
  %44 = sext i32 %43 to i64
  %45 = load double*** %4, align 8
  %46 = getelementptr inbounds double** %45, i64 %44
  %47 = load double** %46, align 8
  %48 = getelementptr inbounds double* %47, i64 %42
  %49 = load double* %48, align 8
  %50 = fmul double %40, %49
  %51 = load i32* %i, align 4
  %52 = sext i32 %51 to i64
  %53 = load double** %pdTotalVol, align 8
  %54 = getelementptr inbounds double* %53, i64 %52
  %55 = load double* %54, align 8
  %56 = fadd double %55, %50
  store double %56, double* %54, align 8
  br label %57

; <label>:57                                      ; preds = %31
  %58 = load i32* %j, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %j, align 4
  br label %26

; <label>:60                                      ; preds = %26
  %61 = load i32* %i, align 4
  %62 = sext i32 %61 to i64
  %63 = load double** %pdTotalVol, align 8
  %64 = getelementptr inbounds double* %63, i64 %62
  %65 = load double* %64, align 8
  %66 = call double @sqrt(double %65) #4
  %67 = load i32* %i, align 4
  %68 = sext i32 %67 to i64
  %69 = load double** %pdTotalVol, align 8
  %70 = getelementptr inbounds double* %69, i64 %68
  store double %66, double* %70, align 8
  br label %71

; <label>:71                                      ; preds = %60
  %72 = load i32* %i, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %i, align 4
  br label %16

; <label>:74                                      ; preds = %16
  store i32 0, i32* %i, align 4
  br label %75

; <label>:75                                      ; preds = %114, %74
  %76 = load i32* %i, align 4
  %77 = load i32* %2, align 4
  %78 = sub nsw i32 %77, 2
  %79 = icmp sle i32 %76, %78
  br i1 %79, label %80, label %117

; <label>:80                                      ; preds = %75
  store i32 0, i32* %j, align 4
  br label %81

; <label>:81                                      ; preds = %110, %80
  %82 = load i32* %j, align 4
  %83 = load i32* %3, align 4
  %84 = sub nsw i32 %83, 1
  %85 = icmp sle i32 %82, %84
  br i1 %85, label %86, label %113

; <label>:86                                      ; preds = %81
  %87 = load i32* %i, align 4
  %88 = sext i32 %87 to i64
  %89 = load i32* %j, align 4
  %90 = sext i32 %89 to i64
  %91 = load double*** %4, align 8
  %92 = getelementptr inbounds double** %91, i64 %90
  %93 = load double** %92, align 8
  %94 = getelementptr inbounds double* %93, i64 %88
  %95 = load double* %94, align 8
  %96 = load i32* %i, align 4
  %97 = sext i32 %96 to i64
  %98 = load double** %pdTotalVol, align 8
  %99 = getelementptr inbounds double* %98, i64 %97
  %100 = load double* %99, align 8
  %101 = fdiv double %95, %100
  %102 = load i32* %i, align 4
  %103 = sext i32 %102 to i64
  %104 = load i32* %j, align 4
  %105 = sext i32 %104 to i64
  %106 = load double*** %ppdWeights, align 8
  %107 = getelementptr inbounds double** %106, i64 %105
  %108 = load double** %107, align 8
  %109 = getelementptr inbounds double* %108, i64 %103
  store double %101, double* %109, align 8
  br label %110

; <label>:110                                     ; preds = %86
  %111 = load i32* %j, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %j, align 4
  br label %81

; <label>:113                                     ; preds = %81
  br label %114

; <label>:114                                     ; preds = %113
  %115 = load i32* %i, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %i, align 4
  br label %75

; <label>:117                                     ; preds = %75
  store i32 0, i32* %i, align 4
  br label %118

; <label>:118                                     ; preds = %142, %117
  %119 = load i32* %i, align 4
  %120 = load i32* %2, align 4
  %121 = sub nsw i32 %120, 2
  %122 = icmp sle i32 %119, %121
  br i1 %122, label %123, label %145

; <label>:123                                     ; preds = %118
  store i32 0, i32* %j, align 4
  br label %124

; <label>:124                                     ; preds = %138, %123
  %125 = load i32* %j, align 4
  %126 = load i32* %2, align 4
  %127 = sub nsw i32 %126, 2
  %128 = icmp sle i32 %125, %127
  br i1 %128, label %129, label %141

; <label>:129                                     ; preds = %124
  %130 = load i32* %j, align 4
  %131 = sext i32 %130 to i64
  %132 = load i32* %i, align 4
  %133 = sext i32 %132 to i64
  %134 = load double*** %1, align 8
  %135 = getelementptr inbounds double** %134, i64 %133
  %136 = load double** %135, align 8
  %137 = getelementptr inbounds double* %136, i64 %131
  store double 0.000000e+00, double* %137, align 8
  br label %138

; <label>:138                                     ; preds = %129
  %139 = load i32* %j, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %j, align 4
  br label %124

; <label>:141                                     ; preds = %124
  br label %142

; <label>:142                                     ; preds = %141
  %143 = load i32* %i, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %i, align 4
  br label %118

; <label>:145                                     ; preds = %118
  store i32 0, i32* %i, align 4
  br label %146

; <label>:146                                     ; preds = %202, %145
  %147 = load i32* %i, align 4
  %148 = load i32* %2, align 4
  %149 = sub nsw i32 %148, 2
  %150 = icmp sle i32 %147, %149
  br i1 %150, label %151, label %205

; <label>:151                                     ; preds = %146
  %152 = load i32* %i, align 4
  store i32 %152, i32* %j, align 4
  br label %153

; <label>:153                                     ; preds = %198, %151
  %154 = load i32* %j, align 4
  %155 = load i32* %2, align 4
  %156 = sub nsw i32 %155, 2
  %157 = icmp sle i32 %154, %156
  br i1 %157, label %158, label %201

; <label>:158                                     ; preds = %153
  store i32 0, i32* %l, align 4
  br label %159

; <label>:159                                     ; preds = %194, %158
  %160 = load i32* %l, align 4
  %161 = load i32* %3, align 4
  %162 = sub nsw i32 %161, 1
  %163 = icmp sle i32 %160, %162
  br i1 %163, label %164, label %197

; <label>:164                                     ; preds = %159
  %165 = load i32* %i, align 4
  %166 = sext i32 %165 to i64
  %167 = load i32* %l, align 4
  %168 = sext i32 %167 to i64
  %169 = load double*** %ppdWeights, align 8
  %170 = getelementptr inbounds double** %169, i64 %168
  %171 = load double** %170, align 8
  %172 = getelementptr inbounds double* %171, i64 %166
  %173 = load double* %172, align 8
  %174 = load i32* %j, align 4
  %175 = sext i32 %174 to i64
  %176 = load i32* %l, align 4
  %177 = sext i32 %176 to i64
  %178 = load double*** %ppdWeights, align 8
  %179 = getelementptr inbounds double** %178, i64 %177
  %180 = load double** %179, align 8
  %181 = getelementptr inbounds double* %180, i64 %175
  %182 = load double* %181, align 8
  %183 = fmul double %173, %182
  %184 = load i32* %j, align 4
  %185 = sext i32 %184 to i64
  %186 = load i32* %i, align 4
  %187 = sext i32 %186 to i64
  %188 = load double*** %1, align 8
  %189 = getelementptr inbounds double** %188, i64 %187
  %190 = load double** %189, align 8
  %191 = getelementptr inbounds double* %190, i64 %185
  %192 = load double* %191, align 8
  %193 = fadd double %192, %183
  store double %193, double* %191, align 8
  br label %194

; <label>:194                                     ; preds = %164
  %195 = load i32* %l, align 4
  %196 = add nsw i32 %195, 1
  store i32 %196, i32* %l, align 4
  br label %159

; <label>:197                                     ; preds = %159
  br label %198

; <label>:198                                     ; preds = %197
  %199 = load i32* %j, align 4
  %200 = add nsw i32 %199, 1
  store i32 %200, i32* %j, align 4
  br label %153

; <label>:201                                     ; preds = %153
  br label %202

; <label>:202                                     ; preds = %201
  %203 = load i32* %i, align 4
  %204 = add nsw i32 %203, 1
  store i32 %204, i32* %i, align 4
  br label %146

; <label>:205                                     ; preds = %146
  %206 = load double** %pdTotalVol, align 8
  %207 = load i32* %2, align 4
  %208 = sub nsw i32 %207, 2
  %209 = sext i32 %208 to i64
  call void @_Z12free_dvectorPdll(double* %206, i64 0, i64 %209)
  %210 = load double*** %ppdWeights, align 8
  %211 = load i32* %3, align 4
  %212 = sub nsw i32 %211, 1
  %213 = sext i32 %212 to i64
  %214 = load i32* %2, align 4
  %215 = sub nsw i32 %214, 2
  %216 = sext i32 %215 to i64
  call void @_Z12free_dmatrixPPdllll(double** %210, i64 0, i64 %213, i64 0, i64 %216)
  store i32 1, i32* %iSuccess, align 4
  %217 = load i32* %iSuccess, align 4
  ret i32 %217
}

; Function Attrs: nounwind uwtable
define i32 @_Z20HJM_Forward_to_YieldPdiS_(double* %pdYield, i32 %iN, double* %pdForward) #2 {
  %1 = alloca double*, align 8
  %2 = alloca i32, align 4
  %3 = alloca double*, align 8
  %iSuccess = alloca i32, align 4
  %i = alloca i32, align 4
  store double* %pdYield, double** %1, align 8
  store i32 %iN, i32* %2, align 4
  store double* %pdForward, double** %3, align 8
  store i32 0, i32* %iSuccess, align 4
  %4 = load double** %3, align 8
  %5 = getelementptr inbounds double* %4, i64 0
  %6 = load double* %5, align 8
  %7 = load double** %1, align 8
  %8 = getelementptr inbounds double* %7, i64 0
  store double %6, double* %8, align 8
  store i32 1, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %38, %0
  %10 = load i32* %i, align 4
  %11 = load i32* %2, align 4
  %12 = sub nsw i32 %11, 1
  %13 = icmp sle i32 %10, %12
  br i1 %13, label %14, label %41

; <label>:14                                      ; preds = %9
  %15 = load i32* %i, align 4
  %16 = sitofp i32 %15 to double
  %17 = load i32* %i, align 4
  %18 = sub nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = load double** %1, align 8
  %21 = getelementptr inbounds double* %20, i64 %19
  %22 = load double* %21, align 8
  %23 = fmul double %16, %22
  %24 = load i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = load double** %3, align 8
  %27 = getelementptr inbounds double* %26, i64 %25
  %28 = load double* %27, align 8
  %29 = fadd double %23, %28
  %30 = load i32* %i, align 4
  %31 = add nsw i32 %30, 1
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %29, %32
  %34 = load i32* %i, align 4
  %35 = sext i32 %34 to i64
  %36 = load double** %1, align 8
  %37 = getelementptr inbounds double* %36, i64 %35
  store double %33, double* %37, align 8
  br label %38

; <label>:38                                      ; preds = %14
  %39 = load i32* %i, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %i, align 4
  br label %9

; <label>:41                                      ; preds = %9
  store i32 1, i32* %iSuccess, align 4
  %42 = load i32* %iSuccess, align 4
  ret i32 %42
}

; Function Attrs: nounwind uwtable
define i32 @_Z16Discount_FactorsPdidS_(double* %pdDiscountFactors, i32 %iN, double %dYears, double* %pdRatePath) #2 {
  %1 = alloca double*, align 8
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %iSuccess = alloca i32, align 4
  %ddelt = alloca double, align 8
  store double* %pdDiscountFactors, double** %1, align 8
  store i32 %iN, i32* %2, align 4
  store double %dYears, double* %3, align 8
  store double* %pdRatePath, double** %4, align 8
  %5 = load double* %3, align 8
  %6 = load i32* %2, align 4
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %5, %7
  store double %8, double* %ddelt, align 8
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %19, %0
  %10 = load i32* %i, align 4
  %11 = load i32* %2, align 4
  %12 = sub nsw i32 %11, 1
  %13 = icmp sle i32 %10, %12
  br i1 %13, label %14, label %22

; <label>:14                                      ; preds = %9
  %15 = load i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = load double** %1, align 8
  %18 = getelementptr inbounds double* %17, i64 %16
  store double 1.000000e+00, double* %18, align 8
  br label %19

; <label>:19                                      ; preds = %14
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %9

; <label>:22                                      ; preds = %9
  store i32 1, i32* %i, align 4
  br label %23

; <label>:23                                      ; preds = %54, %22
  %24 = load i32* %i, align 4
  %25 = load i32* %2, align 4
  %26 = sub nsw i32 %25, 1
  %27 = icmp sle i32 %24, %26
  br i1 %27, label %28, label %57

; <label>:28                                      ; preds = %23
  store i32 0, i32* %j, align 4
  br label %29

; <label>:29                                      ; preds = %50, %28
  %30 = load i32* %j, align 4
  %31 = load i32* %i, align 4
  %32 = sub nsw i32 %31, 1
  %33 = icmp sle i32 %30, %32
  br i1 %33, label %34, label %53

; <label>:34                                      ; preds = %29
  %35 = load i32* %j, align 4
  %36 = sext i32 %35 to i64
  %37 = load double** %4, align 8
  %38 = getelementptr inbounds double* %37, i64 %36
  %39 = load double* %38, align 8
  %40 = fsub double -0.000000e+00, %39
  %41 = load double* %ddelt, align 8
  %42 = fmul double %40, %41
  %43 = call double @exp(double %42) #4
  %44 = load i32* %i, align 4
  %45 = sext i32 %44 to i64
  %46 = load double** %1, align 8
  %47 = getelementptr inbounds double* %46, i64 %45
  %48 = load double* %47, align 8
  %49 = fmul double %48, %43
  store double %49, double* %47, align 8
  br label %50

; <label>:50                                      ; preds = %34
  %51 = load i32* %j, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %j, align 4
  br label %29

; <label>:53                                      ; preds = %29
  br label %54

; <label>:54                                      ; preds = %53
  %55 = load i32* %i, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %i, align 4
  br label %23

; <label>:57                                      ; preds = %23
  store i32 1, i32* %iSuccess, align 4
  %58 = load i32* %iSuccess, align 4
  ret i32 %58
}

; Function Attrs: nounwind
declare double @exp(double) #3

; Function Attrs: uwtable
define i32 @_Z20Discount_Factors_optPdidS_(double* %pdDiscountFactors, i32 %iN, double %dYears, double* %pdRatePath) #0 {
  %1 = alloca double*, align 8
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %iSuccess = alloca i32, align 4
  %ddelt = alloca double, align 8
  %pdexpRes = alloca double*, align 8
  store double* %pdDiscountFactors, double** %1, align 8
  store i32 %iN, i32* %2, align 4
  store double %dYears, double* %3, align 8
  store double* %pdRatePath, double** %4, align 8
  %5 = load double* %3, align 8
  %6 = load i32* %2, align 4
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %5, %7
  store double %8, double* %ddelt, align 8
  %9 = load i32* %2, align 4
  %10 = sub nsw i32 %9, 2
  %11 = sext i32 %10 to i64
  %12 = call double* @_Z7dvectorll(i64 0, i64 %11)
  store double* %12, double** %pdexpRes, align 8
  store i32 0, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %23, %0
  %14 = load i32* %i, align 4
  %15 = load i32* %2, align 4
  %16 = sub nsw i32 %15, 1
  %17 = icmp sle i32 %14, %16
  br i1 %17, label %18, label %26

; <label>:18                                      ; preds = %13
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = load double** %1, align 8
  %22 = getelementptr inbounds double* %21, i64 %20
  store double 1.000000e+00, double* %22, align 8
  br label %23

; <label>:23                                      ; preds = %18
  %24 = load i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %13

; <label>:26                                      ; preds = %13
  store i32 0, i32* %j, align 4
  br label %27

; <label>:27                                      ; preds = %45, %26
  %28 = load i32* %j, align 4
  %29 = load i32* %i, align 4
  %30 = sub nsw i32 %29, 2
  %31 = icmp sle i32 %28, %30
  br i1 %31, label %32, label %48

; <label>:32                                      ; preds = %27
  %33 = load i32* %j, align 4
  %34 = sext i32 %33 to i64
  %35 = load double** %4, align 8
  %36 = getelementptr inbounds double* %35, i64 %34
  %37 = load double* %36, align 8
  %38 = fsub double -0.000000e+00, %37
  %39 = load double* %ddelt, align 8
  %40 = fmul double %38, %39
  %41 = load i32* %j, align 4
  %42 = sext i32 %41 to i64
  %43 = load double** %pdexpRes, align 8
  %44 = getelementptr inbounds double* %43, i64 %42
  store double %40, double* %44, align 8
  br label %45

; <label>:45                                      ; preds = %32
  %46 = load i32* %j, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %j, align 4
  br label %27

; <label>:48                                      ; preds = %27
  store i32 0, i32* %j, align 4
  br label %49

; <label>:49                                      ; preds = %65, %48
  %50 = load i32* %j, align 4
  %51 = load i32* %i, align 4
  %52 = sub nsw i32 %51, 2
  %53 = icmp sle i32 %50, %52
  br i1 %53, label %54, label %68

; <label>:54                                      ; preds = %49
  %55 = load i32* %j, align 4
  %56 = sext i32 %55 to i64
  %57 = load double** %pdexpRes, align 8
  %58 = getelementptr inbounds double* %57, i64 %56
  %59 = load double* %58, align 8
  %60 = call double @exp(double %59) #4
  %61 = load i32* %j, align 4
  %62 = sext i32 %61 to i64
  %63 = load double** %pdexpRes, align 8
  %64 = getelementptr inbounds double* %63, i64 %62
  store double %60, double* %64, align 8
  br label %65

; <label>:65                                      ; preds = %54
  %66 = load i32* %j, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %j, align 4
  br label %49

; <label>:68                                      ; preds = %49
  store i32 1, i32* %i, align 4
  br label %69

; <label>:69                                      ; preds = %96, %68
  %70 = load i32* %i, align 4
  %71 = load i32* %2, align 4
  %72 = sub nsw i32 %71, 1
  %73 = icmp sle i32 %70, %72
  br i1 %73, label %74, label %99

; <label>:74                                      ; preds = %69
  store i32 0, i32* %j, align 4
  br label %75

; <label>:75                                      ; preds = %92, %74
  %76 = load i32* %j, align 4
  %77 = load i32* %i, align 4
  %78 = sub nsw i32 %77, 1
  %79 = icmp sle i32 %76, %78
  br i1 %79, label %80, label %95

; <label>:80                                      ; preds = %75
  %81 = load i32* %j, align 4
  %82 = sext i32 %81 to i64
  %83 = load double** %pdexpRes, align 8
  %84 = getelementptr inbounds double* %83, i64 %82
  %85 = load double* %84, align 8
  %86 = load i32* %i, align 4
  %87 = sext i32 %86 to i64
  %88 = load double** %1, align 8
  %89 = getelementptr inbounds double* %88, i64 %87
  %90 = load double* %89, align 8
  %91 = fmul double %90, %85
  store double %91, double* %89, align 8
  br label %92

; <label>:92                                      ; preds = %80
  %93 = load i32* %j, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %j, align 4
  br label %75

; <label>:95                                      ; preds = %75
  br label %96

; <label>:96                                      ; preds = %95
  %97 = load i32* %i, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %i, align 4
  br label %69

; <label>:99                                      ; preds = %69
  %100 = load double** %pdexpRes, align 8
  %101 = load i32* %2, align 4
  %102 = sub nsw i32 %101, 2
  %103 = sext i32 %102 to i64
  call void @_Z12free_dvectorPdll(double* %100, i64 0, i64 %103)
  store i32 1, i32* %iSuccess, align 4
  %104 = load i32* %iSuccess, align 4
  ret i32 %104
}

; Function Attrs: uwtable
define i32 @_Z25Discount_Factors_BlockingPdidS_i(double* %pdDiscountFactors, i32 %iN, double %dYears, double* %pdRatePath, i32 %BLOCKSIZE) #0 {
  %1 = alloca double*, align 8
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca double*, align 8
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %b = alloca i32, align 4
  %iSuccess = alloca i32, align 4
  %ddelt = alloca double, align 8
  %pdexpRes = alloca double*, align 8
  store double* %pdDiscountFactors, double** %1, align 8
  store i32 %iN, i32* %2, align 4
  store double %dYears, double* %3, align 8
  store double* %pdRatePath, double** %4, align 8
  store i32 %BLOCKSIZE, i32* %5, align 4
  %6 = load double* %3, align 8
  %7 = load i32* %2, align 4
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %6, %8
  store double %9, double* %ddelt, align 8
  %10 = load i32* %2, align 4
  %11 = sub nsw i32 %10, 1
  %12 = load i32* %5, align 4
  %13 = mul nsw i32 %11, %12
  %14 = sub nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = call double* @_Z7dvectorll(i64 0, i64 %15)
  store double* %16, double** %pdexpRes, align 8
  store i32 0, i32* %j, align 4
  br label %17

; <label>:17                                      ; preds = %38, %0
  %18 = load i32* %j, align 4
  %19 = load i32* %2, align 4
  %20 = sub nsw i32 %19, 1
  %21 = load i32* %5, align 4
  %22 = mul nsw i32 %20, %21
  %23 = sub nsw i32 %22, 1
  %24 = icmp sle i32 %18, %23
  br i1 %24, label %25, label %41

; <label>:25                                      ; preds = %17
  %26 = load i32* %j, align 4
  %27 = sext i32 %26 to i64
  %28 = load double** %4, align 8
  %29 = getelementptr inbounds double* %28, i64 %27
  %30 = load double* %29, align 8
  %31 = fsub double -0.000000e+00, %30
  %32 = load double* %ddelt, align 8
  %33 = fmul double %31, %32
  %34 = load i32* %j, align 4
  %35 = sext i32 %34 to i64
  %36 = load double** %pdexpRes, align 8
  %37 = getelementptr inbounds double* %36, i64 %35
  store double %33, double* %37, align 8
  br label %38

; <label>:38                                      ; preds = %25
  %39 = load i32* %j, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %j, align 4
  br label %17

; <label>:41                                      ; preds = %17
  store i32 0, i32* %j, align 4
  br label %42

; <label>:42                                      ; preds = %61, %41
  %43 = load i32* %j, align 4
  %44 = load i32* %2, align 4
  %45 = sub nsw i32 %44, 1
  %46 = load i32* %5, align 4
  %47 = mul nsw i32 %45, %46
  %48 = sub nsw i32 %47, 1
  %49 = icmp sle i32 %43, %48
  br i1 %49, label %50, label %64

; <label>:50                                      ; preds = %42
  %51 = load i32* %j, align 4
  %52 = sext i32 %51 to i64
  %53 = load double** %pdexpRes, align 8
  %54 = getelementptr inbounds double* %53, i64 %52
  %55 = load double* %54, align 8
  %56 = call double @exp(double %55) #4
  %57 = load i32* %j, align 4
  %58 = sext i32 %57 to i64
  %59 = load double** %pdexpRes, align 8
  %60 = getelementptr inbounds double* %59, i64 %58
  store double %56, double* %60, align 8
  br label %61

; <label>:61                                      ; preds = %50
  %62 = load i32* %j, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %j, align 4
  br label %42

; <label>:64                                      ; preds = %42
  store i32 0, i32* %i, align 4
  br label %65

; <label>:65                                      ; preds = %76, %64
  %66 = load i32* %i, align 4
  %67 = load i32* %2, align 4
  %68 = load i32* %5, align 4
  %69 = mul nsw i32 %67, %68
  %70 = icmp slt i32 %66, %69
  br i1 %70, label %71, label %79

; <label>:71                                      ; preds = %65
  %72 = load i32* %i, align 4
  %73 = sext i32 %72 to i64
  %74 = load double** %1, align 8
  %75 = getelementptr inbounds double* %74, i64 %73
  store double 1.000000e+00, double* %75, align 8
  br label %76

; <label>:76                                      ; preds = %71
  %77 = load i32* %i, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %i, align 4
  br label %65

; <label>:79                                      ; preds = %65
  store i32 1, i32* %i, align 4
  br label %80

; <label>:80                                      ; preds = %124, %79
  %81 = load i32* %i, align 4
  %82 = load i32* %2, align 4
  %83 = sub nsw i32 %82, 1
  %84 = icmp sle i32 %81, %83
  br i1 %84, label %85, label %127

; <label>:85                                      ; preds = %80
  store i32 0, i32* %b, align 4
  br label %86

; <label>:86                                      ; preds = %120, %85
  %87 = load i32* %b, align 4
  %88 = load i32* %5, align 4
  %89 = icmp slt i32 %87, %88
  br i1 %89, label %90, label %123

; <label>:90                                      ; preds = %86
  store i32 0, i32* %j, align 4
  br label %91

; <label>:91                                      ; preds = %116, %90
  %92 = load i32* %j, align 4
  %93 = load i32* %i, align 4
  %94 = sub nsw i32 %93, 1
  %95 = icmp sle i32 %92, %94
  br i1 %95, label %96, label %119

; <label>:96                                      ; preds = %91
  %97 = load i32* %j, align 4
  %98 = load i32* %5, align 4
  %99 = mul nsw i32 %97, %98
  %100 = load i32* %b, align 4
  %101 = add nsw i32 %99, %100
  %102 = sext i32 %101 to i64
  %103 = load double** %pdexpRes, align 8
  %104 = getelementptr inbounds double* %103, i64 %102
  %105 = load double* %104, align 8
  %106 = load i32* %i, align 4
  %107 = load i32* %5, align 4
  %108 = mul nsw i32 %106, %107
  %109 = load i32* %b, align 4
  %110 = add nsw i32 %108, %109
  %111 = sext i32 %110 to i64
  %112 = load double** %1, align 8
  %113 = getelementptr inbounds double* %112, i64 %111
  %114 = load double* %113, align 8
  %115 = fmul double %114, %105
  store double %115, double* %113, align 8
  br label %116

; <label>:116                                     ; preds = %96
  %117 = load i32* %j, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %j, align 4
  br label %91

; <label>:119                                     ; preds = %91
  br label %120

; <label>:120                                     ; preds = %119
  %121 = load i32* %b, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, i32* %b, align 4
  br label %86

; <label>:123                                     ; preds = %86
  br label %124

; <label>:124                                     ; preds = %123
  %125 = load i32* %i, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %i, align 4
  br label %80

; <label>:127                                     ; preds = %80
  %128 = load double** %pdexpRes, align 8
  %129 = load i32* %2, align 4
  %130 = sub nsw i32 %129, 1
  %131 = load i32* %5, align 4
  %132 = mul nsw i32 %130, %131
  %133 = sub nsw i32 %132, 1
  %134 = sext i32 %133 to i64
  call void @_Z12free_dvectorPdll(double* %128, i64 0, i64 %134)
  store i32 1, i32* %iSuccess, align 4
  %135 = load i32* %iSuccess, align 4
  ret i32 %135
}

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}

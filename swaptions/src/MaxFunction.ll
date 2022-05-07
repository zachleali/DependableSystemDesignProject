; ModuleID = 'MaxFunction.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define double @_Z4dMaxdd(double %dA, double %dB) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %dA, double* %1, align 8
  store double %dB, double* %2, align 8
  %3 = load double* %1, align 8
  %4 = load double* %2, align 8
  %5 = fcmp ogt double %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load double* %1, align 8
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load double* %2, align 8
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = phi double [ %7, %6 ], [ %9, %8 ]
  ret double %11
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}

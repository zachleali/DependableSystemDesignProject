; ModuleID = 'RanUnif.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define double @_Z7RanUnifPl(i64* %s) #0 {
  %1 = alloca i64*, align 8
  %ix = alloca i64, align 8
  %k1 = alloca i64, align 8
  %dRes = alloca double, align 8
  store i64* %s, i64** %1, align 8
  %2 = load i64** %1, align 8
  %3 = load i64* %2, align 8
  store i64 %3, i64* %ix, align 8
  %4 = load i64* %ix, align 8
  %5 = sdiv i64 %4, 127773
  store i64 %5, i64* %k1, align 8
  %6 = load i64* %ix, align 8
  %7 = load i64* %k1, align 8
  %8 = mul nsw i64 %7, 127773
  %9 = sub nsw i64 %6, %8
  %10 = mul nsw i64 16807, %9
  %11 = load i64* %k1, align 8
  %12 = mul nsw i64 %11, 2836
  %13 = sub nsw i64 %10, %12
  store i64 %13, i64* %ix, align 8
  %14 = load i64* %ix, align 8
  %15 = icmp slt i64 %14, 0
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %0
  %17 = load i64* %ix, align 8
  %18 = add nsw i64 %17, 2147483647
  store i64 %18, i64* %ix, align 8
  br label %19

; <label>:19                                      ; preds = %16, %0
  %20 = load i64* %ix, align 8
  %21 = load i64** %1, align 8
  store i64 %20, i64* %21, align 8
  %22 = load i64* %ix, align 8
  %23 = sitofp i64 %22 to double
  %24 = fmul double %23, 0x3E000000001C5F68
  store double %24, double* %dRes, align 8
  %25 = load double* %dRes, align 8
  ret double %25
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}

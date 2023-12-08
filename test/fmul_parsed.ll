; ModuleID = 'test/fmul.ll'
source_filename = "test/fmul.ll"

; Function Attrs: nounwind
define float @test1(float inreg %a) #0 {
entry:
  %b = fmul float %a, 2.000000e+00
  ret float %b
}

define float @main() {
  %a = call float @test1(float 1.230000e+02)
  ret float %a
}

attributes #0 = { nounwind }

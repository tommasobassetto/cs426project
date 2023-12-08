; ModuleID = 'test/fdiv.ll'
source_filename = "test/fdiv.ll"

; Function Attrs: nounwind
define float @test1(float inreg %a) #0 {
entry:
  %b = fdiv float %a, 5.000000e-01
  ret float %b
}

define float @main() {
  %a = call float @test1(float 1.230000e+02)
  ret float %a
}

attributes #0 = { nounwind }

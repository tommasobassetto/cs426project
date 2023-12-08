; ModuleID = 'test/fsub.ll'
source_filename = "test/fsub.ll"

; Function Attrs: nounwind
define float @test1(float inreg %a) #0 {
entry:
  %b = fsub float %a, -1.000000e+00
  ret float %b
}

define float @main() {
  %a = call float @test1(float 1.230000e+02)
  ret float %a
}

attributes #0 = { nounwind }

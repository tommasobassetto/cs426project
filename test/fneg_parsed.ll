; ModuleID = 'test/fneg.ll'
source_filename = "test/fneg.ll"

; Function Attrs: nounwind
define float @test1(float inreg %a) #0 {
entry:
  ret float -1.400000e+01
}

define float @main() {
  %a = call float @test1(float 1.230000e+02)
  ret float %a
}

attributes #0 = { nounwind }

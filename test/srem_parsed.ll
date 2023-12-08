; ModuleID = 'test/srem.ll'
source_filename = "test/srem.ll"

; Function Attrs: nounwind
define i32 @test1(i32 inreg %a) #0 {
entry:
  %b = srem i32 %a, -2
  ret i32 %b
}

define i32 @main() {
  %a = call i32 @test1(i32 123)
  ret i32 %a
}

attributes #0 = { nounwind }

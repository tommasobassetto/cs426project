; ModuleID = 'test/mul.ll'
source_filename = "test/mul.ll"

; Function Attrs: nounwind
define i32 @test1(i32 inreg %a) #0 {
entry:
  %c = mul i32 1, 2
  %b = mul i32 %a, 2
  ret i32 %b
}

define i32 @main() {
  %a = call i32 @test1(i32 123)
  ret i32 %a
}

attributes #0 = { nounwind }

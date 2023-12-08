; ModuleID = 'test/xor.ll'
source_filename = "test/xor.ll"

; Function Attrs: nounwind
define i32 @test1(i32 inreg %a) #0 {
entry:
  %b = xor i32 %a, 51
  ret i32 %b
}

define i32 @main() {
  %a = call i32 @test1(i32 4444)
  ret i32 %a
}

attributes #0 = { nounwind }

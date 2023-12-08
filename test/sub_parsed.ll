; ModuleID = 'test/sub.ll'
source_filename = "test/sub.ll"

; Function Attrs: nounwind
define i32 @test1(i32 inreg %a) #0 {
entry:
  %c = sub i32 1, 2
  %b = sub i32 %a, -1
  ret i32 %b
}

define i32 @main() {
  %a = call i32 @test1(i32 123)
  ret i32 %a
}

attributes #0 = { nounwind }

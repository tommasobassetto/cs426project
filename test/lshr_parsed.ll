; ModuleID = 'test/lshr.ll'
source_filename = "test/lshr.ll"

; Function Attrs: nounwind
define i32 @test1(i32 inreg %a) #0 {
entry:
  %b = lshr i32 %a, -3
  ret i32 %b
}

define i32 @main() {
  %a = call i32 @test1(i32 44)
  ret i32 %a
}

attributes #0 = { nounwind }

; ModuleID = 'test/add.ll'
source_filename = "test/add.ll"

; Function Attrs: nounwind
define i32 @test1(i32 inreg %0) #0 {
entry:
  %1 = add i32 %0, 3
  ret i32 %1
}

define i32 @main() {
  %1 = call i32 @test1(i32 123)
  ret i32 %1
}

attributes #0 = { nounwind }

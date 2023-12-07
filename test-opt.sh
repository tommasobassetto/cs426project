#!/usr/bin/sh
# Use this script to run MP5!
cd build
make clean && make -j
cd ..
export LLVM_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-15
opt-15 -load-pass-plugin=build/libUnitProject.so -passes="unit-licm" test/$1.ll -S -o test/$1_parsed.ll
clang-15 test/$1_parsed.ll coolrt.o -Wl,--unresolved-symbols=ignore-in-object-files -o test/a.out

echo "printed value:"
test/a.out
echo "\n"

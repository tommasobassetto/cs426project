#!/usr/bin/sh
cd build
make clean && make -j
cd ..
opt-15 -load-pass-plugin=build/libUnitProject.so -passes="unit-loopanalysis" test/$1.ll -S -o test/$1_parsed.ll
# FIXME - opt gives unknown file format
clang-15 test/$1_parsed.ll coolrt.o -o test/a.out
test/a.out
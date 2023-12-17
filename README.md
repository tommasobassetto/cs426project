From the directory containing this file, execute the following commands
```
mkdir build; cd build; cmake ..; make -j
```
This should configure and then build the four passes into a single file ``
which you'll then need to run with LLVM `opt`.
Note that you should use the `opt` of LLVM installation that `cmake` found.
If you're not certain which LLVM that is, search for `LLVM_DIR` in `build/CMakeCache.txt`.
You can run _just_ your passes like this:
```
opt-15 -load-pass-plugin=build/libUnitProject.so -passes="unit-cse,unit-sccp,unit-licm" <input> -o <output>
```
Check `test-opt.sh` for more information.

If you want to run on the testbench, you could simply run:
```
python3 runtest.py
```
Note that comments regarding the ground truth should be removed first, to get the ground truth.
Unit test cases are in `test/`. E.g., `./test-opt sccp` can test the unit sccp pass on `sccp.c`.

import os

def execute_commands():
    test_dir = "tests"
    test_dir = "mp5_testcases"
    # os.system("echo log file > gt.log")
    os.system("echo log file > ours.log")
    for filename in os.listdir(test_dir):
        if filename.endswith(".c"):
            filepath = os.path.join(test_dir, filename)
            exe_name = os.path.splitext(filename)[0]
            file_name = os.path.join(test_dir, exe_name)
            build_cmd = """cd build
                        make -j &&
                        cd .. &&
                        export LLVM_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-15
                        """
            # clang
            compile_cmd1 = f"clang-15 {file_name}.c -c -O0 -S -Xclang -disable-O0-optnone -emit-llvm -o {file_name}.ll"
            compile_cmd2 = f"clang-15 {file_name}.ll -lm -o {file_name}.gt"
            compile_sccp_cmd = f"""
                                opt-15 -passes="mem2reg" {file_name}.ll -S -o {file_name}_c.ll &&
                                opt-15 -load-pass-plugin=build/libUnitProject.so -passes="mem2reg,loop-simplify,unit-sccp,adce,simplifycfg" {file_name}_c.ll -S -o {file_name}_parsed.ll &&
                                clang-15 {file_name}_parsed.ll -lm -o {file_name}.ours
                                """
            execute_gt_cmd = f"echo {exe_name} >> gt.log && ./{file_name}.gt >> gt.log"
            execute_ours_cmd = f"echo {exe_name} >> ours.log && ./{file_name}.ours >> ours.log"

            if os.system(build_cmd) == 0:
                if os.system(compile_cmd1) == 0:
                    # if os.system(compile_cmd2) == 0:
                    #     if os.system(execute_gt_cmd) == 0:
                    #         pass
                    if os.system(compile_sccp_cmd) == 0:
                        if os.system(execute_ours_cmd) == 0:
                            pass
                        else:
                            print(f"\nRunning our program failed.")
            else:
                print(f"\nBuild pass failed.")

    if os.system("diff gt.log ours.log") == 0:
        print(f"\nTests all passed!!")
    else:
        print("Some tests failed!!")

if __name__ == "__main__":
    execute_commands()

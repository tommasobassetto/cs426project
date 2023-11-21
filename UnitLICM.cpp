// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-licm"
#include "llvm/Support/raw_ostream.h"

#include "UnitLICM.h"
#include "UnitLoopInfo.h"

#define DEBUG_TYPE UnitLICM
// Define any statistics here

using namespace llvm;
using namespace cs426;

/// Main function for running the LICM optimization
PreservedAnalyses UnitLICM::run(Function& F, FunctionAnalysisManager& FAM) {
  dbgs() << "UnitLICM running on " << F.getName() << "\n";
  // Acquires the UnitLoopInfo object constructed by your Loop Identification
  // (LoopAnalysis) pass
  UnitLoopInfo &Loops = FAM.getResult<UnitLoopAnalysis>(F);

  // Perform the optimization
  for (auto loop:Loops.program_loops){
    std::unordered_set<Value *> def_set;

    // Get all defs in the loop
    for (auto bb:loop.loopBlocks){
      for (Instruction &inst: *bb) {
        Value *operand = &cast<Value>(inst);

        // Check if the instruction is a def. If so, add it to the def set
        // Stores do not count as they are assumed to never be loop invariant
        if (operand != nullptr && !operand->getName().empty()) {
          dbgs() << "Def detected in your instruction: " << operand->getName() << "\n";
          dbgs() << "(in instruction: ";
          inst.print(dbgs());
          dbgs() << ")\n\n";

          // FIXME - detect loads, and put those in a separate set
          def_set.insert(operand);
        }
      }
    }


    // assume load/store in loop MUST stay in the loop

    // Compute which defs are loop invariant, and can be moved outside of the loop
    // Loop invariant defs are ones where the right hand side variables are not modified in the loop
    // These should be right before the start of the loop (which may not be in the preheader)
  }
  // Set proper preserved analyses
  return PreservedAnalyses::all();
}

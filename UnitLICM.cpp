// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-licm"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/raw_ostream.h"

#include "UnitLICM.h"
#include "UnitLoopInfo.h"

#include <map>

#define DEBUG_TYPE UnitLICM
// Define any statistics here
// These are not working
// STATISTIC(numHoistedLoads, "Number of loads hoisted");
// STATISTIC(numHoistedStores, "Number of stores hoisted");
// STATISTIC(numHoistedTotal, "Number of instructions hoisted");

using namespace llvm;
using namespace cs426;

std::set<Value*> getAllOperands(Instruction &inst) {
  std::set<Value*> uses_in_inst = std::set<Value*>();

  for (Value *V : inst.operands()) {
    if (V != nullptr) {
      uses_in_inst.insert(V);
    }
  }

  return uses_in_inst;
}

/// Main function for running the LICM optimization
// Note that the input must explicitly NOT be in SSA form
PreservedAnalyses UnitLICM::run(Function& F, FunctionAnalysisManager& FAM) {
  int numHoistedLoads = 0;
  int numHoistedStores = 0;
  int numHoistedTotal = 0;

  dbgs() << "UnitLICM running on " << F.getName() << "\n";

  // Acquires the UnitLoopInfo object constructed by your Loop Identification
  // (LoopAnalysis) pass
  UnitLoopInfo &Loops = FAM.getResult<UnitLoopAnalysis>(F);

  // Perform the optimization
  for (auto loop: Loops.program_loops) {
    // map from defs to uses
    std::map<Value*, std::set<Value*>> def_set = std::map<Value*, std::set<Value*>>();
    std::map<Value*, Instruction*> def_to_inst = std::map<Value*, Instruction*>();
    std::set<Value*> loop_fixed_defs = std::set<Value*>();

    std::set<Instruction*> loop_invariant_defs = std::set<Instruction*>();

    // Get all defs in the loop
    for (auto bb: loop.loopBlocks) {
      for (Instruction &inst: *bb) {
        Value *operand = &cast<Value>(inst);

        // Check if the instruction is a def. If so, add it to the def set
        if (operand != nullptr) {
          // alloca is always hoistable
          // since read from uninitialized memory is undefined behavior
          if (inst.getOpcode() == Instruction::Alloca) {
            loop_invariant_defs.insert(&inst);
            continue;
          }

          // Any branch or jump should NEVER be loop invariant
          // Same with functions like rand() that generate inconsistent output
          if (inst.isTerminator()/*|| inst.mayHaveSideEffects()*/) {
            def_set[operand] = getAllOperands(inst);
            loop_fixed_defs.insert(operand);
            continue;
          }

          def_set[operand] = getAllOperands(inst);
          def_to_inst[operand] = &inst;
        }
      }
    }
    
    // Compute which defs are loop invariant, and can be moved outside of the loop
    // Loop invariant defs are ones where the right hand side variables are not modified in the loop
    // These should be right before the start of the loop (which may not be in the preheader)
    for (auto i: def_set) {
      // for all uses that lead to this def
      bool is_loop_invariant = true;
      // FIXME - rework this using aliases
      for (Value *j: i.second) {
        // if this is in the map keys, it's edited in the loop
        // and it's not loop invariant

        // Also check that it's not an explicitly non-loop-invariant variable
        if (def_set.count(j) != 0 || loop_fixed_defs.find(j) != loop_fixed_defs.end()) {
          is_loop_invariant = false;
        }
      }

      if (is_loop_invariant && def_to_inst[i.first] != nullptr) {
        loop_invariant_defs.insert(def_to_inst[i.first]);
      }
    }

    // Move loop invariant variables into the loop preheader
    auto terminator = loop.loopPreheader->getTerminator()->getIterator();
    for (auto inst: loop_invariant_defs) {
      dbgs() << inst << " " << *inst << " is a loop invariant def\n";

      if (inst->getOpcode() == Instruction::Load) numHoistedLoads += 1;
      if (inst->getOpcode() == Instruction::Store) numHoistedStores += 1;

      inst->removeFromParent();
      loop.loopPreheader->getInstList().insert(terminator, inst);
      numHoistedTotal += 1;
    }

  }

  dbgs() << "LICM pass finished running.\n";
  dbgs() << "Stats: " << numHoistedLoads << " loads hoisted, " 
    << numHoistedStores << " stores hoisted, "
    << numHoistedTotal << " total instructions hoisted.\n";

  // Set proper preserved analyses
  return PreservedAnalyses::all();
}

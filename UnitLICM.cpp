// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-licm"
#include "llvm/Support/raw_ostream.h"

#include "UnitLICM.h"
#include "UnitLoopInfo.h"

#include <map>

#define DEBUG_TYPE UnitLICM
// Define any statistics here

using namespace llvm;
using namespace cs426;

/// Main function for running the LICM optimization
// Note that the input must explicitly NOT be in SSA form
PreservedAnalyses UnitLICM::run(Function& F, FunctionAnalysisManager& FAM) {
  dbgs() << "UnitLICM running on " << F.getName() << "\n";
  unsigned numHoistedLoads = 0;
  unsigned numHoistedStores = 0;
  unsigned numHoistedOther = 0;

  // Acquires the UnitLoopInfo object constructed by your Loop Identification
  // (LoopAnalysis) pass
  UnitLoopInfo &Loops = FAM.getResult<UnitLoopAnalysis>(F);

  // Perform the optimization
  for (auto loop: Loops.program_loops) {
    // map from defs to uses
    std::map<StringRef, std::set<StringRef>> def_set = std::map<StringRef, std::set<StringRef>>();
    std::map<StringRef, Instruction*> def_to_inst = std::map<StringRef, Instruction*>();
    std::set<StringRef> loop_fixed_defs = std::set<StringRef>();

    // Get all defs in the loop
    for (auto bb: loop.loopBlocks) {
      for (Instruction &inst: *bb) {
        Value *operand = &cast<Value>(inst);

        // Check if the instruction is a def. If so, add it to the def set
        // Stores do not count as they are assumed to never be loop invariant
        if (operand != nullptr && !operand->getName().empty()) {
          // If it's a load or store, don't process it
          // FIXME - add alias analysis
          if (inst.getOpcode() == Instruction::Store) {
            dbgs() << "Store detected:" << inst << "\n";
            loop_fixed_defs.insert(operand->getName());
            continue;
          }

          if (inst.getOpcode() == Instruction::Load) {
            loop_fixed_defs.insert(operand->getName());
            continue;
          }

          std::set<StringRef> uses_in_inst = std::set<StringRef>();

          for (Value *V : inst.operands()) {
            if (V != nullptr && !V->getName().empty()) {
              uses_in_inst.insert(V->getName());
            }
          }

          def_set[operand->getName()] = uses_in_inst;
          def_to_inst[operand->getName()] = &inst;
        }
      }
    }

    std::set<Instruction*> loop_invariant_defs = std::set<Instruction*>();
    
    // Compute which defs are loop invariant, and can be moved outside of the loop
    // Loop invariant defs are ones where the right hand side variables are not modified in the loop
    // These should be right before the start of the loop (which may not be in the preheader)
    for (auto i: def_set) {
      // for all uses that lead to this def
      bool is_loop_invariant = true;
      for (StringRef j: i.second) {
        // if this is in the map keys, it's edited in the loop
        // and it's not loop invariant

        // Also check that it's not an explicitly non-loop-invariant variable
        if (def_set.count(j) != 0 || loop_fixed_defs.find(j) != loop_fixed_defs.end()) {
          is_loop_invariant = false;
        }
      }

      if (is_loop_invariant) {
        loop_invariant_defs.insert(def_to_inst[i.first]);
      }
    }

    // Move loop invariant variables into a block right before the loop header
    for (auto i: loop_invariant_defs) {
      dbgs() << "detected loop invariant def:" << i << "\n";
    }

    for (auto inst: loop_invariant_defs) {
      dbgs() << inst << " " << *inst << " is a loop invariant def\n";

      if (inst->getOpcode() == Instruction::Load) numHoistedLoads += 1;
      if (inst->getOpcode() == Instruction::Store) numHoistedStores += 1;

      inst->removeFromParent();
      loop.loopPreheader->getInstList().push_front(inst);
      numHoistedOther += 1;
    }

  }

  dbgs() << "LICM pass finished running.\n";
  dbgs() << "Stats: " << numHoistedLoads << " loads hoisted, " 
    << numHoistedStores << " stores hoisted, "
    << numHoistedOther << " total instructions hoisted.\n";
  // Set proper preserved analyses
  return PreservedAnalyses::all();
}

// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-licm"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/raw_ostream.h"

#include "UnitLICM.h"
#include "UnitLoopInfo.h"

#include <map>

#define DEBUG_TYPE "UnitLICM"
// Define any statistics here
STATISTIC(numHoistedLoads, "Number of loads hoisted");
STATISTIC(numHoistedStores, "Number of stores hoisted");
STATISTIC(numHoistedTotal, "Number of instructions hoisted");
STATISTIC(numHoistedComputational, "Number of computational instructions hoisted");

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
  /*int numHoistedLoads = 0;
  int numHoistedStores = 0;
  int numHoistedTotal = 0;*/

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
          if (inst.isTerminator() || inst.mayHaveSideEffects() 
          || inst.getOpcode() == Instruction::Load || inst.getOpcode() == Instruction::Store) {
            def_set[operand] = getAllOperands(inst);
            loop_fixed_defs.insert(operand);
            continue;
          }
          
          if (def_set.find(operand) == def_set.end()) def_set[operand] = std::set<Value*>();

          def_set[operand] = getAllOperands(inst);
          def_to_inst[operand] = &inst;
        }
      }
    }

    AAResults &AA = FAM.getResult<AAManager>(F);
    
    // Compute which defs are loop invariant, and can be moved outside of the loop
    // Loop invariant defs are ones where the right hand side variables are not modified in the loop
    // These should be moved right before the start of the loop (which may not be in the preheader)
    for (auto i: def_set) {
      // for all uses that lead to this def
      bool is_loop_invariant = true;
      for (Value *j: i.second) {
        // if this is not in map keys, it may be loop invariant
        if (def_set.count(j) == 0) {
          continue;
        }

        for (auto item: def_set) {
          if (item.first == j || !AA.isNoAlias(item.first, j)) {
            is_loop_invariant = false;
          }
        }

        for (auto item: loop_fixed_defs) {
          if (item == j || !AA.isNoAlias(item, j)) {
            is_loop_invariant = false;
          }
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

      if (inst->getOpcode() == Instruction::Load) numHoistedLoads ++;
      if (inst->getOpcode() == Instruction::Store) numHoistedStores ++;
      if (dyn_cast<UnaryInstruction>(inst) || 
        inst->isBinaryOp(inst->getOpcode())) numHoistedComputational++;

      inst->removeFromParent();
      loop.loopPreheader->getInstList().insert(terminator, inst);
      numHoistedTotal ++;
    }

  }

  dbgs() << "LICM pass finished running.\n";
  dbgs() << "Cumulative stats: " << numHoistedLoads << " loads hoisted, " 
    << numHoistedStores << " stores hoisted, "
    << numHoistedComputational << " computational instructions hoisted, "
    << numHoistedTotal << " total instructions hoisted.\n";

  // Set proper preserved analyses
  return PreservedAnalyses::all();
}

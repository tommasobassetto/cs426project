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
PreservedAnalyses UnitLICM::run(Function& F, FunctionAnalysisManager& FAM) {
  dbgs() << "UnitLICM running on " << F.getName() << "\n";
  // Acquires the UnitLoopInfo object constructed by your Loop Identification
  // (LoopAnalysis) pass
  UnitLoopInfo &Loops = FAM.getResult<UnitLoopAnalysis>(F);

  // Perform the optimization
  // FIXME - handle nested loops by recomputing loop analysis at every iteration
  for (auto loop:Loops.program_loops){
    // map from defs to uses
    std::map<StringRef, std::set<StringRef>> def_set = std::map<StringRef, std::set<StringRef>>();
    std::set<StringRef> loop_fixed_defs = std::set<StringRef>();

    // Get all defs in the loop
    for (auto bb:loop.loopBlocks){
      for (Instruction &inst: *bb) {
        Value *operand = &cast<Value>(inst);

        // Check if the instruction is a def. If so, add it to the def set
        // Stores do not count as they are assumed to never be loop invariant
        if (operand != nullptr && !operand->getName().empty()) {
          // If it's a load or store, don't process the loop
          if (
            inst.getOpcode() == Instruction::Store
          ) {
            dbgs() << "Load/store instruction detected. Stopping processing for this loop.\n";
            continue;
          }

          if (
            inst.getOpcode() == Instruction::Load
          ) {
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
        }
      }
    }

    std::set<StringRef> loop_invariant_defs = std::set<StringRef>();
    
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
        loop_invariant_defs.insert(i.first);
        // FIXME - remove this from the set
        // FIXME - iterate until we reach a steady state
      }
    }

    // Move loop invariant variables into a block right before the loop header
    // Create a basic block that will always come right before the loop header
    // move all edges that are not the back edge to it
    BasicBlock *loop_def_stash = BasicBlock::Create(
      loop.loopHeader->getContext(),
      "loop_def_stash",
      loop.loopHeader->getParent()
    );

    for (auto i: loop_invariant_defs) {
      dbgs() << "detected loop invariant def:" << i << "\n";
    }

    for (BasicBlock *pred : predecessors(loop.loopHeader)) {
        Instruction *terminator = pred->getTerminator();
        dbgs() << "terminator = " << *terminator << "\n";
        dbgs() << "of basic block" << *pred << "\n";
        if (pred != loop.back_edge_start) {
          dbgs() << "processing successor...\n";
          // Move all predecessors to the stash block
          // except the loop back edge
          for (unsigned i = 0; i < terminator->getNumSuccessors(); ++i) {
              if (terminator->getSuccessor(i) == loop.loopHeader) {
                  terminator->setSuccessor(i, loop_def_stash);
              }
          }
        }
    }

    // FIXME - Move loop invariant instructions into loop_def_stash

    if (!loop_def_stash->empty()) {
      Instruction *terminator = loop_def_stash->getTerminator();
      terminator->setSuccessor(0, loop.loopHeader);
    } else {
      dbgs() << "loop def stash was empty\n";
    }

    
  }
  // Set proper preserved analyses
  return PreservedAnalyses::all();
}

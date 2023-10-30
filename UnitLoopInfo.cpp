#include "llvm/IR/Dominators.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

#include "UnitLoopInfo.h"

#include <iostream>

using namespace llvm;
using namespace cs426;

/// Main function for running the Loop Identification analysis. This function
/// returns information about the loops in the function via the UnitLoopInfo
/// object
UnitLoopInfo UnitLoopAnalysis::run(Function &F, FunctionAnalysisManager &FAM) {
  dbgs() << "UnitLoopAnalysis running on " << F.getName() << "\n";
  // Acquires the Dominator Tree constructed by LLVM for this function. You may
  // find this useful in identifying the natural loops
  DominatorTree &DT = FAM.getResult<DominatorTreeAnalysis>(F);

  F.getEntryBlock();

  // for all basic blocks (in the dominator tree)
  for (
    auto i = GraphTraits<DominatorTree*>::nodes_begin(&DT); 
    i != GraphTraits<DominatorTree*>::nodes_end(&DT); 
    ++i) {

    BasicBlock *block = i->getBlock();
    auto children = successors(block);

    for (auto child: children) {
      // check if child dominates current block
      if (DT.dominates(child, block)) {
        SingleLoopInfo current_loop = SingleLoopInfo();
        current_loop.loopHeader = child;
        current_loop.loopBlocks.push_back(child);
        
        std::cout << "Back edge detected!\n";
      }
    }

    if (F.getName() == "Main.main") {
      std::cout << "\n\n\nDetected basic block at\n";
      block->print(dbgs());
    }
  }
  
  UnitLoopInfo Loops = UnitLoopInfo();
  // Fill in appropriate information

  // For every  

  return Loops;
}

AnalysisKey UnitLoopAnalysis::Key;

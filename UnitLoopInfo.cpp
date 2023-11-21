#include "llvm/IR/Dominators.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

#include "UnitLoopInfo.h"

#include <iostream>
#include <queue>

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
  UnitLoopInfo Loops = UnitLoopInfo();

  // for all basic blocks (in the dominator tree)
  for (
    auto i = GraphTraits<DominatorTree*>::nodes_begin(&DT); 
    i != GraphTraits<DominatorTree*>::nodes_end(&DT); 
    ++i) {
    BasicBlock *block = i->getBlock();
    auto children = successors(block);

    for (auto child: children) {
      // check if child dominates current block
      // if so, this means there's a back edge
      if (DT.dominates(child, block)) {
        // setup header and preheader information
        SingleLoopInfo current_loop = SingleLoopInfo();
        current_loop.loopPreheader = i->getIDom()->getBlock();
        current_loop.loopHeader = child;
        current_loop.back_edge_start = block;
        current_loop.loopBlocks.push_back(child);

        // get the list of all basic blocks in the loop
        // by using reachability analysis
        std::unordered_set<BasicBlock *> reachable_set;
        std::queue<BasicBlock *> worklist;
        worklist.push(current_loop.loopHeader);

        // all basic blocks reachable from loop header
        while (!worklist.empty()) {
          BasicBlock *front = worklist.front();
          worklist.pop();
          for (BasicBlock *succ : successors(front)) {
            if (reachable_set.count(succ) == 0) {
              /// We need the check here to ensure that we don't run 
              /// infinitely if the CFG has a loop in it
              /// i.e. the BB reaches itself directly or indirectly
              worklist.push(succ);
              reachable_set.insert(succ);
            }
          }

          // for each block, check if it can reach the loop header
          if (isReachable(front,current_loop.loopHeader) && front!=current_loop.loopHeader){
            current_loop.loopBlocks.push_back(front);
          }
        }
        
        Loops.program_loops.push_back(current_loop);        
      }
    }
  }

  return Loops;
}

// https://stackoverflow.com/questions/69010453/how-to-obtain-the-basic-blocks-that-are-reachable-from-basic-block-a
bool UnitLoopAnalysis::isReachable(BasicBlock *concern, BasicBlock *target){
  std::unordered_set<BasicBlock *> reachable_set;
  std::queue<BasicBlock *> worklist;
  worklist.push(concern);
  while (!worklist.empty()) {
    BasicBlock *front = worklist.front();
    worklist.pop();
    for (BasicBlock *succ : successors(front)) {
      if (reachable_set.count(succ) == 0) {
        /// We need the check here to ensure that we don't run 
        /// infinitely if the CFG has a loop in it
        /// i.e. the BB reaches itself directly or indirectly
        worklist.push(succ);
        reachable_set.insert(succ);
      }
    }
    if (front == target){
      return true;
    }
  }
  return false;
}
AnalysisKey UnitLoopAnalysis::Key;

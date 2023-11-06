#include "llvm/IR/Dominators.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"

#include "UnitLoopInfo.h"

#include <iostream>
#include <unordered_set>
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
      if (DT.dominates(child, block)) {
        SingleLoopInfo current_loop = SingleLoopInfo();
        current_loop.loopHeader = child;
        current_loop.loopBlocks.push_back(child);

        std::unordered_set<BasicBlock *> reachable_set;
        std::queue<BasicBlock *> worklist;
        worklist.push(current_loop.loopHeader);
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
          if (isReachable(front,current_loop.loopHeader) && front!=current_loop.loopHeader){
            current_loop.loopBlocks.push_back(front);
          }
        }
        // std::cout << "Back edge detected!\n";
        Loops.program_loops.push_back(current_loop);
        // std::cout << "################## of current loop:" << current_loop.loopBlocks.size()<<std::endl;
        for (auto *it : current_loop.loopBlocks ){
          if (it == current_loop.loopHeader){}
        //   std::cout << "TTTTTTTTTTRUE" << std::endl;
        //   std::cout << "CCCCCCCCCCCCC" << std::endl;
        // it->print(dbgs());

        }
        
      }
    }
    // if (F.getName() == "Main.main") {
    //   std::cout << "\n\n\nDetected basic block at\n";
    //   block->print(dbgs());
    // }
  }
  
  // Fill in appropriate information

  // For every  

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

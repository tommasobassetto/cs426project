#ifndef INCLUDE_UNIT_LOOP_INFO_H
#define INCLUDE_UNIT_LOOP_INFO_H
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Instruction.h"

#include <vector>
#include <unordered_set>

using namespace llvm;

namespace cs426 {
/// An object holding information about the (natural) loops in an LLVM
/// function. At minimum this will need to identify the loops, may hold
/// additional information you find useful for your LICM pass
class SingleLoopInfo {
  public:
  BasicBlock *loopHeader = NULL;
  std::vector<BasicBlock*> loopBlocks = {};
  BasicBlock* loopPreheader = NULL;
};

class UnitLoopInfo {
  // Define this class to provide the information you need in LICM
  public:
  UnitLoopInfo() = default;

  std::vector<SingleLoopInfo> program_loops = {};

};

/// Loop Identification Analysis Pass. Produces a UnitLoopInfo object which
/// should contain any information about the loops in the function which is
/// needed for your implementation of LICM
class UnitLoopAnalysis : public AnalysisInfoMixin<UnitLoopAnalysis> {
  friend AnalysisInfoMixin<UnitLoopAnalysis>;
  static AnalysisKey Key;

public:
  typedef UnitLoopInfo Result;

  UnitLoopInfo run(Function &F, FunctionAnalysisManager &AM);
  bool isReachable(BasicBlock *concern, BasicBlock *target);
};
} // namespace
#endif // INCLUDE_UNIT_LOOP_INFO_H

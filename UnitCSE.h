#ifndef INCLUDE_UNIT_CSE_H
#define INCLUDE_UNIT_CSE_H
#include "llvm/IR/PassManager.h"

using namespace llvm;

namespace cs426 {
/// Common Subexpression Elimination Optimization Pass
struct UnitCSE : PassInfoMixin<UnitCSE> {
  PreservedAnalyses run(Function& F, FunctionAnalysisManager& FAM);
};

class UnitCSEInfo {
  public:
  UnitCSEInfo() = default;
  std::vector<Instruction*> uniqueInsts; // worklist for all instructions
  // this is a vector instead of a set
  int findSameInst(Instruction* inst, std::vector<Instruction*> uniqueInsts);
};
} // namespace

#endif // INCLUDE_UNIT_CSE_H

#ifndef INCLUDE_UNIT_CSE_H
#define INCLUDE_UNIT_CSE_H
#include "llvm/IR/PassManager.h"

using namespace llvm;

namespace cs426 {
/// Common Subexpression Elimination Optimization Pass
struct UnitCSE : PassInfoMixin<UnitCSE> {
  PreservedAnalyses run(Function& F, FunctionAnalysisManager& FAM);
};
} // namespace

#endif // INCLUDE_UNIT_CSE_H

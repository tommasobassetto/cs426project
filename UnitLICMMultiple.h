#ifndef INCLUDE_UNIT_LICM_MULTIPLE_H
#define INCLUDE_UNIT_LICM_MULTIPLE_H
#include "llvm/IR/PassManager.h"
#include "llvm/IR/Instructions.h"

using namespace llvm;

namespace cs426 {
/// Loop Invariant Code Motion Optimization Pass
struct UnitLICMMultiple : PassInfoMixin<UnitLICMMultiple> {
  PreservedAnalyses run(Function& F, FunctionAnalysisManager& FAM);
};
} // namespace

#endif // INCLUDE_UNIT_LICM_H

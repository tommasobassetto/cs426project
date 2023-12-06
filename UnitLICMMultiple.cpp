// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-licm-multiple"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include "llvm/Transforms/Utils/Cloning.h"

#include "UnitLICM.h"
#include "UnitLICMMultiple.h"
#include "UnitLoopInfo.h"

#include <map>

#define DEBUG_TYPE UnitLICMMultiple
// Define any statistics here

using namespace llvm;
using namespace cs426;

/// Main function for running the LICM optimization
// Note that the input must explicitly NOT be in SSA form
PreservedAnalyses UnitLICMMultiple::run(Function& F, FunctionAnalysisManager& FAM) {
  dbgs() << "UnitLICMMultiple running on " << F.getName() << "\n";

  // Run LICM until convergence
  // FIXME - check for convergence
  Function *Copy;
  UnitLICM licm = UnitLICM();
  for (int i = 0; i < 5; i++) {
    licm.run(F, FAM);
  }

  return PreservedAnalyses::all();
}

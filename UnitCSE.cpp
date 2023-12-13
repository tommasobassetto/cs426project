#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/raw_ostream.h"

#include "UnitCSE.h"
#include "UnitLoopInfo.h"

#include <map>

#define DEBUG_TYPE "UnitCSE"
// Define any statistics here
STATISTIC(NumInstrCSE, "Number of instructions eliminated");

using namespace llvm;
using namespace cs426;
PreservedAnalyses UnitCSE::run(Function& F, FunctionAnalysisManager& FAM) {
  dbgs() << "UnitCSE running on " << F.getName() << "\n";
  return PreservedAnalyses::all();
}

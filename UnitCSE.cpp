#include "llvm/IR/Instructions.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Dominators.h"

#include "UnitCSE.h"
#include "UnitLoopInfo.h"

#include <map>

#define DEBUG_TYPE "UnitCSE"
// Define any statistics here
STATISTIC(NumInstCSE, "Number of instructions eliminated");
using namespace llvm;
using namespace cs426;

int UnitCSEInfo::findIdenticalInst(Instruction* inst, std::vector<Instruction*> uniqueInsts){
  auto type = inst->getType();
  auto opcode = inst->getOpcode();
  auto numOperands = inst->getNumOperands();
  for (size_t i=0;i<uniqueInsts.size();i++){
    auto uInst = uniqueInsts[i];
    if(uInst->getType() == type && uInst->getOpcode() == opcode && uInst->getNumOperands() == numOperands){
      // test whether operands are the same
      bool match = true;
      for (size_t j=0; j<numOperands;j++){
        if(uInst->getOperand(j) != inst->getOperand(j)){
          match = false;
          break;
        }
      }
      if (match){
        return i;
      }
    }
  }
  return -1;
}

int UnitCSEInfo::findCommunativeInst(Instruction* inst, std::vector<Instruction*> uniqueInsts){
  if (!inst->isCommutative()) return -1;
  auto type = inst->getType();
  auto opcode = inst->getOpcode();
  auto numOperands = inst->getNumOperands();
  for (size_t i=0;i<uniqueInsts.size();i++){
    auto uInst = uniqueInsts[i];
    if(uInst->getType() == type && uInst->getOpcode() == opcode && uInst->getNumOperands() == numOperands){
      // test communative
      // fadd a,b == fadd b,a
      bool match = true;
      if (BinaryOperator *binaryOp = dyn_cast<BinaryOperator>(inst)){
        // if(binaryOp->isCommutative()) {
          // outs() << "+++++++++++ isCommutative Inst: " << * inst << "\n";
          assert (numOperands==2);
          for (size_t j=0; j<numOperands;j++){
            if(uInst->getOperand(j) != inst->getOperand(numOperands-j-1)){
              // acutally this is always numOperands == 2?
              match = false;
              break;
            }
          }
          if (match){
            return i;
          }
        // }
      }
      // todo: process fmulfadd?
      // else if (IntrinsicInst *inInst = dyn_cast<IntrinsicInst>(inst)){
      //   if (numOperands >= 2){// fmulfadd

      //   }
      //   outs() << "+++++++++++ what is this: " << * inst << "\n";
      // }
    }
  }
  return -1;
}

PreservedAnalyses UnitCSE::run(Function& F, FunctionAnalysisManager& FAM) {
  dbgs() << "UnitCSE running on " << F.getName() << "\n";
  UnitCSEInfo Cse = UnitCSEInfo();
  DominatorTree &DT = FAM.getResult<DominatorTreeAnalysis>(F);
  // for all basic blocks (in the dominator tree)
  for (
    auto i = GraphTraits<DominatorTree*>::nodes_begin(&DT); 
    i != GraphTraits<DominatorTree*>::nodes_end(&DT); 
    ++i) {
    BasicBlock *block = i->getBlock();

  // for (BasicBlock &bb : F){
    for (Instruction &inst : *block) {
      if (!inst.getType()->isVoidTy() && !inst.mayReadOrWriteMemory() && !inst.mayHaveSideEffects()){// this means it is an assignment
        // and should not be volatile!!
        for (User *user: inst.users()){
          auto userInst = dyn_cast<Instruction>(user);
          if (userInst->isVolatile())
          // outs()<< "Volatile detected!! "<< *userInst<<"\n";
          // direct go to the end of the loop
          goto nextInst;
        }
        // do not touch alloca as well
        if (dyn_cast<AllocaInst>(&inst)){
          goto nextInst;
        }
        // outs() << inst << "\n";
        int match = Cse.findIdenticalInst(&inst, Cse.uniqueInsts);
        // outs()<< "matched iden = "<< match<<"\n";
        if (match == -1){
          match = Cse.findCommunativeInst(&inst, Cse.uniqueInsts);
        }
        // outs()<< "matched iden = "<< match<<"\n";
        if (match != -1){
          // found at least one pattern
          // replace all its use
          // outs()<< "matched "<< match<<"\n";
        for (User *user: inst.users()){
          auto userInst = dyn_cast<Instruction>(user);
          // outs()<< "UUUUUUUUUUUser detected!! "<< *userInst<<"\n";
        }
          // outs()<< "TTTTTo replace with "<< *Cse.uniqueInsts[match]<<"\n";
          if (DT.dominates((Cse.uniqueInsts[match])->getParent(), block) && !inst.mayReadOrWriteMemory()){
          // outs()<< "REPLACE! with "<< *Cse.uniqueInsts[match]<< "\n";
          inst.replaceAllUsesWith(Cse.uniqueInsts[match]);
          NumInstCSE++;

          }
        }
        else{
          // (match==-1), unique
          Cse.uniqueInsts.push_back(&inst);
        }
      }
      nextInst: ;
      // DominatorTree is not used, but CEs across BBs are actually detected!
    }
  }
  return PreservedAnalyses::all();
}

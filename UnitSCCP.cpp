// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-sccp"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Instructions.h"
// for evaluator
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"

#include <map>
#include <set>

#include "UnitSCCP.h"

#define DEBUG_TYPE UnitSCCP
// Define any statistics here

using namespace llvm;
using namespace cs426;

UnitSCCPInfo::ValueType UnitSCCPInfo::meet(Value_ first, Value_ second) {
  if (first.type == BOTTOM || second.type == BOTTOM) {
    return BOTTOM;
  }

  if (first.type == TOP && second.type == TOP) {
    return TOP;
  }

  if ((first.type == CONSTANT && second.type == TOP) &&
      (second.type == CONSTANT && first.type == TOP)) {
    return CONSTANT;
  }

  if (first.type == CONSTANT && second.type == CONSTANT &&
    first.value == second.value) {
      return CONSTANT;
    }

  return BOTTOM;
}


UnitSCCPInfo::Value_ UnitSCCPInfo::evaluate(Instruction *inst) {
  // FIXME
  // check https://llvm.org/doxygen/classllvm_1_1Interpreter.html
  // note: visit instruction is built in
  // interpret.evaluate?
  // execution engine?
  // todo: delete the instrution with const
  LLVMContext context;
  if (BinaryOperator *binaryOp = dyn_cast<BinaryOperator>(inst)){
        Value *op1 = binaryOp->getOperand(0);
        Value *op2 = binaryOp->getOperand(1);
        Value *const1 = nullptr;
        Value *const2 = nullptr;

  outs() << "in binary\n";
  if (isa<Constant>(op1)){
    const1 = op1;
  }
  else {
    // check values in the map
    auto const_value_ = constant_map.find(op1);
    if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
      // in our map
      const1 = const_value_->second.value;
    }
  }
  if(const1) outs() << "!!!op1 is constant:" << *const1 << "\n";
  if (isa<Constant>(op2)){
    const2 = op2;
  }
  else {
    // check values in the map
    auto const_value_ = constant_map.find(op2);
    if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
      // in our map
      const2 = const_value_->second.value;
    }
  }
  if(const2)  outs() << "!!!op2 is constant:" << *const2 << "\n";
    // return BinaryOperator::CreateAdd(op1, op2, "add_result", inst);
  if(const1 && const2){
    int64_t ValueArg1;
    int64_t ValueArg2;
  if (ConstantInt *ConstantArg1 = dyn_cast<ConstantInt>(const1)) {
      if (ConstantInt *ConstantArg2 = dyn_cast<ConstantInt>(const2)) {
          ValueArg1 = ConstantArg1->getSExtValue();
          ValueArg2 = ConstantArg2->getSExtValue();
      }
  }
  // both are constants, add the result to the map
  // perform real operation
  // binary comes from https://llvm.org/docs/LangRef.html#binary-operations
  // first, integer
  if (binaryOp->getOpcode() == Instruction::Add) {
    // Value* result = BinaryOperator::CreateAdd(op1, op2, "add_result", inst);
    int64_t result = ValueArg1 + ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    // Value * ret = ConstantInt::get(Type::getInt64Ty(context), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    outs() << "!add detected\n";
    outs() << "!!!result name:" << ret_value_.varname << "\n";
    outs() << "!!!result is constant:" << *ret_value_.value << "\n";
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::Sub) {
    int64_t result = ValueArg1 - ValueArg2;
    Value *ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::Mul) {
    int64_t result = ValueArg1 * ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::UDiv) {
    int64_t result = ValueArg1 / ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  // TODO: can't understand what happens to results
  else if (binaryOp->getOpcode() == Instruction::UDiv) {
    int64_t result = (uint64_t)ValueArg1 / (uint64_t)ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::SDiv) {
    int64_t result = ValueArg1 / ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::URem) {
    uint64_t result = (uint64_t)ValueArg1 % (uint64_t)ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::SRem) {
    int64_t result = ValueArg1 % ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::Shl) {
    int64_t result = ValueArg1 << ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::LShr) {
    int64_t result = (uint64_t)ValueArg1 >> ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::AShr) {
    int64_t result = ValueArg1 >> ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::And) {
    int64_t result = ValueArg1 & ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::Or) {
    int64_t result = ValueArg1 | ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
  else if (binaryOp->getOpcode() == Instruction::Xor) {
    int64_t result = ValueArg1 ^ ValueArg2;
    Value * ret = ConstantInt::get(inst->getType(), result);
    Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
    constant_map.insert({inst,ret_value_});
    return ret_value_;
  }
 }
}
/*or binary operator?
    // Handle binary operations
    if (BinaryOperator *binaryOp = dyn_cast<BinaryOperator>(inst)) {
        Value *op1 = binaryOp->getOperand(0);
        Value *op2 = binaryOp->getOperand(1);
        
        if (binaryOp->getOpcode() == Instruction::Add) {
            return BinaryOperator::CreateAdd(op1, op2, "add_result", inst);
        } else if (binaryOp->getOpcode() == Instruction::Sub) {
            return BinaryOperator::CreateSub(op1, op2, "sub_result", inst);
        } else if (binaryOp->getOpcode() == Instruction::Mul) {
            return BinaryOperator::CreateMul(op1, op2, "mul_result", inst);
        } else if (binaryOp->getOpcode() == Instruction::SDiv) {
            return BinaryOperator::CreateSDiv(op1, op2, "sdiv_result", inst);
        } else if (binaryOp->getOpcode() == Instruction::SRem) {
            return BinaryOperator::CreateSRem(op1, op2, "srem_result", inst);
        } else {
            // Unsupported operation
            return nullptr;
        }
    }

    // Handle branch instructions (icmp followed by br)
    if (BranchInst *branchInst = dyn_cast<BranchInst>(inst)) {
        if (branchInst->isConditional()) {
            ICmpInst *icmpInst = dyn_cast<ICmpInst>(branchInst->getCondition());
            if (!icmpInst) {
                // Not an icmp instruction
                return nullptr;
            }

            Value *op1 = icmpInst->getOperand(0);
            Value *op2 = icmpInst->getOperand(1);
            ICmpInst::Predicate pred = icmpInst->getPredicate();

            if (pred == ICmpInst::ICMP_EQ) {
                return new ICmpInst(*branchInst, CmpInst::ICMP_EQ, op1, op2, "icmp_eq_result");
            } else if (pred == ICmpInst::ICMP_NE) {
                return new ICmpInst(*branchInst, CmpInst::ICMP_NE, op1, op2, "icmp_ne_result");
            } else if (pred == ICmpInst::ICMP_SLT) {
                return new ICmpInst(*branchInst, CmpInst::ICMP_SLT, op1, op2, "icmp_slt_result");
            } else if (pred == ICmpInst::ICMP_SLE) {
                return new ICmpInst(*branchInst, CmpInst::ICMP_SLE, op1, op2, "icmp_sle_result");
            } else if (pred == ICmpInst::ICMP_SGT) {
                return new ICmpInst(*branchInst, CmpInst::ICMP_SGT, op1, op2, "icmp_sgt_result");
            } else if (pred == ICmpInst::ICMP_SGE) {
                return new ICmpInst(*branchInst, CmpInst::ICMP_SGE, op1, op2, "icmp_sge_result");
            } else {
                // Unsupported predicate
                return nullptr;
            }
        }
    }

    // Unhandled instruction
    return nullptr;
    */
  // if(const1){

  // }
  auto value = UnitSCCPInfo::Value_();
  value.type = UnitSCCPInfo::BOTTOM;
  return value;
}

std::set<Instruction*> UnitSCCPInfo::successors_(Instruction *inst) {
  std::set<Instruction*> next_instrs = std::set<Instruction*>();

  // if there's a branch we need both sides of the branch
  if (isa<BranchInst>(inst)) {
    BasicBlock *BB = inst->getParent();
    for (auto successor: successors(BB)) {
      next_instrs.insert(&successor->front());
    }
  } else {
    next_instrs.insert(inst->getNextNode());
  }
  return next_instrs;
}

void UnitSCCPInfo::visitInst(Instruction *inst) {
  Value_ val = evaluate(inst);
  Value_ valPrev;

  try {
    valPrev = latCell.at(inst);
  } catch (const std::out_of_range& e) {
    valPrev = Value_();
    valPrev.type = TOP;
  };

  latCell[inst] = val;

  if (val != valPrev) {
    // check if it's an assignment by checking if the return type is non-void
    if (!inst->getType()->isVoidTy()) {
      // add SSAOutEdges(S) to SSAWL
      for (User *user: inst->users()) {
        // outs()<< "--dyn cast here!  \n";
        outs()<<  isa<PHINode>(user) << "\n";
        ssaWL.push_back(
          
          Edge(inst, dyn_cast<Instruction>(user))
        );
      }
    } else { // S is a branch instruction
      if (val.type == CONSTANT) {
        // FIXME - add constant outgoing edge to flowWL
      } else {
        for (Instruction *successor: successors_(inst)) {
          flowWL.push_back(Edge(inst, successor));
        }
      }
    }
  }
}

void UnitSCCPInfo::visitPhi(Instruction *inst) {
  // FIXME - convert inst to a phi - DONE
  PHINode *phi = dyn_cast<PHINode>(inst);
  unsigned numOperands = phi->getNumIncomingValues();

  for (unsigned i = 0; i < numOperands; ++i) {
    Value *incomingValue = phi->getIncomingValue(i);
  }
}

/// Main function for running the SCCP optimization
PreservedAnalyses UnitSCCP::run(Function& F, FunctionAnalysisManager& FAM) {
  dbgs() << "UnitSCCP running on " << F.getName() << "\n";
  UnitSCCPInfo Sccp = UnitSCCPInfo();
  // Initialize values
  // execFlags = std::map<Edge, bool>();
  // latCell = std::map<Instruction*, Value_>();

  // flowWL = {};
  // ssaWL = {};

  std::set<Instruction*> visited = std::set<Instruction*>();

  // visit the first instruction
  Instruction *first = &F.front().front();
  // outs() << "visit first inst\n";
  Sccp.visitInst(first);
  // outs() << "first inst passed\n";

  // find the successors of the inst
  // add the edges to flowWL
  for (auto successor: Sccp.successors_(first)) {
    Sccp.flowWL.push_back(UnitSCCPInfo::Edge(
      first, successor
    ));
  }

  // main loop of SCCP
  while (!Sccp.flowWL.empty() || !Sccp.ssaWL.empty()) {
    outs() << "+++++loop starts \n";
    if (!Sccp.flowWL.empty()) {
      UnitSCCPInfo::Edge edge = Sccp.flowWL.back();
      // possible that edge.second == nullptr for
      // this is the last instrction
      Sccp.flowWL.pop_back();
      // here just continue
      // i.e., *edge.first = ret i32 %b, no edge.second
      if (edge.second == nullptr)
        continue;
      // outs() << "check edge >>> inst 1: " << *edge.first << "\t||| inst 2: " << *edge.second << "\n";

      try {
        if (Sccp.execFlags.at(edge)) continue;
      } catch (const std::out_of_range& e) {
        // false by default, so continue on current iteration
      };
      Sccp.execFlags[edge] = true;
    // crash here edge.second
      if (isa<PHINode>(edge.second)) {
        outs() << "visit phi 1 \n";
        Sccp.visitPhi(edge.second);
      }
      // FIXME - is this supposed to be else if?
      if (!visited.contains(edge.second)) {
        outs() << "visit inst in the main loop\n";
        outs() << "inst: " << *edge.second << "\n";
        Sccp.visitInst(edge.second);
        outs() << "inst passed once in the main loop\n";

      }
      // if only one outgoing edge, add to flowWL
      std::set<Instruction*> next_instrs = Sccp.successors_(edge.second);
      if (next_instrs.size() == 1) {
        for (Instruction* item : next_instrs) {
          Sccp.flowWL.push_back(UnitSCCPInfo::Edge(edge.second, item));
        }
      }

      // This needs to be at the end so it doesn't interfere with the other checks
      visited.insert(edge.second);
      outs() << "successfully here1\n";

    }


    else if (!Sccp.ssaWL.empty()) {
      UnitSCCPInfo::Edge edge = Sccp.ssaWL.back();
      Sccp.ssaWL.pop_back();

      if (isa<PHINode>(edge.second)) {
        outs() << "visit phi 2 \n";

        Sccp.visitPhi(edge.second);
      } else if (Sccp.execFlags[edge]) { // if (E->sink has 1 or more executable in-edges)
        outs() << "visit inst when execflag = 1\n";
        outs() << "inst: " << *edge.second << "\n";
        Sccp.visitInst(edge.second);
        outs() << "inst passed when execflag = 1\n";

      }
    }
    outs() << "successfully here2\n";
  }

  // add a second pass to replace the uses with constants
  for (auto i: Sccp.latCell) {
    if (i.second.type == UnitSCCPInfo::CONSTANT) {
      // generate the LLVM value, and replace all uses of the instruction
      i.first->replaceAllUsesWith(i.second.value);
    }
  }

  // Set proper preserved analyses
  return PreservedAnalyses::all();
}
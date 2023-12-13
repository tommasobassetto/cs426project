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

  // handle binary ops
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
    if(const1 && const2){
      if(inst->getType()->isIntegerTy()){
        // both are constants, add the result to the map
        // perform real operation
        // binary comes from https://llvm.org/docs/LangRef.html#binary-operations
        int64_t ValueArg1 = dyn_cast<ConstantInt>(const1)->getSExtValue();
        int64_t ValueArg2 = dyn_cast<ConstantInt>(const2)->getSExtValue();
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
        else {
          outs() << "unsupported op " << binaryOp->getOpcode() << "\n";
          exit(-1);
        }
      } // todo: frem
      else if(inst->getType()->isFloatTy()){
        float ValueArg1 = dyn_cast<ConstantFP>(const1)->getValueAPF().convertToFloat();
        float ValueArg2 = dyn_cast<ConstantFP>(const2)->getValueAPF().convertToFloat();
        if (binaryOp->getOpcode() == Instruction::FAdd) {
          float result = ValueArg1 + ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          outs() << "!fadd detected\n";
          outs() << "!!!result name:" << ret_value_.varname << "\n";
          outs() << "!!!result is constant:" << *ret_value_.value << "\n";
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::FSub) {
          float result = ValueArg1 - ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::FMul) {
          float result = ValueArg1 * ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        else if (binaryOp->getOpcode() == Instruction::FDiv) {
          float result = ValueArg1 / ValueArg2;
          Value * ret = ConstantFP::get(inst->getType(), result);
          Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
          constant_map.insert({inst,ret_value_});
          return ret_value_;
        }
        // FRem library not support
        // else if (binaryOp->getOpcode() == Instruction::FRem) {
        //   float result = ValueArg1 / ValueArg2;
        //   Value * ret = ConstantFP::get(inst->getType(), result);
        //   Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
        //   constant_map.insert({inst,ret_value_});
        //   return ret_value_;
        // }
        else {
          outs() << "unsupported op " << binaryOp->getOpcode() << "\n";
          exit(-1);
        }
      }
      // todo: support double?
      // todo: bitcast instruction could not be generated
      // bitcast i8 255 to i8
      else{
          outs() << "unsupported inst with binary ops " << *inst << "\n";
          exit(-1);
      }
      numInstrRemoved++;
    }
  }
  // handle unary ops
  else if (UnaryOperator *unaryOp = dyn_cast<UnaryOperator>(inst)){
    outs() << "I am here unart!!\n";
    Value *op1 = unaryOp->getOperand(0);
    Value *const1 = nullptr;
    outs() << "in unary\n";
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
    if(const1){
      outs() << "!!!op1 is constant:" << *const1 << "\n";
      float ValueArg1 = dyn_cast<ConstantFP>(const1)->getValueAPF().convertToFloat();
      if (unaryOp->getOpcode() == Instruction::FNeg) {
        float result = - ValueArg1;
        Value * ret = ConstantFP::get(inst->getType(), result);
        Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
        constant_map.insert({inst,ret_value_});
        return ret_value_;
      }
      else {
        outs() << "unsupported op " << unaryOp->getOpcode() << "\n";
        exit(-1);
      }
    }
  }
  // handle icmp
  else if (ICmpInst *icmpInst = dyn_cast<ICmpInst>(inst)){
    ICmpInst::Predicate pred = icmpInst->getPredicate();
    Type *instructionType = icmpInst->getType();
    Value *op1 = icmpInst->getOperand(0);
    Value *op2 = icmpInst->getOperand(1);
    Value *const1 = nullptr;
    Value *const2 = nullptr;
    outs() << "in icmp\n";
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
    if(const1 && const2){
      outs() << "!!!!!BOTH CONST IN ICMP!!\n";
      bool result;
      result = ICmpInst::compare(dyn_cast<ConstantInt>(const1)->getValue(), dyn_cast<ConstantInt>(const2)->getValue(), pred);
      Value * ret = ConstantInt::get(inst->getType(), result);
      Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
      constant_map.insert({inst,ret_value_});
      numInstrRemoved++;
      return ret_value_;
    }
    outs() << "Condition code: " << pred << "\n";
    outs() << "Type of instruction: " << *instructionType << "\n";
    outs() << "Operand 1: " << *op1 << "\n";
    outs() << "Operand 2: " << *op2 << "\n";
  }
  else if (FCmpInst *fcmpInst = dyn_cast<FCmpInst>(inst)){
    FCmpInst::Predicate pred = fcmpInst->getPredicate();
    Type *instructionType = fcmpInst->getType();
    Value *op1 = fcmpInst->getOperand(0);
    Value *op2 = fcmpInst->getOperand(1);
    Value *const1 = nullptr;
    Value *const2 = nullptr;
    outs() << "in fcmp\n";
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
    if(const1 && const2){
      outs() << "!!!!!BOTH CONST IN FCMP!!\n";
      bool result;
      result = FCmpInst::compare(dyn_cast<ConstantFP>(const1)->getValueAPF(), dyn_cast<ConstantFP>(const2)->getValueAPF(), pred);
      outs() << "comparison done!\n";
      Value * ret = ConstantInt::get(inst->getType(), result);
      outs() << "about to return!\n";
      Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
      constant_map.insert({inst,ret_value_});
      numInstrRemoved++;
      return ret_value_;
    }
  }
  // Handle branch instructions
  else if (BranchInst *branchInst = dyn_cast<BranchInst>(inst)) {
    Value *const_pred = nullptr;
    outs() << "inst:: " << *branchInst << "\n";
    if (branchInst->isConditional()) {
      Value *pred = branchInst->getCondition();    
      if (isa<Constant>(pred)){
        const_pred = pred;
      }
      else {
        // check values in the map
        auto const_value_ = constant_map.find(pred);
        if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
          // in our map
          const_pred = const_value_->second.value;
        }
      }
    }

    if (const_pred){
      // branchInst->setCondition(const_pred); // Remove the condition
      bool pred_value = dyn_cast<ConstantInt>(const_pred)->getSExtValue();
      outs() << "const_pred_val is " << pred_value << "\n"; 
      if (pred_value == true){
        branchInst->setSuccessor(1, branchInst->getSuccessor(0));
      }
      else{
        // false
        branchInst->setSuccessor(0, branchInst->getSuccessor(1));
      }
      numBBUnreachable++;
    }
  }
  else if (SelectInst *selectInst = dyn_cast<SelectInst>(inst)){
    Value *op1 = selectInst->getTrueValue();
    Value *op2 = selectInst->getFalseValue();
    Value *const1 = nullptr;
    Value *const2 = nullptr;
    outs() << "in select\n";
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
    // until now const1 and const2 can still be variable
    if(const1){
      selectInst->setTrueValue(const1);
    }
    if(const2){
      selectInst->setFalseValue(const2);
    }

    Value *const_pred = nullptr;
    outs() << "inst:: " << *selectInst << "\n";
    Value *pred = selectInst->getCondition();    
    if (isa<Constant>(pred)){
      const_pred = pred;
    }
    else {
      // check values in the map
      auto const_value_ = constant_map.find(pred);
      if (const_value_ != constant_map.end() && const_value_->second.type == CONSTANT){
        // in our map
        const_pred = const_value_->second.value;
      }
    }

    if (const_pred){
      numInstrRemoved++;
      // branchInst->setCondition(const_pred); // Remove the condition
      bool pred_value = dyn_cast<ConstantInt>(const_pred)->getSExtValue();
      outs() << "const_pred_val is " << pred_value << "\n"; 
      if (pred_value == true){
        outs() << "I am true " << pred_value << "\n";
        Value * ret = selectInst->getTrueValue();
        Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
        constant_map.insert({inst,ret_value_});
        return ret_value_;
        // selectInst->setSuccessor(1, selectInst->getSuccessor(0));
      }
      else{
        // false
        outs() << "------I am false " << pred_value << "\n";
        Value * ret = selectInst->getFalseValue();
        Value_ ret_value_(CONSTANT, inst->getName().str(), ret);
        constant_map.insert({inst,ret_value_});
        return ret_value_;
      }
    }
  }

  // default return value, NECESSARY!!
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
        // outs()<<  isa<PHINode>(user) << "\n";
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
    // outs() << "+++++loop starts \n";
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
        // outs() << "visit phi 1 \n";
        Sccp.visitPhi(edge.second);
      }
      // FIXME - is this supposed to be else if?
      if (!visited.contains(edge.second)) {
        // outs() << "visit inst in the main loop\n";
        // outs() << "inst: " << *edge.second << "\n";
        Sccp.visitInst(edge.second);
        // outs() << "inst passed once in the main loop\n";

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
      // outs() << "successfully here1\n";

    }


    else if (!Sccp.ssaWL.empty()) {
      UnitSCCPInfo::Edge edge = Sccp.ssaWL.back();
      Sccp.ssaWL.pop_back();

      if (isa<PHINode>(edge.second)) {
        // outs() << "visit phi 2 \n";

        Sccp.visitPhi(edge.second);
      } else if (Sccp.execFlags[edge]) { // if (E->sink has 1 or more executable in-edges)
        // outs() << "visit inst when execflag = 1\n";
        // outs() << "inst: " << *edge.second << "\n";
        Sccp.visitInst(edge.second);
        // outs() << "inst passed when execflag = 1\n";

      }
    }
    // outs() << "successfully here2\n";
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
#pragma once
#include "CostFunction.h"

/// class LMLS - 
class LMLS : public CostFunction {
  // Operations
private:
  double f0 (double output, double target);
  double f1 (double output, double target);
  std::string getName ();
};


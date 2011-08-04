#pragma once
#include "CostFunction.h"

/// class LMS - 
class LMS : public CostFunction {
  // Operations
public:
  double f0 (double output, double target);
  double f1 (double output, double target);
};


#pragma once
#include "CostFunction.h"

/// class Tao - 
class Tao : public CostFunction {
  // Attributes
private:
  double d_STao;
  // Operations
private:
  double f0 (double output, double target);
  double f1 (double output, double target);
  std::string getName ();
};


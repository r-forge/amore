#pragma once
// Interface
/// class CostFunction - 
class CostFunction {
  // Operations
public:
  virtual double f0 (double output, double target) = 0;
  virtual double f1 (double output, double target) = 0;
};


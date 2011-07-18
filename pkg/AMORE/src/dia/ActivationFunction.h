#pragma once
// Interface
/// class ActivationFunction - 
class ActivationFunction {
  // Attributes
private:
  PredictBehaviorRef d_predictBehavior;
  // Operations
public:
  virtual double f0 () = 0;
  virtual double f1 () = 0;
};


#pragma once
// Interface
/// class ActivationFunction - 
class ActivationFunction {
  // Attributes
protected:
  PredictBehaviorWeakPtr d_predictBehavior;
  // Operations
public:
  virtual double f0 () = 0;
  virtual double f1 () = 0;
  double getInducedLocalField ();
  void setPredictBehavior (PredictBehaviorPtr predictBehaviorPtr);
};


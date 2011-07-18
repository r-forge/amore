#pragma once
// Interface
/// class PredictBehavior - 
class PredictBehavior {
  // Attributes
protected:
  ConContainerPtr d_nCons;
  double d_inducedLocalField;
  ActivationFunctionPtr d_activationFunction;
  double d_output;
  // Operations
public:
  virtual void predict () = 0;
  virtual void show () = 0;
  double getOutput ();
  void setOutput (double output);
  void setActivationFunction (ActivationFunctionPtr activationFunctionPtr, PredictBehaviorPtr predictBehaviorPtr);
  double getInducedLocalField ();
  void setConnections (ConContainerPtr conContainerPtr);
protected:
  PredictBehavior ();
};


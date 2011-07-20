#pragma once
/// class Neuron - 
class Neuron {
  // Attributes
protected:
  PredictBehaviorPtr d_predictBehavior;
  ActivationFunctionPtr d_activationFunction;
  // TrainingBehaviorPtr d_trainingBehavior;
  Handler d_Id;
  ConContainerPtr d_nCons;
  double d_inducedLocalField;
  double d_output;
  // Operations
public:
  virtual double getInducedLocalField () = 0;
  virtual void setInducedLocalField (double inducedLocalField) = 0;
  virtual double getOutput () = 0;
  virtual void setOutput (double output) = 0;
  virtual Handler getId () = 0;
  virtual void setId (Handler Id) = 0;
  virtual ConIteratorPtr getConIterator () = 0;
  virtual void setConnections (ConContainerPtr conContainerPtr) = 0;
  virtual void setActivationFunction (ActivationFunctionPtr activationFunctionPtr) = 0;
  virtual void setPredictBehavior (PredictBehaviorPtr predictBehaviorPtr) = 0;
  // virtual void setTrainingBehavior (TrainingBehaviorPtr trainingBehaviorPtr) = 0;
  virtual double useActivationFunctionf0 () = 0;
  virtual void predict () = 0;
  // virtual void adjustParameters () = 0;
  virtual void show () = 0;
  virtual bool validate () = 0;
protected:
  Neuron ();
};


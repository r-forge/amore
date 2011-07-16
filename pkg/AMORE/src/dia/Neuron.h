#pragma once
/// class Neuron - 
class Neuron {
  // Attributes
protected:
  PredictBehaviorPtr d_predictBehavior;
  // TrainingBehaviorPtr d_trainingBehavior;
  // Operations
public:
  virtual double getOutput () = 0;
  virtual void setOutput (double output) = 0;
  virtual Handler getId () = 0;
  virtual void setId (Handler Id) = 0;
  virtual void setPredictBehavior (PredictBehaviorPtr predictBehaviorPtr) = 0;
  // virtual void setTrainingBehavior (TrainingBehaviorPtr trainingBehaviorPtr) = 0;
  virtual void predict () = 0;
  // virtual void adjustParameters () = 0;
  virtual void show () = 0;
  virtual bool validate () = 0;
};


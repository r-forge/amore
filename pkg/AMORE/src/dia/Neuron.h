#pragma once
/// class Neuron - 
class Neuron {
  // Attributes
public:
  PredictBehaviorRef d_predictBehavior;
  TrainingBehaviorRef d_trainingBehavior;
  // Operations
public:
  virtual Handler getId () = 0;
  virtual void setId (Handler Id) = 0;
  virtual void setPredictBehavior (PredictBehavior& predictBehavior) = 0;
  virtual void setTrainingBehavior (TrainingBehavior& trainingBehavior) = 0;
  virtual void predict () = 0;
  virtual void adjustParameters () = 0;
  virtual void show () = 0;
  virtual bool validate () = 0;
};


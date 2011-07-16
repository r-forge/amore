#pragma once
#include "Neuron.h"

/// class SimpleNeuron - 
class SimpleNeuron : public Neuron {
  // Attributes
private:
  int d_Id;
  // Operations
public:
  SimpleNeuron ();
private:
  double getOutput ();
  void setOutput (double output);
  Handler getId ();
  void setId (Handler Id);
  void setPredictBehavior (PredictBehaviorPtr predictBehaviorPtr);
  // void setTrainingBehavior (TrainingBehaviorPtr trainingBehaviorPtr);
  void predict ();
  // void adjustParameters ();
  void show ();
  bool validate ();
};


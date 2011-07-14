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
  Handler getId ();
  void setId (Handler Id);
  // void setPredictBehavior (PredictBehavior& predictBehavior);
  // void setTrainingBehavior (TrainingBehavior& trainingBehavior);
  // void predict ();
  // void adjustParameters ();
  void show ();
  bool validate ();
};


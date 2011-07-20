#pragma once
#include "Neuron.h"

/// class SimpleNeuron - 
class SimpleNeuron : public Neuron {
  // Operations
public:
  SimpleNeuron ();
private:
  double getInducedLocalField ();
  void setInducedLocalField (double inducedLocalField);
  double getOutput ();
  void setOutput (double output);
  Handler getId ();
  void setId (Handler Id);
  ConIteratorPtr getConIterator ();
  void setConnections (ConContainerPtr conContainerPtr);
  void setActivationFunction (ActivationFunctionPtr activationFunctionPtr);
  void setPredictBehavior (PredictBehaviorPtr predictBehaviorPtr);
  // void setTrainingBehavior (TrainingBehaviorPtr trainingBehaviorPtr);
  double useActivationFunctionf0 ();
  void predict ();
  // void adjustParameters ();
  void show ();
  bool validate ();
};


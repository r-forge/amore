#pragma once
#include "Neuron.h"

/// class SimpleNeuron - 
class SimpleNeuron : public Neuron {
  // Operations
public:
  SimpleNeuron (NeuralFactory& neuralFactory);
private:
  double getInducedLocalField ();
  void setInducedLocalField (double inducedLocalField);
  double getOutput ();
  void setOutput (double output);
  double getTarget ();
  void setTarget (double target);
  double getOutputDerivative ();
  void setOutputDerivative (double outputDerivative);
  Handler getId ();
  void setId (Handler Id);
  ConIteratorPtr getConIterator ();
  void addCon (ConPtr conPtr);
  void setActivationFunction (ActivationFunctionPtr activationFunctionPtr);
  void setPredictBehavior (PredictBehaviorPtr predictBehaviorPtr);
  void setNeuronTrainBehavior (NeuronTrainBehaviorPtr neuronTrainBehaviorPtr);
  double useActivationFunctionf0 ();
  double useActivationFunctionf1 ();
  void singlePatternForwardAction ();
  void singlePatternBackwardAction ();
  // void adjustParameters ();
  void show ();
  bool validate ();
};


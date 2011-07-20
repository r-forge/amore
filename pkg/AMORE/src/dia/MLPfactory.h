#pragma once
#include "NeuralFactory.h"

/// class MLPfactory - 
class MLPfactory : public NeuralFactory {
  // Operations
public:
  MLPfactory ();
protected:
  ConPtr makeCon (Neuron& neuron, double weight);
  virtual ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr) = 0;
  PredictBehaviorPtr makePredictBehavior (NeuronPtr neuronPtr);
  ConContainerPtr makeConContainer ();
  NeuronPtr makeNeuron ();
  NeuronContainerPtr makeNeuronContainer ();
};


#pragma once
#include "NeuralFactory.h"

/// class RBFfactory - 
class RBFfactory : public NeuralFactory {
  // Operations
public:
  RBFfactory ();
protected:
  ConPtr makeCon (Neuron* neuron, double weight);
  ConContainerPtr makeConContainer ();
  virtual ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr) = 0;
  PredictBehaviorPtr makePredictBehavior ();
  NeuronPtr makeNeuron (Handler Id);
  NeuronPtr makeNeuron (Handler Id, NeuronIteratorPtr neuronIteratorPtr, double totalAmountOfParameters);
  NeuronContainerPtr makeNeuronContainer ();
};


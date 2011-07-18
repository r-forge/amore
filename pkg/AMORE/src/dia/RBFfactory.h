#pragma once
#include "NeuralFactory.h"

/// class RBFfactory - 
class RBFfactory : public NeuralFactory {
  // Operations
public:
  RBFfactory ();
private:
  ConPtr makeCon (Neuron* neuron, double weight);
  ConPtr makeCon (Neuron& neuron);
  ConContainerPtr makeConContainer ();
  ActivationFunctionPtr makeIdentityActivationFunction ();
  ActivationFunctionPtr makeTanhActivationFunction ();
  PredictBehaviorPtr makePredictBehavior ();
  PredictBehaviorPtr makePredictBehavior (ConContainerPtr conContainerPtr);
  NeuronPtr makeNeuron ();
  NeuronContainerPtr makeNeuronContainer ();
};


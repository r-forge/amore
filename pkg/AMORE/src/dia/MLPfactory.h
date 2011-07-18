#pragma once
#include "NeuralFactory.h"

/// class MLPfactory - 
class MLPfactory : public NeuralFactory {
  // Operations
public:
  MLPfactory ();
private:
  ConPtr makeCon (Neuron& neuron);
  ConPtr makeCon (Neuron& neuron, double weight);
  ActivationFunctionPtr makeIdentityActivationFunction ();
  ActivationFunctionPtr makeTanhActivationFunction ();
  PredictBehaviorPtr makePredictBehavior ();
  PredictBehaviorPtr makePredictBehavior (ConContainerPtr conContainerPtr);
  ConContainerPtr makeConContainer ();
  NeuronPtr makeNeuron ();
  NeuronContainerPtr makeNeuronContainer ();
};


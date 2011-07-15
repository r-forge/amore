#pragma once
#include "NeuralFactory.h"

/// class MLPfactory - 
class MLPfactory : public NeuralFactory {
  // Operations
public:
  MLPfactory ();
private:
  Con* makeCon (Neuron& neuron);
  Con* makeCon (Neuron& neuron, double weight);
  Container<ConPtr>* makeConContainer ();
  Container<NeuronPtr>* makeNeuronContainer ();
  Neuron* makeNeuron ();
};


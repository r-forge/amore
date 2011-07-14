#pragma once
#include "NeuralFactory.h"

/// class MLPfactory - 
class MLPfactory : public NeuralFactory {
  // Operations
public:
  MLPfactory ();
  ConPtr makeCon (Neuron& neuron);
  ConPtr makeCon (Neuron& neuron, double weight);
  NeuronPtr makeNeuron ();
};


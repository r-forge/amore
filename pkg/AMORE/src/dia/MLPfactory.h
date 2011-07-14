#pragma once
#include "NeuralFactory.h"

/// class MLPfactory - 
class MLPfactory : public NeuralFactory {
  // Operations
public:
  MLPfactory ();
  ConPtr makeCon (Neuron& neuron);
  NeuronPtr makeNeuron ();
};


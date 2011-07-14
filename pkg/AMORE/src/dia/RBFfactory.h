#pragma once
#include "NeuralFactory.h"

/// class RBFfactory - 
class RBFfactory : public NeuralFactory {
  // Operations
public:
  RBFfactory ();
  ConPtr makeCon (Neuron& neuron);
  NeuronPtr makeNeuron ();
};


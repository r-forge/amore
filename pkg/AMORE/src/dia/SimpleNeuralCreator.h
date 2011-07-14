#pragma once
#include "NeuralCreator.h"

/// class SimpleNeuralCreator - 
class SimpleNeuralCreator : public NeuralCreator {
  // Operations
public:
  SimpleNeuralCreator ();
  ConPtr createCon (NeuralFactory& neuralFactory, Neuron& neuron);
  NeuronPtr createNeuron (NeuralFactory& neuralFactory);
};


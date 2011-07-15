#pragma once
#include "NeuralCreator.h"

/// class SimpleNeuralCreator - 
class SimpleNeuralCreator : public NeuralCreator {
  // Operations
public:
  SimpleNeuralCreator ();
  Con* createCon (NeuralFactory& neuralFactory, Neuron& neuron);
  Neuron* createNeuron (NeuralFactory& neuralFactory);
};


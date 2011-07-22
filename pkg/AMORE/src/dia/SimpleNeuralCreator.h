#pragma once
#include "NeuralCreator.h"

/// class SimpleNeuralCreator - 
class SimpleNeuralCreator : public NeuralCreator {
  // Operations
public:
  SimpleNeuralCreator ();
  NeuralNetworkPtr createFeedForwardFullyConnectedNetwork (NeuralFactoryPtr neuralFactoryPtr);
};


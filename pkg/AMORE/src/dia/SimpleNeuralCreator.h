#pragma once
#include "NeuralCreator.h"

/// class SimpleNeuralCreator - 
class SimpleNeuralCreator : public NeuralCreator {
  // Operations
public:
  SimpleNeuralCreator ();
  NeuralNetworkPtr createFeedForwardNetwork (std::vector<int> numberOfNeurons, NeuralFactory& hiddenLayersFactory, NeuralFactory& outputLayerFactory);
};


#pragma once
// Interface
/// class NeuralCreator - 
class NeuralCreator {
  // Operations
public:
  virtual NeuralNetworkPtr createFeedForwardNetwork (std::vector<int> numberOfNeurons, NeuralFactory& hiddenLayersFactory, NeuralFactory& outputLayerFactory) = 0;
};


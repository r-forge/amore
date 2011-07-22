#pragma once
// Interface
/// class NeuralCreator - 
class NeuralCreator {
  // Operations
public:
  virtual NeuralNetworkPtr createFeedForwardFullyConnectedNetwork (NeuralFactoryPtr neuralFactoryPtr) = 0;
};


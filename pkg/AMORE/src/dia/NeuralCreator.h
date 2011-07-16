#pragma once
// Interface
/// class NeuralCreator - 
class NeuralCreator {
  // Operations
public:
  virtual NeuronPtr createNeuron (NeuralFactoryPtr neuralFactoryPtr) = 0;
};


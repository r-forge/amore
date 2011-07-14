#pragma once
// Interface
/// class NeuralCreator - 
class NeuralCreator {
  // Operations
public:
  virtual ConPtr createCon (NeuralFactory& neuralFactory, Neuron& neuron) = 0;
  virtual NeuronPtr createNeuron (NeuralFactory& neuralFactory) = 0;
};


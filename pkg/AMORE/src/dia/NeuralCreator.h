#pragma once
// Interface
/// class NeuralCreator - 
class NeuralCreator {
  // Operations
public:
  virtual Con* createCon (NeuralFactory& neuralFactory, Neuron& neuron) = 0;
  virtual Neuron* createNeuron (NeuralFactory& neuralFactory) = 0;
};


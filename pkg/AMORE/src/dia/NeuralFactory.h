#pragma once
// Interface
/// class NeuralFactory - 
class NeuralFactory {
  // Operations
public:
  virtual ConPtr makeCon (Neuron& neuron) = 0;
  virtual ConPtr makeCon (Neuron& neuron, double weight) = 0;
  virtual NeuronPtr makeNeuron () = 0;
};


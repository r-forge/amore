#pragma once
// Interface
/// class NeuralFactory - 
class NeuralFactory {
  // Operations
public:
  virtual ConPtr makeCon (Neuron& neuron) = 0;
  virtual NeuronPtr makeNeuron () = 0;
};


#pragma once
/// class Layer - 
class Layer {
  // Attributes
protected:
  Container<Neuron> nNeurons;
  // Operations
public:
  void show ();
  bool validate ();
};

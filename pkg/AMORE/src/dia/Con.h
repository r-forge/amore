#pragma once
/// class Con - 
class Con {
  // Attributes
protected:
  NeuronRef d_neuron;
  double d_weight;
  // Operations
public:
  Con (Neuron& neuron);
  Con (Neuron& neuron, double weight);
  Neuron& neuron ();
  int Id ();
  double& weight ();
  void show ();
  bool validate ();
};


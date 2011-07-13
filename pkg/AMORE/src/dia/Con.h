#pragma once
/// class Con - 
class Con {
  // Attributes
private:
  NeuronRef d_neuron;
  double d_weight;
  // Operations
public:
  Con ();
  Con (Neuron& neuron);
  Con (Neuron& neuron, double weight);
  Handler Id ();
  Neuron& getNeuron ();
  void setNeuron (Neuron& neuron);
  double getWeight ();
  void setWeight (double weight);
  void show ();
  bool validate ();
};


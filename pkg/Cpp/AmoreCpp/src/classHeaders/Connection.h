#pragma once
/// class Con - 
class Con {
  // Attributes
private:
  NeuronRef d_neuron;
  double d_weight;
  // Operations
public:
  Con (Neuron& neuron);
  Con (Neuron& neuron, double weight);
  Handler Id ();
  Neuron& getNeuron ();
  void setNeuron (Neuron& neuron);
  double getWeight ();
  void setWeight (double weight);
  void addToWeight (double value);
  double getInputValue ();
  void addToDelta (double value);
  void show ();
  bool validate ();
};


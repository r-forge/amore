#pragma once
/// class Neuron - 
class Neuron {
  // Attributes
protected:
  int d_Id;
  // Operations
public:
  Neuron ();
  Neuron (int Id);
  int Id ();
  void show ();
  bool validate ();
};


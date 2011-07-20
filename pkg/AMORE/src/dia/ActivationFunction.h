#pragma once
// Interface
/// class ActivationFunction - 
class ActivationFunction {
  // Attributes
protected:
  NeuronWeakPtr d_neuron;
  // Operations
public:
  virtual double f0 () = 0;
  virtual double f1 () = 0;
protected:
  ActivationFunction (NeuronPtr neuronPtr);
  double getInducedLocalField ();
};


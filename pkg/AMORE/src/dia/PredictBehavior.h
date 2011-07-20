#pragma once
// Interface
/// class PredictBehavior - 
class PredictBehavior {
  // Attributes
protected:
  NeuronWeakPtr d_neuron;
  // Operations
public:
  virtual void predict () = 0;
  virtual void show () = 0;
protected:
  PredictBehavior (NeuronPtr neuronPtr);
  double useActivationFunctionf0 ();
  ConIteratorPtr getConIterator ();
  void setOutput (double output);
  void setInducedLocalField (double inducedLocalField);
};


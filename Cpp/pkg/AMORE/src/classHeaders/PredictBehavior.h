#pragma once
// Interface
/// class PredictBehavior - 
class PredictBehavior {
  // Attributes
protected:
  NeuronWeakPtr d_neuron;
  // Operations
public:
friend class NeuronTrainBehavior; 
  virtual void singlePatternForwardAction () = 0;
  virtual void show () = 0;
  virtual void addToBias (double value) = 0;
protected:
  PredictBehavior (NeuronPtr neuronPtr);
  double useActivationFunctionf0 ();
  double useActivationFunctionf1 ();
  ConIteratorPtr getConIterator ();
  void setOutput (double output);
  void setOutputDerivative (double outputDerivative);
  void setInducedLocalField (double inducedLocalField);
};


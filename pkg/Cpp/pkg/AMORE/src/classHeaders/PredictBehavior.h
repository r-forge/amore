#pragma once
// Interface
/// class PredictBehavior - 
class PredictBehavior {
  // Attributes
protected:
  NeuronPtr d_neuron;
  // Operations
public:
friend class NeuronTrainBehavior; 
  virtual ~PredictBehavior ();
  virtual void singlePatternForwardAction () = 0;
  virtual void show () = 0;
  virtual void addToBias (double value) = 0;
protected:
  PredictBehavior (NeuronPtr neuronPtr);
};


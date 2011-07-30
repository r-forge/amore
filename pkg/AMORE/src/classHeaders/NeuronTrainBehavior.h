#pragma once
// Interface
/// class NeuronTrainBehavior - 
class NeuronTrainBehavior {
  // Attributes
protected:
  NeuronWeakPtr d_neuron;
  // Operations
public:
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
};


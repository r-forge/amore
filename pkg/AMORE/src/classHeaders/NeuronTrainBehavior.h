#pragma once
// Interface
/// class NeuronTrainBehavior - 
class NeuronTrainBehavior {
  // Attributes
protected:
  NeuronWeakPtr d_neuron;
  double d_delta;
  double d_learningRate;
  double d_momentum;
  std::vector<double> d_formerWeightChange;
  double d_formerBiasChange;
  std::vector<double> d_sumDeltaX;
  double d_sumDeltaBias;
  // Operations
public:
  int numberOfConnections ();
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
protected:
  NeuronTrainBehavior (NeuronPtr neuronPtr);
};


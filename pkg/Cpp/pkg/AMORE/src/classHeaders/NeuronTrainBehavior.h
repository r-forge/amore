#pragma once
// Interface
/// class NeuronTrainBehavior - 
class NeuronTrainBehavior {
  // Attributes
protected:
  NeuronPtr d_neuron;
  double d_delta;
  double d_learningRate;
  double d_momentum;
  std::vector<double> d_formerWeightChange;
  double d_formerBiasChange;
  std::vector<double> d_sumDeltaX;
  double d_sumDeltaBias;
  // Operations
public:
  virtual ~NeuronTrainBehavior ();
  int numberOfConnections ();
  double getNeuronTarget ();
  double getNeuronOutput ();
  double getNeuronOutputDerivative ();
  double costFunctionf0 (double output, double target);
  double costFunctionf1 (double output, double target);
  ConIteratorPtr getConIterator ();
  void setLearningRate (double learningRate);
  virtual void addToNeuronBias (double value) = 0;
  virtual void addToDelta (double value) = 0;
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
protected:
  NeuronTrainBehavior (NeuronPtr neuronPtr);
};


#pragma once
// Interface
/// class NeuralFactory - 
class NeuralFactory {
  // Operations
public:
  virtual ConPtr makeCon (Neuron& neuron) = 0;
  virtual ConPtr makeCon (Neuron& neuron, double weight) = 0;
  virtual ConContainerPtr makeConContainer () = 0;
  virtual ActivationFunctionPtr makeIdentityActivationFunction () = 0;
  virtual ActivationFunctionPtr makeTanhActivationFunction () = 0;
  virtual PredictBehaviorPtr makePredictBehavior () = 0;
  virtual NeuronPtr makeNeuron () = 0;
  virtual NeuronContainerPtr makeNeuronContainer () = 0;
};


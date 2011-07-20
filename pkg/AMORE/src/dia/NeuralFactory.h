#pragma once
// Interface
/// class NeuralFactory - 
class NeuralFactory {
  // Operations
public:
  virtual ConPtr makeCon (Neuron& neuron, double weight) = 0;
  virtual ConContainerPtr makeConContainer () = 0;
  virtual ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr) = 0;
  virtual PredictBehaviorPtr makePredictBehavior (NeuronPtr neuronPtr) = 0;
  virtual NeuronPtr makeNeuron () = 0;
  virtual NeuronContainerPtr makeNeuronContainer () = 0;
};


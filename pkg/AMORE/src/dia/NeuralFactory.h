#pragma once
// Interface
/// class NeuralFactory - 
class NeuralFactory {
  // Operations
public:
  virtual Con* makeCon (Neuron& neuron) = 0;
  virtual Con* makeCon (Neuron& neuron, double weight) = 0;
  virtual Container<ConPtr>* makeConContainer () = 0;
  virtual PredictBehavior* makePredictBehavior () = 0;
  virtual Neuron* makeNeuron () = 0;
  virtual Container<NeuronPtr>* makeNeuronContainer () = 0;
};


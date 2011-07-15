#pragma once
#include "NeuralFactory.h"

/// class RBFfactory - 
class RBFfactory : public NeuralFactory {
  // Operations
public:
  RBFfactory ();
private:
  Con* makeCon (Neuron* neuron, double weight);
  Con* makeCon (Neuron& neuron);
  Container<ConPtr>* makeConContainer ();
  PredictBehavior* makePredictBehavior ();
  Neuron* makeNeuron ();
  Container<NeuronPtr>* makeNeuronContainer ();
};


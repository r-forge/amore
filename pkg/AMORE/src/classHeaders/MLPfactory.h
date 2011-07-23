#pragma once
#include "NeuralFactory.h"

/// class MLPfactory - 
class MLPfactory : public NeuralFactory {
  // Operations
public:
  MLPfactory ();
protected:
  ConPtr makeCon (Neuron& neuron, double weight);
  ConContainerPtr makeConContainer ();
  virtual ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr) = 0;
  PredictBehaviorPtr makePredictBehavior (NeuronPtr neuronPtr);
  NeuronPtr makeNeuron (Handler Id);
  NeuronPtr makeNeuron (Handler Id, NeuronIteratorPtr neuronIteratorPtr, double totalAmountOfParameters);
  LayerPtr makeLayer ();
  LayerContainerPtr makeLayerContainer ();
  NeuralNetworkPtr makeNeuralNetwork (NeuralFactory& neuralFactory);
  NeuralCreatorPtr makeNeuralCreator ();
};


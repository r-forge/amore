#pragma once
#include "NeuralFactory.h"

/// class MLPfactory - 
class MLPfactory : public NeuralFactory {
  // Operations
protected:
  ConPtr makeCon (Neuron& neuron, double weight);
  ConContainerPtr makeConContainer ();
  PredictBehaviorPtr makePredictBehavior (NeuronPtr neuronPtr);
  NeuronPtr makeNeuron (Handler Id);
  NeuronPtr makeNeuron (Handler Id, NeuronIteratorPtr neuronIteratorPtr, double totalAmountOfParameters);
  LayerPtr makeLayer ();
  LayerContainerPtr makeLayerContainer ();
  NeuralNetworkPtr makeNeuralNetwork (NeuralFactory& neuralFactory);
  NeuralCreatorPtr makeNeuralCreator ();
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr, Rcpp::XPtr<CppFunctionPointer> f0, Rcpp::XPtr<CppFunctionPointer> f1);
  Rcpp::List makeXPtrFunctionList (std::string functionName);
  // virtual NetworkTrainBehaviorPtr makeNetworkTrainBehavior () = 0;
  // virtual NeuronTrainBehaviorPtr makeNeuronTrainBehavior (NeuronPtr neuronPtr) = 0;
};


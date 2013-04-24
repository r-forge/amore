#pragma once
#include "NeuralFactory.h"

/// class MLPfactory - 
class MLPfactory : public NeuralFactory {
  // Operations
protected:
  ConPtr makeCon (NeuronPtr neuron, double weight);
  ConContainerPtr makeConContainer ();
  PredictBehaviorPtr makePredictBehavior (NeuronPtr neuronPtr);
  NeuronPtr makeNeuron (Handler Id);
  NeuronPtr makeNeuron (Handler Id, NeuronIteratorPtr neuronIteratorPtr, double totalAmountOfParameters, NeuralNetworkPtr neuralNetworkPtr);
  LayerPtr makeLayer ();
  LayerContainerPtr makeLayerContainer ();
  NeuralNetworkPtr makeNeuralNetwork (NeuralFactoryPtr neuralFactoryPtr);
  NeuralCreatorPtr makeNeuralCreator ();
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr, Rcpp::XPtr<CppFunctionPointer> f0, Rcpp::XPtr<CppFunctionPointer> f1);
  Rcpp::List makeXPtrFunctionList (std::string functionName);
  virtual NetworkTrainBehaviorPtr makeNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr) = 0;
  virtual NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr) = 0;
  virtual NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr) = 0;
  CostFunctionPtr makeCostFunction (std::string functionName);
};


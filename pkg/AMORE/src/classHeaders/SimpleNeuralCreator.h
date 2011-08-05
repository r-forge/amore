#pragma once
#include "NeuralCreator.h"

/// class SimpleNeuralCreator - 
class SimpleNeuralCreator : public NeuralCreator {
  // Operations
public:
  SimpleNeuralCreator ();
protected:
  NeuralNetworkPtr createFeedForwardNetwork (NeuralFactory& neuralFactory, std::vector<int> numberOfNeurons, std::string hiddenLayersActivationFunctionName, std::string outputLayerActivationFunctionName);
  NeuralNetworkPtr createCustomFeedForwardNetwork (NeuralFactory& neuralFactory, std::vector<int> numberOfNeurons, Rcpp::List hiddenLayersActivationFunction, Rcpp::List outputLayerActivationFunction);
};


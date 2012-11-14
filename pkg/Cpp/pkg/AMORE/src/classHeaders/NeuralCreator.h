#pragma once
// Interface
/// class NeuralCreator - 
class NeuralCreator {
  // Operations
public:
  virtual NeuralNetworkPtr createFeedForwardNetwork (NeuralFactory& neuralFactory, std::vector<int>  numberOfNeurons, std::string hiddenLayersActivationFunctionName, std::string outputLayerActivationFunctionName) = 0;
  virtual NeuralNetworkPtr createCustomFeedForwardNetwork (NeuralFactory& neuralFactory, std::vector<int> numberOfNeurons, Rcpp::List hiddenLayersActivationFunction, Rcpp::List outputLayerActivationFunction) = 0;
};


#pragma once
// Interface
/// class NetworkTrainBehavior - 
class NetworkTrainBehavior {
  // Attributes
protected:
  NeuralNetworkWeakPtr d_neuralNetwork;
  // Operations
public:
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
};


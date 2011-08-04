#pragma once
// Interface
/// class NetworkTrainBehavior - 
class NetworkTrainBehavior {
  // Attributes
protected:
  NeuralNetworkWeakPtr d_neuralNetwork;
  CostFunctionPtr d_costFunction;
  // Operations
public:
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
};


#pragma once
// Interface
/// class NetworkTrainBehavior - 
class NetworkTrainBehavior {
  // Attributes
protected:
  NeuralNetworkPtr d_neuralNetwork;
  // Operations
public:
  void setLearningRate (double learningRate);
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
  virtual std::string getName () = 0;
protected:
  NetworkTrainBehavior (NeuralNetworkPtr neuralNetworPtr);
};


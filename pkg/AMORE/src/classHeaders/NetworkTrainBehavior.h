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
  virtual std::string getName () = 0;
protected:
  NetworkTrainBehavior (NeuralNetworkPtr neuralNetworPtr);
  void writeInput (std::vector<double>::iterator& iterator);
  void singlePatternForwardAction ();
  void singlePatternBackwardAction ();
  void writeTarget (std::vector<double>::iterator& iterator);
};


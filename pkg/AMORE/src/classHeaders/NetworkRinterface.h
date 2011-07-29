#pragma once
/// class NetworkRinterface - 
class NetworkRinterface {
  // Attributes
private:
  NeuralNetworkPtr d_neuralNetwork;
  // Operations
public:
  NetworkRinterface ();
  void createFeedForwardNetwork (Rcpp::NumericVector numberOfNeurons);
  Rcpp::NumericMatrix predict (Rcpp::NumericMatrix numericMatrix);
  Rcpp::List train (Rcpp::List parameterList);
  size_type inputSize ();
  size_type outputSize ();
  void show ();
  bool validate ();
};


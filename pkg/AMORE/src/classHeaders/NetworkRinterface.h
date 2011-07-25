#pragma once
/// class NetworkRinterface - 
class NetworkRinterface {
  // Attributes
private:
  NeuralNetworkPtr d_neuralNetwork;
  // Operations
public:
  NetworkRinterface ();
  void show ();
  void createFeedForwardNetwork (Rcpp::NumericVector numberOfNeurons);
};


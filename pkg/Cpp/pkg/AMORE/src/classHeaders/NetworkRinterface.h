#pragma once
/// class NetworkRinterface - 
class NetworkRinterface {
  // Attributes
private:
  NeuralNetworkPtr d_neuralNetwork;
  // Operations
public:
  NetworkRinterface ();
  ~NetworkRinterface ();
  Rcpp::NumericMatrix sim (Rcpp::NumericMatrix numericMatrix);
  Rcpp::List train (Rcpp::List parameterList);
  void createFeedForwardNetwork (Rcpp::NumericVector numberOfNeurons, Rcpp::CharacterVector hiddenLayersActivationFunctionName, Rcpp::CharacterVector outputLayerActivationFunctionName);
  void createCustomFeedForwardNetwork (Rcpp::NumericVector numberOfNeurons, Rcpp::List hiddenLayersActivationFunction, Rcpp::List outputLayerActivationFunction);
  size_type inputSize ();
  size_type outputSize ();
  void show ();
  bool validate ();
};


#pragma once
#include "NeuralNetwork.h"

/// class SimpleNetwork - 
class SimpleNetwork : public NeuralNetwork {
  // Operations
public:
  SimpleNetwork (NeuralFactory& neuralFactory);
private:
  void writeInput (std::vector<double>::iterator& iterator);
  void singlePatternForwardAction ();
  void singlePatternBackwardAction ();
  void readOutput (std::vector<double>::iterator& iterator);
  Rcpp::List train (Rcpp::List parameterList);
  size_type inputSize ();
  size_type outputSize ();
  void show ();
  bool validate ();
};


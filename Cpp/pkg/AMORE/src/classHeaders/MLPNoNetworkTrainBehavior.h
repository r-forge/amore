#pragma once
#include "MLPNetworkTrainBehavior.h"

/// class MLPNoNetworkTrainBehavior - 
class MLPNoNetworkTrainBehavior : public MLPNetworkTrainBehavior {
  // Operations
public:
  MLPNoNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
private:
  Rcpp::List train (Rcpp::List parameterList);
  std::string getName ();
};


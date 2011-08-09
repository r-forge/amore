#pragma once
#include "MLPNetworkTrainBehavior.h"

/// class MLPNoNetworkTrainBehavior - 
class MLPNoNetworkTrainBehavior : public MLPNetworkTrainBehavior {
  // Operations
public:
  MLPNoNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
private:
  std::string getName ();
protected:
  Rcpp::List train (Rcpp::List parameterList);
};


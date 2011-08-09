#pragma once
#include "NetworkTrainBehavior.h"

/// class MLPNetworkTrainBehavior - 
class MLPNetworkTrainBehavior : public NetworkTrainBehavior {
  // Operations
protected:
  MLPNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
  virtual std::string getName () = 0;
};


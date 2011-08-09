#pragma once
#include "MLPNetworkTrainBehavior.h"

/// class AdaptNetworkTrainBehavior - 
class AdaptNetworkTrainBehavior : public MLPNetworkTrainBehavior {
  // Operations
protected:
  AdaptNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
  virtual std::string getName () = 0;
};


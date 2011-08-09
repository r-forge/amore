#pragma once
#include "MLPNetworkTrainBehavior.h"

/// class BatchNetworkTrainBehavior - 
class BatchNetworkTrainBehavior : public MLPNetworkTrainBehavior {
  // Operations
protected:
  BatchNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
  virtual std::string getName () = 0;
};


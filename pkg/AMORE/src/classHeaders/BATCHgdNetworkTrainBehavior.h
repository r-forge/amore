#pragma once
#include "BatchNetworkTrainBehavior.h"

/// class BATCHgdNetworkTrainBehavior - 
class BATCHgdNetworkTrainBehavior : public BatchNetworkTrainBehavior {
  // Operations
public:
  BATCHgdNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
protected:
  Rcpp::List train (Rcpp::List parameterList);
  std::string getName ();
};


#pragma once
#include "BatchNetworkTrainBehavior.h"

/// class BATCHgdNetworkTrainBehavior - 
class BATCHgdNetworkTrainBehavior : public BatchNetworkTrainBehavior {
  // Operations
public:
  BATCHgdNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
private:
  Rcpp::List train (Rcpp::List parameterList);
  std::string getName ();
};


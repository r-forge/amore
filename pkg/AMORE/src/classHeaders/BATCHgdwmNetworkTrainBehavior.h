#pragma once
#include "BatchNetworkTrainBehavior.h"

/// class BATCHgdwmNetworkTrainBehavior - 
class BATCHgdwmNetworkTrainBehavior : public BatchNetworkTrainBehavior {
  // Operations
public:
  BATCHgdwmNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
private:
  Rcpp::List train (Rcpp::List parameterList);
  std::string getName ();
};


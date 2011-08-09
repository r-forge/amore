#pragma once
#include "BatchNetworkTrainBehavior.h"

/// class BATCHgdwmNetworkTrainBehavior - 
class BATCHgdwmNetworkTrainBehavior : public BatchNetworkTrainBehavior {
  // Operations
public:
  BATCHgdwmNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
protected:
  Rcpp::List train (Rcpp::List parameterList);
  std::string getName ();
};


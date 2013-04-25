#pragma once
#include "AdaptNetworkTrainBehavior.h"

/// class ADAPTgdwmNetworkTrainBehavior - 
class ADAPTgdwmNetworkTrainBehavior : public AdaptNetworkTrainBehavior {
  // Operations
public:
  ADAPTgdwmNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
private:
  Rcpp::List train (Rcpp::List parameterList);
  std::string getName ();
};

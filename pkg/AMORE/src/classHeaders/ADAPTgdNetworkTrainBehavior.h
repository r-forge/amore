#pragma once
#include "AdaptNetworkTrainBehavior.h"

/// class ADAPTgdNetworkTrainBehavior - 
class ADAPTgdNetworkTrainBehavior : public AdaptNetworkTrainBehavior {
  // Operations
public:
  ADAPTgdNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
protected:
  Rcpp::List train (Rcpp::List parameterList);
  std::string getName ();
};


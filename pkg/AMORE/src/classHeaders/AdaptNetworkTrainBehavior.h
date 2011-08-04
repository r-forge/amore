#pragma once
#include "MLPNetworkTrainBehavior.h"

/// class AdaptNetworkTrainBehavior - 
class AdaptNetworkTrainBehavior : public MLPNetworkTrainBehavior {
  // Operations
public:
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
};


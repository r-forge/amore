#pragma once
#include "NetworkTrainBehavior.h"

/// class AdaptNetworkTrainBehavior - 
class AdaptNetworkTrainBehavior : public NetworkTrainBehavior {
  // Operations
public:
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
};


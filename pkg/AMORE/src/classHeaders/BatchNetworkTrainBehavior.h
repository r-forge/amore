#pragma once
#include "NetworkTrainBehavior.h"

/// class BatchNetworkTrainBehavior - 
class BatchNetworkTrainBehavior : public NetworkTrainBehavior {
  // Operations
public:
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
};


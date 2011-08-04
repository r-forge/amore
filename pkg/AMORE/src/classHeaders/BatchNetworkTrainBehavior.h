#pragma once
#include "MLPNetworkTrainBehavior.h"

/// class BatchNetworkTrainBehavior - 
class BatchNetworkTrainBehavior : public MLPNetworkTrainBehavior {
  // Operations
public:
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
};


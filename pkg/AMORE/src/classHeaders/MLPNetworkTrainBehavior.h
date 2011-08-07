#pragma once
#include "NetworkTrainBehavior.h"

/// class MLPNetworkTrainBehavior - 
class MLPNetworkTrainBehavior : public NetworkTrainBehavior {
  // Operations
protected:
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
};


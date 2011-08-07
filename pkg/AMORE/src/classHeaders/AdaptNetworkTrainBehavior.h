#pragma once
#include "MLPNetworkTrainBehavior.h"

/// class AdaptNetworkTrainBehavior - 
class AdaptNetworkTrainBehavior : public MLPNetworkTrainBehavior {
  // Operations
protected:
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
};


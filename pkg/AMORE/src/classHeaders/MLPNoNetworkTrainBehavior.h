#pragma once
#include "MLPNetworkTrainBehavior.h"

/// class MLPNoNetworkTrainBehavior - 
class MLPNoNetworkTrainBehavior : public MLPNetworkTrainBehavior {
  // Operations
protected:
  Rcpp::List train (Rcpp::List parameterList);
};


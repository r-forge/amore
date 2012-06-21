#pragma once
#include "NetworkTrainBehavior.h"

/// class NoNetworkTrainBehavior - 
class NoNetworkTrainBehavior : public NetworkTrainBehavior {
  // Operations
public:
  Rcpp::List train (Rcpp::List parameterList);
};


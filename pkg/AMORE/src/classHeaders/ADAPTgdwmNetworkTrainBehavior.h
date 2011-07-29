#pragma once
#include "AdaptNetworkTrainBehavior.h"

/// class ADAPTgdwmNetworkTrainBehavior - 
class ADAPTgdwmNetworkTrainBehavior : public AdaptNetworkTrainBehavior {
  // Operations
public:
  Rcpp::List train (Rcpp::List parameterList);
};


#pragma once
#include "AdaptNetworkTrainBehavior.h"

/// class ADAPTgdNetworkTrainBehavior - 
class ADAPTgdNetworkTrainBehavior : public AdaptNetworkTrainBehavior {
  // Operations
public:
  Rcpp::List train (Rcpp::List parameterList);
};


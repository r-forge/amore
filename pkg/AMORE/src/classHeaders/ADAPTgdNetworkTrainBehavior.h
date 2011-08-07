#pragma once
#include "AdaptNetworkTrainBehavior.h"

/// class ADAPTgdNetworkTrainBehavior - 
class ADAPTgdNetworkTrainBehavior : public AdaptNetworkTrainBehavior {
  // Operations
protected:
  Rcpp::List train (Rcpp::List parameterList);
};


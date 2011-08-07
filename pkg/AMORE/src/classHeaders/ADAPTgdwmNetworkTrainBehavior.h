#pragma once
#include "AdaptNetworkTrainBehavior.h"

/// class ADAPTgdwmNetworkTrainBehavior - 
class ADAPTgdwmNetworkTrainBehavior : public AdaptNetworkTrainBehavior {
  // Operations
protected:
  Rcpp::List train (Rcpp::List parameterList);
};


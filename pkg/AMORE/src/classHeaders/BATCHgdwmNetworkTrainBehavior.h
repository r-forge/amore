#pragma once
#include "BatchNetworkTrainBehavior.h"

/// class BATCHgdwmNetworkTrainBehavior - 
class BATCHgdwmNetworkTrainBehavior : public BatchNetworkTrainBehavior {
  // Operations
public:
  Rcpp::List train (Rcpp::List parameterList);
};


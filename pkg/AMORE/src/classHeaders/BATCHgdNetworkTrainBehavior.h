#pragma once
#include "BatchNetworkTrainBehavior.h"

/// class BATCHgdNetworkTrainBehavior - 
class BATCHgdNetworkTrainBehavior : public BatchNetworkTrainBehavior {
  // Operations
public:
  Rcpp::List train (Rcpp::List parameterList);
};


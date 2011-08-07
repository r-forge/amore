#pragma once
#include "BatchNetworkTrainBehavior.h"

/// class BATCHgdNetworkTrainBehavior - 
class BATCHgdNetworkTrainBehavior : public BatchNetworkTrainBehavior {
  // Operations
protected:
  Rcpp::List train (Rcpp::List parameterList);
};


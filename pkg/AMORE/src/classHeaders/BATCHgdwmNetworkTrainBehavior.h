#pragma once
#include "BatchNetworkTrainBehavior.h"

/// class BATCHgdwmNetworkTrainBehavior - 
class BATCHgdwmNetworkTrainBehavior : public BatchNetworkTrainBehavior {
  // Operations
protected:
  Rcpp::List train (Rcpp::List parameterList);
};


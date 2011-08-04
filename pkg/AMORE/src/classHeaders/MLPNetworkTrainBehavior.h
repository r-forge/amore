#pragma once
/// class MLPNetworkTrainBehavior - 
class MLPNetworkTrainBehavior {
  // Operations
public:
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
};


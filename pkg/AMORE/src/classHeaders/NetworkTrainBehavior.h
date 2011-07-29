#pragma once
// Interface
/// class NetworkTrainBehavior - 
class NetworkTrainBehavior {
  // Operations
public:
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
};


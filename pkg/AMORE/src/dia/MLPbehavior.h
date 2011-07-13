#pragma once
#include "PredictBehavior.h"

/// class MLPbehavior - 
class MLPbehavior : public PredictBehavior {
  // Attributes
public:
  double d_accumulator;
private:
  double d_bias;
  double d_output;
  Container<Con> d_nCons;
  // Operations
public:
  void predict ();
};


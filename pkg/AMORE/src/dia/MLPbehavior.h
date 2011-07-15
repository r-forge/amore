#pragma once
#include "PredictBehavior.h"

/// class MLPbehavior - 
class MLPbehavior : public PredictBehavior {
  // Attributes
private:
  double d_bias;
  double d_output;
  ConContainerPtr d_nCons;
  double d_accumulator;
  // Operations
public:
friend class MLPfactory; 
  void predict ();
  void show ();
};


#pragma once
#include "PredictBehavior.h"

/// class MLPbehavior - 
class MLPbehavior : public PredictBehavior {
  // Attributes
private:
  double d_bias;
  // Operations
public:
friend class MLPfactory; 
  MLPbehavior ();
  void predict ();
  void show ();
};


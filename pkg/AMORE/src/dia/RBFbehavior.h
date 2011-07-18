#pragma once
#include "PredictBehavior.h"

/// class RBFbehavior - 
class RBFbehavior : public PredictBehavior {
  // Attributes
private:
  double d_width;
  double d_altitude;
  // Operations
public:
  RBFbehavior ();
  void predict ();
  void show ();
};


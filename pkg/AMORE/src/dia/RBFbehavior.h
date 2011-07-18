#pragma once
#include "PredictBehavior.h"

/// class RBFbehavior - 
class RBFbehavior : public PredictBehavior {
  // Attributes
private:
  double d_width;
  double d_altitude;
  double d_output;
  ConContainerPtr d_nCons;
  double d_inducedLocalField;
   d_activationFunction;
  // Operations
public:
  void predict ();
  void show ();
  double getOutput ();
  void setOutput (double output);
};


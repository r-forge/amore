#pragma once
#include "PredictBehavior.h"

/// class MLPbehavior - 
class MLPbehavior : public PredictBehavior {
  // Attributes
private:
  double d_bias;
  double d_output;
  ConContainerPtr d_nCons;
  double d_inducedLocalField;
   d_activationFunction;
  // Operations
public:
friend class MLPfactory; 
  void predict ();
  void show ();
  double getOutput ();
  void setOutput (double output);
};


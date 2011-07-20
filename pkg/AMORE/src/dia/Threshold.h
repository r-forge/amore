#pragma once
#include "ActivationFunction.h"

/// class Threshold - 
class Threshold : public ActivationFunction {
  // Operations
public:
  Threshold (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};


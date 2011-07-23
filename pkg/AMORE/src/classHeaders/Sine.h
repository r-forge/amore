#pragma once
#include "ActivationFunction.h"

/// class Sine - 
class Sine : public ActivationFunction {
  // Operations
public:
  Sine (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};


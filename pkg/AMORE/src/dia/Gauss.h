#pragma once
#include "ActivationFunction.h"

/// class Gauss - 
class Gauss : public ActivationFunction {
  // Operations
public:
  Gauss (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};


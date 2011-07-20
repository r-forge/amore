#pragma once
#include "ActivationFunction.h"

/// class Tanh - 
class Tanh : public ActivationFunction {
  // Operations
public:
  Tanh (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};


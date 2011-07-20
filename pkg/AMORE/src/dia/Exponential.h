#pragma once
#include "ActivationFunction.h"

/// class Exponential - 
class Exponential : public ActivationFunction {
  // Operations
public:
  Exponential (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};


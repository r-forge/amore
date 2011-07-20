#pragma once
#include "ActivationFunction.h"

/// class Identity - 
class Identity : public ActivationFunction {
  // Operations
public:
  Identity (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};


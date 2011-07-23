#pragma once
#include "ActivationFunction.h"

/// class Square - 
class Square : public ActivationFunction {
  // Operations
public:
  Square (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};


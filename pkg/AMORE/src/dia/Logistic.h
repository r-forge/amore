#pragma once
#include "ActivationFunction.h"

/// class Logistic - 
class Logistic : public ActivationFunction {
  // Operations
public:
  Logistic (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};


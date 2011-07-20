#pragma once
#include "ActivationFunction.h"

/// class Elliot - 
class Elliot : public ActivationFunction {
  // Operations
public:
  Elliot (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};


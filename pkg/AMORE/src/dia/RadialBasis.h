#pragma once
#include "ActivationFunction.h"

/// class RadialBasis - 
class RadialBasis : public ActivationFunction {
  // Operations
public:
  RadialBasis (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};


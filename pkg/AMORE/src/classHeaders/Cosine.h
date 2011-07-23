#pragma once
#include "ActivationFunction.h"

/// class Cosine - 
class Cosine : public ActivationFunction {
  // Operations
public:
  Cosine (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};


#pragma once
#include "ActivationFunction.h"

/// class Reciprocal - 
class Reciprocal : public ActivationFunction {
  // Operations
public:
  Reciprocal (NeuronPtr neuronPtr);
  void f0 ();
  void f1 ();
};


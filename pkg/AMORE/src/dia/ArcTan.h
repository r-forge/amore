#pragma once
#include "ActivationFunction.h"

/// class ArcTan - 
class ArcTan : public ActivationFunction {
  // Operations
public:
  Arctan (NeuronPtr neuronPtr);
  double f0 ();
  double f1 ();
};

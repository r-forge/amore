#pragma once
#include "MLPfactory.h"

/// class ExponentialFactory - 
class ExponentialFactory : public MLPfactory {
  // Operations
public:
  ExponentialFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


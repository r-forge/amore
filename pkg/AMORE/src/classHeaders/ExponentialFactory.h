#pragma once
#include "MLPfactory.h"

/// class ExponentialFactory - 
class ExponentialFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


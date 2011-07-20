#pragma once
#include "MLPfactory.h"

/// class GaussFactory - 
class GaussFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


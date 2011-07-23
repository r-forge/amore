#pragma once
#include "MLPfactory.h"

/// class IdentityFactory - 
class IdentityFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


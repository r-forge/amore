#pragma once
#include "MLPfactory.h"

/// class IdentityFactory - 
class IdentityFactory : public MLPfactory {
  // Operations
public:
  IdentityFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


#pragma once
#include "MLPfactory.h"

/// class TanhFactory - 
class TanhFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


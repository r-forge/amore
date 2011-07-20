#pragma once
#include "MLPfactory.h"

/// class CosineFactory - 
class CosineFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


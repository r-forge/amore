#pragma once
#include "MLPfactory.h"

/// class SineFactory - 
class SineFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


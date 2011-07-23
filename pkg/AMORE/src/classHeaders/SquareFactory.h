#pragma once
#include "MLPfactory.h"

/// class SquareFactory - 
class SquareFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


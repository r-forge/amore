#pragma once
#include "MLPfactory.h"

/// class ElliotFactory - 
class ElliotFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


#pragma once
#include "RBFfactory.h"

/// class RadialBasisFactory - 
class RadialBasisFactory : public RBFfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


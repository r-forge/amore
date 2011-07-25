#pragma once
#include "RBFfactory.h"

/// class RadialBasisFactory - 
class RadialBasisFactory : public RBFfactory {
  // Operations
public:
  RadialBasisFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


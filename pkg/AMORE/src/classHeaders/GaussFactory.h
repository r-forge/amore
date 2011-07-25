#pragma once
#include "MLPfactory.h"

/// class GaussFactory - 
class GaussFactory : public MLPfactory {
  // Operations
public:
  GaussFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


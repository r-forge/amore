#pragma once
#include "MLPfactory.h"

/// class CosineFactory - 
class CosineFactory : public MLPfactory {
  // Operations
public:
  CosineFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


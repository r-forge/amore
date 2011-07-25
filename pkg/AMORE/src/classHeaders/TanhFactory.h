#pragma once
#include "MLPfactory.h"

/// class TanhFactory - 
class TanhFactory : public MLPfactory {
  // Operations
public:
  TanhFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


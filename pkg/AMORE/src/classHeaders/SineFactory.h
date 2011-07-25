#pragma once
#include "MLPfactory.h"

/// class SineFactory - 
class SineFactory : public MLPfactory {
  // Operations
public:
  SineFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


#pragma once
#include "MLPfactory.h"

/// class ElliotFactory - 
class ElliotFactory : public MLPfactory {
  // Operations
public:
  ElliotFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


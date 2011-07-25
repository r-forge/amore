#pragma once
#include "MLPfactory.h"

/// class SquareFactory - 
class SquareFactory : public MLPfactory {
  // Operations
public:
  SquareFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


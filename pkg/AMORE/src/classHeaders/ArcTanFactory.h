#pragma once
#include "MLPfactory.h"

/// class ArcTanFactory - 
class ArcTanFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


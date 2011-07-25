#pragma once
#include "MLPfactory.h"

/// class ArcTanFactory - 
class ArcTanFactory : public MLPfactory {
  // Operations
public:
  ArcTanFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


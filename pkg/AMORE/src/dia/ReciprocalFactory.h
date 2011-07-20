#pragma once
#include "MLPfactory.h"

/// class ReciprocalFactory - 
class ReciprocalFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


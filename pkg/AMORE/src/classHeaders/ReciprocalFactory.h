#pragma once
#include "MLPfactory.h"

/// class ReciprocalFactory - 
class ReciprocalFactory : public MLPfactory {
  // Operations
public:
  ReciprocalFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


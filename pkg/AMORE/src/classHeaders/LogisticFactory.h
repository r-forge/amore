#pragma once
#include "MLPfactory.h"

/// class LogisticFactory - 
class LogisticFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


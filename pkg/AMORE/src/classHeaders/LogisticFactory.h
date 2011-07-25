#pragma once
#include "MLPfactory.h"

/// class LogisticFactory - 
class LogisticFactory : public MLPfactory {
  // Operations
public:
  LogisticFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


#pragma once
#include "MLPfactory.h"

/// class ThresholdFactory - 
class ThresholdFactory : public MLPfactory {
  // Operations
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


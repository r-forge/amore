#pragma once
#include "MLPfactory.h"

/// class ThresholdFactory - 
class ThresholdFactory : public MLPfactory {
  // Operations
public:
  ThresholdFactory ();
private:
  ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr);
};


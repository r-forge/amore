#pragma once
#include "ADAPTFactory.h"

/// class ADAPTgdwmFactory - 
class ADAPTgdwmFactory : public ADAPTFactory {
  // Operations
protected:
  NeuronTrainBehaviorPtr makeNeuronTrainBehavior (NeuronPtr neuronPtr);
};


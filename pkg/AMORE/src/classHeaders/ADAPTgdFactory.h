#pragma once
#include "ADAPTFactory.h"

/// class ADAPTgdFactory - 
class ADAPTgdFactory : public ADAPTFactory {
  // Operations
protected:
  NeuronTrainBehaviorPtr makeNeuronTrainBehavior (NeuronPtr neuronPtr);
};


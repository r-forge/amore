#pragma once
#include "ADAPTFactory.h"

/// class ADAPTgdwmFactory - 
class ADAPTgdwmFactory : public ADAPTFactory {
  // Operations
protected:
  NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
};


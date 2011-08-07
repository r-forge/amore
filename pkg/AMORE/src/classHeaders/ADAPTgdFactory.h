#pragma once
#include "ADAPTFactory.h"

/// class ADAPTgdFactory - 
class ADAPTgdFactory : public ADAPTFactory {
  // Operations
protected:
  NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
};


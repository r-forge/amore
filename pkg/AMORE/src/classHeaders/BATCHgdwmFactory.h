#pragma once
#include "BATCHFactory.h"

/// class BATCHgdwmFactory - 
class BATCHgdwmFactory : public BATCHFactory {
  // Operations
protected:
  NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
};


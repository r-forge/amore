#pragma once
#include "BATCHFactory.h"

/// class BATCHgdFactory - 
class BATCHgdFactory : public BATCHFactory {
  // Operations
protected:
  NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
};


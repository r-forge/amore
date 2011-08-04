#pragma once
#include "BATCHFactory.h"

/// class BATCHgdFactory - 
class BATCHgdFactory : public BATCHFactory {
  // Operations
protected:
  NeuronTrainBehaviorPtr makeNeuronTrainBehavior (NeuronPtr neuronPtr);
};


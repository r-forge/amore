#pragma once
#include "BATCHFactory.h"

/// class BATCHgdwmFactory - 
class BATCHgdwmFactory : public BATCHFactory {
  // Operations
protected:
  NeuronTrainBehaviorPtr makeNeuronTrainBehavior (NeuronPtr neuronPtr);
};


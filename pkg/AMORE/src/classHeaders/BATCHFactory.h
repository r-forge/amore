#pragma once
#include "MLPfactory.h"

/// class BATCHFactory - 
class BATCHFactory : public MLPfactory {
  // Operations
protected:
  NetworkTrainBehaviorPtr makeNetworkTrainBehavior ();
  virtual NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr) = 0;
  virtual NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr) = 0;
};


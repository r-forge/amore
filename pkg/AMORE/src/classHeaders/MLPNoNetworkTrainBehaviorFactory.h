#pragma once
#include "MLPfactory.h"

/// class MLPNoNetworkTrainBehaviorFactory - 
class MLPNoNetworkTrainBehaviorFactory : public MLPfactory {
  // Operations
protected:
  NetworkTrainBehaviorPtr makeNetworkTrainBehavior ();
  NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
};


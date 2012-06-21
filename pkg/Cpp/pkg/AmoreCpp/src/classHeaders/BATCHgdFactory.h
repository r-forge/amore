#pragma once
#include "BATCHFactory.h"

/// class BATCHgdFactory - 
class BATCHgdFactory : public BATCHFactory {
  // Operations
protected:
  NetworkTrainBehaviorPtr makeNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
  NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
};


#pragma once
#include "BATCHFactory.h"

/// class BATCHgdwmFactory - 
class BATCHgdwmFactory : public BATCHFactory {
  // Operations
protected:
  NetworkTrainBehaviorPtr makeNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
  NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
};


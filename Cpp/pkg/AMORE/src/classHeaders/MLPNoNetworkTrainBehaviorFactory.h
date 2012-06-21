#pragma once
#include "MLPfactory.h"

/// class MLPNoNetworkTrainBehaviorFactory - 
class MLPNoNetworkTrainBehaviorFactory : public MLPfactory {
  // Operations
protected:
  NetworkTrainBehaviorPtr makeNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
  NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
};


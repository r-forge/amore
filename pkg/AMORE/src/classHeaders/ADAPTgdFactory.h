#pragma once
#include "ADAPTFactory.h"

/// class ADAPTgdFactory - 
class ADAPTgdFactory : public ADAPTFactory {
  // Operations
protected:
  NetworkTrainBehaviorPtr makeNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
  NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
};


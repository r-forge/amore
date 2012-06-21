#pragma once
#include "ADAPTFactory.h"

/// class ADAPTgdwmFactory - 
class ADAPTgdwmFactory : public ADAPTFactory {
  // Operations
protected:
  NetworkTrainBehaviorPtr makeNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr);
  NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
};


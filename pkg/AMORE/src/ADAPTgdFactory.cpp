/*
 * ADAPTgdFactory.cpp
 *
 *  Created on: 30/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdFactory.h"

NetworkTrainBehaviorPtr
ADAPTgdFactory::makeNetworkTrainBehavior(NeuralNetworkPtr neuralNetworkPtr)
{
  NetworkTrainBehaviorPtr networkTrainBehaviorPtr(new ADAPTgdNetworkTrainBehavior(neuralNetworkPtr));
  return networkTrainBehaviorPtr;

}

NeuronTrainBehaviorPtr
ADAPTgdFactory::makeOutputNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new ADAPTgdOutputNeuronTrainBehavior);
  return  neuronTrainBehaviorPtr;
}

NeuronTrainBehaviorPtr
ADAPTgdFactory::makeHiddenNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr(  new ADAPTgdHiddenNeuronTrainBehavior);
  return  neuronTrainBehaviorPtr;
}

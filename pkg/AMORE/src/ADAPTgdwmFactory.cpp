/*
 * ADAPTgdwmFactory.cpp
 *
 *  Created on: 5/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdwmFactory.h"


NetworkTrainBehaviorPtr
ADAPTgdwmFactory::makeNetworkTrainBehavior(NeuralNetworkPtr neuralNetworkPtr)
{
  NetworkTrainBehaviorPtr networkTrainBehaviorPtr(new ADAPTgdwmNetworkTrainBehavior(neuralNetworkPtr));
  return  networkTrainBehaviorPtr;

}



NeuronTrainBehaviorPtr
ADAPTgdwmFactory::makeOutputNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new ADAPTgdwmOutputNeuronTrainBehavior );
  return  neuronTrainBehaviorPtr;
}

NeuronTrainBehaviorPtr
ADAPTgdwmFactory::makeHiddenNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new ADAPTgdwmHiddenNeuronTrainBehavior );
  return  neuronTrainBehaviorPtr;
}

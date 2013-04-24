/*
 * ADAPTgdFactory.cpp
 *
 *  Created on: 30/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdFactory.h"
#include "classHeaders/ADAPTgdNetworkTrainBehavior.h"
#include "classHeaders/ADAPTgdOutputNeuronTrainBehavior.h"
#include "classHeaders/ADAPTgdHiddenNeuronTrainBehavior.h"

NetworkTrainBehaviorPtr
ADAPTgdFactory::makeNetworkTrainBehavior(NeuralNetworkPtr neuralNetworkPtr)
{
  NetworkTrainBehaviorPtr networkTrainBehaviorPtr(new ADAPTgdNetworkTrainBehavior(neuralNetworkPtr));
  return networkTrainBehaviorPtr;

}

NeuronTrainBehaviorPtr
ADAPTgdFactory::makeOutputNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new ADAPTgdOutputNeuronTrainBehavior(neuronPtr) );
  return  neuronTrainBehaviorPtr;
}

NeuronTrainBehaviorPtr
ADAPTgdFactory::makeHiddenNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr(  new ADAPTgdHiddenNeuronTrainBehavior(neuronPtr) );
  return  neuronTrainBehaviorPtr;
}

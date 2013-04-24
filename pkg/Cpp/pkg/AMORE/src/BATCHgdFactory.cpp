/*
 * BATCHgdFactory.cpp
 *
 *  Created on: 5/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/BATCHgdFactory.h"
#include "classHeaders/BATCHgdNetworkTrainBehavior.h"
#include "classHeaders/BATCHgdOutputNeuronTrainBehavior.h"
#include "classHeaders/BATCHgdHiddenNeuronTrainBehavior.h"



NetworkTrainBehaviorPtr
BATCHgdFactory::makeNetworkTrainBehavior(NeuralNetworkPtr neuralNetworkPtr)
{
  NetworkTrainBehaviorPtr networkTrainBehaviorPtr(new BATCHgdNetworkTrainBehavior(neuralNetworkPtr));
  return networkTrainBehaviorPtr;

}


NeuronTrainBehaviorPtr
BATCHgdFactory::makeOutputNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new BATCHgdOutputNeuronTrainBehavior(neuronPtr) );
  return neuronTrainBehaviorPtr;
}


NeuronTrainBehaviorPtr
BATCHgdFactory::makeHiddenNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new BATCHgdHiddenNeuronTrainBehavior(neuronPtr) );
  return neuronTrainBehaviorPtr;
}

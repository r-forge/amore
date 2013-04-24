/*
 * BATCHgdwmFactory.cpp
 *
 *  Created on: 5/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/BATCHgdwmFactory.h"
#include "classHeaders/BATCHgdwmNetworkTrainBehavior.h"
#include "classHeaders/BATCHgdwmOutputNeuronTrainBehavior.h"
#include "classHeaders/BATCHgdwmHiddenNeuronTrainBehavior.h"




NetworkTrainBehaviorPtr
BATCHgdwmFactory::makeNetworkTrainBehavior(NeuralNetworkPtr neuralNetworkPtr)
{
  NetworkTrainBehaviorPtr networkTrainBehaviorPtr(new BATCHgdwmNetworkTrainBehavior(neuralNetworkPtr));
  return networkTrainBehaviorPtr;
}


NeuronTrainBehaviorPtr
BATCHgdwmFactory::makeOutputNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new BATCHgdwmOutputNeuronTrainBehavior(neuronPtr) );
  return neuronTrainBehaviorPtr;
}

NeuronTrainBehaviorPtr
BATCHgdwmFactory::makeHiddenNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new BATCHgdwmHiddenNeuronTrainBehavior(neuronPtr) );
  return neuronTrainBehaviorPtr;
}

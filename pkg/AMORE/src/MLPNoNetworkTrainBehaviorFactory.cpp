/*
 * NoNetworkTrainBehaviorFactory.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/MLPfactory.h"
#include "classHeaders/ADAPTFactory.h"

#if 0
NetworkTrainBehaviorPtr
NoNetworkTrainBehaviorFactory::makeNetworkTrainBehavior()
{
  NetworkTrainBehaviorPtr networkTrainBehaviorPtr (new NoNetworkTrainBehavior());
  return networkTrainBehaviorPtr;
}

NeuronTrainBehaviorPtr
NoNetworkTrainBehaviorFactory::makeNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (new NoNeuronTrainBehavior());
  return  neuronTrainBehaviorPtr;

}

#endif

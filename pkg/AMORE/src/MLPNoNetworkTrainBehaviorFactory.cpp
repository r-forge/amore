/*
 * MLPNoNetworkTrainBehaviorFactory.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/MLPNoNetworkTrainBehaviorFactory.h"


NetworkTrainBehaviorPtr
MLPNoNetworkTrainBehaviorFactory::makeNetworkTrainBehavior(NeuralNetworkPtr neuralNetworkPtr)
{
  NetworkTrainBehaviorPtr networkTrainBehaviorPtr (new MLPNoNetworkTrainBehavior(neuralNetworkPtr) );
  return networkTrainBehaviorPtr;
}



NeuronTrainBehaviorPtr
MLPNoNetworkTrainBehaviorFactory::makeOutputNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (new NoNeuronTrainBehavior );
  return  neuronTrainBehaviorPtr;

}


NeuronTrainBehaviorPtr
MLPNoNetworkTrainBehaviorFactory::makeHiddenNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (new NoNeuronTrainBehavior );
  return  neuronTrainBehaviorPtr;
}

/*
 * MLPNoNetworkTrainBehaviorFactory.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/MLPNoNetworkTrainBehaviorFactory.h"
#include "classHeaders/MLPNoNetworkTrainBehavior.h"
#include "classHeaders/NeuronTrainBehavior.h"
#include "classHeaders/NoNeuronTrainBehavior.h"



NetworkTrainBehaviorPtr
MLPNoNetworkTrainBehaviorFactory::makeNetworkTrainBehavior(NeuralNetworkPtr neuralNetworkPtr)
{
  NetworkTrainBehaviorPtr networkTrainBehaviorPtr (new MLPNoNetworkTrainBehavior(neuralNetworkPtr) );
  return networkTrainBehaviorPtr;
}



NeuronTrainBehaviorPtr
MLPNoNetworkTrainBehaviorFactory::makeOutputNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (new NoNeuronTrainBehavior(neuronPtr) );
  return  neuronTrainBehaviorPtr;

}


NeuronTrainBehaviorPtr
MLPNoNetworkTrainBehaviorFactory::makeHiddenNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (new NoNeuronTrainBehavior(neuronPtr) );
  return  neuronTrainBehaviorPtr;
}

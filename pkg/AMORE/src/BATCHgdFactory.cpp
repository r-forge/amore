/*
 * BATCHgdFactory.cpp
 *
 *  Created on: 5/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/BATCHgdFactory.h"


NetworkTrainBehaviorPtr
BATCHgdFactory::makeNetworkTrainBehavior(NeuralNetworkPtr neuralNetworkPtr)
{
  NetworkTrainBehaviorPtr networkTrainBehavior(new BATCHgdNetworkTrainBehavior(neuralNetworkPtr));

}



NeuronTrainBehaviorPtr
BATCHgdFactory::makeOutputNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new BATCHgdOutputNeuronTrainBehavior );
}

NeuronTrainBehaviorPtr
BATCHgdFactory::makeHiddenNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new BATCHgdHiddenNeuronTrainBehavior );
}

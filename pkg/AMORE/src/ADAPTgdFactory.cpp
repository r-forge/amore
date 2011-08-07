/*
 * ADAPTgdFactory.cpp
 *
 *  Created on: 30/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdFactory.h"




NeuronTrainBehaviorPtr
ADAPTgdFactory::makeOutputNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new ADAPTgdOutputNeuronTrainBehavior );
}

NeuronTrainBehaviorPtr
ADAPTgdFactory::makeHiddenNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new ADAPTgdHiddenNeuronTrainBehavior );
}

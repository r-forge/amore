/*
 * ADAPTgdwmFactory.cpp
 *
 *  Created on: 5/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdwmFactory.h"




NeuronTrainBehaviorPtr
ADAPTgdwmFactory::makeOutputNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new ADAPTgdwmOutputNeuronTrainBehavior );
}

NeuronTrainBehaviorPtr
ADAPTgdwmFactory::makeHiddenNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new ADAPTgdwmHiddenNeuronTrainBehavior );
}

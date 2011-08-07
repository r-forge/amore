/*
 * BATCHgdwmFactory.cpp
 *
 *  Created on: 5/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/BATCHgdwmFactory.h"




NeuronTrainBehaviorPtr
BATCHgdwmFactory::makeOutputNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new BATCHgdwmOutputNeuronTrainBehavior );
}

NeuronTrainBehaviorPtr
BATCHgdwmFactory::makeHiddenNeuronTrainBehavior(NeuronPtr neuronPtr)
{
  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr( new BATCHgdwmHiddenNeuronTrainBehavior );
}

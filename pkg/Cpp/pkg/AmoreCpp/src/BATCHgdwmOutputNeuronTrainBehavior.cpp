/*
 * BATCHgdwmOutputNeuronTrainBehavior.cpp
 *
 *  Created on: 10/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/BATCHgdwmOutputNeuronTrainBehavior.h"

BATCHgdwmOutputNeuronTrainBehavior::BATCHgdwmOutputNeuronTrainBehavior(NeuronPtr neuronPtr) :
  BATCHgdwmNeuronTrainBehavior(neuronPtr)
{
}

void
BATCHgdwmOutputNeuronTrainBehavior::singlePatternBackwardAction()
{
      Rprintf("TODO");
}

void
BATCHgdwmOutputNeuronTrainBehavior::endOfEpochAction()
{
  Rprintf("TODO");
}

std::string
BATCHgdwmOutputNeuronTrainBehavior::getName()
{
  std::string name("BATCHgdwmOutputNeuronTrainBehavior");
  return name;
}

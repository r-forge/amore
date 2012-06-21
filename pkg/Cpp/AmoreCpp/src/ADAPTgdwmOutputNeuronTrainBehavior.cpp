/*
 * ADAPTgdwmOutputNeuronTrainBehavior.cpp
 *
 *  Created on: 30/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdwmOutputNeuronTrainBehavior.h"

ADAPTgdwmOutputNeuronTrainBehavior::ADAPTgdwmOutputNeuronTrainBehavior(NeuronPtr neuronPtr) :
  ADAPTgdwmNeuronTrainBehavior(neuronPtr)
{
}

void
ADAPTgdwmOutputNeuronTrainBehavior::singlePatternBackwardAction()
{
      Rprintf("TODO");
}

void
ADAPTgdwmOutputNeuronTrainBehavior::endOfEpochAction()
{
  Rprintf("TODO");
}

std::string
ADAPTgdwmOutputNeuronTrainBehavior::getName()
{
  std::string name("ADAPTgdwmOutputNeuronTrainBehavior");
  return name;
}

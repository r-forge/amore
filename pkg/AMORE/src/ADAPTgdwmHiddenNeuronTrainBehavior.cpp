/*
 * ADAPTgdwmHiddenNeuronTrainBehavior.cpp
 *
 *  Created on: 30/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdwmHiddenNeuronTrainBehavior.h"

ADAPTgdwmHiddenNeuronTrainBehavior::ADAPTgdwmHiddenNeuronTrainBehavior(NeuronPtr neuronPtr) :
  ADAPTgdwmNeuronTrainBehavior(neuronPtr)
{
}

void
ADAPTgdwmHiddenNeuronTrainBehavior::singlePatternBackwardAction()
{
      Rprintf("TODO");
}

void
ADAPTgdwmHiddenNeuronTrainBehavior::endOfEpochAction()
{
  Rprintf("TODO");
}

std::string
ADAPTgdwmHiddenNeuronTrainBehavior::getName()
{
  std::string name("ADAPTgdwmHiddenNeuronTrainBehavior");
  return name;
}

/*
 * ADAPTgdHiddenNeuronTrainBehavior.cpp
 *
 *  Created on: 08/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdHiddenNeuronTrainBehavior.h"

ADAPTgdHiddenNeuronTrainBehavior::ADAPTgdHiddenNeuronTrainBehavior(NeuronPtr neuronPtr) :
  ADAPTgdNeuronTrainBehavior(neuronPtr)
{
}

void
ADAPTgdHiddenNeuronTrainBehavior::singlePatternBackwardAction()
{
  Rprintf("TODO : ADAPTgdHiddenNeuronTrainBehavior::singlePatternBackwardAction \n");
}

void
ADAPTgdHiddenNeuronTrainBehavior::endOfEpochAction()
{
// There's nothing to do in this case.
}

std::string
ADAPTgdHiddenNeuronTrainBehavior::getName()
{
  std::string name("ADAPTgdHiddenNeuronTrainBehavior");
  return name;
}


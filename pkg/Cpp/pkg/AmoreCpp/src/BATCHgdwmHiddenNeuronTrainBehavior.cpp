/*
 * BATCHgdwmHiddenNeuronTrainBehavior.cpp
 *
 *  Created on: 10/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/BATCHgdwmHiddenNeuronTrainBehavior.h"

BATCHgdwmHiddenNeuronTrainBehavior::BATCHgdwmHiddenNeuronTrainBehavior(NeuronPtr neuronPtr) :
  BATCHgdwmNeuronTrainBehavior(neuronPtr)
{
}

void
BATCHgdwmHiddenNeuronTrainBehavior::singlePatternBackwardAction()
{
      Rprintf("TODO");
}

void
BATCHgdwmHiddenNeuronTrainBehavior::endOfEpochAction()
{
  Rprintf("TODO");
}

std::string
BATCHgdwmHiddenNeuronTrainBehavior::getName()
{
  std::string name("BATCHgdwmHiddenNeuronTrainBehavior");
  return name;
}

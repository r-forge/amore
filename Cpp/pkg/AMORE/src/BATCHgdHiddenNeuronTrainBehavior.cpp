/*
 * BATCHgdHiddenNeuronTrainBehavior.cpp
 *
 *  Created on: 10/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/BATCHgdHiddenNeuronTrainBehavior.h"

BATCHgdHiddenNeuronTrainBehavior::BATCHgdHiddenNeuronTrainBehavior(NeuronPtr neuronPtr) :
  BATCHgdNeuronTrainBehavior(neuronPtr)
{
}

void
BATCHgdHiddenNeuronTrainBehavior::singlePatternBackwardAction()
{
      Rprintf("TODO");
}

void
BATCHgdHiddenNeuronTrainBehavior::endOfEpochAction()
{
  Rprintf("TODO");
}

std::string
BATCHgdHiddenNeuronTrainBehavior::getName()
{
  std::string name("BATCHgdHiddenNeuronTrainBehavior");
  return name;
}

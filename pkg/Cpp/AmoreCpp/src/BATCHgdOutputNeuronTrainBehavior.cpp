/*
 * BATCHgdOutputNeuronTrainBehavior.cpp
 *
 *  Created on: 10/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/BATCHgdOutputNeuronTrainBehavior.h"

BATCHgdOutputNeuronTrainBehavior::BATCHgdOutputNeuronTrainBehavior(NeuronPtr neuronPtr) :
  BATCHgdNeuronTrainBehavior(neuronPtr)
{
}

void
BATCHgdOutputNeuronTrainBehavior::singlePatternBackwardAction()
{
      Rprintf("TODO");
}

void
BATCHgdOutputNeuronTrainBehavior::endOfEpochAction()
{
  Rprintf("TODO");
}

std::string
BATCHgdOutputNeuronTrainBehavior::getName()
{
  std::string name("BATCHgdOutputNeuronTrainBehavior");
  return name;
}

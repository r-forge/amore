/*
 * NoNeuronTrainBehavior.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/NoNeuronTrainBehavior.h"

void
NoNeuronTrainBehavior::singlePatternBackwardAction()
{
  Rprintf("\nNoNeuronTrainBehavior::singlePatternBackwardAction(). Set train behavior in order to train. \n");

}

void
NoNeuronTrainBehavior::endOfEpochAction()
{
  Rprintf("\nNoNeuronTrainBehavior.endOfEpochAction(). Set train behavior in order to train. \n");
}


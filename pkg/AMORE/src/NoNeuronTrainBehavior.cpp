/*
 * NoNeuronTrainBehavior.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/NoNeuronTrainBehavior.h"

NoNeuronTrainBehavior::NoNeuronTrainBehavior(NeuronPtr neuronPtr) :
  NeuronTrainBehavior(neuronPtr)
{
}

void
NoNeuronTrainBehavior::singlePatternBackwardAction()
{
//  Rprintf(      "\n[ NoNeuronTrainBehavior::singlePatternBackwardAction() ]: Set train behavior in order to train. \n");

}

void
NoNeuronTrainBehavior::endOfEpochAction()
{
//  Rprintf(    "\n[ NoNeuronTrainBehavior.endOfEpochAction() ]: Set train behavior in order to train. \n");
}

std::string
NoNeuronTrainBehavior::getName()
{
  std::string name("NoNeuronTrainBehavior");
  return name;
}


void
NoNeuronTrainBehavior::addToNeuronBias(double value)
{
//  Rprintf("\n[ NoNeuronTrainBehavior::addToNeuronBias() ]: No change made. Neuron Id: %d\n", d_neuron.lock()->getId() );
}


void
NoNeuronTrainBehavior::addToDelta(double value)
{
//  Rprintf("\n[ NoNeuronTrainBehavior::addToDelta() ]: No change made. Neuron Id: %d\n", d_neuron.lock()->getId() );
}

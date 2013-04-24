/*
 * MLPNeuronTrainBehavior.cpp
 *
 *  Created on: 09/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/MLPNeuronTrainBehavior.h"
#include "classHeaders/Neuron.h"

MLPNeuronTrainBehavior::MLPNeuronTrainBehavior(NeuronPtr neuronPtr) :
    NeuronTrainBehavior(neuronPtr)
{
}


void
MLPNeuronTrainBehavior::addToNeuronBias(double value)
{
  d_neuron->addToBias(value);
}


void
MLPNeuronTrainBehavior::addToDelta(double value)
{
   d_delta += value;
}

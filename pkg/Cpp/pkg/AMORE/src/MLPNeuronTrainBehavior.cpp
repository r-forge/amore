/*
 * MLPNeuronTrainBehavior.cpp
 *
 *  Created on: 09/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/MLPNeuronTrainBehavior.h"

MLPNeuronTrainBehavior::MLPNeuronTrainBehavior(NeuronPtr neuronPtr) :
    NeuronTrainBehavior(neuronPtr)
{
}


void
MLPNeuronTrainBehavior::addToNeuronBias(double value)
{
  NeuronPtr neuronPtr( d_neuron.lock() );
  neuronPtr->addToBias(value);
}


void
MLPNeuronTrainBehavior::addToDelta(double value)
{
   d_delta += value;
}

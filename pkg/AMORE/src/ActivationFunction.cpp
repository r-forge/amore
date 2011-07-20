/*
 * ActivationFunction.cpp
 *
 *  Created on: 18/07/2011
 *      Author: mcasl
 */

#include "dia/ActivationFunction.h"
//=========================================================================================================

ActivationFunction::ActivationFunction(NeuronPtr neuronPtr) :
  d_neuron(neuronPtr)
{
}

double
ActivationFunction::getInducedLocalField()
{
  NeuronPtr neuronPtr(d_neuron.lock());
  return neuronPtr->getInducedLocalField();
}


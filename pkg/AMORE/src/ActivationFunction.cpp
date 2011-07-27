/*
 * ActivationFunction.cpp
 *
 *  Created on: 18/07/2011
 *      Author: mcasl
 */
#include "package.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/ActivationFunction.h"
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


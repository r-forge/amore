/*
 * TanhFactory.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "classHeaders/NeuralFactory.h"
#include "classHeaders/MLPfactory.h"
#include "classHeaders/TanhFactory.h"

TanhFactory::TanhFactory()
{
}

ActivationFunctionPtr
TanhFactory::makeActivationFunction(NeuronPtr neuronPtr)
{
  ActivationFunctionPtr activationFunctionPtr(new Tanh(neuronPtr));
  return activationFunctionPtr;
}

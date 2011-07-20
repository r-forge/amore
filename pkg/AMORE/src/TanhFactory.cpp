/*
 * TanhFactory.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "dia/NeuralFactory.h"
#include "dia/MLPfactory.h"
#include "dia/TanhFactory.h"





ActivationFunctionPtr
TanhFactory::makeActivationFunction(NeuronPtr neuronPtr)
{
  ActivationFunctionPtr activationFunctionPtr(new Tanh(neuronPtr));
  return activationFunctionPtr;
}

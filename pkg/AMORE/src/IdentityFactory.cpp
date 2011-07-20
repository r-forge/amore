/*
 * IdentityFactory.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "dia/NeuralFactory.h"
#include "dia/MLPfactory.h"
#include "dia/IdentityFactory.h"





ActivationFunctionPtr
IdentityFactory::makeActivationFunction(NeuronPtr neuronPtr)
{
  ActivationFunctionPtr activationFunctionPtr(new Identity(neuronPtr));
  return activationFunctionPtr;
}

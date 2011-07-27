/*
 * IdentityFactory.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/Identity.h"
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/MLPfactory.h"
#include "classHeaders/IdentityFactory.h"

IdentityFactory::IdentityFactory()
{
}


ActivationFunctionPtr
IdentityFactory::makeActivationFunction(NeuronPtr neuronPtr)
  {
    ActivationFunctionPtr activationFunctionPtr(new Identity(neuronPtr));
    return activationFunctionPtr;
  }

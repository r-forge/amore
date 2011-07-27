/*
 * TanhFactory.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */


#include "package.h"
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/MLPfactory.h"
#include "classHeaders/Tanh.h"
#include "classHeaders/TanhFactory.h"
#include "classHeaders/ActivationFunction.h"


TanhFactory::TanhFactory()
{
}

ActivationFunctionPtr
TanhFactory::makeActivationFunction(NeuronPtr neuronPtr)
{
  ActivationFunctionPtr activationFunctionPtr(new Tanh(neuronPtr));
  return activationFunctionPtr;
}

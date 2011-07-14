/*
 * MLPfactory.cpp
 *
 *  Created on: 14/07/2011
 *      Author: mcasl
 */

#include "dia/NeuralFactory.h"
#include "dia/MLPfactory.h"
//=========================================================================================================


MLPfactory::MLPfactory()
{
}
;

ConPtr
MLPfactory::makeCon(Neuron& neuron)
{
  ConPtr conPtr(new Con(neuron));
  return conPtr;
}

NeuronPtr
MLPfactory::makeNeuron()
{
  NeuronPtr neuronPtr(new SimpleNeuron());
  return neuronPtr;
}
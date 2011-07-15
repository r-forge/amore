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

Con*
MLPfactory::makeCon(Neuron& neuron)
{
  return new Con(neuron);
}

Con*
MLPfactory::makeCon(Neuron& neuron, double weight)
{
  return new Con(neuron, weight);
}

Container<ConPtr>*
MLPfactory::makeConContainer()
{
  return new SimpleContainer<ConPtr> ;
}


Container<NeuronPtr>*
MLPfactory::makeNeuronContainer()
{
  return new SimpleContainer<NeuronPtr> ;
}



Neuron*
MLPfactory::makeNeuron()
{
  return new SimpleNeuron();
}

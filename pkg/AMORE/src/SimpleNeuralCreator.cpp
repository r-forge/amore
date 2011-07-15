/*
 * SimpleCreator.cpp
 *
 *  Created on: 14/07/2011
 *      Author: mcasl
 */



#include "dia/NeuralCreator.h"
#include "dia/SimpleNeuralCreator.h"
//=========================================================================================================


SimpleNeuralCreator::SimpleNeuralCreator()
{
}
;

Con*
SimpleNeuralCreator::createCon(NeuralFactory& neuralFactory, Neuron& neuron)
{
  return neuralFactory.makeCon(neuron);
}


Neuron*
SimpleNeuralCreator::createNeuron(NeuralFactory& neuralFactory)
{
  return neuralFactory.makeNeuron();
}


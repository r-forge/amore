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


NeuronPtr
SimpleNeuralCreator::createNeuron(NeuralFactoryPtr neuralFactoryPtr)
{
  return neuralFactoryPtr->makeNeuron();
}


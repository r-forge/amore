/*
 * PredictBehavior.cpp
 *
 *  Created on: 15/07/2011
 *      Author: mcasl
 */
//=========================================================================================================


#include "package.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/PredictBehavior.h"

PredictBehavior::PredictBehavior(NeuronPtr neuronPtr) :
  d_neuron(neuronPtr)
{
}

double
PredictBehavior::useActivationFunctionf0()
{
  NeuronPtr neuronPtr( d_neuron.lock() ) ;
  return neuronPtr->useActivationFunctionf0();
}


double
PredictBehavior::useActivationFunctionf1()
{
  NeuronPtr neuronPtr( d_neuron.lock() ) ;
  return neuronPtr->useActivationFunctionf1();
}


ConIteratorPtr
PredictBehavior::getConIterator()
{
  NeuronPtr neuronPtr( d_neuron.lock() ) ;
  return neuronPtr->getConIterator();
}

void
PredictBehavior::setOutput(double output)
{
  NeuronPtr neuronPtr( d_neuron.lock() ) ;
  return neuronPtr->setOutput(output);
}


void
PredictBehavior::setOutputDerivative(double outputDerivative)
{
  NeuronPtr neuronPtr( d_neuron.lock() ) ;
  return neuronPtr->setOutputDerivative(outputDerivative);
}


void
PredictBehavior::setInducedLocalField(double inducedLocalField)
{
  NeuronPtr neuronPtr( d_neuron.lock() ) ;
  return neuronPtr->setInducedLocalField(inducedLocalField);
}

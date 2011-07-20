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
MLPfactory::makeCon(Neuron& neuron, double weight)
{
  ConPtr conPtr(new Con(neuron, weight));
  return conPtr;
}

ConContainerPtr
MLPfactory::makeConContainer()
{
  ConContainerPtr conContainerPtr(new SimpleContainer<ConPtr> );
  return conContainerPtr;
}


PredictBehaviorPtr
MLPfactory::makePredictBehavior(NeuronPtr neuronPtr)
{
  PredictBehaviorPtr predictBehaviorPtr(new MLPbehavior(neuronPtr));
  return predictBehaviorPtr;
}

NeuronPtr
MLPfactory::makeNeuron()
{
  NeuronPtr neuronPtr(new SimpleNeuron());
  neuronPtr->setPredictBehavior (makePredictBehavior(neuronPtr));
  neuronPtr->setActivationFunction (makeActivationFunction(neuronPtr));
  neuronPtr->setConnections (makeConContainer());

  return neuronPtr;
}

NeuronContainerPtr
MLPfactory::makeNeuronContainer()
{
  NeuronContainerPtr neuronContainerPtr(new SimpleContainer<NeuronPtr> );
  return neuronContainerPtr;
}

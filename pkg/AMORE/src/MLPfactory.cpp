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
  ConPtr conPtr( new Con(neuron) );
  return conPtr;
}

ConPtr
MLPfactory::makeCon(Neuron& neuron, double weight)
{
  ConPtr conPtr( new Con(neuron, weight) );
  return conPtr;
}

ConContainerPtr
MLPfactory::makeConContainer()
{
  ConContainerPtr conContainerPtr( new SimpleContainer<ConPtr> );
  return conContainerPtr;
}

ActivationFunctionPtr
MLPfactory::makeIdentityActivationFunction(){
  ActivationFunctionPtr activationFunctionPtr(new Identity()) ;
  return activationFunctionPtr;
}

ActivationFunctionPtr
MLPfactory::makeTanhActivationFunction(){
  ActivationFunctionPtr activationFunctionPtr(new Tanh() );
  return activationFunctionPtr;
}



PredictBehaviorPtr
MLPfactory::makePredictBehavior()
{
  PredictBehaviorPtr predictBehaviorPtr(  new MLPbehavior() );
  predictBehaviorPtr->setConnections( makeConContainer());
  predictBehaviorPtr->setActivationFunction( makeIdentityActivationFunction() , predictBehaviorPtr);
  return  predictBehaviorPtr;
}




NeuronPtr
MLPfactory::makeNeuron()
{
  NeuronPtr neuronPtr( new SimpleNeuron() );
  neuronPtr->setPredictBehavior(  makePredictBehavior()  );
  return neuronPtr;
}



NeuronContainerPtr
MLPfactory::makeNeuronContainer()
{
  NeuronContainerPtr neuronContainerPtr(new SimpleContainer<NeuronPtr>);
  return neuronContainerPtr ;
}

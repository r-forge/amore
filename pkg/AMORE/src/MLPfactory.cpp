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


PredictBehaviorPtr
MLPfactory::makePredictBehavior()
{

  MLPbehavior* mlpBehavior( new MLPbehavior() );
  mlpBehavior->d_bias=0.0;
  mlpBehavior->d_output=0.0;
  mlpBehavior->d_accumulator=0.0;
  mlpBehavior->d_nCons=makeConContainer();

  PredictBehaviorPtr predictBehavior( mlpBehavior);
  return  predictBehavior;
}


PredictBehaviorPtr
MLPfactory::makePredictBehavior(ConContainerPtr conContainerPtr)
{
  MLPbehavior* mlpBehavior( new MLPbehavior() );
  mlpBehavior->d_bias=0.0;
  mlpBehavior->d_output=0.0;
  mlpBehavior->d_accumulator=0.0;
  mlpBehavior->d_nCons=conContainerPtr;

  PredictBehaviorPtr predictBehavior( mlpBehavior);
  return  predictBehavior;

}


NeuronPtr
MLPfactory::makeNeuron()
{
  NeuronPtr neuronPtr( new SimpleNeuron() );
  neuronPtr->setPredictBehavior( makePredictBehavior() );
  return neuronPtr;
}



NeuronContainerPtr
MLPfactory::makeNeuronContainer()
{
  NeuronContainerPtr neuronContainerPtr(new SimpleContainer<NeuronPtr>);
  return neuronContainerPtr ;
}

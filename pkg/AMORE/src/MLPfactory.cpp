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


PredictBehavior*
MLPfactory::makePredictBehavior()
{
  MLPbehavior* mlpBehavior( new MLPbehavior() );
  mlpBehavior->d_bias=0.0;
  mlpBehavior->d_output=0.0;
  mlpBehavior->d_accumulator=0.0;
  mlpBehavior->d_nCons.reset(makeConContainer());
  return  mlpBehavior;
}


Neuron*
MLPfactory::makeNeuron()
{
  Neuron* ptNeuron ( new SimpleNeuron() );
  ptNeuron->setPredictBehavior( makePredictBehavior() );


  return ptNeuron;
}



Container<NeuronPtr>*
MLPfactory::makeNeuronContainer()
{
  return new SimpleContainer<NeuronPtr> ;
}

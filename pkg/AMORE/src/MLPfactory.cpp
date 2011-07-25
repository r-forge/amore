/*
 * MLPfactory.cpp
 *
 *  Created on: 14/07/2011
 *      Author: mcasl
 */

#include "classHeaders/NeuralFactory.h"
#include "classHeaders/MLPfactory.h"
//=========================================================================================================




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
MLPfactory::makeNeuron(Handler Id)
{
  NeuronPtr neuronPtr(new SimpleNeuron(*this));
  neuronPtr->setId(Id);
  neuronPtr->setPredictBehavior(makePredictBehavior(neuronPtr));
  neuronPtr->setActivationFunction(makeActivationFunction(neuronPtr));
  return neuronPtr;
}

NeuronPtr
MLPfactory::makeNeuron(Handler Id, NeuronIteratorPtr neuronIteratorPtr,
    double totalAmountOfParameters)
{
  RNGScope scope;

  NeuronPtr neuronPtr(makeNeuron(Id));

  double extreme = sqrt(3 / totalAmountOfParameters);
  double weight;
  for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone(); neuronIteratorPtr->next())
    {
      weight =as<double>(runif(1, -extreme, extreme));
      neuronPtr->addCon(makeCon(*neuronIteratorPtr->currentItem(), weight));
    }

  MLPbehavior* mlpBehavior = dynamic_cast<MLPbehavior*>(neuronPtr->d_predictBehavior.get()) ;
  mlpBehavior->d_bias=as<double>(runif(1, -extreme, extreme));

return neuronPtr;
}

NeuronContainerPtr
MLPfactory::makeLayer()
{
  LayerPtr layerPtr( new SimpleContainer<NeuronPtr> );
  return layerPtr;
}


LayerContainerPtr
MLPfactory::makeLayerContainer()
{
  LayerContainerPtr layerContainerPtr( new SimpleContainer<LayerPtr> );
  layerContainerPtr->push_back( makeLayer() );
  return layerContainerPtr;
}


NeuralNetworkPtr
MLPfactory::makeNeuralNetwork(NeuralFactory& neuralFactory)
{
  NeuralNetworkPtr neuralNetworkPtr(new SimpleNetwork(neuralFactory ) );
  return neuralNetworkPtr;
}


NeuralCreatorPtr
MLPfactory::makeNeuralCreator()
{
  NeuralCreatorPtr neuralCreatorPtr(new SimpleNeuralCreator );
  return neuralCreatorPtr;
}




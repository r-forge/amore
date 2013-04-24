/*
 * NeuralNetwork.cpp
 *
 *  Created on: 22/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/NeuralNetwork.h"
#include "classHeaders/Container.h"

NeuralNetwork::NeuralNetwork(NeuralFactoryPtr neuralFactoryPtr)
{
  d_inputLayer   = neuralFactoryPtr->makeLayer();
  d_hiddenLayers = neuralFactoryPtr->makeLayerContainer();
  d_outputLayer  = neuralFactoryPtr->makeLayer();
  d_costFunction = neuralFactoryPtr->makeCostFunction("LMS");
}

NeuralNetwork::~NeuralNetwork()
{
	  delete d_inputLayer;
	  delete d_hiddenLayers;
	  delete d_outputLayer;
//	  delete d_costFunction; // TODO ver si hace falta
}

NeuronIteratorPtr
NeuralNetwork::getInputNeuronIterator(){
	return d_inputLayer->createIterator();
}

NeuronIteratorPtr
NeuralNetwork::getOutputNeuronIterator(){
	return d_outputLayer->createIterator();
}

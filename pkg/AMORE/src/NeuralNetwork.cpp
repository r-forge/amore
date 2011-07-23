/*
 * NeuralNetwork.cpp
 *
 *  Created on: 22/07/2011
 *      Author: mcasl
 */

#include "dia/NeuralNetwork.h"

NeuralNetwork::NeuralNetwork(NeuralFactory& neuralFactory)
{
  d_inputLayer  = neuralFactory.makeLayer();
  d_hiddenLayers = neuralFactory.makeLayerContainer();
  d_outputLayer = neuralFactory.makeLayer();
}


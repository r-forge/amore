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

NeuralNetworkPtr
SimpleNeuralCreator::createFeedForwardNetwork(std::vector<int> numberOfNeurons, NeuralFactory& hiddenLayersFactory, NeuralFactory& outputLayerFactory)
{
  NeuralNetworkPtr neuralNetworkPtr(outputLayerFactory.makeNeuralNetwork(outputLayerFactory));
  NeuronPtr neuronPtr;

  if (numberOfNeurons.size() <= 2)
    {
      throw std::range_error(
          "[C++ CreateFeedForwardNetwork::validate]: Error, number of layers lower than 3.");
    }

  Handler neuronId = 1;

  //============================================================
  // Calculation of the total amount of parameters
  //============================================================
  int totalAmountOfParameters = 0;

  std::vector<int>::iterator itr1 = numberOfNeurons.begin();
  int totalNumberOfNeurons = *itr1;
  for (std::vector<int>::iterator itr2 = 1+itr1; itr2 != numberOfNeurons.end(); ++itr2, ++itr1)
    {
      totalNumberOfNeurons += *itr2;
      totalAmountOfParameters += (*itr2) * (*itr1); //integer multiplication
    }
  totalAmountOfParameters += totalNumberOfNeurons;


  //============================================================
  // Neuron insertion
  //============================================================

  //Input Layer
  for (int i = 0; i < numberOfNeurons.at(0); ++i)
    {
      neuronPtr = outputLayerFactory.makeNeuron(neuronId++); // It's irrelevant whether to use outputLayerFactory o hiddenLayersFactory as inputFactory
      neuralNetworkPtr->d_inputLayer->push_back(neuronPtr);
    }


  // Hidden layers

  for (int i = 0; i < numberOfNeurons.at(1); ++i)
     {
       neuronPtr = hiddenLayersFactory.makeNeuron(neuronId++, neuralNetworkPtr->d_inputLayer->createIterator(), totalAmountOfParameters);
       neuralNetworkPtr->d_hiddenLayers->at(0)->push_back(neuronPtr);
     }

  unsigned int layerItr = 2 ;
  for (; layerItr < (-1 + numberOfNeurons.size()); ++layerItr)
    {
      neuralNetworkPtr->d_hiddenLayers->push_back( hiddenLayersFactory.makeLayer() ) ;
      for (int i = 0; i < numberOfNeurons.at(layerItr); ++i)
        {
          neuronPtr = hiddenLayersFactory.makeNeuron(neuronId++, neuralNetworkPtr->d_hiddenLayers->at(layerItr-2)->createIterator(), totalAmountOfParameters);
          neuralNetworkPtr->d_hiddenLayers->at(layerItr-1)->push_back(neuronPtr);
        }
    }


  //Output Layer
  for (int i = 0; i < numberOfNeurons.back(); ++i)
    {
      neuronPtr = outputLayerFactory.makeNeuron(neuronId++, neuralNetworkPtr->d_hiddenLayers->at(layerItr-2)->createIterator() , totalAmountOfParameters);
      neuralNetworkPtr->d_outputLayer->push_back(neuronPtr);
    }

  return neuralNetworkPtr;
}


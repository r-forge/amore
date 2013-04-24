/*
 * SimpleCreator.cpp
 *
 *  Created on: 14/07/2011
 *      Author: mcasl
 */
//=========================================================================================================


#include "package.h"
#include "classHeaders/Container.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/NeuralCreator.h"
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/NeuralNetwork.h"
#include "classHeaders/SimpleNeuralCreator.h"

SimpleNeuralCreator::SimpleNeuralCreator()
{
}

NeuralNetworkPtr
SimpleNeuralCreator::createFeedForwardNetwork(NeuralFactoryPtr neuralFactoryPtr,
    std::vector<int> numberOfNeurons,
    std::string hiddenLayersActivationFunctionName,
    std::string outputLayerActivationFunctionName)
  {
    Rcpp::List hiddenLayersActivationFunction = neuralFactoryPtr->makeXPtrFunctionList(hiddenLayersActivationFunctionName);
    Rcpp::List outputLayerActivationFunction  = neuralFactoryPtr->makeXPtrFunctionList(outputLayerActivationFunctionName);
    return createCustomFeedForwardNetwork(neuralFactoryPtr, numberOfNeurons, hiddenLayersActivationFunction, outputLayerActivationFunction);
  }

NeuralNetworkPtr
SimpleNeuralCreator::createCustomFeedForwardNetwork(
    NeuralFactoryPtr neuralFactoryPtr, std::vector<int> numberOfNeurons,
    Rcpp::List hiddenLayersActivationFunction,
    Rcpp::List outputLayerActivationFunction)
{
  NeuralNetworkPtr neuralNetworkPtr(
      neuralFactoryPtr->makeNeuralNetwork(neuralFactoryPtr));
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
  for (std::vector<int>::iterator itr2 = 1 + itr1; itr2
      != numberOfNeurons.end(); ++itr2, ++itr1)
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
      neuronPtr = neuralFactoryPtr->makeNeuron(neuronId++);
      neuronPtr->setNeuralNetwork(neuralNetworkPtr);
      neuronPtr->setNeuronTrainBehavior( neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr));
      neuralNetworkPtr->d_inputLayer->push_back(neuronPtr);
    }

  // Hidden layers
  Rcpp::XPtr < CppFunctionPointer > f0XPtr      = hiddenLayersActivationFunction["f0"];
  Rcpp::XPtr < CppFunctionPointer > f1XPtr      = hiddenLayersActivationFunction["f1"];

  for (int i = 0; i < numberOfNeurons.at(1); ++i)
    {
      neuronPtr = neuralFactoryPtr->makeNeuron(
                        neuronId++,
                        neuralNetworkPtr->d_inputLayer->createIterator(),
                        totalAmountOfParameters,
                        neuralNetworkPtr);
      neuronPtr->setActivationFunction(  neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr) );
      neuronPtr->setNeuronTrainBehavior( neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr) );
      neuralNetworkPtr->d_hiddenLayers->at(0)->push_back(neuronPtr);
    }

  unsigned int layerItr = 2;
  for (; layerItr < (-1 + numberOfNeurons.size()); ++layerItr)
    {
      neuralNetworkPtr->d_hiddenLayers->push_back(neuralFactoryPtr->makeLayer());
      for (int i = 0; i < numberOfNeurons.at(layerItr); ++i)
        {
          neuronPtr
              = neuralFactoryPtr->makeNeuron(
                      neuronId++,
                      neuralNetworkPtr->d_hiddenLayers->at(layerItr - 2)->createIterator(),
                      totalAmountOfParameters,
                      neuralNetworkPtr
                  );
          neuronPtr->setActivationFunction(  neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr));
          neuronPtr->setNeuronTrainBehavior( neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr));
          neuralNetworkPtr->d_hiddenLayers->at(layerItr - 1)->push_back(neuronPtr);
        }
    }

  //Output Layer
  f0XPtr = outputLayerActivationFunction["f0"];
  f1XPtr = outputLayerActivationFunction["f1"];

  for (int i = 0; i < numberOfNeurons.back(); ++i)
    {
      neuronPtr = neuralFactoryPtr->makeNeuron(
                          neuronId++,
                          neuralNetworkPtr->d_hiddenLayers->at(layerItr - 2)->createIterator(),
                          totalAmountOfParameters,
                          neuralNetworkPtr
                      );
      neuronPtr->setActivationFunction(  neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr));
      neuronPtr->setNeuronTrainBehavior( neuralFactoryPtr->makeOutputNeuronTrainBehavior(neuronPtr));
      neuralNetworkPtr->d_outputLayer->push_back(neuronPtr);
    }

  return neuralNetworkPtr;
}


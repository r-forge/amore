/*
 * NetworkTrainBehavior.cpp
 *
 *  Created on: 08/08/2011
 *      Author: mcasl
 */
//=========================================================================================================


#include "package.h"
#include "classHeaders/NetworkTrainBehavior.h"

NetworkTrainBehavior::NetworkTrainBehavior(NeuralNetworkPtr neuralNetworkPtr) :
  d_neuralNetwork(neuralNetworkPtr)
{
}

void
NetworkTrainBehavior::setLearningRate (double learningRate){
  NeuralNetworkPtr neuralNetworkPtr(d_neuralNetwork.lock());
  neuralNetworkPtr->setLearningRate(learningRate);
}

void
NetworkTrainBehavior::writeInput(std::vector<double>::iterator& iterator)
{
  NeuralNetworkPtr neuralNetworkPtr(d_neuralNetwork.lock());
  neuralNetworkPtr->writeInput(iterator);
}

void
NetworkTrainBehavior::singlePatternForwardAction()
{
  NeuralNetworkPtr neuralNetworkPtr(d_neuralNetwork.lock());
  neuralNetworkPtr->singlePatternForwardAction();
}

void
NetworkTrainBehavior::writeTarget(std::vector<double>::iterator& iterator)
{
  NeuralNetworkPtr neuralNetworkPtr(d_neuralNetwork.lock());
  neuralNetworkPtr->writeTarget(iterator);
}

void
NetworkTrainBehavior::singlePatternBackwardAction()
{
  NeuralNetworkPtr neuralNetworkPtr(d_neuralNetwork.lock());
  neuralNetworkPtr->singlePatternBackwardAction();
}

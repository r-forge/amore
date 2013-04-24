/*
 * NetworkTrainBehavior.cpp
 *
 *  Created on: 08/08/2011
 *      Author: mcasl
 */
//=========================================================================================================


#include "package.h"
#include "classHeaders/NetworkTrainBehavior.h"
#include "classHeaders/NeuralNetwork.h"
NetworkTrainBehavior::NetworkTrainBehavior(NeuralNetworkPtr neuralNetworkPtr) :
  d_neuralNetwork(neuralNetworkPtr)
{
}

void
NetworkTrainBehavior::setLearningRate (double learningRate){
  NeuralNetworkPtr neuralNetworkPtr(d_neuralNetwork);
  neuralNetworkPtr->setLearningRate(learningRate);
}


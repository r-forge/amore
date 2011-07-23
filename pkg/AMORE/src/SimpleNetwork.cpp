/*
 * SimpleNetwork.cpp
 *
 *  Created on: 22/07/2011
 *      Author: mcasl
 */

#include "dia/NeuralNetwork.h"
#include "dia/SimpleNetwork.h"

SimpleNetwork::SimpleNetwork(NeuralFactory& neuralFactory) :
  NeuralNetwork(neuralFactory)
{

}

void
SimpleNetwork::show()
{
  Rprintf("\n\n=========================================================\n");
  Rprintf("         Input Layer");
  Rprintf("\n=========================================================");
  d_inputLayer->show();

  Rprintf("\n\n=========================================================\n");
  Rprintf("         Hidden Layers");
  Rprintf("\n=========================================================");
  d_hiddenLayers->show();

  Rprintf("\n\n=========================================================\n");
  Rprintf("         Output Layer");
  Rprintf("\n=========================================================");
  d_outputLayer->show();
  Rprintf("\n=========================================================\n");

}

bool
SimpleNetwork::validate()
{
  d_inputLayer->validate();
  d_hiddenLayers->validate();
  d_outputLayer->validate();
  return true;
}

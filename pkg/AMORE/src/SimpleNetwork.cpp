/*
 * SimpleNetwork.cpp
 *
 *  Created on: 22/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/Container.h"
#include "classHeaders/Iterator.h"
#include "classHeaders/Neuron.h"

#include "classHeaders/NeuralNetwork.h"
#include "classHeaders/SimpleNetwork.h"

SimpleNetwork::SimpleNetwork(NeuralFactory& neuralFactory) :
  NeuralNetwork(neuralFactory)
{

}

void
SimpleNetwork::writeInput(std::vector<double>::iterator& iterator)
{
  NeuronIteratorPtr neuronIteratorPtr(d_inputLayer->createIterator());
  for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone(); neuronIteratorPtr->next())
    {
      neuronIteratorPtr->currentItem()->setOutput(*iterator++);
    }
}

void
SimpleNetwork::writeTarget(std::vector<double>::iterator& iterator)
{
  NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
  for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone(); neuronIteratorPtr->next())
    {
      neuronIteratorPtr->currentItem()->setTarget(*iterator++);
    }
}


void
SimpleNetwork::singlePatternForwardAction()
{

  // Hidden Layers
  LayerIteratorPtr layerIteratorPtr(d_hiddenLayers->createIterator());

  for (layerIteratorPtr->first(); !layerIteratorPtr->isDone(); layerIteratorPtr->next())
    {
      NeuronIteratorPtr neuronIteratorPtr(layerIteratorPtr->currentItem()->createIterator());
      for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone(); neuronIteratorPtr->next())
        {
          neuronIteratorPtr->currentItem()->singlePatternForwardAction();
        }
    }

  // Output Layers
  NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
  for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone(); neuronIteratorPtr->next())
    {
      neuronIteratorPtr->currentItem()->singlePatternForwardAction();
    }
}

#if 0
void
SimpleNetwork::singlePatternBackwardAction()
{
  // Output Layers
  NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createReverseIterator());
  for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone(); neuronIteratorPtr->next())
    {
      neuronIteratorPtr->currentItem()->singlePatternBackwardAction();
    }

  // Hidden Layers
  LayerIteratorPtr layerIteratorPtr(d_hiddenLayers->createReverseIterator());
  for (layerIteratorPtr->first(); !layerIteratorPtr->isDone(); layerIteratorPtr->next())
    {
      NeuronIteratorPtr neuronIteratorPtr(layerIteratorPtr->currentItem()->createReverseIterator());
      for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone(); neuronIteratorPtr->next())
        {
          neuronIteratorPtr->currentItem()->singlePatternBackwardAction();
        }
    }
}

#endif

void
SimpleNetwork::readOutput(std::vector<double>::iterator& iterator)
{
  NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
  for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone(); neuronIteratorPtr->next())
    {
      *iterator++ = neuronIteratorPtr->currentItem()->getOutput();
    }
}

Rcpp::List
SimpleNetwork::train(Rcpp::List parameterList)
{
  // TODO check train behavior and change it if need be
  // TODO check cost function  and change it if need be

//  return d_networkTrainBehavior->train(parameterList);
  return Rcpp::List::create();
}

size_type
SimpleNetwork::inputSize()
{
  return d_inputLayer->size();
}

size_type
SimpleNetwork::outputSize()
{
  return d_outputLayer->size();
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

/*
 * SimpleNetwork.cpp
 *
 *  Created on: 22/07/2011
 *      Author: mcasl
 */

#include "classHeaders/NeuralNetwork.h"
#include "classHeaders/SimpleNetwork.h"

SimpleNetwork::SimpleNetwork(NeuralFactory& neuralFactory) :
  NeuralNetwork(neuralFactory)
{

}

void
SimpleNetwork::predict()
{

  // Hidden Layers
  boost::shared_ptr < Iterator<LayerPtr> > layerIterator(
      d_hiddenLayers->createIterator());

  for (layerIterator->first(); !layerIterator->isDone(); layerIterator->next())
    {
      boost::shared_ptr < Iterator<NeuronPtr> > neuronIterator(
          layerIterator->currentItem()->createIterator());
      for (neuronIterator->first(); !neuronIterator->isDone(); neuronIterator->next())
        {
          neuronIterator->currentItem()->predict();
        }
    }

  // Output Layers
  boost::shared_ptr < Iterator<NeuronPtr> > neuronIterator(
      d_outputLayer->createIterator());
  for (neuronIterator->first(); !neuronIterator->isDone(); neuronIterator->next())
    {
      neuronIterator->currentItem()->predict();
    }
}

void
SimpleNetwork::writeInput(std::vector<double>::iterator& iterator)
{
  size_type nInputs(inputSize());
  for (size_type i = 0; i < nInputs; i++)
    {
      d_inputLayer->at(i)->setOutput(*iterator++);
    }
}

void
SimpleNetwork::readOutput(std::vector<double>::iterator& iterator)
{
  size_type nOutputs(outputSize());
  for (size_type i = 0; i < nOutputs; i++)
    {
      *iterator++ = d_outputLayer->at(i)->getOutput();
    }
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

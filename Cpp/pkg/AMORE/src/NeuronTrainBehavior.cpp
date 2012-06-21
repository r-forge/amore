/*
 * NeuronTrainBehavior.cpp
 *
 *  Created on: 09/08/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/NeuronTrainBehavior.h"

NeuronTrainBehavior::NeuronTrainBehavior(NeuronPtr neuronPtr) :
  d_neuron(neuronPtr), d_delta(0.0), d_learningRate(0.0), d_momentum(0.0),
      d_formerBiasChange(0.0), d_sumDeltaBias(0.0)
{
  d_formerWeightChange.clear();
  d_formerWeightChange.resize(numberOfConnections(), 0.0);
  d_sumDeltaX.clear();
  d_sumDeltaX.resize(numberOfConnections(), 0.0);
}

int
NeuronTrainBehavior::numberOfConnections()
{
  NeuronPtr neuronPtr(d_neuron.lock());
  return neuronPtr->numberOfConnections();
}

double
NeuronTrainBehavior::getNeuronTarget()
{
  NeuronPtr neuronPtr(d_neuron.lock());
  return neuronPtr->getTarget();
}

double
NeuronTrainBehavior::getNeuronOutput()
{
  NeuronPtr neuronPtr(d_neuron.lock());
  return neuronPtr->getOutput();
}

double
NeuronTrainBehavior::getNeuronOutputDerivative()
{
  NeuronPtr neuronPtr(d_neuron.lock());
  return neuronPtr->getOutputDerivative();
}

double
NeuronTrainBehavior::costFunctionf0(double output, double target)
{
  NeuronPtr neuronPtr(d_neuron.lock());
  return neuronPtr->costFunctionf0(output, target);
}

double
NeuronTrainBehavior::costFunctionf1(double output, double target)
{
  NeuronPtr neuronPtr(d_neuron.lock());
  return neuronPtr->costFunctionf1(output, target);
}

ConIteratorPtr
NeuronTrainBehavior::getConIterator()
{
  NeuronPtr neuronPtr(d_neuron.lock());
  return neuronPtr->getConIterator();
}

void
NeuronTrainBehavior::setLearningRate(double learningRate)
{
  d_learningRate = learningRate;
}


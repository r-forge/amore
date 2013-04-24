/*
 * NeuronTrainBehavior.cpp
 *
 *  Created on: 09/08/2011
 *      Author: mcasl
 */
//=========================================================================================================
#include "package.h"
#include "classHeaders/NeuronTrainBehavior.h"
#include "classHeaders/Neuron.h"

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
  return d_neuron->numberOfConnections();
}

double
NeuronTrainBehavior::getNeuronTarget()
{
  return d_neuron->getTarget();
}

double
NeuronTrainBehavior::getNeuronOutput()
{
  return d_neuron->getOutput();
}

double
NeuronTrainBehavior::getNeuronOutputDerivative()
{
  return d_neuron->getOutputDerivative();
}

double
NeuronTrainBehavior::costFunctionf0(double output, double target)
{
  return d_neuron->costFunctionf0(output, target);
}

double
NeuronTrainBehavior::costFunctionf1(double output, double target)
{
  return d_neuron->costFunctionf1(output, target);
}

ConIteratorPtr
NeuronTrainBehavior::getConIterator()
{
  return d_neuron->getConIterator();
}

void
NeuronTrainBehavior::setLearningRate(double learningRate)
{
  d_learningRate = learningRate;
}


/*
 * ADAPTgdHiddenNeuronTrainBehavior.cpp
 *
 *  Created on: 08/07/2011
 *      Author: mcasl
 */
//=========================================================================================================
#include "package.h"
#include "classHeaders/ADAPTgdHiddenNeuronTrainBehavior.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/Iterator.h"
#include "classHeaders/Connection.h"


ADAPTgdHiddenNeuronTrainBehavior::ADAPTgdHiddenNeuronTrainBehavior(NeuronPtr neuronPtr) :
  ADAPTgdNeuronTrainBehavior(neuronPtr)
{
}


void
ADAPTgdHiddenNeuronTrainBehavior::singlePatternBackwardAction()
{
  d_delta = d_neuron->d_outputDerivative * d_delta;
  double minusLearningRateTimesDelta = -d_learningRate * d_delta;
  addToNeuronBias( minusLearningRateTimesDelta );
  {
	  ConIteratorPtr conIteratorPtr = d_neuron->d_conIterator;
	  for (conIteratorPtr->first(); !conIteratorPtr->isDone(); conIteratorPtr->next())
	  {
		  double inputValue = conIteratorPtr->currentItem()->d_neuron->d_output;
		  conIteratorPtr->currentItem()->d_weight += minusLearningRateTimesDelta * inputValue ;
		  double weight = conIteratorPtr->currentItem()->d_weight ;
		  conIteratorPtr->currentItem()->d_neuron->d_neuronTrainBehavior->addToDelta( d_delta * weight);
	  }
  }
  d_delta=0.0;
}


void
ADAPTgdHiddenNeuronTrainBehavior::endOfEpochAction()
{
// There's nothing to do in this case.
}


std::string
ADAPTgdHiddenNeuronTrainBehavior::getName()
{
  std::string name("ADAPTgdHiddenNeuronTrainBehavior");
  return name;
}


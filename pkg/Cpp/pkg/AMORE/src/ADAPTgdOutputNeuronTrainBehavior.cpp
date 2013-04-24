/*
 * ADAPTgdOutputNeuronTrainBehavior.cpp
 *
 *  Created on: 30/07/2011
 *      Author: mcasl
 */
//=========================================================================================================


#include "package.h"
#include "classHeaders/ADAPTgdOutputNeuronTrainBehavior.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/Iterator.h"
#include "classHeaders/Connection.h"



ADAPTgdOutputNeuronTrainBehavior::ADAPTgdOutputNeuronTrainBehavior(
    NeuronPtr neuronPtr) :
  ADAPTgdNeuronTrainBehavior(neuronPtr)
{
}

void
ADAPTgdOutputNeuronTrainBehavior::singlePatternBackwardAction()
{
  d_delta = d_neuron->d_outputDerivative * d_neuron->costFunctionf1( d_neuron->d_output, d_neuron->d_target );
  double minusLearningRateTimesDelta = -d_learningRate * d_delta;
  addToNeuronBias( minusLearningRateTimesDelta );
  {
	  ConIteratorPtr conIteratorPtr = d_neuron->d_conIterator;
	  for (conIteratorPtr->first(); !conIteratorPtr->isDone(); conIteratorPtr->next())
		{
		  double inputValue = conIteratorPtr->currentItem()->d_neuron->d_output;
		  conIteratorPtr->currentItem()->d_weight +=  minusLearningRateTimesDelta * inputValue;  // Update current weight
		  double weight = conIteratorPtr->currentItem()->d_weight;
		  conIteratorPtr->currentItem()->d_neuron->d_neuronTrainBehavior->addToDelta(d_delta * weight);                           // Update connections' delta
		}
  }
   d_delta=0.0;
}


// TODO check that aux_DELTA = 0.0;



void
ADAPTgdOutputNeuronTrainBehavior::endOfEpochAction()
{
  // There's nothing to do in this case.
}

std::string
ADAPTgdOutputNeuronTrainBehavior::getName()
{
  std::string name("ADAPTgdOutputNeuronTrainBehavior");
  return name;
}

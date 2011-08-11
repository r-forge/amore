/*
 * ADAPTgdOutputNeuronTrainBehavior.cpp
 *
 *  Created on: 30/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdOutputNeuronTrainBehavior.h"

ADAPTgdOutputNeuronTrainBehavior::ADAPTgdOutputNeuronTrainBehavior(
    NeuronPtr neuronPtr) :
  ADAPTgdNeuronTrainBehavior(neuronPtr)
{
}

void
ADAPTgdOutputNeuronTrainBehavior::singlePatternBackwardAction()
{
  d_delta = getNeuronOutputDerivative() * costFunctionf1( getNeuronOutput(), getNeuronTarget() );
  double minusLearningRateTimesDelta = -d_learningRate * d_delta;
  addToNeuronBias( minusLearningRateTimesDelta );

  ConIteratorPtr conIteratorPtr = getConIterator();
  for (conIteratorPtr->first(); !conIteratorPtr->isDone(); conIteratorPtr->next())
    {
      double inputValue = conIteratorPtr->currentItem()->getInputValue();
      conIteratorPtr->currentItem()->addToWeight( minusLearningRateTimesDelta * inputValue );  // Update current weight
      double weight = conIteratorPtr->currentItem()->getWeight() ;
      conIteratorPtr->currentItem()->addToDelta( d_delta * weight );                           // Update connections' delta
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

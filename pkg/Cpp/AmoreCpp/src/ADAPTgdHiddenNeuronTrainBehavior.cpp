/*
 * ADAPTgdHiddenNeuronTrainBehavior.cpp
 *
 *  Created on: 08/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdHiddenNeuronTrainBehavior.h"

ADAPTgdHiddenNeuronTrainBehavior::ADAPTgdHiddenNeuronTrainBehavior(NeuronPtr neuronPtr) :
  ADAPTgdNeuronTrainBehavior(neuronPtr)
{
}


void
ADAPTgdHiddenNeuronTrainBehavior::singlePatternBackwardAction()
{
  d_delta = getNeuronOutputDerivative() * d_delta;
  double minusLearningRateTimesDelta = -d_learningRate * d_delta;
  addToNeuronBias( minusLearningRateTimesDelta );

  ConIteratorPtr conIteratorPtr = getConIterator();
  for (conIteratorPtr->first(); !conIteratorPtr->isDone(); conIteratorPtr->next())
    {
      double inputValue = conIteratorPtr->currentItem()->getInputValue();
      conIteratorPtr->currentItem()->addToWeight( minusLearningRateTimesDelta  *  inputValue );
      double weight = conIteratorPtr->currentItem()->getWeight() ;
      conIteratorPtr->currentItem()->addToDelta( d_delta * weight);
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


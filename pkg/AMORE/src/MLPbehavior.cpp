/*
 * MLPbehavior.cpp
 *
 *  Created on: 15/07/2011
 *      Author: mcasl
 */

#include "classHeaders/PredictBehavior.h"
#include "classHeaders/MLPbehavior.h"
//=========================================================================================================


MLPbehavior::MLPbehavior(NeuronPtr neuronPtr) :
   PredictBehavior(neuronPtr) , d_bias(0.0)
{
}

void
MLPbehavior::predict()
{

  double accumulator(d_bias);
  ConIteratorPtr conIterator = getConIterator();
  double weight;
  double incomingSignalValue;
  for (conIterator->first(); !conIterator->isDone(); conIterator->next())
    {
      weight = conIterator->currentItem()->getWeight();
      incomingSignalValue = conIterator->currentItem()->getNeuron().getOutput();
      accumulator += weight * incomingSignalValue;
    }
  setInducedLocalField(accumulator);
  setOutput (
  useActivationFunctionf0());
}

void
MLPbehavior::show()
{
  Rprintf("\n bias: %lf", d_bias);
}


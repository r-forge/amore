/*
 * MLPbehavior.cpp
 *
 *  Created on: 15/07/2011
 *      Author: mcasl
 */

#include "dia/PredictBehavior.h"
#include "dia/MLPbehavior.h"
//=========================================================================================================


MLPbehavior::MLPbehavior() :
  d_bias(0.0), PredictBehavior()
{
}

void
MLPbehavior::predict()
{
  d_inducedLocalField = 0.0;
  ConIteratorPtr conIterator = d_nCons->createIterator();
  double weight;
  double incomingSignalValue;
  for (conIterator->first(); !conIterator->isDone(); conIterator->next())
    {
      weight = conIterator->currentItem()->getWeight();
      incomingSignalValue = conIterator->currentItem()->getNeuron().getOutput();
      d_inducedLocalField += weight * incomingSignalValue;
    }
  d_output = d_activationFunction->f0();
}

void
MLPbehavior::show()
{
  Rprintf("\n bias: %lf", d_bias);
  Rprintf("\n output: %lf", d_output);
  Rprintf("\n------------------------\n");
  if (d_nCons->size() == 0)
    {
      Rprintf("\n No connections defined");
    }
  else
    {
      d_nCons->show();
    }
  Rprintf("\n------------------------\n");
}


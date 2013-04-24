/*
 * MLPbehavior.cpp
 *
 *  Created on: 15/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/ActivationFunction.h"
#include "classHeaders/Connection.h"
#include "classHeaders/Iterator.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/PredictBehavior.h"
#include "classHeaders/MLPbehavior.h"

//=========================================================================================================


MLPbehavior::MLPbehavior(NeuronPtr neuronPtr) :
   PredictBehavior(neuronPtr) , d_bias(0.0)
{
}

void
MLPbehavior::singlePatternForwardAction()
{

  double accumulator(d_bias);
  {
	  ConIteratorPtr conIterator = d_neuron->d_conIterator;
	  double weight;
	  double incomingSignalValue;
	  for (conIterator->first(); !conIterator->isDone(); conIterator->next())
		{
		  weight = conIterator->currentItem()->d_weight;
		  incomingSignalValue = conIterator->currentItem()->d_neuron->d_output;
		  accumulator += weight * incomingSignalValue;
		}
  }
  d_neuron->d_inducedLocalField = accumulator;
  d_neuron->d_output            = d_neuron->d_activationFunction->f0();
  d_neuron->d_outputDerivative  = d_neuron->d_activationFunction->f1();
}

void
MLPbehavior::show()
{
  Rprintf("\n bias: %lf", d_bias);
}


void
MLPbehavior::addToBias(double value)
{
  d_bias += value;
}


/*
 * PredictBehavior.cpp
 *
 *  Created on: 15/07/2011
 *      Author: mcasl
 */
//=========================================================================================================


#include "package.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/PredictBehavior.h"

PredictBehavior::PredictBehavior(NeuronPtr neuronPtr) :
  d_neuron(neuronPtr)
{
}

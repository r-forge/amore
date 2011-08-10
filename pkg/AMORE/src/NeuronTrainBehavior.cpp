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
      d_neuron(neuronPtr),
      d_delta(0.0),
      d_learningRate(0.0),
      d_momentum(0.0),
      d_formerBiasChange(0.0),
      d_sumDeltaBias(0.0)
{
       d_formerWeightChange.clear();
       d_formerWeightChange.resize( numberOfConnections(), 0.0);
       d_sumDeltaX.clear();
       d_sumDeltaX.resize( numberOfConnections(), 0.0);
}


int
NeuronTrainBehavior::numberOfConnections ()
{
  NeuronPtr neuronPtr ( d_neuron.lock() );
  return neuronPtr->numberOfConnections();
}

/*
 * ADAPTgdOutputNeuronTrainBehavior.cpp
 *
 *  Created on: 30/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdOutputNeuronTrainBehavior.h"

ADAPTgdOutputNeuronTrainBehavior::ADAPTgdOutputNeuronTrainBehavior(NeuronPtr neuronPtr) :
  ADAPTgdNeuronTrainBehavior(neuronPtr)
{
}

void
ADAPTgdOutputNeuronTrainBehavior::singlePatternBackwardAction()
{
#if 0
  d_delta = d_neuron->getOutputDerivative() * d_costFunction->f1(
      d_neuron->getOutput(), d_neuron->getTarget());
      d_neuron->d_predictBehavior->d_bias += -d_learningRate * d_delta;
      //I'm working here right now
#endif
}

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

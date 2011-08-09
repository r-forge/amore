/*
 * ADAPTgdOutputNeuronTrainBehavior.cpp
 *
 *  Created on: 30/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdOutputNeuronTrainBehavior.h"



void ADAPTgdOutputNeuronTrainBehavior::singlePatternBackwardAction (){
  Rprintf("ADAPTgdOutputNeuronTrainBehavior.h\n");
#if 0
  d_delta = d_neuron->getOutputDerivative() * d_costFunction->f1( d_neuron->getOutput(), d_neuron->getTarget() );
  d_neuron->d_predictBehavior->d_bias += - d_learningRate * d_delta  ;
#endif
}



void ADAPTgdOutputNeuronTrainBehavior::endOfEpochAction (){
  Rprintf("ADAPTgdOutputNeuronTrainBehavior.h\n");
}


std::string
ADAPTgdOutputNeuronTrainBehavior::getName()
{
  std::string name("ADAPTgdOutputNeuronTrainBehavior");
  return name;
}

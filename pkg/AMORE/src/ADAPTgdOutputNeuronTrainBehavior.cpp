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
  d_delta = d_neuron->getOutputDerivative() * d_costFunction->f1( d_neuron->getOutput(), d_neuron->getTarget() );
  d_neuron->changeBias( - d_learningRate * d_delta ) ;
}



void ADAPTgdOutputNeuronTrainBehavior::endOfEpochAction (){

}


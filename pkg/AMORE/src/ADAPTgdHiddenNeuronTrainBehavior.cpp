/*
 * ADAPTgdHiddenNeuronTrainBehavior.cpp
 *
 *  Created on: 08/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/ADAPTgdHiddenNeuronTrainBehavior.h"



void ADAPTgdHiddenNeuronTrainBehavior::singlePatternBackwardAction (){
  Rprintf("ADAPTgdHiddenNeuronTrainBehavior.h\n");
}



void ADAPTgdHiddenNeuronTrainBehavior::endOfEpochAction (){
  Rprintf("ADAPTgdHiddenNeuronTrainBehavior.h\n");
}


std::string
ADAPTgdHiddenNeuronTrainBehavior::getName()
{
  std::string name("ADAPTgdHiddenNeuronTrainBehavior");
  return name;
}


/*
 * Identity.cpp
 *
 *  Created on: 18/07/2011
 *      Author: mcasl
 */

#include "dia/ActivationFunction.h"
#include "dia/Identity.h"
//=========================================================================================================

Identity::Identity(NeuronPtr neuronPtr) : ActivationFunction(neuronPtr) {

}

double Identity::f0 () {
  return getInducedLocalField() ;
}

double Identity::f1 () {
  return 1 ;
}


/*
 * Identity.cpp
 *
 *  Created on: 18/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/ActivationFunction.h"
#include "classHeaders/Identity.h"
//=========================================================================================================

Identity::Identity(NeuronPtr neuronPtr) : ActivationFunction(neuronPtr) {

}

double Identity::f0 () {
  return getInducedLocalField() ;
}

double Identity::f1 () {
  return 1 ;
}


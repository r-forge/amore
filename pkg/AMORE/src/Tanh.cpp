/*
 * Tanh.cpp
 *
 *  Created on: 18/07/2011
 *      Author: mcasl
 */
//=========================================================================================================

#include "package.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/ActivationFunction.h"
#include "classHeaders/Tanh.h"


Tanh::Tanh(NeuronPtr neuronPtr) : ActivationFunction(neuronPtr) {

}

double Tanh::f0 () {
  return tanh(getInducedLocalField());

}

double Tanh::f1 () {
  double tanhx ( tanh(getInducedLocalField()) );
  return (1-tanhx*tanhx) ; // TODO consider speeding up the calculation by using caller.d_output instead of tanhx
}


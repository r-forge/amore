/*
 * ActivationFunction.cpp
 *
 *  Created on: 18/07/2011
 *      Author: mcasl
 */
#include "package.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/ActivationFunction.h"
//=========================================================================================================


ActivationFunction::ActivationFunction(NeuronPtr neuronPtr,
    Rcpp::XPtr<CppFunctionPointer> f0, Rcpp::XPtr<CppFunctionPointer> f1) :
  d_neuron(neuronPtr), d_f0(f0), d_f1(f1)
{
}

double
ActivationFunction::getInducedLocalField()
{
  NeuronPtr neuronPtr(d_neuron.lock());
  return neuronPtr->getInducedLocalField();
}

double
ActivationFunction::f0()
{
  return (*d_f0)(getInducedLocalField());
}

double
ActivationFunction::f1()
{
  return (*d_f1)(getInducedLocalField());
}

/*
 * Tanh.cpp
 *
 *  Created on: 18/07/2011
 *      Author: mcasl
 */

#include "dia/ActivationFunction.h"
#include "dia/Tanh.h"
//=========================================================================================================



double Identity::f0 () {
  x <- d_predictBehavior.d_inducedLocalField;
  e2x=exp(2*x);
  d_predictBehavior.d_output =  (e2x-1)/(e2x+1);
}

double Identity::f1 () {
  x <- d_predictBehaviorPtr.d_output;
  d_predictBehavior.d_outputDerivative = (1-x)/(1+x) ;
}


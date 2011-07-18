/*
 * Identity.cpp
 *
 *  Created on: 18/07/2011
 *      Author: mcasl
 */

#include "dia/ActivationFunction.h"
#include "dia/Identity.h"
//=========================================================================================================


double Identity::f0 () {
  x <- d_predictBehavior.d_inducedLocalField;
  d_predictBehavior.d_output = x;
}

double Identity::f1 () {
  d_predictBehavior.d_outputDerivative = 1.0 ;
}


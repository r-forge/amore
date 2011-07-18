/*
 * ActivationFunction.cpp
 *
 *  Created on: 18/07/2011
 *      Author: mcasl
 */

#include "dia/ActivationFunction.h"
//=========================================================================================================


double ActivationFunction::getInducedLocalField () {
  PredictBehaviorPtr predictBehaviorPtr ( d_predictBehavior.lock() );
      return predictBehaviorPtr->getInducedLocalField();
}


void ActivationFunction::setPredictBehavior (PredictBehaviorPtr predictBehaviorPtr) {
   d_predictBehavior = predictBehaviorPtr;
}

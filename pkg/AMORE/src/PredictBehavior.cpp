/*
 * PredictBehavior.cpp
 *
 *  Created on: 15/07/2011
 *      Author: mcasl
 */

#include "dia/PredictBehavior.h"
//=========================================================================================================

PredictBehavior::PredictBehavior() :
  d_output(0.0), d_inducedLocalField(0.0)
{
}

void
PredictBehavior::setOutput(double output)
{
  d_output = output;
}

double
PredictBehavior::getOutput()
{
  return d_output;
}

double
PredictBehavior::getInducedLocalField()
{
  return d_inducedLocalField;
}

void
PredictBehavior::setActivationFunction(
    ActivationFunctionPtr activationFunctionPtr,
    PredictBehaviorPtr predictBehaviorPtr)
{
  d_activationFunction = activationFunctionPtr;
  d_activationFunction.get()->setPredictBehavior(predictBehaviorPtr);
}

void
PredictBehavior::setConnections(ConContainerPtr conContainerPtr)
{
  d_nCons = conContainerPtr;
}


/*
 * SimpleNeuron.cpp
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */

#include "dia/SimpleNeuron.h"

SimpleNeuron::SimpleNeuron() :
  d_Id(NA_INTEGER) //, nCons()
{
}


Handler
SimpleNeuron::getId()
{
  return d_Id;
}



void
SimpleNeuron::setId(Handler Id)
{
   d_Id=Id;
}



void
SimpleNeuron::setPredictBehavior(PredictBehavior* predictBehavior)
{
   d_predictBehavior.reset(predictBehavior);
}


void
SimpleNeuron::show()
{
  int id = getId();
  Rprintf("\n------------------------\n");
  if (id == NA_INTEGER)
    {
      Rprintf("\n Id: NA, Invalid neuron Id");
    }
  else
    {
      Rprintf("\n Id: %d", id);
    }
  Rprintf("\n------------------------\n");
  d_predictBehavior->show();

}

bool
SimpleNeuron::validate()
{
  BEGIN_RCPP
  if (getId() == NA_INTEGER ) throw std::range_error("[C++ SimpleNeuron::validate]: Error, Id is NA.");
 // nCons.validate();
  return (TRUE);
END_RCPP}


/*
 * SimpleNeuron.cpp
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */

#include "dia/SimpleNeuron.h"

SimpleNeuron::SimpleNeuron(NeuralFactory& neuralFactory) :
  Neuron(neuralFactory)
{
}

double
SimpleNeuron::getInducedLocalField()
{
  return d_inducedLocalField;
}

void
SimpleNeuron::setInducedLocalField(double inducedLocalField)
{
  d_inducedLocalField = inducedLocalField;
}

double
SimpleNeuron::getOutput()
{
  return d_output;
}

void
SimpleNeuron::setOutput(double output)
{
  d_output = output;
}

Handler
SimpleNeuron::getId()
{
  return d_Id;
}

void
SimpleNeuron::setId(Handler Id)
{
  d_Id = Id;
}

ConIteratorPtr
SimpleNeuron::getConIterator()
{
  return d_nCons->createIterator();
}

void
SimpleNeuron::addCon(ConPtr conPtr)
{
  d_nCons->push_back(conPtr);
}

void
SimpleNeuron::setActivationFunction(ActivationFunctionPtr activationFunctionPtr)
{
  d_activationFunction = activationFunctionPtr;
}

void
SimpleNeuron::setPredictBehavior(PredictBehaviorPtr predictBehaviorPtr)
{
  d_predictBehavior = predictBehaviorPtr;
}

double
SimpleNeuron::useActivationFunctionf0()
{
  return d_activationFunction->f0();
}

void
SimpleNeuron::predict()
{
  d_predictBehavior->predict();
}

void
SimpleNeuron::show()
{
  if (d_nCons->size() == 0)
    {

      int id = getId();
      Rprintf("\n\n-----------------------------------");
      if (id == NA_INTEGER)
        {
          Rprintf("\n Id: NA, Invalid neuron Id");
        }
      else
        {
          Rprintf("\n Id: %d", id);
        }
      Rprintf("\n-----------------------------------");
      Rprintf("\n output: %lf", d_output);
      Rprintf("\n-----------------------------------");
    }
  else
    {
      int id = getId();
      Rprintf("\n\n-----------------------------------");
      if (id == NA_INTEGER)
        {
          Rprintf("\n Id: NA, Invalid neuron Id");
        }
      else
        {
          Rprintf("\n Id: %d", id);
        }
      Rprintf("\n-----------------------------------");
      d_predictBehavior->show();

      Rprintf("\n output: %lf", d_output);
      Rprintf("\n-----------------------------------");
      d_nCons->show();
      Rprintf("\n-----------------------------------");
    }
}

bool
SimpleNeuron::validate()
{
  BEGIN_RCPP
  if (getId() == NA_INTEGER ) throw std::range_error("[C++ SimpleNeuron::validate]: Error, Id is NA.");
  // nCons.validate();
  return (TRUE);
END_RCPP}


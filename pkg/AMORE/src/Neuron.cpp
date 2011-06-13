/*
 * Neuron.cpp
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */

#include "Neuron.h"

Neuron::Neuron() :
  Id(NA_INTEGER), nCons()
{
}

Neuron::Neuron(int Id) :
  Id(Id), nCons()
{
}

Neuron::Neuron(int Id, Container<Con>::const_iterator firstCon, Container<Con>::const_iterator lastCon ) :
  Id(Id), nCons()
{

  nCons.insert(nCons.begin(), firstCon, lastCon);

}

int
Neuron::getId()
{
  return Id;
}

void
Neuron::setId(int value)
{
  Id = value;
}


void
Neuron::iterators(Container<Con>::iterator & first, Container<Con>::iterator & last)
{
   first=nCons.begin();
    last=nCons.end();
}


void
Neuron::const_iterators(Container<Con>::const_iterator & first, Container<Con>::const_iterator & last)
{
   first=nCons.begin();
    last=nCons.end();
}


void
Neuron::show()
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

  if (nCons.size() == 0)
    {
      Rprintf("\n No connections defined");
    }
  else
    {
      nCons.show();
    }
  Rprintf("\n------------------------\n");
 }

bool
Neuron::validate()
{
  BEGIN_RCPP
  if (getId() == NA_INTEGER ) throw std::range_error("[C++ Neuron::validate]: Error, Id is NA.");
 // nCons.validate();
  return (TRUE);
END_RCPP}


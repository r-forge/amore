/*
 * Neuron.cpp
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */

#include "Neuron.h"

Neuron::Neuron() :
  Id(NA_INTEGER), con()
{
}

Neuron::Neuron(int Id) :
  Id(Id), con()
{
}

//Neuron::Neuron(int Id, ConContainer con) :
//  Id(Id), con(con), outputValue(0.0)
//{
//}

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


//void
//Neuron::iterators(Container<Con>::iterator & first, Container<Con>::iterator & last)
//{
//   first=con.begin();
//    last=con.end();
//}

bool
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
  return true;

}

bool
Neuron::validate()
{
  BEGIN_RCPP
  if (getId() == NA_INTEGER ) throw std::range_error("[C++ Neuron::validate]: Error, Id is NA.");
  nCons.validate();
  return (TRUE);
END_RCPP}


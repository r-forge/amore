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


#if 0
SimpleNeuron::SimpleNeuron(int Id, Container<Con>::const_iterator firstCon, Container<Con>::const_iterator lastCon ) :
  d_Id(Id)//, nCons()
{

//  nCons.insert(nCons.begin(), firstCon, lastCon);

}

#endif

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


#if 0
void SimpleNeuron::iterators(Container<Con>::iterator & first, Container<Con>::iterator & last)
{
   first=nCons.begin();
    last=nCons.end();
}


// void SimpleNeuron::const_iterators(Container<Con>::const_iterator & first, Container<Con>::const_iterator & last)
{
   first=nCons.begin();
    last=nCons.end();
}

#endif

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
#if 0

  if (nCons.size() == 0)
    {
      Rprintf("\n No connections defined");
    }
  else
    {
      nCons.show();
    }
  Rprintf("\n------------------------\n");
#endif
}

bool
SimpleNeuron::validate()
{
  BEGIN_RCPP
  if (getId() == NA_INTEGER ) throw std::range_error("[C++ SimpleNeuron::validate]: Error, Id is NA.");
 // nCons.validate();
  return (TRUE);
END_RCPP}


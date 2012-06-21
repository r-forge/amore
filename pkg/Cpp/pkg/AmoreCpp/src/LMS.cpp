/*
 * LMS.cpp
 *
 *  Created on: 09/08/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/LMS.h"

double
LMS::f0(double output, double target)
{
  double aux = output - target;
  return 0.5 * aux * aux;
}

double
LMS::f1(double output, double target)
{
  return output - target;
}

std::string
LMS::getName()
{
  std::string name("LMS");
  return name;
}

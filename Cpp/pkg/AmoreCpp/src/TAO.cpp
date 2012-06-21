/*
 * TAO.cpp
 *
 *  Created on: 09/08/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/Tao.h"

// TODO CHANGE IT, now it is LMLS

double
Tao::f0(double output, double target)
{
  double residual = output-target;
  return log(1.0 + residual*residual / 2.0);
}

double
Tao::f1(double output, double target)
{
  double residual = output-target;
  return residual/(1.0+residual*residual/2.0);
}


std::string
Tao::getName()
{
  std::string name("TAO is LMS still");
  return name;
}

/*
 * LMLS.cpp
 *
 *  Created on: 09/08/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/LMLS.h"

double
LMLS::f0(double output, double target)
{
  double residual = output - target;
  return log(1.0 + residual * residual / 2.0);
}

double
LMLS::f1(double output, double target)
{
  double residual = output - target;
  return residual / (1.0 + residual * residual / 2.0);
}

std::string
LMLS::getName()
{
  std::string name("LMLS");
  return name;
}

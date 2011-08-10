/*
 * ADAPTgdwmNetworkTrainBehavior.cpp
 *
 *  Created on: 29/07/2011
 *      Author: mcasl
 */
#include "package.h"
#include "classHeaders/ADAPTgdwmNetworkTrainBehavior.h"

ADAPTgdwmNetworkTrainBehavior::ADAPTgdwmNetworkTrainBehavior( NeuralNetworkPtr neuralNetworkPtr) :
  AdaptNetworkTrainBehavior(neuralNetworkPtr)
{
}

Rcpp::List
ADAPTgdwmNetworkTrainBehavior::train(Rcpp::List parameterList)
{

  Rprintf("TODO");

  Rcpp::List result;
  result["error"]=0.0; //TODO change

  return result;
}


std::string
ADAPTgdwmNetworkTrainBehavior::getName()
{
  std::string name("ADAPTgdwmNetworkTrainBehavior");
  return name;
}

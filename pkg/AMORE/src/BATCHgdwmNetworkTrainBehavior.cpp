/*
 * BATCHgdwmNetworkTrainBehavior.cpp
 *
 *  Created on: 10/08/2011
 *      Author: mcasl
 */
#include "package.h"
#include "classHeaders/BATCHgdwmNetworkTrainBehavior.h"

BATCHgdwmNetworkTrainBehavior::BATCHgdwmNetworkTrainBehavior( NeuralNetworkPtr neuralNetworkPtr) :
  BatchNetworkTrainBehavior(neuralNetworkPtr)
{
}

Rcpp::List
BATCHgdwmNetworkTrainBehavior::train(Rcpp::List parameterList)
{

  Rprintf("TODO");

  Rcpp::List result;
  result["error"]=0.0; //TODO change

  return result;
}


std::string
BATCHgdwmNetworkTrainBehavior::getName()
{
  std::string name("BATCHgdwmNetworkTrainBehavior");
  return name;
}

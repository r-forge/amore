/*
 * BATCHgdNetworkTrainBehavior.cpp
 *
 *  Created on: 10/08/2011
 *      Author: mcasl
 */
#include "package.h"
#include "classHeaders/BATCHgdNetworkTrainBehavior.h"

BATCHgdNetworkTrainBehavior::BATCHgdNetworkTrainBehavior( NeuralNetworkPtr neuralNetworkPtr) :
  BatchNetworkTrainBehavior(neuralNetworkPtr)
{
}

Rcpp::List
BATCHgdNetworkTrainBehavior::train(Rcpp::List parameterList)
{

  Rprintf("TODO");

  Rcpp::List result;
  result["error"]=0.0; //TODO change

  return result;
}


std::string
BATCHgdNetworkTrainBehavior::getName()
{
  std::string name("BATCHgdNetworkTrainBehavior");
  return name;
}

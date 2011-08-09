/*
 * MLPNoNetworkTrainBehavior.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/MLPNoNetworkTrainBehavior.h"

MLPNoNetworkTrainBehavior::MLPNoNetworkTrainBehavior(NeuralNetworkPtr neuralNetworkPtr) :
  MLPNetworkTrainBehavior(neuralNetworkPtr)
{

}

Rcpp::List
MLPNoNetworkTrainBehavior::train(Rcpp::List parameterList)
{
  Rprintf("\n No Network Train Behavior.\n ");
  return Rcpp::List::create();
}


std::string
MLPNoNetworkTrainBehavior::getName()
{
  std::string name("MLPNoNetworkTrainBehavior");
  return name;
}

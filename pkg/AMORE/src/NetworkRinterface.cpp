/*
 * NetworkRinterface.cpp
 *
 *  Created on: 25/07/2011
 *      Author: mcasl
 */

#include "classHeaders/NetworkRinterface.h"

//=========================================================================================================


NetworkRinterface::NetworkRinterface()
{

}

void
NetworkRinterface::createFeedForwardNetwork(Rcpp::NumericVector numberOfNeurons)
{
  NeuralFactoryPtr hiddenLayersFactoryPtr(new TanhFactory());
  NeuralFactoryPtr outputFactoryPtr(new IdentityFactory());
  NeuralCreatorPtr neuralCreator(outputFactoryPtr->makeNeuralCreator());
  d_neuralNetwork = neuralCreator->createFeedForwardNetwork(
      as<std::vector<int> > (numberOfNeurons), *hiddenLayersFactoryPtr,
      *outputFactoryPtr);
}

void
NetworkRinterface::show()
{
  if(d_neuralNetwork) {
      d_neuralNetwork->show();
  } else {
      Rprintf("Uninitialized network. Please use any of the create methods available.");
  }

}


/*
 * NetworkRinterface.cpp
 *
 *  Created on: 25/07/2011
 *      Author: mcasl
 */

#include "package.h"

#include "classHeaders/IdentityFactory.h"
#include "classHeaders/TanhFactory.h"
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/NeuralNetwork.h"
#include "classHeaders/NeuralCreator.h"
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

Rcpp::NumericMatrix
NetworkRinterface::predict(Rcpp::NumericMatrix numericMatrix)
{
  BEGIN_RCPP

  // VALIDATION

  if (!d_neuralNetwork)
    {
      throw std::runtime_error( "\nUninitialized network. Please use any of the create methods available.\n");
    }

  bool checkIncorrectNumberOfRows(
      inputSize() != static_cast<size_type> (numericMatrix.nrow()));
  if (checkIncorrectNumberOfRows)
    {
      throw std::runtime_error(
          "\nIncorrect number or rows. The number of input neurons must be equal to the number of rows of the input matrix.\n");
    }

  Rcpp::NumericMatrix outputMatrix(outputSize(), numericMatrix.ncol());
  std::vector<double>::iterator inputIterator(numericMatrix.begin());
  std::vector<double>::iterator outputIterator(outputMatrix.begin());

  // PREDICT LOOP
  for (int i = 0; i < numericMatrix.ncol(); i++)
    {
      d_neuralNetwork->writeInput(inputIterator);
      d_neuralNetwork->singlePatternForwardAction();
      d_neuralNetwork->readOutput(outputIterator);
    }
  return outputMatrix;

END_RCPP}




Rcpp::List
NetworkRinterface::train(Rcpp::List parameterList)
{
  BEGIN_RCPP
    return d_neuralNetwork->train(parameterList);
  END_RCPP
}


















size_type
NetworkRinterface::inputSize()
{
  return d_neuralNetwork->inputSize();
}

size_type
NetworkRinterface::outputSize()
{
  return d_neuralNetwork->outputSize();
}

void
NetworkRinterface::show()
{

  if (!d_neuralNetwork)
    {
      Rprintf(
          "\nUninitialized network. Please use any of the create methods available.\n");
    }
  else
    {
      d_neuralNetwork->show();
    }
}

bool
NetworkRinterface::validate()
{
BEGIN_RCPP if (d_neuralNetwork)
  {
    return d_neuralNetwork->validate();
  }
else
  {
    throw std::runtime_error(
        "\nUninitialized network. Please use any of the create methods available.\n");
    return false;
  }
END_RCPP
}

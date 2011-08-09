/*
 * NetworkRinterface.cpp
 *
 *  Created on: 25/07/2011
 *      Author: mcasl
 */

#include "package.h"


#include "classHeaders/NeuralFactory.h"
#include "classHeaders/NeuralNetwork.h"
#include "classHeaders/NeuralCreator.h"
#include "classHeaders/NetworkRinterface.h"



//=========================================================================================================


NetworkRinterface::NetworkRinterface()
{

}

void
NetworkRinterface::createFeedForwardNetwork(Rcpp::NumericVector numberOfNeurons,   Rcpp::CharacterVector hiddenLayersActivationFunctionName, Rcpp::CharacterVector outputLayerActivationFunctionName)
{
  NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
  NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
  std::string hiddenName = as<std::string> (hiddenLayersActivationFunctionName);
  std::string outputName = as<std::string> (outputLayerActivationFunctionName);
  std::vector<int> numOfNeurons = as< std::vector<int> >(numberOfNeurons) ;
  d_neuralNetwork = neuralCreatorPtr->createFeedForwardNetwork(*neuralFactoryPtr, numOfNeurons, hiddenName, outputName);
}

void
NetworkRinterface::createCustomFeedForwardNetwork(Rcpp::NumericVector numberOfNeurons, Rcpp::List hiddenLayersActivationFunction, Rcpp::List outputLayerActivationFunction)
{
  NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
  NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
  std::vector<int> numOfNeurons = as< std::vector<int> >(numberOfNeurons) ;
  d_neuralNetwork = neuralCreatorPtr->createCustomFeedForwardNetwork(*neuralFactoryPtr, numOfNeurons, hiddenLayersActivationFunction, outputLayerActivationFunction);

}



Rcpp::NumericMatrix
NetworkRinterface::sim(Rcpp::NumericMatrix numericMatrix)
{
  BEGIN_RCPP

  if (!d_neuralNetwork)
    {
      throw std::runtime_error( "\nUninitialized network. Please use any of the create methods available.\n");
    }

  return d_neuralNetwork->sim(numericMatrix);

END_RCPP}




Rcpp::List
NetworkRinterface::train(Rcpp::List parameterList)
{
  BEGIN_RCPP
  if (!d_neuralNetwork)
    {
      throw std::runtime_error( "\nUninitialized network. Please use any of the create methods available.\n");
    }

  Rcpp::CharacterVector algorithmRcpp = parameterList["algorithm"];
  std::string algorithm=as<std::string>(algorithmRcpp);
  NeuralFactoryPtr neuralFactoryPtr;
  if (algorithm == "ADAPTgd")
    {
      neuralFactoryPtr= NeuralFactoryPtr(new ADAPTgdFactory);
    }
#if 0
  else if (algorithm == "ADAPTgdwm")
    {
      neuralFactoryPtr= NeuralFactoryPtr(new ADAPTgdwmFactory);
    }
  else if (algorithm == "BATCHgd")
    {
      neuralFactoryPtr= NeuralFactoryPtr(new BATCHgdFactory);
    }
  else if (algorithm == "BATCHgdwm")
    {
      neuralFactoryPtr= NeuralFactoryPtr(new BATCHgdwmFactory);
    }
#endif
  else
      {
        throw std::invalid_argument("\n[NetworkRinterface::train Error]: Invalid argument. Please choose a known algorithm.\n");
      }

  d_neuralNetwork->setNetworkTrainBehavior( neuralFactoryPtr->makeNetworkTrainBehavior(d_neuralNetwork) );

  Rcpp::CharacterVector costFunction = parameterList["costFunction"];
  std::string functionName = as<std::string>(costFunction);
  d_neuralNetwork->setCostFunction( neuralFactoryPtr->makeCostFunction(functionName) );
  d_neuralNetwork->setNeuronTrainBehavior( *neuralFactoryPtr );
  return d_neuralNetwork->train(parameterList);
  END_RCPP
}



size_type
NetworkRinterface::inputSize()
{
  if (!d_neuralNetwork)
    {
      throw std::runtime_error( "\nUninitialized network. Please use any of the create methods available.\n");
    }

  return d_neuralNetwork->inputSize();
}

size_type
NetworkRinterface::outputSize()
{
  if (!d_neuralNetwork)
    {
      throw std::runtime_error( "\nUninitialized network. Please use any of the create methods available.\n");
    }

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

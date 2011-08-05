/*
 * MLPfactory.cpp
 *
 *  Created on: 14/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/Connection.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/SimpleNeuron.h"
#include "classHeaders/Container.h"
#include "classHeaders/SimpleContainer.h"
#include "classHeaders/NeuralNetwork.h"
#include "classHeaders/SimpleNetwork.h"
#include "classHeaders/NeuralCreator.h"
#include "classHeaders/SimpleNeuralCreator.h"
#include "classHeaders/predictBehavior.h"
#include "classHeaders/MLPbehavior.h"
#include "classHeaders/Iterator.h"
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/MLPfactory.h"

//=========================================================================================================


ConPtr
MLPfactory::makeCon(Neuron& neuron, double weight)
{
  ConPtr conPtr(new Con(neuron, weight));
  return conPtr;
}

ConContainerPtr
MLPfactory::makeConContainer()
{
  ConContainerPtr conContainerPtr(new SimpleContainer<ConPtr> );
  return conContainerPtr;
}

PredictBehaviorPtr
MLPfactory::makePredictBehavior(NeuronPtr neuronPtr)
{
  PredictBehaviorPtr predictBehaviorPtr(new MLPbehavior(neuronPtr));
  return predictBehaviorPtr;
}

NeuronPtr
MLPfactory::makeNeuron(Handler Id)
{
  NeuronPtr neuronPtr(new SimpleNeuron(*this));
  neuronPtr->setId(Id);
  neuronPtr->setPredictBehavior(makePredictBehavior(neuronPtr));
  neuronPtr->setActivationFunction(
      makeActivationFunction(neuronPtr,
          Rcpp::XPtr<CppFunctionPointer>(new CppFunctionPointer(&default_f0)),
          Rcpp::XPtr<CppFunctionPointer>(new CppFunctionPointer(&default_f1))));
  return neuronPtr;
}

NeuronPtr
MLPfactory::makeNeuron(Handler Id, NeuronIteratorPtr neuronIteratorPtr,
    double totalAmountOfParameters)
{
  RNGScope scope;

  NeuronPtr neuronPtr(makeNeuron(Id));

  double extreme = sqrt(3 / totalAmountOfParameters);
  double weight;
  for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone(); neuronIteratorPtr->next())
    {
      weight = as<double> (runif(1, -extreme, extreme));
      neuronPtr->addCon(makeCon(*neuronIteratorPtr->currentItem(), weight));
    }

  MLPbehavior* mlpBehavior =
      dynamic_cast<MLPbehavior*> (neuronPtr->d_predictBehavior.get());
  mlpBehavior->d_bias = as<double> (runif(1, -extreme, extreme));

  return neuronPtr;
}

LayerPtr
MLPfactory::makeLayer()
{
  LayerPtr layerPtr(new SimpleContainer<NeuronPtr> );
  return layerPtr;
}

LayerContainerPtr
MLPfactory::makeLayerContainer()
{
  LayerContainerPtr layerContainerPtr(new SimpleContainer<LayerPtr> );
  layerContainerPtr->push_back(makeLayer());
  return layerContainerPtr;
}

NeuralNetworkPtr
MLPfactory::makeNeuralNetwork(NeuralFactory& neuralFactory)
{
  NeuralNetworkPtr neuralNetworkPtr(new SimpleNetwork(neuralFactory));
  return neuralNetworkPtr;
}



NeuralCreatorPtr
MLPfactory::makeNeuralCreator()
  {
    NeuralCreatorPtr neuralCreatorPtr(new SimpleNeuralCreator );
    return neuralCreatorPtr;
  }


ActivationFunctionPtr
MLPfactory::makeActivationFunction(NeuronPtr neuronPtr,
    Rcpp::XPtr<CppFunctionPointer> f0, Rcpp::XPtr<CppFunctionPointer> f1)
{
  ActivationFunctionPtr activationFunctionPtr(
      new ActivationFunction(neuronPtr, f0, f1));
  return activationFunctionPtr;
}

Rcpp::List
MLPfactory::makeXPtrFunctionList(std::string functionName)
{

  if (functionName == "Tanh")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (new CppFunctionPointer(&Tanh_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (new CppFunctionPointer(&Tanh_f1)));
    }
  else if (functionName == "Identity")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Identity_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Identity_f1)));
    }
  else if (functionName == "Threshold")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Threshold_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Threshold_f1)));
    }
  else if (functionName == "Logistic")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Logistic_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Logistic_f1)));
    }
  else if (functionName == "Exponential")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Exponential_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Exponential_f1)));
    }
  else if (functionName == "Reciprocal")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Reciprocal_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Reciprocal_f1)));
    }
  else if (functionName == "Square")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Square_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Square_f1)));
    }
  else if (functionName == "Gauss")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Gauss_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Gauss_f1)));
    }
  else if (functionName == "Sine")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Sine_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Sine_f1)));
    }
  else if (functionName == "Cosine")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Cosine_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Cosine_f1)));
    }
  else if (functionName == "Elliot")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Elliot_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Elliot_f1)));
    }
  else if (functionName == "Arctan")
    {
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Arctan_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&Arctan_f1)));
    }
  else
    {
      Rprintf(
          "\nWarning: default function applied. Unknown function name entered.\n");
      return List::create(
          _["f0"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&default_f0)),
          _["f1"] = XPtr<CppFunctionPointer> (
              new CppFunctionPointer(&default_f1)));
    }

}

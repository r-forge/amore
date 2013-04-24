#pragma once

/*! \mainpage The AMORE++ package

 *

 * \section intro_sec Introduction

 *

 * Here you will find the documentation of the C++ component of the AMORE++ R package.

 * The AMORE++ package is a new version of the publicly available AMORE package for neural network training and simulation under R

 *

 * \section motiv_sec Motivation

 *

 * Since the release of the previous version of the AMORE many things have changed in the R programming world.

 * The advent of the Reference Classes and of packages like Rcpp, inline and RUnit compel us to write a better version of the package in order to provide a more useful framework for neural network training and simulation.

 *

 * \section RoadMap Road Map

 * This project is currently very active and the development team intends to provide a beta version as soon as this summer (2011)

 *

 */

#include <iostream>
#include <sstream>
#include <algorithm>
#include <vector>
#include <iterator>
#include <valarray>    // for tanh, ...
#include <Rcpp.h>

using namespace Rcpp;

class ActivationFunction;
class Con;
class CostFunction;
template<typename T>
  class Container;
class Identity;
class IdentityFactory;
class Identity;
template<typename T>
  class Iterator;
class MLPbehavior;
class MLPfactory;
class NetworkRinterface;
class NeuralNetwork;
class NeuralCreator;
class NeuralFactory;
class NetworkTrainBehavior;
class Neuron;
class NeuronTrainBehavior;

class PredictBehavior;
template<typename T>
  class SimpleContainer;
template<typename T>
  class SimpleContainerIterator;
template<typename T>
  class SimpleContainerReverseIterator;
class SimpleNetwork;
class SimpleNeuralCreator;
class SimpleNeuron;
class Tanh;
class TanhFactory;

#ifndef size_type
#define size_type unsigned int
#endif

typedef int Handler;
typedef double (*CppFunctionPointer)(double);


typedef std::reference_wrapper<PredictBehavior> ActivationFunctionRef;
typedef std::shared_ptr<CostFunction> CostFunctionPtr;


typedef std::reference_wrapper<PredictBehavior> PredictBehaviorRef;
// typedef std::reference_wrapper<TrainingBehavior> TrainingBehaviorRef;
typedef std::reference_wrapper<Neuron> NeuronRef;

typedef std::shared_ptr<ActivationFunction> ActivationFunctionPtr;
typedef std::shared_ptr<CostFunction> CostFunctionPtr;
typedef std::shared_ptr<PredictBehavior> PredictBehaviorPtr;
typedef std::shared_ptr<NetworkTrainBehavior> NetworkTrainBehaviorPtr;
typedef std::shared_ptr<NeuronTrainBehavior> NeuronTrainBehaviorPtr;
typedef std::shared_ptr<Neuron> NeuronPtr;
typedef std::shared_ptr<Con> ConPtr;
typedef std::shared_ptr<NeuralNetwork> NeuralNetworkPtr;

typedef std::shared_ptr<Container<NeuronPtr> > LayerPtr;
typedef std::shared_ptr<Container<LayerPtr> > LayerContainerPtr;
typedef std::shared_ptr<Container<ConPtr> > ConContainerPtr;

typedef std::shared_ptr<Iterator<LayerPtr> > LayerIteratorPtr;
typedef std::shared_ptr<Iterator<NeuronPtr> > NeuronIteratorPtr;
typedef std::shared_ptr<Iterator<ConPtr> > ConIteratorPtr;

typedef std::shared_ptr<NeuralFactory> NeuralFactoryPtr;
typedef std::shared_ptr<NeuralCreator> NeuralCreatorPtr;

typedef std::weak_ptr<NeuralNetwork> NeuralNetworkWeakPtr;
typedef std::weak_ptr<Neuron> NeuronWeakPtr;


/^*** esto no era de package.h
//============================================================================================
// ----------------------------------- Function definitions ----------------------
//============================================================================================
double default_f0(double inducedLocalField)  { return NA_REAL; }
double default_f1(double inducedLocalField)  { return NA_REAL; }

double Tanh_f0(double inducedLocalField)     { return tanh(inducedLocalField); }
double Tanh_f1(double inducedLocalField)     { double f0value = tanh(inducedLocalField); return 1-f0value*f0value;}

double Identity_f0(double inducedLocalField) { return inducedLocalField; }
double Identity_f1(double inducedLocalField) { return 1; }

double Threshold_f0(double inducedLocalField)   { return (inducedLocalField > 0) ? 1 : 0 ; }
double Threshold_f1(double inducedLocalField)   { return 0; }

double Logistic_f0(double inducedLocalField) { return 1.0/(1.0+exp(-inducedLocalField)) ; }
double Logistic_f1(double inducedLocalField) { double f0value = 1.0/(1.0+exp(-inducedLocalField)); return f0value*(1-f0value) ; }

double Exponential_f0(double inducedLocalField) { return exp(inducedLocalField); }
double Exponential_f1(double inducedLocalField) { double f0value=exp(inducedLocalField); return f0value; }

double Reciprocal_f0(double inducedLocalField) { return 1.0/inducedLocalField; }
double Reciprocal_f1(double inducedLocalField) { double f0value=1.0/inducedLocalField ; return -f0value*f0value; }

double Square_f0(double inducedLocalField) { return inducedLocalField*inducedLocalField; }
double Square_f1(double inducedLocalField) { return 2*inducedLocalField; }

double Gauss_f0(double inducedLocalField) { return exp(-inducedLocalField*inducedLocalField); }
double Gauss_f1(double inducedLocalField) { double f0value=exp(-inducedLocalField*inducedLocalField); return -2*inducedLocalField*f0value; }

double Sine_f0(double inducedLocalField) { return sin(inducedLocalField); }
double Sine_f1(double inducedLocalField) { return cos(inducedLocalField); }

double Cosine_f0(double inducedLocalField) { return cos(inducedLocalField); }
double Cosine_f1(double inducedLocalField) { return -sin(inducedLocalField); }


double Elliot_f0(double inducedLocalField) { return inducedLocalField/(1+abs(inducedLocalField)); }
double Elliot_f1(double inducedLocalField) { double aux= abs(inducedLocalField)+1; return (aux+inducedLocalField) / (aux*aux) ; }

double Arctan_f0(double inducedLocalField) { return 2.0*atan(inducedLocalField)/M_PI; }
double Arctan_f1(double inducedLocalField) { return 2.0/((1+inducedLocalField*inducedLocalField)*M_PI); }


//============================================================================================
// ----------------------------------- End of Function definitions ----------------------
//============================================================================================


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
#include <boost/shared_ptr.hpp>
#include <boost/weak_ptr.hpp>
#include <boost/ref.hpp>
#include <valarray>    // for tanh, ...
#include <Rcpp.h>

using namespace Rcpp;

class ActivationFunction;
class Con;
template<typename T>  class Container;
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
class Neuron;
class PredictBehavior;
template<typename T>
  class SimpleContainer;
template<typename T>
  class SimpleContainerIterator;
class SimpleNetwork;
class SimpleNeuralCreator;
class SimpleNeuron;
class Tanh;
class TanhFactory;

#ifndef size_type
#define size_type unsigned int
#endif

typedef int Handler;

typedef boost::reference_wrapper<PredictBehavior> ActivationFunctionRef;
typedef boost::reference_wrapper<PredictBehavior> PredictBehaviorRef;
// typedef boost::reference_wrapper<TrainingBehavior> TrainingBehaviorRef;
typedef boost::reference_wrapper<Neuron> NeuronRef;

typedef boost::shared_ptr<ActivationFunction> ActivationFunctionPtr;
typedef boost::shared_ptr<PredictBehavior> PredictBehaviorPtr;
typedef boost::shared_ptr<Neuron> NeuronPtr;
typedef boost::shared_ptr<Con> ConPtr;
typedef boost::shared_ptr<NeuralNetwork> NeuralNetworkPtr;

typedef boost::shared_ptr<Iterator<NeuronPtr> > NeuronIteratorPtr;
typedef boost::shared_ptr<Iterator<ConPtr> > ConIteratorPtr;

typedef boost::shared_ptr<Container<NeuronPtr> > LayerPtr;
typedef boost::shared_ptr<Container<LayerPtr> > LayerContainerPtr;

typedef boost::shared_ptr<Container<ConPtr> > ConContainerPtr;

typedef boost::shared_ptr<NeuralFactory> NeuralFactoryPtr;
typedef boost::shared_ptr<NeuralCreator> NeuralCreatorPtr;

typedef boost::weak_ptr<Neuron> NeuronWeakPtr;


/*! \mainpage The AMORE++ package * * \section intro_sec Introduction * * Here you will find the documentation of the C++ component of the AMORE++ R package. * The AMORE++ package is a new version of the publicly available AMORE package for neural network training and simulation under R * * \section motiv_sec Motivation * * Since the release of the previous version of the AMORE many things have changed in the R programming world. * The advent of the Reference Classes and of packages like Rcpp, inline and RUnit compel us to write a better version of the package in order to provide a more useful framework for neural network training and simulation. * * \section RoadMap Road Map * This project is currently very active and the development team intends to provide a beta version as soon as this summer (2011) * */#include <iostream>#include <sstream>#include <algorithm>#include <vector>#include <iterator>#include <boost/shared_ptr.hpp>#include <boost/weak_ptr.hpp>#include <boost/foreach.hpp>#include <boost/ref.hpp>#include <valarray>    // for tanh, ...#include <Rcpp.h>using namespace Rcpp;class Con;class PredictBehavior;class TrainingBehavior;class Neuron;class SimpleNeuron;class NeuralFactory;class MLPfactory;class NeuralCreator;class SimpleNeuralCreator;class ActivationFunction;class Tanh;class Identity;template<typename T> class Container;template<typename T> class SimpleContainer;template<typename T> class Iterator;template<typename T> class SimpleContainerIterator;#define foreach         BOOST_FOREACH#ifndef size_type#define size_type unsigned int#endiftypedef int Handler;typedef boost::reference_wrapper<PredictBehavior> ActivationFunctionRef;typedef boost::reference_wrapper<PredictBehavior> PredictBehaviorRef;typedef boost::reference_wrapper<TrainingBehavior> TrainingBehaviorRef;typedef boost::reference_wrapper<Neuron> NeuronRef;typedef boost::shared_ptr<ActivationFunction> ActivationFunctionPtr;typedef boost::shared_ptr<PredictBehavior> PredictBehaviorPtr;typedef boost::shared_ptr<Neuron> NeuronPtr;typedef boost::shared_ptr<Con> ConPtr;typedef boost::shared_ptr< Iterator<NeuronPtr> >NeuronIteratorPtr;typedef boost::shared_ptr< Iterator<ConPtr> > ConIteratorPtr;typedef boost::shared_ptr< Container<NeuronPtr> > NeuronContainerPtr;typedef boost::shared_ptr< Container<ConPtr> > ConContainerPtr;typedef boost::shared_ptr< NeuralFactory > NeuralFactoryPtr;typedef boost::shared_ptr< NeuralCreator > NeuralCreatorPtr;typedef boost::weak_ptr<Neuron> NeuronWeakPtr;#include "dia/Con.h"#include "dia/ActivationFunction.h"#include "dia/Tanh.h"#include "dia/Identity.h"#include "dia/PredictBehavior.h"#include "dia/MLPBehavior.h"#include "dia/Neuron.h"#include "dia/SimpleNeuron.h"#include "dia/NeuralFactory.h"#include "dia/MLPfactory.h"#include "dia/TanhFactory.h"#include "dia/IdentityFactory.h"#include "dia/NeuralCreator.h"#include "dia/SimpleNeuralCreator.h"#include "dia/Container.h"#include "dia/SimpleContainer.h"#include "dia/Iterator.h"#include "dia/SimpleContainerIterator.h"#include "Con.cpp"#include "ActivationFunction.cpp"#include "Tanh.cpp"#include "Identity.cpp"#include "PredictBehavior.cpp"#include "MLPbehavior.cpp"#include "Neuron.cpp"#include "SimpleNeuron.cpp"#include "MLPfactory.cpp"#include "TanhFactory.cpp"#include "IdentityFactory.cpp"#include "SimpleNeuralCreator.cpp"#include "Container.cpp"#include "Iterator.cpp"#include "SimpleContainer.cpp"#include "SimpleContainerIterator.cpp"
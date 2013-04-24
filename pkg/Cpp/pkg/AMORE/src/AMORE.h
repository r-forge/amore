//#pragma once

#include <iostream>
#include <sstream>
#include <algorithm>
#include <vector>
#include <iterator>
#include <string>
#include <valarray>      // for tanh, ...
#include <Rcpp.h>

using namespace Rcpp;

class ActivationFunction;
class Con;
template<typename T> class Container;
class CostFunction;
class classNoTrainBehaviorFactory;

class Identity;
class IdentityFactory;
template<typename T> class Iterator;
class MLPbehavior;
class MLPfactory;
class NetworkRinterface;
class NeuralNetwork;
class SimpleNetwork;
class NeuralCreator;
class SimpleNeuralCreator;
class NeuralFactory;
class NetworkTrainBehavior;
class PredictBehavior;
class Neuron;
class SimpleNeuron;
class NeuronTrainBehavior;

template<typename T> class SimpleContainer;
template<typename T> class SimpleContainerIterator;
template<typename T> class SimpleContainerReverseIterator;

class Tanh;
class TanhFactory;


class TrainingBehavior;


#ifndef size_type
#define size_type unsigned int
#endif

typedef int Handler;
typedef double (*CppFunctionPointer)(double);




typedef Neuron* NeuronPtr;
typedef Con* ConPtr;

typedef ActivationFunction* 		ActivationFunctionPtr;
typedef CostFunction* 			CostFunctionPtr;
typedef PredictBehavior* 		PredictBehaviorPtr;
typedef NetworkTrainBehavior* 	NetworkTrainBehaviorPtr;
typedef NeuronTrainBehavior* 	NeuronTrainBehaviorPtr;
typedef NeuralNetwork* 			NeuralNetworkPtr;

typedef Container<NeuronPtr>*	LayerPtr;
typedef Container<LayerPtr>* 	LayerContainerPtr;
typedef Container<ConPtr>* 	ConContainerPtr;


typedef Iterator<LayerPtr>*		LayerIteratorPtr;
typedef Iterator<NeuronPtr>*		NeuronIteratorPtr;
typedef Iterator<ConPtr>*		ConIteratorPtr;

typedef NeuralFactory*			NeuralFactoryPtr;
typedef NeuralCreator*			NeuralCreatorPtr;

typedef CostFunction*			CostFunctionPtr;


//============================================================================================
// CODE  (grouped according to the *.dia files)
//============================================================================================

// -------------------------------------------  Activation.dia classes' code ----------
#include "ActivationFunction.cpp"

// -------------------------------------------  Con.dia classes' code ----------
#include "Connection.cpp"

// -------------------------------------------  Container.dia classes' code ----------
// Container.dia classes are templates, thus with coded defined in the header files


// -------------------------------------------  CostFunction.dia classes' code ----------
#include "LMS.cpp"
#include "LMLS.cpp"
#include "TAO.cpp"

// -------------------------------------------  NetworkRinterface.dia classes' code ----------
#include "NetworkRinterface.cpp"


// -------------------------------------------  NetworkTrainBehavior.dia classes' code ----------
#include "NetworkTrainBehavior.cpp"
#include "MLPNetworkTrainBehavior.cpp"
#include "MLPNoNetworkTrainBehavior.cpp"
#include "AdaptNetworkTrainBehavior.cpp"
#include "ADAPTgdNetworkTrainBehavior.cpp"
#include "ADAPTgdwmNetworkTrainBehavior.cpp"
#include "BatchNetworkTrainBehavior.cpp"
#include "BATCHgdNetworkTrainBehavior.cpp"
#include "BATCHgdwmNetworkTrainBehavior.cpp"


// -------------------------------------------  NeuralCreator.dia classes' code ----------
#include "SimpleNeuralCreator.cpp"

//// -------------------------------------------  NeuralNetwork.dia classes' code ----------
#include "NeuralNetwork.cpp"
#include "SimpleNetwork.cpp"

//// -------------------------------------------  Neuralfactory.dia classes' code ----------
#include "MLPfactory.cpp"
#include "MLPNoNetworkTrainBehaviorFactory.cpp"
#include "ADAPTgdFactory.cpp"
#include "ADAPTgdwmFactory.cpp"
#include "BATCHgdFactory.cpp"
#include "BATCHgdwmFactory.cpp"


// -------------------------------------------  Neuron.dia class classes' code ----------
#include "Neuron.cpp"
#include "SimpleNeuron.cpp"

// -------------------------------------------  NeuronTrainBehavior.dia classes' code ----------
#include "NeuronTrainBehavior.cpp"
#include "NoNeuronTrainBehavior.cpp"
#include "MLPNeuronTrainBehavior.cpp"
#include "AdaptNeuronTrainBehavior.cpp"
#include "ADAPTgdNeuronTrainBehavior.cpp"
#include "ADAPTgdOutputNeuronTrainBehavior.cpp"
#include "ADAPTgdHiddenNeuronTrainBehavior.cpp"
#include "ADAPTgdwmNeuronTrainBehavior.cpp"
#include "ADAPTgdwmOutputNeuronTrainBehavior.cpp"
#include "ADAPTgdwmHiddenNeuronTrainBehavior.cpp"
#include "BatchNeuronTrainBehavior.cpp"
#include "BATCHgdNeuronTrainBehavior.cpp"
#include "BATCHgdOutputNeuronTrainBehavior.cpp"
#include "BATCHgdHiddenNeuronTrainBehavior.cpp"
#include "BATCHgdwmNeuronTrainBehavior.cpp"
#include "BATCHgdwmOutputNeuronTrainBehavior.cpp"
#include "BATCHgdwmHiddenNeuronTrainBehavior.cpp"


//// -------------------------------------------  PredictBehavior.dia classes' code ----------
#include "PredictBehavior.cpp"
#include "MLPbehavior.cpp"


//// -------------------------------------------  RcppModules code ----------
#include "RcppModules.cpp"

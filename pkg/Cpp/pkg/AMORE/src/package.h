#pragma once

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


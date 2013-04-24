

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


//class Tanh;



class TrainingBehavior;


#ifndef size_type
#define size_type unsigned int
#endif

typedef int Handler;
typedef double (*CppFunctionPointer)(double);


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
// HEADERS (grouped according to the *.dia files)
//============================================================================================

// -------------------------------------------  Activation.dia class headers ----------
#include "classHeaders/ActivationFunction.h"

// -------------------------------------------  Con.dia class headers ----------
#include "classHeaders/Connection.h"

// -------------------------------------------  Container.dia class headers ----------
#include "classHeaders/Container.h"
#include "classHeaders/SimpleContainer.h"
#include "classHeaders/Iterator.h"
#include "classHeaders/SimpleContainerIterator.h"
#include "classHeaders/SimpleContainerReverseIterator.h"


// -------------------------------------------  CostFunction.dia class headers ----------
#include "classHeaders/CostFunction.h"
#include "classHeaders/LMS.h"
#include "classHeaders/LMLS.h"
#include "classHeaders/TAO.h"

//// -------------------------------------------  NetworkRinterface.dia class headers ----------
#include "classHeaders/NetworkRinterface.h"


//// -------------------------------------------  NetworkTrainBehavior.dia class headers ----------
#include "classHeaders/NetworkTrainBehavior.h"
#include "classHeaders/MLPNetworkTrainBehavior.h"
#include "classHeaders/MLPNoNetworkTrainBehavior.h"
#include "classHeaders/AdaptNetworkTrainBehavior.h"
#include "classHeaders/ADAPTgdNetworkTrainBehavior.h"
#include "classHeaders/ADAPTgdwmNetworkTrainBehavior.h"
#include "classHeaders/BatchNetworkTrainBehavior.h"
#include "classHeaders/BATCHgdNetworkTrainBehavior.h"
#include "classHeaders/BATCHgdwmNetworkTrainBehavior.h"


//// -------------------------------------------  NeuralCreator.dia class headers ----------
#include "classHeaders/NeuralCreator.h"
#include "classHeaders/SimpleNeuralCreator.h"


//// -------------------------------------------  NeuralNetwork.dia class headers ----------
#include "classHeaders/NeuralNetwork.h"
#include "classHeaders/SimpleNetwork.h"

//// -------------------------------------------  Neuralfactory.dia class headers ----------
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/MLPfactory.h"
#include "classHeaders/MLPNoNetworkTrainBehaviorFactory.h"
#include "classHeaders/ADAPTFactory.h"
#include "classHeaders/ADAPTgdFactory.h"
#include "classHeaders/ADAPTgdwmFactory.h"
#include "classHeaders/BATCHFactory.h"
#include "classHeaders/BATCHgdFactory.h"
#include "classHeaders/BATCHgdwmFactory.h"



// -------------------------------------------  Neuron.dia class headers ----------
#include "classHeaders/Neuron.h"
#include "classHeaders/SimpleNeuron.h"
// -------------------------------------------  NeuronTrainBehavior.dia class headers ----------
#include "classHeaders/NeuronTrainBehavior.h"
#include "classHeaders/NoNeuronTrainBehavior.h"
#include "classHeaders/MLPNeuronTrainBehavior.h"
#include "classHeaders/AdaptNeuronTrainBehavior.h"
#include "classHeaders/ADAPTgdNeuronTrainBehavior.h"
#include "classHeaders/ADAPTgdOutputNeuronTrainBehavior.h"
#include "classHeaders/ADAPTgdHiddenNeuronTrainBehavior.h"
#include "classHeaders/ADAPTgdwmNeuronTrainBehavior.h"
#include "classHeaders/ADAPTgdwmOutputNeuronTrainBehavior.h"
#include "classHeaders/ADAPTgdwmHiddenNeuronTrainBehavior.h"
#include "classHeaders/BatchNeuronTrainBehavior.h"
#include "classHeaders/BATCHgdNeuronTrainBehavior.h"
#include "classHeaders/BATCHgdOutputNeuronTrainBehavior.h"
#include "classHeaders/BATCHgdHiddenNeuronTrainBehavior.h"
#include "classHeaders/BATCHgdwmNeuronTrainBehavior.h"
#include "classHeaders/BATCHgdwmOutputNeuronTrainBehavior.h"
#include "classHeaders/BATCHgdwmHiddenNeuronTrainBehavior.h"


//// -------------------------------------------  PredictBehavior.dia class headers ----------
#include "classHeaders/PredictBehavior.h"
#include "classHeaders/MLPBehavior.h"


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

# Unit Tests for the Con C++ class methods
# 
# Author: mcasl
###############################################################################



###############################################################################
test.Con.Cpp.Constructor_SingleArgument <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			boost::shared_ptr<SimpleNeuron> neuronPtr ( new SimpleNeuron() ) ;
			neuronPtr->setId(1);
			Con con( *neuronPtr ); 
			con.show();
			con.validate();	
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 	= con.Id(),
										Rcpp::Named(\"weight\") = con.getWeight()
									);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result$Id, 1)
	checkEquals(result$weight, 0)
	# file1ba975dd.cpp:90:28: error: SimpleNeuron.cpp: No such file or directory
	# In file included from file1ba975dd.cpp:89:
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:10: error: definition of implicitly-declared 'Neuron::Neuron()'
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:10: error: declaration of 'Neuron::Neuron()' throws different exceptions
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/dia/Neuron.h:3: error: from previous declaration 'Neuron::Neuron() throw ()'
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp: In constructor 'Neuron::Neuron()':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:11: error: class 'Neuron' does not have any field named 'd_Id'
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:11: error: no matching function for call to 'boost::reference_wrapper<PredictBehavior>::reference_wrapper()'
	# /opt/local/include/boost/ref.hpp:43: note: candidates are: boost::reference_wrapper<T>::reference_wrapper(T&) [with T = PredictBehavior]
	# /opt/local/include/boost/ref.hpp:33: note:                 boost::reference_wrapper<PredictBehavior>::reference_wrapper(const boost::reference_wrapper<PredictBehavior>&)
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:11: error: no matching function for call to 'boost::reference_wrapper<TrainingBehavior>::reference_wrapper()'
	# /opt/local/include/boost/ref.hpp:43: note: candidates are: boost::reference_wrapper<T>::reference_wrapper(T&) [with T = TrainingBehavior]
	# /opt/local/include/boost/ref.hpp:33: note:                 boost::reference_wrapper<TrainingBehavior>::reference_wrapper(const boost::reference_wrapper<TrainingBehavior>&)
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp: At global scope:
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:15: error: prototype for 'Neuron::Neuron(int)' does not match any in class 'Neuron'
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/dia/Neuron.h:3: error: candidates are: Neuron::Neuron(const Neuron&)
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:10: error:                 Neuron::Neuron()
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp: In constructor 'Neuron::Neuron(int)':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:16: error: class 'Neuron' does not have any field named 'd_Id'
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:16: error: no matching function for call to 'boost::reference_wrapper<PredictBehavior>::reference_wrapper()'
	# /opt/local/include/boost/ref.hpp:43: note: candidates are: boost::reference_wrapper<T>::reference_wrapper(T&) [with T = PredictBehavior]
	# /opt/local/include/boost/ref.hpp:33: note:                 boost::reference_wrapper<PredictBehavior>::reference_wrapper(const boost::reference_wrapper<PredictBehavior>&)
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:16: error: no matching function for call to 'boost::reference_wrapper<TrainingBehavior>::reference_wrapper()'
	# /opt/local/include/boost/ref.hpp:43: note: candidates are: boost::reference_wrapper<T>::reference_wrapper(T&) [with T = TrainingBehavior]
	# /opt/local/include/boost/ref.hpp:33: note:                 boost::reference_wrapper<TrainingBehavior>::reference_wrapper(const boost::reference_wrapper<TrainingBehavior>&)
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp: At global scope:
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:32: error: no 'int Neuron::Id()' member function declared in class 'Neuron'
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp: In member function 'int Neuron::Id()':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:34: error: 'd_Id' was not declared in this scope
	# make: *** [file1ba975dd.o] Error 1
	# 
	# ERROR(s) during compilation: source code errors or compiler configuration errors!
	# 
	# Program source:
	#   1: #include <Rcpp.h>
	#   2: 
	#   3: /*! \mainpage The AMORE++ package
	#   4: 
	#   5:  *
	#   6: 
	#   7:  * \section intro_sec Introduction
	#   8: 
	#   9:  *
	#  10: 
	#  11:  * Here you will find the documentation of the C++ component of the AMORE++ R package.
	#  12: 
	#  13:  * The AMORE++ package is a new version of the publicly available AMORE package for neural network training and simulation under R
	#  14: 
	#  15:  *
	#  16: 
	#  17:  * \section motiv_sec Motivation
	#  18: 
	#  19:  *
	#  20: 
	#  21:  * Since the release of the previous version of the AMORE many things have changed in the R programming world.
	#  22: 
	#  23:  * The advent of the Reference Classes and of packages like Rcpp, inline and RUnit compel us to write a better version of the package in order to provide a more useful framework for neural network training and simulation.
	#  24: 
	#  25:  *
	#  26: 
	#  27:  * \section RoadMap Road Map
	#  28: 
	#  29:  * This project is currently very active and the development team intends to provide a beta version as soon as this summer (2011)
	#  30: 
	#  31:  *
	#  32: 
	#  33:  */
	#  34: 
	#  35: #include <iostream>
	#  36: #include <sstream>
	#  37: #include <algorithm>
	#  38: #include <vector>
	#  39: #include <iterator>
	#  40: #include <boost/shared_ptr.hpp>
	#  41: #include <boost/weak_ptr.hpp>
	#  42: #include <boost/foreach.hpp>
	#  43: #include <boost/ref.hpp>
	#  44: #include <Rcpp.h>
	#  45: 
	#  46: using namespace Rcpp;
	#  47: 
	#  48: class Con;
	#  49: class PredictBehavior;
	#  50: class TrainingBehavior;
	#  51: class Neuron;
	#  52: class SimpleNeuron;
	#  53: template<typename T> class ContainerInterface;
	#  54: template<typename T> class Container;
	#  55: template<typename T> class IteratorInterface;
	#  56: template<typename T> class ContainerIterator;
	#  57: 
	#  58: #define foreach         BOOST_FOREACH
	#  59: 
	#  60: #ifndef size_type
	#  61: #define size_type unsigned int
	#  62: #endif
	#  63: 
	#  64: typedef int Handler;
	#  65: typedef boost::reference_wrapper<PredictBehavior> PredictBehaviorRef;
	#  66: typedef boost::reference_wrapper<TrainingBehavior> TrainingBehaviorRef;
	#  67: typedef boost::reference_wrapper<Neuron> NeuronRef;
	#  68: typedef boost::shared_ptr<Neuron> NeuronPtr;
	#  69: typedef boost::shared_ptr<Con> ConPtr;
	#  70: typedef boost::shared_ptr< IteratorInterface<Neuron> > NeuronIteratorInterfacePtr;
	#  71: typedef boost::shared_ptr< IteratorInterface<Con> > ConIteratorInterfacePtr;
	#  72: 
	#  73: #include "dia/Con.h"
	#  74: #include "dia/Neuron.h"
	#  75: #include "dia/SimpleNeuron.h"
	#  76: 
	#  77: #if 0
	#  78: #include "dia/IteratorInterface.h"
	#  79: #include "dia/ContainerInterface.h"
	#  80: #include "dia/Container.h"
	#  81: #include "dia/ContainerIterator.h"
	#  82: 
	#  83: #endif
	#  84: 
	#  85: typedef Container<Con> ConContainer;
	#  86: typedef Container<Neuron> NeuronContainer;
	#  87: 
	#  88: #include "Con.cpp"
	#  89: #include "Neuron.cpp"
	#  90: #include "SimpleNeuron.cpp"
	#  91: 
	#  92: #if 0
	#  93: 
	#  94: #include "ContainerInterface.cpp"
	#  95: #include "Container.cpp"
	#  96: #include "IteratorInterface.cpp"
	#  97: #include "ContainerIterator.cpp"
	#  98: 
	#  99: 
	# 100: 
	# 101: #endif
	# 102: 
	# 103: using namespace Rcpp;
	# 104: extern "C" {
	# 105:   SEXP file1ba975dd (  );
	# 106: }
	# 107: 
	# 108: SEXP file1ba975dd (  ) {
	# 109: 
	# 110: 			boost::shared_ptr<SimpleNeuron> neuronPtr ( new SimpleNeuron() ) ;
	# 111: 			neuronPtr->setId(1);
	# 112: 			Con con( *neuronPtr ); 
	# 113: 			con.show();
	# 114: 			con.validate();	
	# 115: 			return	Rcpp::List::create(	Rcpp::Named("Id") 	= con.Id(),
	# 116: 										Rcpp::Named("weight") = con.getWeight()
	# 117: 									);
	# 118: 			
	# 119:   Rf_warning("your C program does not return anything!");
	# 120:   return R_NilValue;
	# 121: }
	# Error en compileCode(f, code, language, verbose) : 
	#   Compilation ERROR, function(s)/method(s) not created! file1ba975dd.cpp:90:28: error: SimpleNeuron.cpp: No such file or directory
	# In file included from file1ba975dd.cpp:89:
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:10: error: definition of implicitly-declared 'Neuron::Neuron()'
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:10: error: declaration of 'Neuron::Neuron()' throws different exceptions
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/dia/Neuron.h:3: error: from previous declaration 'Neuron::Neuron() throw ()'
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp: In constructor 'Neuron::Neuron()':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Neuron.cpp:11: error: class 'Neuron' does not have any field named 'd_Id'
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMOR
	# Adem'as: Mensajes de aviso perdidos
	# comando ejecutado '/Library/Frameworks/R.framework/Resources/bin/R CMD SHLIB file1ba975dd.cpp 2> file1ba975dd.cpp.err.txt' tiene estatus 1 
	# From:	 1 	 Weight= 	 0.000000 
	# [1] TRUE
	# [1] TRUE

	
	# From:	 1 	 Weight= 	 0.000000 
	# [1] TRUE
	# [1] TRUE
# From:	 1 	 Weight= 	 0.000000 
	# [1] TRUE
	# [1] TRUE
}



###############################################################################
test.Con.Cpp.Constructor_FullArgumentList <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- " 
			NeuronPtr neuronPtr ( new Neuron(1) ) ;
			Con con( *neuronPtr , 4.5 );
			con.show();
			con.validate();	
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 	= con.Id(),
										Rcpp::Named(\"weight\") = con.weight()
									);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result$Id, 1)
	checkEquals(result$weight, 4.5)
	# From:	 1 	 Weight= 	 4.500000 
	# [1] TRUE
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.getNeuron <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronPtr neuronPtr1 ( new Neuron(1) ) ;
			Con con( *neuronPtr1 );
			return wrap(con.getNeuron().Id());
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(1,2)) 
	# [1] TRUE
}


###############################################################################
test.Con.Cpp.setNeuron <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronPtr neuronPtr1 ( new Neuron(1) ) ;
			NeuronPtr neuronPtr2 ( new Neuron(2) ) ;
			Con con( *neuronPtr1 );
			
			std::vector<double> result;
			result.push_back(con.getNeuron().Id());
			con.setNeuron(neuronPtr2);
			result.push_back(con.getNeuron().Id());  
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(1,2)) 
	# [1] TRUE
}


###############################################################################
test.Con.Cpp.Id <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			NeuronPtr neuronPtr ( new Neuron(9) ) ;
			Con con( *neuronPtr );  	// d_neuron points to neuron and weight is set to 0
			return wrap(con.Id());
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 9)
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.weight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			NeuronPtr neuronPtr ( new Neuron(16) ) ;
			Con con( *neuronPtr , 12.4);
			std::vector<double> result;
			result.push_back(con.weight());
			con.weight()=2.2;
			result.push_back(con.weight());
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(12.4, 2.2) )
	# [1] TRUE
}




###############################################################################
test.Con.Cpp.show <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronPtr neuronPtr ( new Neuron(16) ) ;
			Con con( *neuronPtr, 12.4 ); 
			con.show();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkTrue(result)
# From:	 16 	 Weight= 	 12.400000 
# [1] TRUE
}

###############################################################################
test.Con.Cpp.validate_weight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronPtr  neuronPtr ( new Neuron(16) ) ;
			Con con( *neuronPtr, 12.4/0.0 );  		
			con.validate();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	checkException(result <- testCodefun(), silent=TRUE)
	# [1] TRUE
	# plus a couple of reasonable warnings from the compiler concerning a division by cero
}

###############################################################################
test.Con.Cpp.validate_from <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			NeuronPtr neuronPtr ( new Neuron(NA_INTEGER) ) ;
			Con con( *neuronPtr, 12.4 ); 
			con.validate();
			return wrap(true);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	checkException(result <- testCodefun(), silent=TRUE)
	# [1] TRUE
}



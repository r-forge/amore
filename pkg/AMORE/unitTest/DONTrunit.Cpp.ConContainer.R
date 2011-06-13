# Unit Tests for the ConContainer C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.ConContainer.Cpp.push_back.getId <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
				std::vector<int> result;
				ContainerNeuronPtr	neuronContainerPtr( new Container<Neuron>() );
				ConContainerPtr	conContainerPtr( new ConContainer() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
					ptN.reset( new Neuron( ids[i] ) ); 	
					neuronContainerPtr->push_back(ptN);
				}
				for (int i=0; i<=2 ; i++) {				// and a vector with three connections
					ptC.reset( new Con( neuronContainerPtr->load().at(i), weights[i]) );  	
					conContainerPtr->push_back(ptC);			 
				}		
	// Test
			conContainerPtr->show() ;
			conContainerPtr->validate();		
			result=conContainerPtr->getId();
			return wrap(result);
			"	
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10, 20, 30))
	# From:	 10 	 Weight= 	 1.130000 
	# From:	 20 	 Weight= 	 2.220000 
	# From:	 30 	 Weight= 	 3.330000 
	# [1] TRUE
}

###############################################################################
test.ConContainer.Cpp.numOfCons.show <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
				std::vector<int> result;
				std::vector<ConPtr> vcA, vcB;
				ContainerNeuronPtr	neuronContainerPtr( new Container<Neuron>() );
				ConContainerPtr	conContainerPtr( new ConContainer() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
					ptN.reset( new Neuron( ids[i] ) ); 	
					neuronContainerPtr->push_back(ptN);
				}
				for (int i=0; i<=2 ; i++) {				// and a vector with three connections
					result.push_back(conContainerPtr->numOfCons());		// Append numOfCons to result, create new Con and push_back into conContainer	
					ptC.reset( new Con( neuronContainerPtr->load().at(i), weights[i]) );  	
					conContainerPtr->push_back(ptC);			 
				}		
	// Test
			conContainerPtr->show() ;
			conContainerPtr->validate();					
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(0, 1, 2))
	# From:	 10 	 Weight= 	 1.130000 
	# From:	 20 	 Weight= 	 2.220000 
	# From:	 30 	 Weight= 	 3.330000 
	# [1] TRUE
}



###############################################################################
test.ConContainer.Cpp.BuildAppend <- function() {	
###############################################################################

incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
testCode <- "
			// Data set up
				std::vector<int> result;
				NeuronContainer neuronContainer;
				ConContainerPtr	conContainerPtr( new ConContainer() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				std::vector<double> nWeights;
				nWeights.push_back(12.3);
				nWeights.push_back(1.2);
				nWeights.push_back(2.1);
				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
					ptN.reset( new Neuron( ids[i] ) ); 	
					neuronContainer.push_back(ptN);
				}
				conContainerPtr->buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );			 
			// Test	
				result=conContainerPtr->getId();
				return wrap(result);
		"
testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
result <- testCodefun()
checkEquals(result, c( 10, 20, 30))
# file647ac73d.cpp:54: error: invalid use of incomplete type 'struct NeuronContainer'
# file647ac73d.cpp:37: error: forward declaration of 'struct NeuronContainer'
# In file included from file647ac73d.cpp:58:
# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/ConContainer.h:40: error: 'struct NeuronContainer::iterator' has not been declared
# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/ConContainer.h:41: error: 'struct NeuronContainer::iterator' has not been declared
# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/ConContainer.h:45: error: expected ';' before 'std'
# In file included from file647ac73d.cpp:64:
# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/ConContainer.cpp:146: error: no 'bool ConContainer::buildAndAppend(__gnu_cxx::__normal_iterator<boost::shared_ptr<Neuron>*, std::vector<boost::shared_ptr<Neuron>, std::allocator<boost::shared_ptr<Neuron> > > >, __gnu_cxx::__normal_iterator<boost::shared_ptr<Neuron>*, std::vector<boost::shared_ptr<Neuron>, std::allocator<boost::shared_ptr<Neuron> > > >, __gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > >, __gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > >)' member function declared in class 'ConContainer'
# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/ConContainer.cpp:215: error: prototype for 'std::vector<double, std::allocator<double> > ConContainer::getWeight()' does not match any in class 'ConContainer'
# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/ConContainer.h:49: error: candidate is: std::vector<double, std::allocator<double> > ConContainer::getWeight(std::vector<int, std::allocator<int> >)
# make: *** [file647ac73d.o] Error 1
# 
# ERROR(s) during compilation: source code errors or compiler configuration errors!
# 
# Program source:
#   1: #include <Rcpp.h>
#   2: 
#   3: /*! \mainpage The AMORE++ package
#   4:  *
#   5:  * \section intro_sec Introduction
#   6:  *
#   7:  * Here you will find the documentation of the C++ component of the AMORE++ R package.
#   8:  * The AMORE++ package is a new version of the publicly available AMORE package for neural network training and simulation under R
#   9:  *
#  10:  * \section motiv_sec Motivation
#  11:  *
#  12:  * Since the release of the previous version of the AMORE many things have changed in the R programming world.
#  13:  * The advent of the Reference Classes and of packages like Rcpp, inline and RUnit compel us to write a better version of the package in order to provide a more useful framework for neural network training and simulation.
#  14:  *
#  15:  * \section RoadMap Road Map
#  16:  * This project is currently very active and the development team intends to provide a beta version as soon as this summer (2011)
#  17:  *
#  18:  */
#  19: 
#  20: #include <iostream>
#  21: #include <sstream>
#  22: #include <algorithm>
#  23: #include <vector>
#  24: #include <iterator>
#  25: #include <boost/shared_ptr.hpp>
#  26: #include <boost/weak_ptr.hpp>
#  27: #include <boost/foreach.hpp>
#  28: #include <Rcpp.h>
#  29: 
#  30: using namespace Rcpp;
#  31: 
#  32: class Con;
#  33: template<typename T>
#  34:   class Container;
#  35: class ConContainer;
#  36: class Neuron;
#  37: class NeuronContainer;
#  38: 
#  39: #define foreach         BOOST_FOREACH
#  40: 
#  41: #ifndef size_type
#  42: #define size_type unsigned int
#  43: #endif
#  44: 
#  45: 
#  46: 
#  47: typedef boost::shared_ptr<Con> ConPtr;
#  48: typedef boost::shared_ptr<Neuron> NeuronPtr;
#  49: typedef boost::weak_ptr<Neuron> NeuronWeakPtr;
#  50: typedef boost::shared_ptr<Container<Con> > ContainerConPtr;
#  51: typedef boost::shared_ptr<Container<Neuron> > ContainerNeuronPtr;
#  52: typedef boost::shared_ptr<ConContainer> ConContainerPtr;
#  53: typedef boost::shared_ptr<NeuronContainer> NeuronContainerPtr;
#  54: typedef std::vector<NeuronPtr>::iterator NeuronContainer::iterator;
#  55: 
#  56: #include "Con.h"
#  57: #include "Container.h"
#  58: #include "ConContainer.h"
#  59: #include "Neuron.h"
#  60: #include "NeuronContainer.h"
#  61: 
#  62: #include "Con.cpp"
#  63: #include "Container.cpp"
#  64: #include "ConContainer.cpp"
#  65: #include "Neuron.cpp"
#  66: #include "NeuronContainer.cpp"
#  67: 
#  68: 
#  69: using namespace Rcpp;
#  70: extern "C" {
#  71:   SEXP file647ac73d (  );
#  72: }
#  73: 
#  74: SEXP file647ac73d (  ) {
#  75: 
#  76: 			// Data set up
#  77: 				std::vector<int> result;
#  78: 				NeuronContainer neuronContainer;
#  79: 				ConContainerPtr	conContainerPtr( new ConContainer() );
#  80: 				ConPtr	ptC;
#  81: 				NeuronPtr ptN;
#  82: 				int ids[]= {10, 20, 30};
#  83: 				std::vector<double> nWeights;
#  84: 				nWeights.push_back(12.3);
#  85: 				nWeights.push_back(1.2);
#  86: 				nWeights.push_back(2.1);
#  87: 				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
#  88: 					ptN.reset( new Neuron( ids[i] ) ); 	
#  89: 					neuronContainer.push_back(ptN);
#  90: 				}
#  91: 				conContainerPtr->buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );			 
#  92: 			// Test	
#  93: 				result=conContainerPtr->getId();
#  94: 				return wrap(result);
#  95: 		
#  96:   Rf_warning("your C program does not return anything!");
#  97:   return R_NilValue;
#  98: }
# Error en compileCode(f, code, language, verbose) : 
#   Compilation ERROR, function(s)/method(s) not created! file647ac73d.cpp:54: error: invalid use of incomplete type 'struct NeuronContainer'
# file647ac73d.cpp:37: error: forward declaration of 'struct NeuronContainer'
# In file included from file647ac73d.cpp:58:
# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/ConContainer.h:40: error: 'struct NeuronContainer::iterator' has not been declared
# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/ConContainer.h:41: error: 'struct NeuronContainer::iterator' has not been declared
# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/ConContainer.h:45: error: expected ';' before 'std'
# In file included from file647ac73d.cpp:64:
# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/ConContainer.cpp:146: error: no 'bool ConContainer::buildAndAppend(__gnu_cxx::__normal_iterator<boost::shared_ptr<Neuron>*, std::vector<boost::shared_pt
# Adem'as: Mensajes de aviso perdidos
# comando ejecutado '/Library/Frameworks/R.framework/Resources/bin/R CMD SHLIB file647ac73d.cpp 2> file647ac73d.cpp.err.txt' tiene estatus 1 
# Error: no se pudo encontrar la funci'on "testCodefun"
# Error en all.equal(target, current, tolerance = tolerance, ...) : 
#   objeto 'result' no encontrado

# [1] TRUE
}



###############################################################################
test.ConContainer.Cpp.Validate_Duplicated_Id <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<int> result;
			ConContainer conContainer;
			NeuronContainer neuronContainer;
			std::vector<double> nWeights;
			// Test	
			NeuronPtr ptNeuron( new Neuron(11) );
			neuronContainer.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(22) );
			neuronContainer.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(11) );
			neuronContainer.push_back(ptNeuron);	
			
			nWeights.push_back(12.3);
			nWeights.push_back(1.2);
			nWeights.push_back(2.1);
			
			conContainer.buildAndAppend( neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
			conContainer.show();
			conContainer.validate();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	checkException(result <- testCodefun(), silent=TRUE)
	# From:	 11 	 Weight= 	 12.300000 
	# From:	 22 	 Weight= 	 1.200000 
	# From:	 11 	 Weight= 	 2.100000 
	# [1] TRUE
}



###############################################################################
test.ConContainer.Cpp.Validate_Weight_Inf <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
				std::vector<int> result;
				ConContainer conContainer;
				std::vector<NeuronPtr> neuronContainer;
				std::vector<double> nWeights;
			// Test	
				NeuronPtr ptNeuron( new Neuron(11) );
				neuronContainer.push_back(ptNeuron);	
				ptNeuron.reset( new Neuron(22) );
				neuronContainer.push_back(ptNeuron);	
				ptNeuron.reset( new Neuron(33) );
				neuronContainer.push_back(ptNeuron);	
			
				nWeights.push_back(12.3);
				nWeights.push_back(1.2/0);
				nWeights.push_back(2.1);
			
				conContainer.buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
				conContainer.validate();
				return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	checkException(result <- testCodefun(), silent=TRUE)
	# [1] TRUE
	# (plus a few reasonable warnings from the compiler related to 1.2/0 )
}



###############################################################################
test.ConContainer.Cpp.setFrom <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			std::vector<int> result;
			ContainerNeuronPtr	neuronContainerPtr( new Container<Neuron>() );
			ConContainerPtr	conContainerPtr( new ConContainer() );
			ConPtr	ptC;
			NeuronPtr ptN;

			int ids[]= {10, 20, 30};
			double weights[] = {1.13, 2.22, 3.33 };

			for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
				ptN.reset( new Neuron( ids[i] ) ); 	
				neuronContainerPtr->push_back(ptN);
			}
			for (int i=0; i<=2 ; i++) {				// and a vector with three connections
				ptC.reset( new Con() );  	
				conContainerPtr->push_back(ptC);			 
			}		
			// Test
			conContainerPtr->setFrom(neuronContainerPtr->load()) ;
			conContainerPtr->show();		
			result=conContainerPtr->getId();
			return wrap(result);
			"	
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10, 20, 30))
	# From:	 10 	 Weight= 	 0.000000 
	# From:	 20 	 Weight= 	 0.000000 
	# From:	 30 	 Weight= 	 0.000000 
	# [1] TRUE
}






###############################################################################
test.ConContainer.Cpp.getWeight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			std::vector<double> result;
			int ids[]= {1, 2, 3};
			double weights[] = {12.3, 1.2, 2.1 };
			ConContainer conContainer;
			std::vector<NeuronPtr> neuronContainer;
			std::vector<double> nWeights;
			NeuronPtr ptNeuron;

			for (int i=0; i<=2; i++) {
				ptNeuron.reset( new Neuron(ids[i]) );
				neuronContainer.push_back(ptNeuron);	
				nWeights.push_back(weights[i]);	
			}
			conContainer.buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );

		// Test			
			result=conContainer.getWeight();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c( 12.3, 1.2, 2.1))
	# [1] TRUE
}



###############################################################################
test.ConContainer.Cpp.setWeight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<double> result;
			int ids[]= {1, 2, 3};
			double weights[] = {12.3, 1.2, 2.1 };
			ConContainer conContainer;
			std::vector<NeuronPtr> neuronContainer;
			std::vector<double> nWeights;
			NeuronPtr ptNeuron;
			
			for (int i=0; i<=2; i++) {
			ptNeuron.reset( new Neuron(ids[i]) );
			neuronContainer.push_back(ptNeuron);	
			nWeights.push_back(0);					// weights are set to 0
			}
			conContainer.buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
			conContainer.show();
			
			for (int i=0; i<=2; i++) {
				nWeights.at(i)=weights[i];	
			}
			// Test			
			conContainer.setWeight(nWeights);			// weights are set to 12.3, 1.2 and 2.1	
			result=conContainer.getWeight();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c( 12.3, 1.2, 2.1))
	# From:	 1 	 Weight= 	 0.000000 
	# From:	 2 	 Weight= 	 0.000000 
	# From:	 3 	 Weight= 	 0.000000 
	# [1] TRUE
}


###############################################################################
test.ConContainer.Cpp.getFrom <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			int ids[]= {1, 2, 3};
			double weights[] = {12.3, 1.2, 2.1 };
			ConContainer conContainer;
			NeuronContainer neuronContainer , nNeurons;
			std::vector<double> nWeights;
			NeuronPtr ptNeuron;

			for (int i=0; i<=2; i++) {
				ptNeuron.reset( new Neuron(ids[i]) );
				neuronContainer.push_back(ptNeuron);	
				nWeights.push_back(weights[i]);					
			}
			conContainer.buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
		// Test			
			nNeurons=conContainer.getFrom();				
			return wrap(nNeurons.getId());
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c( 1, 2, 3))
	# [1] TRUE
}



###############################################################################
test.ConContainer.Cpp.erase <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<int> result;
			std::vector<NeuronPtr> neuronContainer;
			ConContainerPtr	conContainerPtr( new ConContainer() );
			ConPtr	ptC;
			NeuronPtr ptN;
			int ids[]= {11, 10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
			std::vector<double> nWeights;
			nWeights.push_back(11.32);			nWeights.push_back(1.26);			nWeights.push_back(2.14);			nWeights.push_back(3.16);
			nWeights.push_back(4.14);			nWeights.push_back(5.19);			nWeights.push_back(6.18);			nWeights.push_back(7.16);
			nWeights.push_back(8.14);			nWeights.push_back(9.12);			nWeights.push_back(10.31);
	
			for (int i=0; i<nWeights.size() ; i++) {				// Let's create a vector with three neurons
				ptN.reset( new Neuron( ids[i] ) ); 	
				neuronContainer.push_back(ptN);
			}
			conContainerPtr->buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );	
 

			// Test	

			std::vector<int> toRemove;
			toRemove.push_back(1);
			toRemove.push_back(3);
			toRemove.push_back(5);
			toRemove.push_back(7);

			conContainerPtr->erase(toRemove);
			conContainerPtr->show();
			result=conContainerPtr->getId();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c( 2,  4,  6, 8,  9, 10, 11))
	# From:	 2 	 Weight= 	 9.120000 
	# From:	 4 	 Weight= 	 4.140000 
	# From:	 6 	 Weight= 	 6.180000 
	# From:	 8 	 Weight= 	 8.140000 
	# From:	 9 	 Weight= 	 2.140000 
	# From:	 10 	 Weight= 	 1.260000 
	# From:	 11 	 Weight= 	 11.320000 
	# [1] TRUE
}



###############################################################################
test.ConContainer.Cpp.select <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<int> result;
			std::vector<NeuronPtr> neuronContainer;
			ConContainerPtr	conContainerPtr( new ConContainer() );
			ConPtr	ptC;
			NeuronPtr ptN;
			int ids[]= {11, 10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
			double weights[]={11.32, 1.26, 2.14, 3.16, 4.14, 5.19, 6.18, 7.16, 8.14, 9.12, 10.31};
			std::vector<double> nWeights;
			for (int i=0; i<11; i++) {
				nWeights.push_back(weights[i]);
			}
			for (int i=0; i<nWeights.size() ; i++) {				// Let's create a vector with three neurons
				ptN.reset( new Neuron( ids[i] ) ); 	
				neuronContainer.push_back(ptN);
			}
			conContainerPtr->buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );			 
			// Test
			std::vector<int> toSelect;
			toSelect.push_back(1);
			toSelect.push_back(3);
			toSelect.push_back(5);
			toSelect.push_back(7);
			
			ConContainerPtr  vSelect (  conContainerPtr->select(toSelect)  );
			result=vSelect->getId();
			return wrap(result);
	"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c( 1, 3,  5, 7))
}





###############################################################################
test.ConContainer.Cpp.getWeight_FromIsNumeric <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			std::vector<double> result;
			std::vector<NeuronPtr> neuronContainer;
			ConContainerPtr	conContainerPtr( new ConContainer() );
			ConPtr	ptC;
			NeuronPtr ptN;
			int ids[]= {11, 10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
			double weights[]={11.32, 1.26, 2.14, 3.16, 4.14, 5.19, 6.18, 7.16, 8.14, 9.12, 10.31};
			std::vector<double> nWeights;
			for (int i=0; i<11; i++) {
			nWeights.push_back(weights[i]);
			}
			for (int i=0; i<nWeights.size() ; i++) {				// Let's create a vector with three neurons
			ptN.reset( new Neuron( ids[i] ) ); 	
			neuronContainer.push_back(ptN);
			}
			conContainerPtr->buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );			 

		// Test
			std::vector<int> toSelect;
			toSelect.push_back(1);
			toSelect.push_back(3);
			toSelect.push_back(5);
			toSelect.push_back(7);
			
			result=conContainerPtr->getWeight(toSelect);
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c( 10.31, 3.16,  5.19, 7.16))
	# [1] TRUE
}




###############################################################################
test.ConContainer.Cpp.setWeight_FromIsNumeric <- function() {	
	###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
			std::vector<double> result;
			std::vector<NeuronPtr> neuronContainer;
			ConContainerPtr	conContainerPtr( new ConContainer() );
			ConPtr	ptC;
			NeuronPtr ptN;
			int ids[]= {11, 10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
			double weights[]={11.32, 1.26, 2.14, 3.16, 4.14, 5.19, 6.18, 7.16, 8.14, 9.12, 10.31};
			std::vector<double> nWeights;
			for (int i=0; i<11; i++) {
			nWeights.push_back(weights[i]);
			}
			for (int i=0; i<nWeights.size() ; i++) {				// Let's create a vector with three neurons
			ptN.reset( new Neuron( ids[i] ) ); 	
			neuronContainer.push_back(ptN);
			}
			conContainerPtr->buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );		 
			
			std::vector<int> toSelect;
			std::vector<double> vNewWeights;
			toSelect.push_back(1);
			toSelect.push_back(3);
			toSelect.push_back(5);
			toSelect.push_back(7);
			vNewWeights.push_back(1000.1);			
			vNewWeights.push_back(3000.3);
			vNewWeights.push_back(5000.5);
			vNewWeights.push_back(7000.7);
			conContainerPtr->setWeight(vNewWeights, toSelect);
			
	// Test			
			result = conContainerPtr->getWeight();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c( 1000.10, 9.12, 3000.30, 4.14, 5000.50, 6.18, 7000.70, 8.14, 2.14, 1.26, 11.32))
	# [1] TRUE
}







# Unit Tests for the vecCon C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.vecCon.Cpp.push_back.getFromId <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
				std::vector<int> result;
				std::vector<ConSharedPtr> vcA, vcB;
				vecAMOREneuronSharedPtr	ptShvNeuron( new vecAMORE<Neuron>() );
				vecConSharedPtr	ptShvCon( new vecCon() );
				ConSharedPtr	ptC;
				NeuronSharedPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
					ptN.reset( new Neuron( ids[i] ) ); 	
					ptShvNeuron->push_back(ptN);
				}
				for (int i=0; i<=2 ; i++) {				// and a vector with three connections
					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );  	
					ptShvCon->push_back(ptC);			 
				}		
	// Test
			ptShvCon->show() ;
			ptShvCon->validate();		
			result=ptShvCon->getFromId();
			return wrap(result);
			"	
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10, 20, 30))
	# [1] TRUE		
}

###############################################################################
test.vecCon.Cpp.numOfCons.show <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
				std::vector<int> result;
				std::vector<ConSharedPtr> vcA, vcB;
				vecAMOREneuronSharedPtr	ptShvNeuron( new vecAMORE<Neuron>() );
				vecConSharedPtr	ptShvCon( new vecCon() );
				ConSharedPtr	ptC;
				NeuronSharedPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
					ptN.reset( new Neuron( ids[i] ) ); 	
					ptShvNeuron->push_back(ptN);
				}
				for (int i=0; i<=2 ; i++) {				// and a vector with three connections
					result.push_back(ptShvCon->numOfCons());		// Append numOfCons to result, create new Con and push_back into MyvecCon	
					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );  	
					ptShvCon->push_back(ptC);			 
				}		
	// Test
			ptShvCon->show() ;
			ptShvCon->validate();					
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
test.vecCon.Cpp.BuildAppend <- function() {	
###############################################################################
incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
testCode <- "
			// Data set up
			std::vector<int> result;
			vecCon MyvecCon;
			std::vector<NeuronSharedPtr> vNeuron;
			std::vector<double> vWeight;


			// Test	
			NeuronSharedPtr ptNeuron( new Neuron(11) );
			vNeuron.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(22) );
			vNeuron.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(33) );
			vNeuron.push_back(ptNeuron);	

			vWeight.push_back(12.3);
			vWeight.push_back(1.2);
			vWeight.push_back(2.1);

			MyvecCon.buildAndAppend(vNeuron, vWeight);

			result=MyvecCon.getFromId();
			return wrap(result);
		"
testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
result <- testCodefun()
checkEquals(result, c( 11, 22, 33))
# [1] TRUE
}

###############################################################################
test.vecCon.Cpp.Validate <- function() {	
	###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<int> result;
			vecCon MyvecCon;
			std::vector<NeuronSharedPtr> vNeuron;
			std::vector<double> vWeight;
			
			
			// Test	
			NeuronSharedPtr ptNeuron( new Neuron(11) );
			vNeuron.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(22) );
			vNeuron.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(33) );
			vNeuron.push_back(ptNeuron);	
			
			vWeight.push_back(12.3);
			vWeight.push_back(1.2);
			vWeight.push_back(2.1);
			
			MyvecCon.buildAndAppend(vNeuron, vWeight);
			MyvecCon.validateVector();
			
			return wrap(MyvecCon);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	checkException(result <- testCodefun(), silent=TRUE)
# [1] TRUE
}


###############################################################################
test.vecCon.Cpp.getWeight <- function() {	
###############################################################################

	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<double> result;
			vecCon MyvecCon;
			std::vector<NeuronSharedPtr> vNeuron;
			std::vector<double> vWeight;
			
			
			// Test	
			NeuronSharedPtr ptNeuron( new Neuron(11) );
			vNeuron.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(22) );
			vNeuron.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(33) );
			vNeuron.push_back(ptNeuron);	
			
			vWeight.push_back(12.3);
			vWeight.push_back(1.2);
			vWeight.push_back(2.1);
			
			MyvecCon.buildAndAppend(vNeuron, vWeight);
			
			result=MyvecCon.getWeight();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c( 12.3, 1.2, 2.1))
	# [1] TRUE
}



###############################################################################
test.vecCon.Cpp.getFromNeuron <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<int> result;
			vecCon MyvecCon,  auxvec;
			std::vector<NeuronSharedPtr> vNeuron;
			std::vector<double> vWeight;

			// Test	
			NeuronSharedPtr ptNeuron( new Neuron(11) );
			vNeuron.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(22) );
			vNeuron.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(33) );
			vNeuron.push_back(ptNeuron);	
			
			vWeight.push_back(12.3);
			vWeight.push_back(1.2);
			vWeight.push_back(2.1);
			
			MyvecCon.buildAndAppend(vNeuron, vWeight);
			auxvec.buildAndAppend(MyvecCon.getFromNeuron(), vWeight);
			result=auxvec.getFromId();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c( 11, 22, 33))
	# In file included from filef516215.cpp:49:
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp: In constructor 'Con::Con(NeuronSharedPtr, double)':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp:27: error: cannot convert 'NeuronSharedPtr' to 'NeuronSharedPtr*' in initialization
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp: In member function 'NeuronSharedPtr Con::getFromNeuron()':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp:60: error: conversion from 'NeuronSharedPtr*' to non-scalar type 'NeuronSharedPtr' requested
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp: In member function 'void Con::setFromNeuron(NeuronSharedPtr)':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp:71: error: cannot convert 'NeuronSharedPtr' to 'NeuronSharedPtr*' in assignment
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp: In member function 'int Con::getFromId()':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp:98: error: 'class boost::shared_ptr<Neuron>' has no member named 'getId'
	# In file included from filef516215.cpp:51:
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/vecCon.cpp: In member function 'bool vecCon::buildAndAppend(std::vector<boost::shared_ptr<Neuron>, std::allocator<boost::shared_ptr<Neuron> > >, std::vector<double, std::allocator<double> >)':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/vecCon.cpp:141: error: no matching function for call to 'Con::Con(Neuron*, double&)'
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp:27: note: candidates are: Con::Con(NeuronSharedPtr, double)
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp:18: note:                 Con::Con()
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.h:16: note:                 Con::Con(const Con&)
	# make: *** [filef516215.o] Error 1
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
	#  20: 
	#  21: #include <iostream>
	#  22: #include <sstream>
	#  23: #include <algorithm>
	#  24: #include <vector>
	#  25: #include <boost/shared_ptr.hpp>
	#  26: #include <Rcpp.h>
	#  27: 
	#  28: using namespace Rcpp;
	#  29: 
	#  30: class Con;
	#  31: template <typename T> class vecAMORE;
	#  32: class vecCon;
	#  33: class Neuron;
	#  34: 
	#  35: 
	#  36: typedef boost::shared_ptr<Con> ConSharedPtr;
	#  37: typedef boost::shared_ptr<Neuron> NeuronSharedPtr;
	#  38: 
	#  39: 
	#  40: #include "Con.h"
	#  41: 
	#  42: 
	#  43: 
	#  44: #include "vecAMORE.h"
	#  45: #include "vecCon.h"
	#  46: #include "Neuron.h"
	#  47: 
	#  48: 
	#  49: #include "Con.cpp"
	#  50: #include "vecAMORE.cpp"
	#  51: #include "vecCon.cpp"
	#  52: #include "Neuron.cpp"
	#  53: 
	#  54: 
	#  55: using namespace Rcpp;
	#  56: extern "C" {
	#  57:   SEXP filef516215 (  );
	#  58: }
	#  59: 
	#  60: SEXP filef516215 (  ) {
	#  61: 
	#  62: 			// Data set up
	#  63: 			std::vector<int> result;
	#  64: 			vecCon MyvecCon,  auxvec;
	#  65: 			std::vector<NeuronSharedPtr> vNeuron;
	#  66: 			std::vector<double> vWeight;
	#  67: 
	#  68: 			// Test	
	#  69: 			NeuronSharedPtr ptNeuron( new Neuron(11) );
	#  70: 			vNeuron.push_back(ptNeuron);	
	#  71: 			ptNeuron.reset( new Neuron(22) );
	#  72: 			vNeuron.push_back(ptNeuron);	
	#  73: 			ptNeuron.reset( new Neuron(33) );
	#  74: 			vNeuron.push_back(ptNeuron);	
	#  75: 			
	#  76: 			vWeight.push_back(12.3);
	#  77: 			vWeight.push_back(1.2);
	#  78: 			vWeight.push_back(2.1);
	#  79: 			
	#  80: 			MyvecCon.buildAndAppend(vNeuron, vWeight);
	#  81: 			auxvec.buildAndAppend(MyvecCon.getFromNeuron(), vWeight);
	#  82: 			result=auxvec.getFromId();
	#  83: 			return wrap(result);
	#  84: 			
	#  85:   Rf_warning("your C program does not return anything!");
	#  86:   return R_NilValue;
	#  87: }
	# Error en compileCode(f, code, language, verbose) : 
	#   Compilation ERROR, function(s)/method(s) not created! In file included from filef516215.cpp:49:
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp: In constructor 'Con::Con(NeuronSharedPtr, double)':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp:27: error: cannot convert 'NeuronSharedPtr' to 'NeuronSharedPtr*' in initialization
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp: In member function 'NeuronSharedPtr Con::getFromNeuron()':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp:60: error: conversion from 'NeuronSharedPtr*' to non-scalar type 'NeuronSharedPtr' requested
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp: In member function 'void Con::setFromNeuron(NeuronSharedPtr)':
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/Con.cpp:71: error: c
	# Adem'as: Mensajes de aviso perdidos
	# comando ejecutado '/Library/Frameworks/R.framework/Resources/bin/R CMD SHLIB filef516215.cpp 2> filef516215.cpp.err.txt' tiene estatus 1 
	# [1] TRUE

	# [1] TRUE	
}




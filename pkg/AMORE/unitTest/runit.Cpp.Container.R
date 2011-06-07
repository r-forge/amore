# Unit Tests for the Container C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.Container.Cpp.Constructor_EmptyArgumentList<- function() {	
###############################################################################

	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			Container<Con> MyContainer;
			MyContainer.validate();		
			return wrap(MyContainer.size());
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 0)
	# In file included from file635071b6.cpp:64:
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/VecNeuron.cpp:22: error: stray '\312' in program
	# make: *** [file635071b6.o] Error 1
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
	#  35: class VecCon;
	#  36: class Neuron;
	#  37: class VecNeuron;
	#  38: 
	#  39: #define foreach         BOOST_FOREACH
	#  40: 
	#  41: #ifndef size_type
	#  42: #define size_type unsigned int
	#  43: #endif
	#  44: 
	#  45: typedef boost::shared_ptr<Con> ConPtr;
	#  46: typedef boost::shared_ptr<Neuron> NeuronPtr;
	#  47: typedef boost::weak_ptr<Neuron> NeuronWeakPtr;
	#  48: typedef boost::shared_ptr<Container<Con> > ContainerConPtr;
	#  49: typedef boost::shared_ptr<Container<Neuron> > ContainerNeuronPtr;
	#  50: typedef boost::shared_ptr<VecCon> VecConPtr;
	#  51: typedef boost::shared_ptr<VecNeuron> VecNeuronPtr;
	#  52: 
	#  53: #include "Con.h"
	#  54: #include "Container.h"
	#  55: 
	#  56: #include "VecCon.h"
	#  57: #include "Neuron.h"
	#  58: #include "VecNeuron.h"
	#  59: 
	#  60: #include "Con.cpp"
	#  61: #include "Container.cpp"
	#  62: #include "VecCon.cpp"
	#  63: #include "Neuron.cpp"
	#  64: #include "VecNeuron.cpp"
	#  65: 
	#  66: 
	#  67: 
	#  68: using namespace Rcpp;
	#  69: extern "C" {
	#  70:   SEXP file635071b6 (  );
	#  71: }
	#  72: 
	#  73: SEXP file635071b6 (  ) {
	#  74: 
	#  75: 			// Test
	#  76: 			Container<Con> MyContainer;
	#  77: 			MyContainer.validate();		
	#  78: 			return wrap(MyContainer.size());
	#  79: 			
	#  80:   Rf_warning("your C program does not return anything!");
	#  81:   return R_NilValue;
	#  82: }
	# Error en compileCode(f, code, language, verbose) : 
	#   Compilation ERROR, function(s)/method(s) not created! In file included from file635071b6.cpp:64:
	# /Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-WC/AMORE-WC/pkg/AMORE/src/VecNeuron.cpp:22: error: stray '\312' in program
	# make: *** [file635071b6.o] Error 1
	# Adem'as: Mensajes de aviso perdidos
	# comando ejecutado '/Library/Frameworks/R.framework/Resources/bin/R CMD SHLIB file635071b6.cpp 2> file635071b6.cpp.err.txt' tiene estatus 1 
	# Error: no se pudo encontrar la funci'on "testCodefun"
	# Error en all.equal(target, current, tolerance = tolerance, ...) : 
	#   objeto 'result' no encontrado

	# [1] TRUE
}



###############################################################################
test.Container.Cpp.Constructor_collectionAsArgument<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
				ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
				ContainerConPtr		ptShvCon( new Container<Con>() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptShvNeuron->push_back(ptN);
				}

				int i=0;
				foreach ( NeuronPtr itr , *ptShvNeuron ) {			// and a vector with three connections
					ptC.reset( new Con( itr, weights[i++]) );  	
					ptShvCon->push_back(ptC);	
				}

			// Test
				Container<Con> AuxContainer( ptShvCon->load() );		// Constructor from a std::vector<ConPtr> object
				std::vector<int> result;
				foreach(ConPtr itr, AuxContainer){
					result.push_back( itr->getId() );
				}
				VecCon MyVecCon( ptShvCon->load() );					// VecCon constructor calls Container constructor as well
				std::vector<int> vIds(MyVecCon.getId());
				result.insert(result.end(), vIds.begin(), vIds.end());
				return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10, 20, 30, 10, 20, 30))
}









###############################################################################
test.Container.Cpp.validate.show<- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
			ContainerConPtr	ptShvCon( new Container<Con>() );
			ConPtr	ptC;
			NeuronPtr ptN;
			int ids[]= {10, 20, 30};
			double weights[] = {1.13, 2.22, 3.33 };
			foreach (int id, ids){  			// Let's create a vector with three neurons
				ptN.reset( new Neuron( id ) ); 	
				ptShvNeuron->push_back(ptN);
			}
			int i=0;
			foreach ( NeuronPtr itr , *ptShvNeuron ) {			// and a vector with three connections
				ptC.reset( new Con( itr, weights[i++]) );  	
				ptShvCon->push_back(ptC);	
			}

		// Test
			ptShvCon->show() ;
			ptShvCon->validate();		
			return wrap(1);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 1)
	# From:	 10 	 Weight= 	 1.130000 
	# From:	 20 	 Weight= 	 2.220000 
	# From:	 30 	 Weight= 	 3.330000 
	# [1] TRUE

}


###############################################################################
test.Container.Cpp.push_back<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
				std::vector<int> result;
				ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
				ContainerConPtr	ptShvCon( new Container<Con>() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
			// Test
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptShvNeuron->push_back(ptN);
				}

				int i=0;
				foreach ( NeuronPtr itr , *ptShvNeuron ) {			// and a vector with three connections
					ptC.reset( new Con( itr, weights[i++]) );  	
					ptShvCon->push_back(ptC);	
				}

				foreach ( ConPtr itr , *ptShvCon ) {			// and a vector with three connections
					result.push_back( itr->getId() ); 			// Container does not have getId defined	
				}

				return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}


###############################################################################
test.Container.Cpp.size<- function() {	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
				std::vector<int> result;
				ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
				ContainerConPtr	ptShvCon( new Container<Con>() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
			// Test
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptShvNeuron->push_back(ptN);
				}

				int i=0;
				foreach ( NeuronPtr itr , *ptShvNeuron ) {			// and a vector with three connections
					ptC.reset( new Con( itr, weights[i++]) );  	
					ptShvCon->push_back(ptC);	
					result.push_back(ptShvCon->size());
				}			 
				return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(1,2,3))
	# [1] TRUE
}



###############################################################################
test.Container.Cpp.store.load<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
				std::vector<int> result;
				std::vector<ConPtr> vcA, vcB;
				ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
				ContainerConPtr	ptShvCon( new Container<Con>() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptShvNeuron->push_back(ptN);
				}

				int i=0;
				foreach( NeuronPtr itr, *ptShvNeuron) {				// and a vector with three connections
					ptC.reset( new Con( itr , weights[i++]) );  	
					vcA.push_back(ptC);			 
				}			 
	// Test
			ptShvCon->store(vcA);
			vcB = ptShvCon->load();
			for (int i=0; i<=2 ; i++) {					// get Ids. Container does not have getId defined
					result.push_back( vcB.at(i)->getId());
			}
		
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}


################################################################################
test.Container.Cpp.append<- function() {	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
				std::vector<int> 	result;
				std::vector<ConPtr>	vcA, vcB;
				ContainerNeuronPtr	ptShvNeuron(new Container<Neuron>() );
				ContainerConPtr		ptShvConA(	new Container<Con>() );
				ContainerConPtr		ptShvConB(	new Container<Con>() );
				ConPtr				ptC;
				NeuronPtr 			ptN;
				int ids[]= {1, 2, 3, 4, 5, 6};
				double weights[] = {1.13, 2.22, 3.33, 5.6, 4.2, 3.6 };
	
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptShvNeuron->push_back(ptN);
				}
	
				for (int i=0; i<=2 ; i++) {				// A vector with three connections
					ptC.reset( new Con( ptShvNeuron->load().at(i), weights[i]) );  	
					ptShvConA->push_back(ptC);			 
				}			 

				for (int i=3; i<=5 ; i++) {				// Another vector with three connections
					ptC.reset( new Con( ptShvNeuron->load().at(i), weights[i]) );  	
					ptShvConB->push_back(ptC);			 
				}			 
	// Test
				ptShvConA->append(*ptShvConB);
				ptShvConA->validate();		
				ptShvConA->show() ;

				foreach (ConPtr itr, ptShvConA->load()){  // Get Ids (Container does not know about VecCon::getId yet, thus the loop)	
					 result.push_back( itr->getId() );		
				}
				return wrap(result);
		"
testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
result <- testCodefun()
checkEquals(result, c(1,2,3,4,5,6))
# From:	 1 	 Weight= 	 1.130000 
# From:	 2 	 Weight= 	 2.220000 
# From:	 3 	 Weight= 	 3.330000 
# From:	 4 	 Weight= 	 5.600000 
# From:	 5 	 Weight= 	 4.200000 
# From:	 6 	 Weight= 	 3.600000 
# [1] TRUE
}

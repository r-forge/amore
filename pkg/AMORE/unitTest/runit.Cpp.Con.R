# Unit Tests for the Con C++ class methods
# 
# Author: mcasl
###############################################################################

###############################################################################
test.Con.Cpp.setAndgetFromNeuron <- function() {	
###############################################################################
	incCode <- paste(
			paste(  "#define INLINE_R\n",					collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.h"),		collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/Neuron.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),	collapse = "\n" ),	collapse = "\n")
	testCode <- '
			Con myCon;
			Neuron MyNeuron;
			Neuron * ptNeuron;
			MyNeuron.setId(1);
			myCon.setFromNeuron(&MyNeuron);
			
			ptNeuron = myCon.getFromNeuron();
			int result= ptNeuron->getId();
			return wrap(result);
			'
	testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- testCodefun()
	checkEquals(result, 1)
}

###############################################################################
test.Con.Cpp.getFromId<- function() {	
###############################################################################
	incCode <- paste(
			paste(  "#define INLINE_R\n",					collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.h"),		collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/Neuron.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),	collapse = "\n" ),	collapse = "\n")
	testCode <- '
			Con myCon;
			Neuron MyNeuron;
			MyNeuron.setId(16);
			myCon.setFromNeuron(&MyNeuron);
			
			int result= myCon.getFromId();
			return wrap(result);
			'
	testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- testCodefun()
	checkEquals(result, 16)
}

###############################################################################
test.Con.Cpp.setAndgetWeight <- function() {	
###############################################################################
	incCode <- paste(
			paste(  "#define INLINE_R\n",					collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.h"),		collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/Neuron.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),	collapse = "\n" ),	collapse = "\n")
	testCode <- '
			Con myCon;
			Neuron MyNeuron;
			MyNeuron.setId(16);
			myCon.setFromNeuron(&MyNeuron);
			myCon.setWeight(12.4);
			double result1= myCon.getWeight();
			myCon.setWeight(2.2);
			double result2= myCon.getWeight();
			return Rcpp::List::create(	Rcpp::Named("R1")	= result1,
			Rcpp::Named("R2") 	= result2);
			'
	testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- testCodefun()
	checkEquals(result$R1, 12.4)
	checkEquals(result$R2, 2.2)
}

###############################################################################
test.Con.Cpp.show <- function() {	
###############################################################################
	incCode <- paste(
			paste(  "#define INLINE_R\n",					collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.h"),		collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/Neuron.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),	collapse = "\n" ),	collapse = "\n")
	testCode <- '
			Con myCon;
			Neuron MyNeuron;
			MyNeuron.setId(16);
			myCon.setFromNeuron(&MyNeuron);
			myCon.setWeight(12.4);
			bool result= myCon.show();
			return wrap(result);
			'
	testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- testCodefun()
	checkTrue(result)
}

###############################################################################
test.Con.Cpp.validate.weight <- function() {	
###############################################################################
	incCode <- paste(
			paste(  "#define INLINE_R\n",					collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.h"),		collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/Neuron.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),	collapse = "\n" ),	collapse = "\n")
	testCode <- '
			Con myCon;
			Neuron MyNeuron;
			MyNeuron.setId(16);
			myCon.setFromNeuron(&MyNeuron);
			myCon.setWeight(1.4/0);
			myCon.validate();
			return wrap(true);
			'
	testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	checkException(result <- testCodefun(), silent=TRUE)
}

###############################################################################
test.Con.Cpp.validate.from <- function() {
###############################################################################
	incCode <- paste(
			paste(  "#define INLINE_R\n",					collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.h"),		collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/Neuron.h"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),	collapse = "\n" ),	collapse = "\n")
	testCode <- '
			Con myCon;
			Neuron MyNeuron;
			MyNeuron.setId(NA_INTEGER);
			myCon.setFromNeuron(&MyNeuron);
			myCon.setWeight(1.4);
			myCon.validate();
			return wrap(myCon.getFromId());
			'
	testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	checkException(result <- testCodefun(), silent=TRUE)
}


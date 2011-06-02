# Unit Tests for the Con C++ class methods
# 
# Author: mcasl
###############################################################################

# FIXME Javi: Unit test for Con class constructors

###############################################################################
test.Con.Cpp.setFromNeuron.getFromNeuron <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			Con myCon;
			Neuron MyNeuron;
			Neuron * ptNeuron;
			MyNeuron.setId(1);
			myCon.setFromNeuron(&MyNeuron);
			
			ptNeuron = myCon.getFromNeuron();
			int result= ptNeuron->getId();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 1)
	# [1] TRUE
}



###############################################################################
test.Con.Cpp.getFromId<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			Con myCon;
			Neuron MyNeuron;
			MyNeuron.setId(16);
			myCon.setFromNeuron(&MyNeuron);
			
			int result= myCon.getFromId();
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 16)
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.setWeight.getWeight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			Con myCon;
			Neuron MyNeuron;
			std::vector<double> result;
			MyNeuron.setId(16);
			myCon.setFromNeuron(&MyNeuron);
			myCon.setWeight(12.4);
			result.push_back(myCon.getWeight());
			myCon.setWeight(2.2);
			result.push_back(myCon.getWeight());
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(12.4, 2.2) )
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.show <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			Neuron MyNeuron;
			MyNeuron.setId(16);
			Con myCon(&MyNeuron, 12.4);
			bool result= myCon.show();
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	result <- testCodefun()
	checkTrue(result)
	# From:	 16 	 Weight= 	 12.400000 
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.validate.weight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			Neuron MyNeuron;
			MyNeuron.setId(16);
			Con myCon(&MyNeuron, 12.4/0);
			myCon.validate();
			return wrap(true);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	checkException(result <- testCodefun(), silent=TRUE)
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.validate.from <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			Neuron MyNeuron;
			MyNeuron.setId(NA_INTEGER);
			Con myCon(&MyNeuron, 12.4);
			myCon.validate();
			return wrap(myCon.getFromId());
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	checkException(result <- testCodefun(), silent=TRUE)
	# [1] TRUE
}



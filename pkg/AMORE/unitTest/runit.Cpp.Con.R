# Unit Tests for the Con C++ class methods
# 
# Author: mcasl
###############################################################################

###############################################################################
test.Con.Cpp.setAndgetFromNeuron <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
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
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 1)
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
}

###############################################################################
test.Con.Cpp.setAndgetWeight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
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
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result$R1, 12.4)
	checkEquals(result$R2, 2.2)
}

###############################################################################
test.Con.Cpp.show <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			Con myCon;
			Neuron MyNeuron;
			MyNeuron.setId(16);
			myCon.setFromNeuron(&MyNeuron);
			myCon.setWeight(12.4);
			bool result= myCon.show();
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	result <- testCodefun()
	checkTrue(result)
}

###############################################################################
test.Con.Cpp.validate.weight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			Con myCon;
			Neuron MyNeuron;
			MyNeuron.setId(16);
			myCon.setFromNeuron(&MyNeuron);
			myCon.setWeight(1.4/0);
			myCon.validate();
			return wrap(true);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	checkException(result <- testCodefun(), silent=TRUE)
}

###############################################################################
test.Con.Cpp.validate.from <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			Con myCon;
			Neuron MyNeuron;
			MyNeuron.setId(NA_INTEGER);
			myCon.setFromNeuron(&MyNeuron);
			myCon.setWeight(1.4);
			myCon.validate();
			return wrap(myCon.getFromId());
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	checkException(result <- testCodefun(), silent=TRUE)
}



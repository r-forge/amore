# Unit Tests for the Con C++ class methods
# 
# Author: mcasl
###############################################################################



###############################################################################
test.Con.Cpp.Constructor_fromIsEmpty <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronSharedPtr ptShNeuron ( new Neuron(1) ); 	// Neuron Id is set to 1 
			ConSharedPtr ptShCon( new Con() );  	// from points to ptShNeuron and weight is set to 0
			ptShCon->show();
			int result=ptShCon->getFromId();
			return wrap(result);
"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, NA)
}


###############################################################################
test.Con.Cpp.getFromNeuron <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronSharedPtr ptShNeuron ( new Neuron(1) ); 	// Neuron Id is set to 1 
			ConSharedPtr ptShCon( new Con(ptShNeuron) );  	// from points to ptShNeuron and weight is set to 0
			ptShNeuron = ptShCon->getFromNeuron() ;				
			int result = ptShNeuron->getId();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 1)
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.setFromNeuron <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronSharedPtr ptShNeuron ( new Neuron(1) ); 	// Neuron Id is set to 1 
			ConSharedPtr ptShCon( new Con() );  	
			ptShCon->setFromNeuron( ptShNeuron );  	
			ptShNeuron = ptShCon->getFromNeuron() ;				
			int result = ptShNeuron->getId();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 1)
	# [1] TRUE
}



###############################################################################
test.Con.Cpp.getFromId<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			NeuronSharedPtr ptShNeuron ( new Neuron(16) ); 	// Neuron Id is set to 16 
			ConSharedPtr ptShCon( new Con(ptShNeuron) );  	// from points to ptShNeuron and weight is set to 0
			int result = ptShCon->getFromId();
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 16)
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.setWeight.getWeight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			std::vector<double> result;
			NeuronSharedPtr ptShNeuron ( new Neuron(16) ); 		// Neuron Id is set to 16 
			ConSharedPtr ptShCon( new Con(ptShNeuron, 12.4) );  // from points to ptShNeuron and weight is set to 12.4		
			result.push_back(ptShCon->getWeight());
			ptShCon->setWeight(2.2);
			result.push_back(ptShCon->getWeight());
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
			NeuronSharedPtr ptShNeuron ( new Neuron(16) ); 		// Neuron Id is set to 16 
			ConSharedPtr ptShCon( new Con(ptShNeuron, 12.4) );  // from points to ptShNeuron and weight is set to 12.4		
			bool result= ptShCon->show();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkTrue(result)
	# From:	 16 	 Weight= 	 12.400000 
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.validate.weight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronSharedPtr ptShNeuron ( new Neuron(16) ); 		// Neuron Id is set to 16 
			ConSharedPtr ptShCon( new Con(ptShNeuron, 12.4/0) );  // from points to ptShNeuron and weight is set to an abnormal value.		
			ptShCon->validate();
			return wrap(true);
			"
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
			NeuronSharedPtr ptShNeuron ( new Neuron(NA_INTEGER) ); 		// Neuron Id is set to NA
			ConSharedPtr ptShCon( new Con(ptShNeuron, 12.4) );  		// from points to ptShNeuron and weight is set to 12.4		
			ptShCon->validate();
			return wrap(true);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	checkException(result <- testCodefun(), silent=TRUE)
	# [1] TRUE
}



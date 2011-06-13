# Unit Tests for the Con C++ class methods
# 
# Author: mcasl
###############################################################################



###############################################################################
test.Con.Cpp.Constructor_EmptyArgumentList <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			ConPtr conPtr( new Con() );  	// from points to ptShNeuron and weight is set to 0
			conPtr->show();
			int result=conPtr->getId();
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 		= conPtr->getId(),
										Rcpp::Named(\"weight\") 	= conPtr->getWeight()
									);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkTrue(is.na(result$Id))
	checkEquals(result$weight, 0)
	# From: NA	 Invalid Connection 
	# [1] TRUE
	# [1] TRUE
}


###############################################################################
test.Con.Cpp.Constructor_SingleArgument <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronPtr neuronPtr ( new Neuron(1) ); 	// Neuron Id is set to 1 
			ConPtr conPtr( new Con(neuronPtr) );  	// from points to ptShNeuron and weight is set to 0
			conPtr->show();
			conPtr->validate();	
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 		= conPtr->getId(),
										Rcpp::Named(\"weight\") 	= conPtr->getWeight()
									);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result$Id, 1)
	checkEquals(result$weight, 0)
	# From:	 1 	 Weight= 	 0.000000 
	# [1] TRUE
	# [1] TRUE
}



###############################################################################
test.Con.Cpp.Constructor_FullArgumentList <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronPtr neuronPtr ( new Neuron(1) ); 	// Neuron Id is set to 1 
			ConPtr conPtr( new Con(neuronPtr, 4.5) );  	// from points to ptShNeuron and weight is set to 0
			conPtr->show();
			conPtr->validate();	
			int result=conPtr->getId();
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 		= conPtr->getId(),
										Rcpp::Named(\"weight\") 	= conPtr->getWeight()
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
test.Con.Cpp.getFrom <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronPtr neuronPtr ( new Neuron(1) ); 	// Neuron Id is set to 1 
			ConPtr conPtr( new Con(neuronPtr) );  	// from points to ptShNeuron and weight is set to 0
			neuronPtr = conPtr->getFrom() ;				
			int result = neuronPtr->getId();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 1)
	# [1] TRUE
}



###############################################################################
test.Con.Cpp.getId<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			NeuronPtr neuronPtr ( new Neuron(16) ); 	// Neuron Id is set to 16 
			ConPtr conPtr( new Con(neuronPtr) );  	// from points to ptShNeuron and weight is set to 0
			int result = conPtr->getId();
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
			NeuronPtr neuronPtr ( new Neuron(16) ); 		// Neuron Id is set to 16 
			ConPtr conPtr( new Con(neuronPtr, 12.4) );  // from points to ptShNeuron and weight is set to 12.4		
			result.push_back(conPtr->getWeight());
			conPtr->setWeight(2.2);
			result.push_back(conPtr->getWeight());
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(12.4, 2.2) )
	# [1] TRUE
}


###############################################################################
test.Con.Cpp.setFrom <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronPtr neuronPtr ( new Neuron(1) ); 	// Neuron Id is set to 1 
			ConPtr conPtr( new Con() );  	
			conPtr->setFrom( neuronPtr );  	
			neuronPtr = conPtr->getFrom() ;				
			int result = neuronPtr->getId();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 1)
	# [1] TRUE
}



###############################################################################
test.Con.Cpp.show <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuronPtr neuronPtr ( new Neuron(16) ); 		// Neuron Id is set to 16 
			ConPtr conPtr( new Con(neuronPtr, 12.4) );  	// from points to ptShNeuron and weight is set to 12.4		
			conPtr->show();
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
			NeuronPtr neuronPtr ( new Neuron(16) ); 		// Neuron Id is set to 16 
			ConPtr conPtr( new Con(neuronPtr, 12.4/0) );  // from points to ptShNeuron and weight is set to an abnormal value.		
			conPtr->validate();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	checkException(result <- testCodefun(), silent=TRUE)
	# [1] TRUE
	# plus a couple of reasonable warning from the compiler concerning a division by cero
}

###############################################################################
test.Con.Cpp.validate_from <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			NeuronPtr neuronPtr ( new Neuron(NA_INTEGER) ); 		// Neuron Id is set to NA
			ConPtr conPtr( new Con(neuronPtr, 12.4) );  		// from points to ptShNeuron and weight is set to 12.4		
			conPtr->validate();
			return wrap(true);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	checkException(result <- testCodefun(), silent=TRUE)
	# [1] TRUE
}



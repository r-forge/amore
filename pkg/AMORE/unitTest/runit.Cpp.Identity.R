# Unit Tests for the Identity class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.Identity.Cpp.f0 <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new IdentityFactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(1) );
			ActivationFunctionPtr activationFunctionPtr( neuralFactoryPtr->makeActivationFunction(neuronPtr) );
			neuronPtr->setActivationFunction(activationFunctionPtr);
			double result  = activationFunctionPtr->f0();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 0)
	# [1] TRUE
	
}


###############################################################################
test.Identity.Cpp.f1 <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new IdentityFactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(2) );
			ActivationFunctionPtr activationFunctionPtr( neuralFactoryPtr->makeActivationFunction(neuronPtr) );
			neuronPtr->setActivationFunction(activationFunctionPtr);
			double result  = activationFunctionPtr->f1();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 1)
	# [1] TRUE
}



# Unit Tests for the Tanh class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.Tanh.Cpp.f0 <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			PredictBehaviorPtr predictBehaviorPtr( neuralFactoryPtr->makePredictBehavior() );
			ActivationFunctionPtr activationFunctionPtr( neuralFactoryPtr->makeTanhActivationFunction() );
			predictBehaviorPtr->setActivationFunction(activationFunctionPtr, predictBehaviorPtr);

			double result  = activationFunctionPtr->f0();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 0)
	# [1] TRUE

}


###############################################################################
test.Tanh.Cpp.f1 <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			PredictBehaviorPtr predictBehaviorPtr( neuralFactoryPtr->makePredictBehavior() );
			ActivationFunctionPtr activationFunctionPtr( neuralFactoryPtr->makeTanhActivationFunction() );
			predictBehaviorPtr->setActivationFunction(activationFunctionPtr, predictBehaviorPtr);

			double result  = activationFunctionPtr->f1();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 1)
	# [1] TRUE
}



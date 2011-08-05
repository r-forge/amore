
###############################################################################
test.NetworkRinterface.Cpp.show_UninitializedNetwork <- function() {	
###############################################################################	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NetworkRinterface networkRinterface;
			// Test
			networkRinterface.show();
			networkRinterface.validate();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	checkException(result <- testCodefun(),silent=TRUE)	
	# 
	# Uninitialized network. Please use any of the create methods available.
	# [1] TRUE
}


###############################################################################
test.NetworkRinterface.Cpp.show_InitializedNetwork <- function() {	
###############################################################################	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up			
			NetworkRinterface networkRinterface;
			// Test
			networkRinterface.createFeedForwardNetwork(numberOfNeurons, hiddenLayerFunction, outputLayerFunction);
			networkRinterface.show();
			return wrap(true);
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="numeric", hiddenLayerFunction="character", outputLayerFunction="character"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,4,3), hiddenLayerFunction="Tanh", outputLayerFunction="Identity")	
	checkTrue(result)

}



###############################################################################
test.NetworkRinterface.Cpp.createFeedForwardNetwork <- function() {	
###############################################################################	
	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
		// Data set up			
			NetworkRinterface networkRinterface;
		// Test
			networkRinterface.createFeedForwardNetwork(numberOfNeurons, hiddenLayerFunction, outputLayerFunction);
			return wrap( networkRinterface.validate() );
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="numeric", hiddenLayerFunction="character", outputLayerFunction="character"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,4,3), hiddenLayerFunction="Tanh", outputLayerFunction="Identity")	
	checkTrue(result)
	# [1] TRUE
}



###############################################################################
test.NetworkRinterface.Cpp.createCustomFeedForwardNetwork <- function() {	
###############################################################################	
	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up			
			NetworkRinterface networkRinterface;
	    	NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
	
			// Test
			Rcpp::List hiddenLayersActivationFunctionList = neuralFactoryPtr->makeXPtrFunctionList("Tanh");
			Rcpp::List outputLayerActivationFunctionsList = neuralFactoryPtr->makeXPtrFunctionList("Identity");

			
			networkRinterface.createCustomFeedForwardNetwork(numberOfNeurons, hiddenLayersActivationFunctionList, outputLayerActivationFunctionsList);
			return wrap( networkRinterface.validate() );
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="numeric", hiddenLayerFunction="character", outputLayerFunction="character"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,4,3), hiddenLayerFunction="Tanh", outputLayerFunction="Identity")	
	checkTrue(result)
	# [1] TRUE
}


###############################################################################
test.NetworkRinterface.Cpp.predict <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
		// Data set up			
			NetworkRinterface networkRinterface;
		// Test
			networkRinterface.createFeedForwardNetwork(numberOfNeurons, hiddenLayerFunction, outputLayerFunction);
			Rcpp::NumericMatrix inputMatrix (input); 
			return wrap( networkRinterface.predict(inputMatrix) );
		'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="numeric", hiddenLayerFunction="character", outputLayerFunction="character", input="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,4,3), hiddenLayerFunction="Tanh", outputLayerFunction="Identity", input=matrix(rnorm(300), ncol=150, nrow=2))	
	checkEquals(dim(result), c(3,150))
	checkEquals(sum(is.na(result)), 0)
	checkTrue(sum(abs(result>0))> 0)	
}


###############################################################################
test.NetworkRinterface.Cpp.inputSize <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up			
			NetworkRinterface networkRinterface;
			// Test
			networkRinterface.createFeedForwardNetwork(numberOfNeurons, hiddenLayerFunction, outputLayerFunction);
			return wrap(  networkRinterface.inputSize()  );
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="numeric", hiddenLayerFunction="character", outputLayerFunction="character"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,4,3), hiddenLayerFunction="Tanh", outputLayerFunction="Identity")	
	checkEquals(result,2)
	# [1] TRUE
}


###############################################################################
test.NetworkRinterface.Cpp.outputSize <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up			
			NetworkRinterface networkRinterface;
			// Test
			networkRinterface.createFeedForwardNetwork(numberOfNeurons, hiddenLayerFunction, outputLayerFunction);
			return wrap( networkRinterface.outputSize() );
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="numeric", hiddenLayerFunction="character", outputLayerFunction="character"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,4,3), hiddenLayerFunction="Tanh", outputLayerFunction="Identity")	
	checkEquals(result,3)
	# [1] TRUE
}

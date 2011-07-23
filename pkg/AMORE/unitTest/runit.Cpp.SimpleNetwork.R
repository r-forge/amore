
###############################################################################
test.SimpleNetwork.Cpp.validate <- function() {	
###############################################################################	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NeuralFactoryPtr hiddenLayersFactoryPtr (new TanhFactory()     );
			NeuralFactoryPtr outputFactoryPtr 		(new IdentityFactory()) ; 
			NeuralCreatorPtr neuralCreator( outputFactoryPtr->makeNeuralCreator() );
			NeuralNetworkPtr network = neuralCreator->createFeedForwardNetwork(as< std::vector<int> >(numberOfNeurons), *hiddenLayersFactoryPtr, *outputFactoryPtr);
			// Test
			network->validate();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,5,4,1))
	checkTrue(result)
}

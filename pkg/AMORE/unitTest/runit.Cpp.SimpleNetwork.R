
###############################################################################
test.SimpleNetwork.Cpp.validate <- function() {	
###############################################################################	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NeuralFactoryPtr hiddenLayersFactoryPtr (new TanhFactory()     );
			NeuralFactoryPtr outputFactoryPtr 		(new IdentityFactory()) ; 
			NeuralCreatorPtr neuralCreator( outputFactoryPtr->makeNeuralCreator() );
			NeuralNetworkPtr networkPtr = neuralCreator->createFeedForwardNetwork(as< std::vector<int> >(numberOfNeurons), *hiddenLayersFactoryPtr, *outputFactoryPtr);
			// Test
			bool result ( networkPtr->validate() );
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,5,4,1))
	checkTrue(result)
	# [1] TRUE
}


###############################################################################
test.SimpleNetwork.Cpp.XPtr <- function() {	
###############################################################################	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NeuralFactoryPtr hiddenLayersFactoryPtr (new TanhFactory()     );
			NeuralFactoryPtr outputFactoryPtr 		(new IdentityFactory()) ; 
			NeuralCreatorPtr neuralCreator( outputFactoryPtr->makeNeuralCreator() );
			NeuralNetworkPtr networkPtr = neuralCreator->createFeedForwardNetwork(as< std::vector<int> >(numberOfNeurons), *hiddenLayersFactoryPtr, *outputFactoryPtr);
			// Test
			networkPtr->validate();
 networkPtr.get()->show();
			Rcpp::XPtr<NeuralNetwork> resultXPtr( networkPtr.get() );

			return wrap(resultXPtr);
			"
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	networkXPtr <- testCodefun(c(2,5,4,1))
	
	testCode <- "
					Rcpp::XPtr<NeuralNetwork> networkXPtr ( RpointerToNetwork  );
					networkXPtr->show();
					return wrap(true);
				"
	testCodefun <- cfunction(sig=signature(RpointerToNetwork="externalpointer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(networkXPtr)
	
	
	
}



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
test.SimpleNetwork.Cpp.inputSize <- function() {	
###############################################################################		
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NeuralFactoryPtr hiddenLayersFactoryPtr (new TanhFactory()     );
			NeuralFactoryPtr outputFactoryPtr 		(new IdentityFactory()) ; 
			NeuralCreatorPtr neuralCreator( outputFactoryPtr->makeNeuralCreator() );
			NeuralNetworkPtr networkPtr = neuralCreator->createFeedForwardNetwork(as< std::vector<int> >(numberOfNeurons), *hiddenLayersFactoryPtr, *outputFactoryPtr);
			// Test
			int result ( networkPtr->inputSize() );
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,5,4,1))
	checkEquals(result, 2)
}



###############################################################################
test.SimpleNetwork.Cpp.outputSize <- function() {	
###############################################################################		
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NeuralFactoryPtr hiddenLayersFactoryPtr (new TanhFactory()     );
			NeuralFactoryPtr outputFactoryPtr 		(new IdentityFactory()) ; 
			NeuralCreatorPtr neuralCreator( outputFactoryPtr->makeNeuralCreator() );
			NeuralNetworkPtr networkPtr = neuralCreator->createFeedForwardNetwork(as< std::vector<int> >(numberOfNeurons), *hiddenLayersFactoryPtr, *outputFactoryPtr);
			// Test
			int result ( networkPtr->outputSize() );
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,5,4,31))
	checkEquals(result, 31)
	# [1] TRUE
}



###############################################################################
test.SimpleNetwork.Cpp.writeInput <- function() {	
###############################################################################		
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NeuralFactoryPtr hiddenLayersFactoryPtr (new TanhFactory()     );
			NeuralFactoryPtr outputFactoryPtr 		(new IdentityFactory()) ; 
			NeuralCreatorPtr neuralCreator( outputFactoryPtr->makeNeuralCreator() );
			NeuralNetworkPtr networkPtr = neuralCreator->createFeedForwardNetwork(as< std::vector<int> >(numberOfNeurons), *hiddenLayersFactoryPtr, *outputFactoryPtr);
			// Test
			Rcpp::NumericVector numericVector(inputData);
		    std::vector<double>::iterator iterator(numericVector.begin());
			networkPtr->writeInput(iterator);
			networkPtr->show();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(numberOfNeurons=c(2,5,4,31), inputData=c(1.4, 4.5) )
	checkTrue(result)
}

###############################################################################
test.SimpleNetwork.Cpp.readOutput <- function() {	
###############################################################################		
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NeuralFactoryPtr hiddenLayersFactoryPtr (new TanhFactory()     );
			NeuralFactoryPtr outputFactoryPtr 		(new IdentityFactory()) ; 
			NeuralCreatorPtr neuralCreator( outputFactoryPtr->makeNeuralCreator() );
			NeuralNetworkPtr networkPtr = neuralCreator->createFeedForwardNetwork(as< std::vector<int> >(numberOfNeurons), *hiddenLayersFactoryPtr, *outputFactoryPtr);
			// Test
			Rcpp::NumericVector inputVector(inputData);
			Rcpp::NumericVector outputVector(networkPtr->outputSize());
	
     		std::vector<double>::iterator inputIterator(inputVector.begin());
			std::vector<double>::iterator outputIterator(outputVector.begin());

			networkPtr->writeInput(inputIterator);
			networkPtr->readOutput(outputIterator);
			return wrap(outputVector);
			"
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(numberOfNeurons=c(2,5,4,31), inputData=c(1.4, 4.5) )
	checkEquals(result, rep(0, 31))
	# [1] TRUE
}



###############################################################################
test.SimpleNetwork.Cpp.singlePatternForwardAction <- function() {	
###############################################################################		
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NeuralFactoryPtr hiddenLayersFactoryPtr (new TanhFactory()     );
			NeuralFactoryPtr outputFactoryPtr 		(new IdentityFactory()) ; 
			NeuralCreatorPtr neuralCreator( outputFactoryPtr->makeNeuralCreator() );
			NeuralNetworkPtr networkPtr = neuralCreator->createFeedForwardNetwork(as< std::vector<int> >(numberOfNeurons), *hiddenLayersFactoryPtr, *outputFactoryPtr);
			// Test
			Rcpp::NumericVector inputVector(inputData);
			Rcpp::NumericVector outputVector(networkPtr->outputSize());
			
			std::vector<double>::iterator inputIterator(inputVector.begin());
			std::vector<double>::iterator outputIterator(outputVector.begin());
			
			networkPtr->writeInput(inputIterator);
			networkPtr->singlePatternForwardAction();
			networkPtr->readOutput(outputIterator);
			return wrap(outputVector);
			"
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(numberOfNeurons=c(2,5,4,31), inputData=c(1.4, 4.5) )
	checkEquals(length(result), 31)
	# [1] TRUE
}

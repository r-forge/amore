
###############################################################################
test.SimpleNeuronCreator.Cpp.createFeedForward <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			{
			// Data set up
				NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory()     );
				NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
				NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
			// Test
				networkPtr->show();
				networkPtr->validate();
				delete networkPtr;
				delete neuralCreatorPtr;
				delete neuralFactoryPtr;
			}
			return wrap(true);
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(c(2,5,4,1))
	checkTrue(result)
}


###############################################################################
test.SimpleNeuronCreator.Cpp.createCustomFeedForward <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
		{
			// Data set up
			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory()     );
			NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
			Rcpp::List hiddenLayersActivationFunctionList = neuralFactoryPtr->makeXPtrFunctionList("Tanh");
			Rcpp::List outputLayerActivationFunctionsList = neuralFactoryPtr->makeXPtrFunctionList("Identity");
			NeuralNetworkPtr networkPtr = neuralCreatorPtr->createCustomFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), hiddenLayersActivationFunctionList, outputLayerActivationFunctionsList);
			// Test
			networkPtr->show();
			networkPtr->validate();
			delete networkPtr;
			delete neuralCreatorPtr;
			delete neuralFactoryPtr;
		}
			return wrap(true);
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(c(2,5,4,1))
	checkTrue(result)
}

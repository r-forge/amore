
###############################################################################
test.SimpleNetwork.Cpp.validate <- function() {
###############################################################################

	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up
			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory()     );
			NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
			NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");

			// Test
			bool result ( networkPtr->validate() );
networkPtr->show();
			delete networkPtr;
			delete neuralCreatorPtr;
			delete neuralFactoryPtr;
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(c(2,5,4,1))
	checkTrue(result)

	# [1] TRUE
}


###############################################################################
test.SimpleNetwork.Cpp.inputSize <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up
			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );

			int result;
			{
				NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
				Rcpp::List hiddenLayersActivationFunctionList = neuralFactoryPtr->makeXPtrFunctionList("Tanh");
				Rcpp::List outputLayerActivationFunctionsList = neuralFactoryPtr->makeXPtrFunctionList("Identity");
				NeuralNetworkPtr networkPtr = neuralCreatorPtr->createCustomFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), hiddenLayersActivationFunctionList, outputLayerActivationFunctionsList);
        		    networkPtr->show();
			// Test
				result=networkPtr->inputSize();
				delete networkPtr;
				delete neuralCreatorPtr;
			}

			delete neuralFactoryPtr;
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(c(2,5,4,1))
	checkEquals(result, 2)
	# [1] TRUE
}

###############################################################################
test.SimpleNetwork.Cpp.outputSize <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up
			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
			int result;
			{
				NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
				NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
				networkPtr->show();
				// Test
				result =networkPtr->outputSize() ;
				delete networkPtr;
				delete neuralCreatorPtr;
		}

		delete neuralFactoryPtr;
		return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(c(2,5,4,31))
	checkEquals(result, 31)
	# [1] TRUE
}

###############################################################################
test.SimpleNetwork.Cpp.writeInput <- function() {
###############################################################################

suppressMessages(require("inline"))
suppressMessages(require("Rcpp"))
suppressMessages(require("RUnit"))



	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up
			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
			Rcpp::NumericVector numberOfNeuronsParams (numberOfNeurons);
			Rcpp::NumericVector outputVector(numberOfNeuronsParams[2]);
			{
				NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
				NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
				Rcpp::NumericVector inputVector(inputData);
				std::vector<double>::iterator inputIterator(inputVector.begin());
				std::vector<double>::iterator outputIterator(outputVector.begin());

				NeuronIteratorPtr inputNeuronIteratorPtr(networkPtr->getInputNeuronIterator());
				NeuronIteratorPtr outputNeuronIteratorPtr(networkPtr->getOutputNeuronIterator());

			// Test
				networkPtr->singlePatternForwardAction();
				networkPtr->readOutput(outputIterator, outputNeuronIteratorPtr);
				networkPtr->writeInput(inputIterator, inputNeuronIteratorPtr);
				networkPtr->singlePatternForwardAction();
				networkPtr->readOutput(outputIterator, outputNeuronIteratorPtr);
				delete outputNeuronIteratorPtr;
				delete inputNeuronIteratorPtr;
				delete networkPtr;
				delete neuralCreatorPtr;
		}
		delete neuralFactoryPtr;
		return wrap(outputVector);
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(numberOfNeurons=c(2,3,2), inputData=c(1.4, 4.5) )
	checkEquals(sum (result [ 1: (length(result)/2) ] !=	result [ (1 +  length(result)/2) : length(result) ] ), length(result)/2)
}


###############################################################################
test.SimpleNetwork.Cpp.writeTarget <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up
			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
			Rcpp::NumericVector numberOfNeuronsParams (numberOfNeurons);
			Rcpp::NumericVector resultVector(numberOfNeuronsParams[2]);
			{
				NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
				NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
				NeuronIteratorPtr outputNeuronIteratorPtr(networkPtr->getOutputNeuronIterator());
				// Test
				Rcpp::NumericVector targetVector(targetData);
				std::vector<double>::iterator targetIterator(targetVector.begin());
				std::vector<double>::iterator resultIterator(resultVector.begin());
				networkPtr->writeTarget(targetIterator, outputNeuronIteratorPtr);

				delete outputNeuronIteratorPtr;
				delete networkPtr;
				delete neuralCreatorPtr;
			}
			delete neuralFactoryPtr;
			return wrap(true);   //TODO improve test
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", targetData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(numberOfNeurons=c(2,3,2), targetData=c(1.4, 4.5) )
	checkTrue(result)
	# [1] TRUE
}


###############################################################################
test.SimpleNetwork.Cpp.readOutput <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up
			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
			Rcpp::NumericVector numberOfNeuronsParams (numberOfNeurons);
			Rcpp::NumericVector outputVector(numberOfNeuronsParams[2]);
			{
				NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
				NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
				// Test
				Rcpp::NumericVector inputVector(inputData);
    	 			std::vector<double>::iterator inputIterator(inputVector.begin()) ;
				std::vector<double>::iterator outputIterator(outputVector.begin());
				NeuronIteratorPtr inputNeuronIteratorPtr(networkPtr->getInputNeuronIterator());
				NeuronIteratorPtr outputNeuronIteratorPtr(networkPtr->getOutputNeuronIterator());
				networkPtr->writeInput(inputIterator, inputNeuronIteratorPtr);
				networkPtr->readOutput(outputIterator, outputNeuronIteratorPtr);
				delete outputNeuronIteratorPtr;
				delete inputNeuronIteratorPtr;
				delete networkPtr;
				delete neuralCreatorPtr;
			}
			delete neuralFactoryPtr;
			return wrap(outputVector);
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(numberOfNeurons=c(2,2,3), inputData=c(1.4, 4.5) )
	checkEquals(result, rep(0, 3))

# [1] TRUE

}



###############################################################################
test.SimpleNetwork.Cpp.singlePatternForwardAction <- function() {
###############################################################################

incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up
			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
			Rcpp::NumericVector numberOfNeuronsParams (numberOfNeurons);
			Rcpp::NumericVector outputVector(numberOfNeuronsParams[3]);
			{
				NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
				NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
				// Test
				Rcpp::NumericVector inputVector(inputData);
				std::vector<double>::iterator inputIterator(inputVector.begin());
				std::vector<double>::iterator outputIterator(outputVector.begin());
				NeuronIteratorPtr inputNeuronIteratorPtr(networkPtr->getInputNeuronIterator());
				NeuronIteratorPtr outputNeuronIteratorPtr(networkPtr->getOutputNeuronIterator());
				networkPtr->writeInput(inputIterator, inputNeuronIteratorPtr);
				networkPtr->singlePatternForwardAction();
				networkPtr->readOutput(outputIterator, outputNeuronIteratorPtr);
				delete outputNeuronIteratorPtr;
				delete inputNeuronIteratorPtr;
				delete networkPtr;
				delete neuralCreatorPtr;
			}
			delete neuralFactoryPtr;
			return wrap(outputVector);
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(numberOfNeurons=c(2,5,4,31), inputData=c(1.4, 4.5) )
	checkEquals(length(result), 31)
	# [1] TRUE
}



###############################################################################
test.SimpleNetwork.Cpp.singlePatternBackwardAction <- function() {
###############################################################################

	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
		// Data set up
				NeuralFactoryPtr neuralFactoryPtr (new ADAPTgdFactory );
				Rcpp::NumericVector numberOfNeuronsParams (numberOfNeurons);
				Rcpp::NumericVector outputVector(numberOfNeuronsParams[2]);
				{
					NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
					NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
					NetworkTrainBehaviorPtr networkTrainBehaviorPtr ( neuralFactoryPtr->makeNetworkTrainBehavior(networkPtr) );
					networkPtr->setNetworkTrainBehavior( networkTrainBehaviorPtr );
					networkPtr->setNeuronTrainBehavior( *neuralFactoryPtr );
		// Test
					Rcpp::NumericVector inputVector(inputData);
					Rcpp::NumericVector targetVector(targetData);

					std::vector<double>::iterator inputIterator(inputVector.begin());
					std::vector<double>::iterator targetIterator(targetVector.begin());
					std::vector<double>::iterator outputIterator(outputVector.begin());
				NeuronIteratorPtr inputNeuronIteratorPtr(networkPtr->getInputNeuronIterator());
				NeuronIteratorPtr outputNeuronIteratorPtr(networkPtr->getOutputNeuronIterator());

				networkPtr->writeInput(inputIterator, inputNeuronIteratorPtr);
				Rprintf(\"====================================================================================================================\");
				Rprintf(\"Write input: \");
				Rprintf(\"====================================================================================================================\");
				networkPtr->show();
				networkPtr->singlePatternForwardAction();
				Rprintf(\"====================================================================================================================\");
				Rprintf(\"Forward: \");
				Rprintf(\"====================================================================================================================\");
				networkPtr->show();
				networkPtr->singlePatternBackwardAction();
				Rprintf(\"====================================================================================================================\");
				Rprintf(\"Backward: \");
				Rprintf(\"====================================================================================================================\");
				networkPtr->show();
				networkPtr->readOutput(outputIterator, outputNeuronIteratorPtr);

				delete outputNeuronIteratorPtr;
				delete inputNeuronIteratorPtr;
				delete networkPtr;
				delete networkTrainBehaviorPtr;
				delete neuralCreatorPtr;
			}
			delete neuralFactoryPtr;
			return wrap(outputVector);
			'
	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric", targetData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(numberOfNeurons=c(2,2,2), inputData=c(1.4, 4.5), targetData=c(0.4, 0.5) )
	checkEquals(length(result), 2)

	}


###############################################################################
test.SimpleNetwork.Cpp.setNetworkTrainBehavior <- function() {
###############################################################################
		incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
		testCode <- '
				// Data set up
		            NeuralFactoryPtr neuralFactoryPtr ( new MLPNoNetworkTrainBehaviorFactory );
					Rcpp::List result;
					{
		                NeuralCreatorPtr neuralCreatorPtr ( neuralFactoryPtr->makeNeuralCreator() );
						NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
					// Test

						result["before"]= networkPtr->getNetworkTrainBehaviorName();
						neuralFactoryPtr = NeuralFactoryPtr(new ADAPTgdFactory) ;
						NetworkTrainBehaviorPtr networkTrainBehaviorPtr ( neuralFactoryPtr->makeNetworkTrainBehavior(networkPtr) );
						networkPtr->setNetworkTrainBehavior( networkTrainBehaviorPtr );
						result["after"]= networkPtr->getNetworkTrainBehaviorName();

						delete networkPtr;
						delete networkTrainBehaviorPtr;
						delete neuralCreatorPtr;
					}
					delete neuralFactoryPtr;
					return result;
		'
		testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric", targetData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
		result <- testCodefun(numberOfNeurons=c(2,2,2), inputData=c(1.4, 4.5), targetData=c(0.4, 0.5) )
		checkEquals(result$before, "MLPNoNetworkTrainBehavior"   )
		checkEquals(result$after,  "ADAPTgdNetworkTrainBehavior" )
		# [1] TRUE
		# [1] TRUE
	}


###############################################################################
test.SimpleNetwork.Cpp.setNeuronTrainBehavior <- function() {
###############################################################################
		incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
		testCode <- '
				// Data set up
				NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
				{
					NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
					NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
					// Test
					neuralFactoryPtr = NeuralFactoryPtr(new ADAPTgdFactory) ;
					NetworkTrainBehaviorPtr networkTrainBehaviorPtr ( neuralFactoryPtr->makeNetworkTrainBehavior(networkPtr) );
					networkPtr->setNetworkTrainBehavior( networkTrainBehaviorPtr );
					networkPtr->show();
					networkPtr->setNeuronTrainBehavior( *neuralFactoryPtr );
					networkPtr->show();
					delete networkPtr;
					delete networkTrainBehaviorPtr;
					delete neuralCreatorPtr;
				}
				delete neuralFactoryPtr;
				return wrap(true);
				'
		testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric", targetData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
		result <- testCodefun(numberOfNeurons=c(2,2,2), inputData=c(1.4, 4.5), targetData=c(0.4, 0.5) )
		checkTrue(result)

	}




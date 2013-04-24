


###############################################################################
test.Neuron.Cpp.getId <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
			std::vector<Handler> result;
			{
				NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(NA_INTEGER) );
				result.push_back( neuronPtr->getId() ) ;
				neuronPtr = neuralFactoryPtr->makeNeuron(12) ;
				result.push_back( neuronPtr->getId() ) ;
				delete neuronPtr;
			}
			delete neuralFactoryPtr;
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(NA, 12))
	# [1] TRUE
}


###############################################################################
test.Neuron.Cpp.setId <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
			std::vector<Handler> result;
			{
				NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(NA_INTEGER) );
				result.push_back( neuronPtr->getId() ) ;
				neuronPtr->setId(12);
				result.push_back( neuronPtr->getId() ) ;
				neuronPtr->setId(NA_INTEGER);
				result.push_back( neuronPtr->getId() ) ;
				neuronPtr->setId(35);
				result.push_back( neuronPtr->getId() ) ;
				delete neuronPtr;
			}
			delete neuralFactoryPtr;
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(NA, 12, NA, 35))
	# [1] TRUE
}


###############################################################################
test.Neuron.Cpp.Validate_IdIsNa <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			//Test
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
			{
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(NA_INTEGER) );
			neuronPtr->validate();
			delete neuronPtr;
			}
			delete neuralFactoryPtr;
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	checkException( result <- testCodefun() , silent=TRUE)
	# [1] TRUE
}


###############################################################################
test.Neuron.Cpp.Validate_EmptyCon <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			//Test
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
			int result;
			{
				NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(12) );
				neuronPtr->validate();			// An empty con does not throw exception
				result = neuronPtr->getId();
				delete neuronPtr;
			}
			delete neuralFactoryPtr;
			return wrap( result );
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 12 )
	# [1] TRUE
}


#double getInducedLocalField ();
#void setInducedLocalField (double inducedLocalField);
#double getOutput ();
#void setOutput (double output);
#double getTarget ();
#void setTarget (double target);
#double getOutputDerivative ();
#void setOutputDerivative (double outputDerivative);
#ConIteratorPtr getConIterator ();
#void addCon (ConPtr conPtr);
#void setActivationFunction (ActivationFunctionPtr activationFunctionPtr);
#void setPredictBehavior (PredictBehaviorPtr predictBehaviorPtr);
#void setNeuronTrainBehavior (NeuronTrainBehaviorPtr neuronTrainBehaviorPtr);
#std::string getNeuronTrainBehaviorName ();
#NeuralNetworkPtr getNeuralNetwork ();
#void setNeuralNetwork (NeuralNetworkPtr neuralNetworkPtr);
#double useActivationFunctionf0 ();
#double useActivationFunctionf1 ();
#void singlePatternForwardAction ();
#void singlePatternBackwardAction ();
#void show ();
#int numberOfConnections ();
#double costFunctionf0 (double output, double target);
#double costFunctionf1 (double output, double target);
#void addToBias (double value);
#void addToDelta (double value);
#void setLearningRate (double learningRate);


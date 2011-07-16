
###############################################################################
 test.Neuron.Cpp.Constructor_EmptyArgumentList <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		//Test
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->show();	
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") = neuronPtr->getId() );
	"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkTrue(is.na(result$Id))
	# 
	# ------------------------
	# 
	#  Id: NA, Invalid neuron Id
	# ------------------------
	# [1] TRUE
}

 
###############################################################################
test.Neuron.Cpp.getId <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
		// Test
			std::vector<Handler> result;
			result.push_back( neuronPtr->getId() ) ;
			neuronPtr = neuralFactoryPtr->makeNeuron() ;	
			neuronPtr->setId(12);
			result.push_back( neuronPtr->getId() ) ;			
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
			// Data set up
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
		// Test
			std::vector<Handler> result;
			result.push_back( neuronPtr->getId() ) ;
			neuronPtr->setId(12);
			result.push_back( neuronPtr->getId() ) ;			
			neuronPtr->setId(NA_INTEGER);
			result.push_back( neuronPtr->getId() ) ;			
			neuronPtr->setId(35);
			result.push_back( neuronPtr->getId() ) ;			

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
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->validate();			
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	checkException( result <- testCodefun() , silent=TRUE)
}


###############################################################################
test.Neuron.Cpp.Validate_EmptyCon <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			//Test
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(12);
			neuronPtr->validate();			// An empty con does not throw exception
			return wrap( neuronPtr->getId() );			
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 12 )
	# [1] TRUE
}

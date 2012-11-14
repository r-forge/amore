# Unit Tests for the Con C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.Con.Cpp.Constructor <- function() {	
###############################################################################	


	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- " 
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(1) );
			
			Con con( *neuronPtr , 4.5 );
			con.show();
			con.validate();	
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 	= con.Id(),
										Rcpp::Named(\"weight\") = con.getWeight()
									);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result$Id, 1)
	checkEquals(result$weight, 4.5)
	

	# From:	 1 	 Weight= 	 4.500000 
	# [1] TRUE
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.getNeuron <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(12) );
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr, 9.8) ); 
	
			return wrap(conPtr->getNeuron().getId());
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 12) 
	# [1] TRUE
}


###############################################################################
test.Con.Cpp.setNeuron <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory );
			NeuronPtr neuronPtr1( neuralFactoryPtr->makeNeuron(12) );
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr1, 9.7) ); 
	
			std::vector<double> result;
			result.push_back(conPtr->Id());
			conPtr->show();
			NeuronPtr neuronPtr2( neuralFactoryPtr->makeNeuron(21) );

			conPtr->setNeuron(*neuronPtr2);
			conPtr->show();
			result.push_back(conPtr->Id());  
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(12,21))
	# From:	 12 	 Weight= 	 9.700000 
	# From:	 21 	 Weight= 	 9.700000 
	# [1] TRUE
 }


###############################################################################
test.Con.Cpp.Id <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(9) );
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr, 8.7) ); 
	
			return wrap(conPtr->Id());
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, 9)
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.getWeight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(16) );
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr, 12.4) ); 
	
			return wrap(conPtr->getWeight());
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 12.4)
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.setWeight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory);
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(16) );
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr, 12.4) ); 
			std::vector<double> result;
			result.push_back(conPtr->getWeight());
			conPtr->setWeight(2.2);
			result.push_back(conPtr->getWeight());
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(12.4, 2.2) )
	# [1] TRUE
}


###############################################################################
test.Con.Cpp.show <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(16) );
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr, 12.4) ); 
	
			conPtr->show();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkTrue(result)
	# From:	 16 	 Weight= 	 12.400000 
	# [1] TRUE
}

###############################################################################
test.Con.Cpp.validate_weight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(16) );
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr, 12.4/0.0) ); 
		
			conPtr->validate();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	checkException(result <- testCodefun(), silent=TRUE)
	# [1] TRUE
	# plus a couple of reasonable warnings from the compiler concerning a division by cero
}

###############################################################################
test.Con.Cpp.validate_from <- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(NA_INTEGER) );
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr, 2.7) ); 
		
			conPtr->validate();
			return wrap(true);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode,
			otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(),
			cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	
	checkException(result <- testCodefun(), silent=TRUE)
	# [1] TRUE
}



# Unit Tests for the Con C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.Con.Cpp.Constructor_SingleArgument <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(1);
			
			Con con( *neuronPtr ); 
			con.show();
			con.validate();	
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 	= con.Id(),
										Rcpp::Named(\"weight\") = con.getWeight()
										);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result$Id, 1)
	checkEquals(result$weight, 0)

	# From:	 1 	 Weight= 	 0.000000 
	# [1] TRUE
	# [1] TRUE
}



###############################################################################
test.Con.Cpp.Constructor_FullArgumentList <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- " 
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(1);
	
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
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(12);
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr) ); 
	
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
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr1( neuralFactoryPtr->makeNeuron() );
			neuronPtr1->setId(12);
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr1) ); 
	
			std::vector<double> result;
			result.push_back(conPtr->Id());
			conPtr->show();
			NeuronPtr neuronPtr2( neuralFactoryPtr->makeNeuron() );
			neuronPtr2->setId(21);
			conPtr->setNeuron(*neuronPtr2);
			conPtr->show();
			result.push_back(conPtr->Id());  
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(12,21)) 
	# From:	 12 	 Weight= 	 0.000000 
	# From:	 21 	 Weight= 	 0.000000 
	# [1] TRUE
}


###############################################################################
test.Con.Cpp.Id <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(9);
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr) ); 
	
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
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(16);
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
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(16);
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
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(16);
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
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(16);
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
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(NA_INTEGER);
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



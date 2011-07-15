# Unit Tests for the MLPfactory C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.MLPfactory.Cpp.makeNeuron <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(1);
			neuronPtr->show();
			neuronPtr->validate();	
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 	= neuronPtr->getId()
			);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result$Id, 1)
	# 
	# ------------------------
	# 
	#  Id: 1
	# ------------------------
	# [1] TRUE
}


###############################################################################
test.MLPfactory.Cpp.makeCon <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(1);
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr) ); 
			conPtr->show();
			conPtr->validate();	
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 	= conPtr->Id(),
										Rcpp::Named(\"weight\") = conPtr->getWeight()
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


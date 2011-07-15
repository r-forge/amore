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
	# 
	#  bias: 0.000000
	#  output: 0.000000
	# ------------------------
	# 
	#  No connections defined
	# ------------------------
	# [1] TRUE

}


###############################################################################
test.MLPfactory.Cpp.makeCon_OneArgument <- function() {	
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


###############################################################################
test.MLPfactory.Cpp.makeCon_TwoArguments <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(1);
			ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr, 4.5) ); 
			conPtr->show();
			conPtr->validate();	
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 	= conPtr->Id(),
			Rcpp::Named(\"weight\") = conPtr->getWeight()
			);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result$Id, 1)
	checkEquals(result$weight, 4.5)
	# From:	 1 	 Weight= 	 0.000000 
	# [1] TRUE
	# [1] TRUE
}



###############################################################################
test.MLPfactory.Cpp.makeMLPbehavior <- function() {	
###############################################################################	


	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPfactory() );

			NeuronPtr neuronPtrInput1( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(1);

			NeuronPtr neuronPtrInput2( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(2);

			NeuronPtr neuronPtrInput3( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(3);

			NeuronPtr neuronPtrOutput( neuralFactoryPtr->makeNeuron() );
			neuronPtr->setId(4);

			ConContainerPtr conContainerPtr( neuralFactoryPtr->makeConContainer() );
			conContainerPtr->push_back( neuralFactoryPtr->makeCon(*neuronPtrInput1, 0.25) ); 
			conContainerPtr->push_back( neuralFactoryPtr->makeCon(*neuronPtrInput2, 0.50) ); 
			conContainerPtr->push_back( neuralFactoryPtr->makeCon(*neuronPtrInput3, 0.75) ); 

			conPtr->show();
			conPtr->validate();
	
			PredictBehaviorPtr predictBehaviorPtr( neuralFactoryPtr->makePredictBehavior() );
		
//	TODO predictBehaviorPtr->predict();

			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 	= 0.0 ,
			Rcpp::Named(\"weight\") = 0.0
			);
			"
	#	TODO predictBehaviorPtr->predict();
	
	
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result$Id, 1)
	checkEquals(result$weight, 4.5)
# Error en checkEquals(result$Id, 1) : Mean absolute difference: 1
# Error en checkEquals(result$weight, 4.5) : Mean absolute difference: 4.5
}










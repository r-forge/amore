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
			neuronPtrInput1->setId(1);	
			neuronPtrInput1->setOutput(4);

			NeuronPtr neuronPtrInput2( neuralFactoryPtr->makeNeuron() );
			neuronPtrInput2->setId(2);
			neuronPtrInput2->setOutput(2);

			NeuronPtr neuronPtrInput3( neuralFactoryPtr->makeNeuron() );
			neuronPtrInput3->setId(3);
			neuronPtrInput3->setOutput(4);

			ConContainerPtr conContainerPtr( neuralFactoryPtr->makeConContainer() );
			ConPtr conPtr(neuralFactoryPtr->makeCon(*neuronPtrInput1, 0.25));
			conContainerPtr->push_back( conPtr ); 
			conPtr = neuralFactoryPtr->makeCon(*neuronPtrInput2, 0.50);
			conContainerPtr->push_back( conPtr );  
			conPtr = neuralFactoryPtr->makeCon(*neuronPtrInput3, 0.75);
			conContainerPtr->push_back( conPtr );  

			NeuronPtr neuronPtrOutput( neuralFactoryPtr->makeNeuron() );
			neuronPtrOutput->setId(4);
			neuronPtrOutput->setPredictBehavior( neuralFactoryPtr->makePredictBehavior(conContainerPtr) );
			neuronPtrOutput->predict();
			
			neuronPtrInput1->show();
			neuronPtrInput2->show();
			neuronPtrInput3->show();
			neuronPtrOutput->show();

			return	Rcpp::List::create(	Rcpp::Named(\"outputN1\") = neuronPtrInput1->getOutput(),
										Rcpp::Named(\"outputN2\") = neuronPtrInput2->getOutput(),
										Rcpp::Named(\"outputN3\") = neuronPtrInput3->getOutput(),
										Rcpp::Named(\"outputN4\") = neuronPtrOutput->getOutput()
			);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()	
	checkEquals(result$outputN1, 4)
	checkEquals(result$outputN2, 2)
	checkEquals(result$outputN3, 4)
	checkEquals(result$outputN4, 5)
	
		
	
}










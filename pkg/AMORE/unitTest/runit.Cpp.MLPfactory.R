# Unit Tests for the MLPfactory C++ class methods
# 
# Author: mcasl
###############################################################################


require("inline")
require("Rcpp")
require("RUnit")


###############################################################################
test.MLPfactory.Cpp.makeNeuron <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(1) );
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
test.MLPfactory.Cpp.makeCon <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(1) );
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
	# From:	 1 	 Weight= 	 4.500000 
	# [1] TRUE
	# [1] TRUE
}



###############################################################################
test.MLPfactory.Cpp.makeMLPbehavior <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory );
			
			LayerPtr inputLayerPtr (neuralFactoryPtr->makeLayer());
			NeuronPtr neuronPtrInput1( neuralFactoryPtr->makeNeuron(1) );
			NeuronPtr neuronPtrInput2( neuralFactoryPtr->makeNeuron(2) );
			NeuronPtr neuronPtrInput3( neuralFactoryPtr->makeNeuron(3) );
			inputLayerPtr->push_back(neuronPtrInput1);
			inputLayerPtr->push_back(neuronPtrInput2);	
			inputLayerPtr->push_back(neuronPtrInput3);
			neuronPtrInput1->setOutput(4.0);
			neuronPtrInput2->setOutput(2.0);
			neuronPtrInput3->setOutput(4.0);
			
			LayerPtr outputLayerPtr (neuralFactoryPtr->makeLayer());
			NeuronPtr neuronPtrOutput4( neuralFactoryPtr->makeNeuron(4) );
			neuronPtrOutput4->addCon(neuralFactoryPtr->makeCon(*neuronPtrInput1, 0.25));	// These are hand-made in order to check the predict results
			neuronPtrOutput4->addCon(neuralFactoryPtr->makeCon(*neuronPtrInput2, 0.50));
			neuronPtrOutput4->addCon(neuralFactoryPtr->makeCon(*neuronPtrInput3, 0.75));
			neuronPtrOutput4->singlePatternForwardAction();

			NeuronPtr neuronPtrOutput5( neuralFactoryPtr->makeNeuron(5, inputLayerPtr->createIterator(), 11) );
			neuronPtrOutput5->singlePatternForwardAction();

			outputLayerPtr->push_back(neuronPtrOutput4);
			outputLayerPtr->push_back(neuronPtrOutput5);

			Rprintf(\"===================================\");
			Rprintf(\" Input Neurons \");
			Rprintf(\"===================================\");			
			inputLayerPtr->show();

			Rprintf(\"===================================\");
			Rprintf(\" Output Neurons \");
			Rprintf(\"===================================\");	
			outputLayerPtr->show();

			return	Rcpp::List::create(	Rcpp::Named(\"outputN1\") = neuronPtrInput1->getOutput(),
										Rcpp::Named(\"outputN2\") = neuronPtrInput2->getOutput(),
										Rcpp::Named(\"outputN3\") = neuronPtrInput3->getOutput(),
										Rcpp::Named(\"outputN4\") = neuronPtrOutput4->getOutput(),
										Rcpp::Named(\"outputN4\") = neuronPtrOutput5->getOutput()
			);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()	
	checkEquals(result$outputN1, 4)
	checkEquals(result$outputN2, 2)
	checkEquals(result$outputN3, 4)
	checkEquals(result$outputN4, tanh(5))

}










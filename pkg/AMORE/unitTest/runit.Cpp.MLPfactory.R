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
			NeuralFactoryPtr neuralFactoryPtr( new IdentityFactory() );
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
			NeuralFactoryPtr neuralFactoryPtr( new IdentityFactory() );
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
			NeuralFactoryPtr neuralFactoryPtr( new TanhFactory() );
			NeuronContainerPtr inputNeuronContainerPtr (neuralFactoryPtr->makeNeuronContainer());
			NeuronContainerPtr outputNeuronContainerPtr (neuralFactoryPtr->makeNeuronContainer());

			NeuronPtr neuronPtrInput1( neuralFactoryPtr->makeNeuron(1) );
			neuronPtrInput1->setOutput(4.0);
			inputNeuronContainerPtr->push_back(neuronPtrInput1);
			

			NeuronPtr neuronPtrInput2( neuralFactoryPtr->makeNeuron(2) );
			neuronPtrInput2->setOutput(2.0);
			inputNeuronContainerPtr->push_back(neuronPtrInput2);
			
			NeuronPtr neuronPtrInput3( neuralFactoryPtr->makeNeuron(3) );
			neuronPtrInput3->setOutput(4.0);
			inputNeuronContainerPtr->push_back(neuronPtrInput3);
			


			NeuronPtr neuronPtrOutput4( neuralFactoryPtr->makeNeuron(4) );
			neuronPtrOutput4->addCon(neuralFactoryPtr->makeCon(*neuronPtrInput1, 0.25));
			neuronPtrOutput4->addCon(neuralFactoryPtr->makeCon(*neuronPtrInput2, 0.50));
			neuronPtrOutput4->addCon(neuralFactoryPtr->makeCon(*neuronPtrInput3, 0.75));
			neuronPtrOutput4->predict();


			NeuronPtr neuronPtrOutput5( neuralFactoryPtr->makeNeuron(5, inputNeuronContainerPtr->createIterator(), 11) );
			neuronPtrOutput5->predict();


			outputNeuronContainerPtr->push_back(neuronPtrOutput4);
			outputNeuronContainerPtr->push_back(neuronPtrOutput5);


			Rprintf(\"===================================\");
			Rprintf(\" Input Neurons \");
			Rprintf(\"===================================\");			
			inputNeuronContainerPtr->show();
			Rprintf(\"===================================\");
			Rprintf(\" Output Neurons \");
			Rprintf(\"===================================\");	
			outputNeuronContainerPtr->show();

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
	# =================================== Input Neurons ===================================
	# ------------------------
	# 
	#  Id: 1
	# ------------------------
	# 
	#  bias: 0.000000
	#  output: 4.000000
	# ------------------------
	# 
	#  No connections defined
	# ------------------------
	# 
	# ------------------------
	# 
	#  Id: 2
	# ------------------------
	# 
	#  bias: 0.000000
	#  output: 2.000000
	# ------------------------
	# 
	#  No connections defined
	# ------------------------
	# 
	# ------------------------
	# 
	#  Id: 3
	# ------------------------
	# 
	#  bias: 0.000000
	#  output: 4.000000
	# ------------------------
	# 
	#  No connections defined
	# ------------------------
	# =================================== Output Neurons ===================================
	# ------------------------
	# 
	#  Id: 4
	# ------------------------
	# 
	#  bias: 0.000000
	#  output: 0.999909
	# ------------------------
	# From:	 1 	 Weight= 	 0.250000 
	# From:	 2 	 Weight= 	 0.500000 
	# From:	 3 	 Weight= 	 0.750000 
	# 
	# ------------------------
	# 
	# ------------------------
	# 
	#  Id: 5
	# ------------------------
	# 
	#  bias: -0.395620
	#  output: 0.891598
	# ------------------------
	# From:	 1 	 Weight= 	 0.521615 
	# From:	 2 	 Weight= 	 -0.279283 
	# From:	 3 	 Weight= 	 0.074348 
	# 
	# ------------------------
	# [1] TRUE
	# [1] TRUE
	# [1] TRUE
	# [1] TRUE

	
}










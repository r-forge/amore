
###############################################################################
test.ContainerIterator.Cpp.Constructor<- function() {	
###############################################################################
	


require("inline")
require("Rcpp")
require("RUnit")


	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			Container<Neuron> 	neuronContainer;
			ContainerInterface<Neuron>& neuronContainerInterface(neuronContainer);

			NeuronPtr neuronPtr;
			int ids[]= {10, 20, 30};
			foreach (int id, ids){  			// Let's create a vector with three neurons
				neuronPtr.reset( new Neuron( id ) ); 	
				neuronContainerInterface.push_back(*neuronPtr);
			}
	
			boost::shared_ptr< IteratorInterface<Neuron> > neuronIteratorInterfacePtr = neuronContainerInterface.createIterator();

			std::vector<int> result;
			for ( neuronIteratorInterfacePtr->first(); !neuronIteratorInterfacePtr->isDone(); neuronIteratorInterfacePtr->next() ) {
				result.push_back(neuronIteratorInterfacePtr->currentItem().Id());
			}
			return wrap(	result	);			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs="-Wall", cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	
	# [1] TRUE

	
	# [1] TRUE

	


	
}
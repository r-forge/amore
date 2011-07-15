
###############################################################################
test.ContainerIterator.Cpp.Constructor<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			NeuronContainerPtr containerPtr(new SimpleContainer<NeuronPtr>() );

			NeuralFactoryPtr factoryPtr( new MLPfactory() );
			NeuronPtr neuronPtr;

			int ids[]= {10, 20, 30};
			foreach (int id, ids){  			// Let's create a vector with three neurons
				NeuronPtr neuronPtr( factoryPtr->makeNeuron() );
				neuronPtr->setId(id);
				containerPtr->push_back(neuronPtr);
			}
	
			NeuronIteratorPtr itr = containerPtr->createIterator();

			std::vector<int> result;
			for ( itr->first(); !itr->isDone(); itr->next() ) {
				result.push_back(itr->currentItem()->getId());
			}
			return wrap(	result	);			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs="-Wall", cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}
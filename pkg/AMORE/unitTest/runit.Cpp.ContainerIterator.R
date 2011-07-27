
###############################################################################
test.ContainerIterator.Cpp.Constructor<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			LayerPtr containerPtr(new SimpleContainer<NeuronPtr>() );

			NeuralFactoryPtr factoryPtr( new IdentityFactory() );
			NeuronPtr neuronPtr;

			int ids[]= {10, 20, 30};
			foreach (int id, ids){  			// Let's create a vector with three neurons
				NeuronPtr neuronPtr( factoryPtr->makeNeuron(id) );
				containerPtr->push_back(neuronPtr);
			}
	
			NeuronIteratorPtr itr = containerPtr->createIterator();

			std::vector<int> result;
			for ( itr->first(); !itr->isDone(); itr->next() ) {
				result.push_back(itr->currentItem()->getId());
			}
			return wrap(	result	);
		"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs="-Wall", cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}


###############################################################################
test.ContainerIterator.Cpp.first<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			LayerPtr containerPtr(new SimpleContainer<NeuronPtr>() );
			
			NeuralFactoryPtr factoryPtr( new IdentityFactory() );
			NeuronPtr neuronPtr;
			
			int ids[]= {10, 20, 30};
			foreach (int id, ids){  			// Let's create a vector with three neurons
				NeuronPtr neuronPtr( factoryPtr->makeNeuron(id) );
				containerPtr->push_back(neuronPtr);
			}
			
			NeuronIteratorPtr itr = containerPtr->createIterator();
			itr->next();
			itr->next();
			itr->first();
			int result = itr->currentItem()->getId();
			return wrap(result);
		"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs="-Wall", cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 10)
	# [1] TRUE
}


###############################################################################
test.ContainerIterator.Cpp.next<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			LayerPtr containerPtr(new SimpleContainer<NeuronPtr>() );
			
			NeuralFactoryPtr factoryPtr( new IdentityFactory() );
			NeuronPtr neuronPtr;
			
			int ids[]= {10, 20, 30};
			foreach (int id, ids){  			// Let's create a vector with three neurons
				NeuronPtr neuronPtr( factoryPtr->makeNeuron(id) );
				containerPtr->push_back(neuronPtr);
			}
			
			NeuronIteratorPtr itr = containerPtr->createIterator();
			itr->first();
			std::vector<Handler> result;
			result.push_back( itr->currentItem()->getId() );
			itr->next();
			result.push_back( itr->currentItem()->getId() );
			itr->next();
			result.push_back( itr->currentItem()->getId() );
			return wrap(result);
		"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs="-Wall", cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}


###############################################################################
test.ContainerIterator.Cpp.isDone<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			LayerPtr containerPtr(new SimpleContainer<NeuronPtr>() );
			
			NeuralFactoryPtr factoryPtr( new IdentityFactory() );
			NeuronPtr neuronPtr;
			
			int ids[]= {10, 20, 30};
			foreach (int id, ids){  			// Let's create a vector with three neurons
				NeuronPtr neuronPtr( factoryPtr->makeNeuron(id) );
				containerPtr->push_back(neuronPtr);
			}
			
			NeuronIteratorPtr itr = containerPtr->createIterator();
			itr->first();
			std::vector<bool> result;
			result.push_back( itr->isDone() );
			itr->next();
			result.push_back( itr->isDone() );
			itr->next();
			result.push_back( itr->isDone() );
			itr->next();
			result.push_back( itr->isDone() );
			return wrap(result);
		"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs="-Wall", cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(FALSE, FALSE, FALSE, TRUE))
	# [1] TRUE
}


###############################################################################
test.ContainerIterator.Cpp.currentItem<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
BEGIN_RCPP
			// Test
			LayerPtr containerPtr(new SimpleContainer<NeuronPtr>() );
			
			NeuralFactoryPtr factoryPtr( new IdentityFactory() );
			NeuronPtr neuronPtr;
			
			int ids[]= {10, 20, 30};
			foreach (int id, ids){  			// Let's create a vector with three neurons
				NeuronPtr neuronPtr( factoryPtr->makeNeuron(id) );
				containerPtr->push_back(neuronPtr);
			}
			
			NeuronIteratorPtr itr = containerPtr->createIterator();
			itr->first();
			std::vector<Handler> result;
			result.push_back( itr->currentItem()->getId() ); // Id==10
			itr->next();
			result.push_back( itr->currentItem()->getId() ); // Id==20
			itr->next();
			result.push_back( itr->currentItem()->getId() ); // Id==30
			itr->next();
			result.push_back( itr->currentItem()->getId() ); // Error: IteratorOutOfBounds
			return wrap(result);
END_RCPP

			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs="-Wall", cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	checkException( result <- testCodefun() )
}






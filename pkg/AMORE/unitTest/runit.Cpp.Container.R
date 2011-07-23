# Unit Tests for the Container C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.Container.Cpp.Constructor_EmptyArgumentList<- function() {	
###############################################################################

	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			ConContainerPtr conContainerPtr( new SimpleContainer<ConPtr> () );
			conContainerPtr->validate();		
			return wrap(conContainerPtr->size());			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs="-Wall", cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 0)
	# [1] TRUE

}



###############################################################################
test.Container.Cpp.show<- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			NeuralFactoryPtr neuralFactoryPtr( new IdentityFactory() );
			LayerPtr layerPtr ( neuralFactoryPtr->makeLayer() );

			int ids[]= {10, 20, 30};
			NeuronPtr neuronPtr;
			foreach (Handler id, ids) {
				neuronPtr = neuralFactoryPtr->makeNeuron(id) ;
 				layerPtr->push_back(neuronPtr) ;			
			}	
			double weights[] = {1.13, 2.22, 3.33 };
			ConContainerPtr conContainerPtr( neuralFactoryPtr->makeConContainer() );
			ConPtr conPtr;
			int wId=0;
			NeuronIteratorPtr itr( layerPtr->createIterator() ) ;
			for ( itr->first(); !itr->isDone(); itr->next() ) {
				conPtr = neuralFactoryPtr->makeCon( *itr->currentItem() , weights[wId++]) ;
				conContainerPtr->push_back( conPtr );
			}
		// Test	
			conContainerPtr->show();

			std::vector<Handler> result;
			ConIteratorPtr conItr( conContainerPtr->createIterator() );
			for ( conItr->first(); !conItr->isDone(); conItr->next() ) {
				result.push_back( conItr->currentItem()->Id() );
			}
			return wrap(	result	);		
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10, 20, 30))
# From:	 10 	 Weight= 	 1.130000 
# From:	 20 	 Weight= 	 2.220000 
# From:	 30 	 Weight= 	 3.330000 
# [1] TRUE
}


###############################################################################
test.Container.Cpp.push_back<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
				
				NeuralFactoryPtr neuralFactoryPtr( new IdentityFactory() );
				NeuronContainerPtr layerPtr ( neuralFactoryPtr->makeLayer() );
				ConContainerPtr conContainerPtr ( neuralFactoryPtr->makeConContainer() );
				ConPtr	conPtr;
				NeuronPtr neuronPtr;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
			// Test
				foreach (int id, ids){  			// Let's create a vector with three neurons
					neuronPtr = neuralFactoryPtr->makeNeuron(id) ;
					layerPtr->push_back(neuronPtr);
				}

				int wId=0;

				NeuronIteratorPtr itr( layerPtr->createIterator() ) ;
				for ( itr->first(); !itr->isDone(); itr->next() ) {
					conPtr = neuralFactoryPtr->makeCon( *itr->currentItem() , weights[wId++]) ;
					conContainerPtr->push_back( conPtr );
				}
				std::vector<Handler> result;
				
				ConIteratorPtr conItr( conContainerPtr->createIterator() );
				for ( conItr->first(); !conItr->isDone(); conItr->next() ) {
					result.push_back( conItr->currentItem()->Id() );
				}
				return wrap(	result	);	
				"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}


###############################################################################
test.Container.Cpp.size<- function() {	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
				NeuralFactoryPtr neuralFactoryPtr( new IdentityFactory() );
				NeuronContainerPtr layerPtr ( neuralFactoryPtr->makeLayer() );
				NeuronPtr neuronPtr;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
			// Test
				foreach (int id, ids){  			// Let's create a vector with three neurons
					neuronPtr = neuralFactoryPtr->makeNeuron(id) ;
					layerPtr->push_back(neuronPtr);
				}
					
				ConContainerPtr conContainerPtr ( neuralFactoryPtr->makeConContainer() );
				ConPtr	conPtr;
				int wId=0;
				std::vector<size_type> result;				
				NeuronIteratorPtr itr( layerPtr->createIterator() ) ;
				for ( itr->first(); !itr->isDone(); itr->next() ) {
					conPtr = neuralFactoryPtr->makeCon( *itr->currentItem() , weights[wId++]) ;
					conContainerPtr->push_back( conPtr );
					result.push_back(conContainerPtr->size());
				}

				return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(1,2,3))
	# [1] TRUE
}
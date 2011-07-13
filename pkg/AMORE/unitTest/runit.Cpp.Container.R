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
			Container<Con> conContainer;
			ContainerInterface<Con>* containerPtr (& conContainer);
			containerPtr->validate();		
			return wrap(containerPtr->size());			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs="-Wall", cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 0)

}



###############################################################################
test.Container.Cpp.show<- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up

			Container<Neuron> 	neuronContainer;
			ContainerInterface<Neuron>& neuronContainerInterface(neuronContainer);

			NeuronPtr neuronPtr;
			int ids[]= {10, 20, 30};
			foreach (int id, ids){  			// Let's create a vector with three neurons
				neuronPtr.reset( new Neuron( id ) ); 	
				neuronContainerInterface.push_back(*neuronPtr);
			}
			neuronContainerInterface.show() ;		
	
			double weights[] = {1.13, 2.22, 3.33 };
			Container<Con> 		conContainer;
			ContainerInterface<Con>& conContainerInterface(conContainer);
			
			ConPtr conPtr;
			boost::shared_ptr< IteratorInterface<Neuron> > neuronIteratorInterfacePtr = neuronContainerInterface.createIterator();
			for ( neuronIteratorInterfacePtr->first(); !neuronIteratorInterfacePtr->isDone(); neuronIteratorInterfacePtr->next() ) {
				conPtr.reset( new Con(neuronIteratorInterface->current(), ) );
				result.push_back( conPtr );
			}
			
			

			std::vector<int> result;

			boost::shared_ptr< IteratorInterface<Con> > conIteratorInterfacePtr = conContainerInterface.createIterator();
			for ( conIteratorInterfacePtr->first(); !conIteratorInterfacePtr->isDone(); conIteratorInterfacePtr->next() ) {
				result.push_back( conIteratorInterfacePtr->currentItem().Id() );
			}
			return wrap(	result	);		
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10, 20, 30))

	
	
}


###############################################################################
test.Container.Cpp.push_back<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
				std::vector<int> result;
				NeuronContainerPtr	ptNeuronContainer( new Container<Neuron>() );
				ConContainerPtr	conContainerPtr( new Container<Con>() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
			// Test
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptNeuronContainer->push_back(ptN);
				}

				int i=0;
				foreach ( NeuronPtr itr , *ptNeuronContainer ) {			// and a vector with three connections
					ptC.reset( new Con( itr, weights[i++]) );  	
					conContainerPtr->push_back(ptC);	
				}

				foreach ( ConPtr itr , *conContainerPtr ) {			// and a vector with three connections
					result.push_back( itr->getId() ); 			// Container does not have getId defined	
				}

				return wrap(result);
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
				std::vector<int> result;
				NeuronContainerPtr	ptNeuronContainer( new Container<Neuron>() );
				ConContainerPtr	conContainerPtr( new Container<Con>() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
			// Test
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptNeuronContainer->push_back(ptN);
				}

				int i=0;
				foreach ( NeuronPtr itr , *ptNeuronContainer ) {			// and a vector with three connections
					ptC.reset( new Con( itr, weights[i++]) );  	
					conContainerPtr->push_back(ptC);	
					result.push_back(conContainerPtr->size());
				}			 
				return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(1,2,3))
	# [1] TRUE
}
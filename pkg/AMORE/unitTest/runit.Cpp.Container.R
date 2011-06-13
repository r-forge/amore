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
			Container<Con> MyContainer;
			MyContainer.validate();		
			return wrap(MyContainer.size());
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 0)
}



###############################################################################
test.Container.Cpp.Constructor_collectionAsArgument<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
				NeuronContainerPtr	ptNeuronContainer( new Container<Neuron>() );
				ConContainerPtr		conContainerPtr( new Container<Con>() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptNeuronContainer->push_back(ptN);
				}

				int i=0;
				foreach ( NeuronPtr itr , *ptNeuronContainer ) {			// and a vector with three connections
					ptC.reset( new Con( itr, weights[i++]) );  	
					conContainerPtr->push_back(ptC);	
				}

			// Test
				Container<Con> AuxContainer( conContainerPtr->begin(), conContainerPtr->end() );		// Constructor from a std::vector<ConPtr> object
				std::vector<int> result;
				foreach(ConPtr itr, AuxContainer){
					result.push_back( itr->getId() );
				}
				return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10, 20, 30))
	# [1] TRUE
}


###############################################################################
test.Container.Cpp.validate.show<- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			NeuronContainerPtr	ptNeuronContainer( new Container<Neuron>() );
			ConContainerPtr	conContainerPtr( new Container<Con>() );
			ConPtr	ptC;
			NeuronPtr ptN;
			int ids[]= {10, 20, 30};
			double weights[] = {1.13, 2.22, 3.33 };
			foreach (int id, ids){  			// Let's create a vector with three neurons
				ptN.reset( new Neuron( id ) ); 	
				ptNeuronContainer->push_back(ptN);
			}
			int i=0;
			foreach ( NeuronPtr itr , *ptNeuronContainer ) {			// and a vector with three connections
				ptC.reset( new Con( itr, weights[i++]) );  	
				conContainerPtr->push_back(ptC);	
			}

		// Test
			conContainerPtr->show() ;
			conContainerPtr->validate();		
			return wrap(1);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 1)
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
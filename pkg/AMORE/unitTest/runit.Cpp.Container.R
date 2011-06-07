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
	# [1] TRUE
}



###############################################################################
test.Container.Cpp.Constructor_collectionAsArgument<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
				ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
				ContainerConPtr		ptShvCon( new Container<Con>() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptShvNeuron->push_back(ptN);
				}

				int i=0;
				foreach ( NeuronPtr itr , *ptShvNeuron ) {			// and a vector with three connections
					ptC.reset( new Con( itr, weights[i++]) );  	
					ptShvCon->push_back(ptC);	
				}

			// Test
				Container<Con> AuxContainer( ptShvCon->load() );		// Constructor from a std::vector<ConPtr> object
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
			ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
			ContainerConPtr	ptShvCon( new Container<Con>() );
			ConPtr	ptC;
			NeuronPtr ptN;
			int ids[]= {10, 20, 30};
			double weights[] = {1.13, 2.22, 3.33 };
			foreach (int id, ids){  			// Let's create a vector with three neurons
				ptN.reset( new Neuron( id ) ); 	
				ptShvNeuron->push_back(ptN);
			}
			int i=0;
			foreach ( NeuronPtr itr , *ptShvNeuron ) {			// and a vector with three connections
				ptC.reset( new Con( itr, weights[i++]) );  	
				ptShvCon->push_back(ptC);	
			}

		// Test
			ptShvCon->show() ;
			ptShvCon->validate();		
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
				ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
				ContainerConPtr	ptShvCon( new Container<Con>() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
			// Test
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptShvNeuron->push_back(ptN);
				}

				int i=0;
				foreach ( NeuronPtr itr , *ptShvNeuron ) {			// and a vector with three connections
					ptC.reset( new Con( itr, weights[i++]) );  	
					ptShvCon->push_back(ptC);	
				}

				foreach ( ConPtr itr , *ptShvCon ) {			// and a vector with three connections
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
				ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
				ContainerConPtr	ptShvCon( new Container<Con>() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
			// Test
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptShvNeuron->push_back(ptN);
				}

				int i=0;
				foreach ( NeuronPtr itr , *ptShvNeuron ) {			// and a vector with three connections
					ptC.reset( new Con( itr, weights[i++]) );  	
					ptShvCon->push_back(ptC);	
					result.push_back(ptShvCon->size());
				}			 
				return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(1,2,3))
	# [1] TRUE
}



###############################################################################
test.Container.Cpp.store.load<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
				std::vector<int> result;
				std::vector<ConPtr> vcA, vcB;
				ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
				ContainerConPtr	ptShvCon( new Container<Con>() );
				ConPtr	ptC;
				NeuronPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptShvNeuron->push_back(ptN);
				}

				int i=0;
				foreach( NeuronPtr itr, *ptShvNeuron) {				// and a vector with three connections
					ptC.reset( new Con( itr , weights[i++]) );  	
					vcA.push_back(ptC);			 
				}			 
	// Test
			ptShvCon->store(vcA);
			vcB = ptShvCon->load();
			for (int i=0; i<=2 ; i++) {					// get Ids. Container does not have getId defined
					result.push_back( vcB.at(i)->getId());
			}
		
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}


################################################################################
test.Container.Cpp.append<- function() {	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
				std::vector<int> 	result;
				std::vector<ConPtr>	vcA, vcB;
				ContainerNeuronPtr	ptShvNeuron(new Container<Neuron>() );
				ContainerConPtr		ptShvConA(	new Container<Con>() );
				ContainerConPtr		ptShvConB(	new Container<Con>() );
				ConPtr				ptC;
				NeuronPtr 			ptN;
				int ids[]= {1, 2, 3, 4, 5, 6};
				double weights[] = {1.13, 2.22, 3.33, 5.6, 4.2, 3.6 };
	
				foreach (int id, ids){  			// Let's create a vector with three neurons
					ptN.reset( new Neuron( id ) ); 	
					ptShvNeuron->push_back(ptN);
				}
	
				for (int i=0; i<=2 ; i++) {				// A vector with three connections
					ptC.reset( new Con( ptShvNeuron->load().at(i), weights[i]) );  	
					ptShvConA->push_back(ptC);			 
				}			 

				for (int i=3; i<=5 ; i++) {				// Another vector with three connections
					ptC.reset( new Con( ptShvNeuron->load().at(i), weights[i]) );  	
					ptShvConB->push_back(ptC);			 
				}			 
	// Test
				ptShvConA->append(*ptShvConB);
				ptShvConA->validate();		
				ptShvConA->show() ;

				foreach (ConPtr itr, ptShvConA->load()){  // Get Ids (Container does not know about VecCon::getId yet, thus the loop)	
					 result.push_back( itr->getId() );		
				}
				return wrap(result);
		"
testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
result <- testCodefun()
checkEquals(result, c(1,2,3,4,5,6))
# From:	 1 	 Weight= 	 1.130000 
# From:	 2 	 Weight= 	 2.220000 
# From:	 3 	 Weight= 	 3.330000 
# From:	 4 	 Weight= 	 5.600000 
# From:	 5 	 Weight= 	 4.200000 
# From:	 6 	 Weight= 	 3.600000 
# [1] TRUE
}

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
			conContainer.validate();		
			return wrap(conContainer.size());
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 0)
	# [1] TRUE

}



###############################################################################
test.Container.Cpp.Constructor_IteratorsAsArgument<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
				Container<Neuron>	neuronContainer;
				Container<Con>		conContainer;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				foreach (int id, ids){  			// Let's create a vector with three neurons 	
					neuronContainer.push_back( *new Neuron( id ) );
				}

				int i=0; 
				boost::shared_ptr<Con> conPtr;
				foreach ( Neuron itrNeuron , neuronContainer ) {			// and a vector with three connections 	
				//	conPtr.reset(new Con( itrNeuron, weights[i++]));
					conContainer.push_back(	*new Con( itrNeuron, weights[i++]));	
				}

				return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10, 20, 30))
	# Error en checkEquals(result, c(10, 20, 30)) : Modes: logical, numeric
	# Lengths: 1, 3
	# target is logical, current is numeric

	# [1] TRUE
}


###############################################################################
test.Container.Cpp.BuildAppend_ConContainer_NeuronAndWeight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<int> result;
			NeuronContainer neuronContainer;
			ConContainerPtr	conContainerPtr( new ConContainer() );
			NeuronPtr neuronPtr;
			int ids[]= {10, 20, 30};
			std::vector<double> nWeights;
			nWeights.push_back(12.3);
			nWeights.push_back(1.2);
			nWeights.push_back(2.1);
			for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
			neuronPtr.reset( new Neuron( ids[i] ) ); 	
			neuronContainer.push_back(neuronPtr);
			}
	// Test			
			conContainerPtr->buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );			 
			foreach(ConPtr itrCon, conContainer ){
				result.push_back(itrCon.Id());
			}
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c( 10, 20, 30))
	# [1] TRUE
}


###############################################################################
test.Container.Cpp.BuildAppend_ConContainer_noWeights <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<int> result;
			NeuronContainer neuronContainer;
			ConContainerPtr	conContainerPtr( new ConContainer() );
			NeuronPtr neuronPtr;
			int ids[]= {10, 20, 30};
			for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
				neuronPtr.reset( new Neuron( ids[i] ) ); 	
				neuronContainer.push_back(neuronPtr);
			}
			// Test			
			conContainerPtr->buildAndAppend(neuronContainer.begin(), neuronContainer.end() );			 
			foreach(ConPtr itrCon, *conContainerPtr ){
				result.push_back(itrCon->getId());
			}
			conContainerPtr->show();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c( 10, 20, 30))
	# From:	 10 	 Weight= 	 0.000000 
	# From:	 20 	 Weight= 	 0.000000 
	# From:	 30 	 Weight= 	 0.000000 
	# [1] TRUE
}



###############################################################################
test.Container.Cpp.BuildAppend_NeuronContainer_ <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<int> result;
			NeuronContainer neuronContainer;
			ConContainerPtr	conContainerPtr( new ConContainer() );
			NeuronPtr neuronPtr;
			int idsFirst[]= {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
			int idsSecond[]={11, 12, 13, 14, 15, 16, 17, 18, 19, 20};
			std::vector<int> nIds(idsFirst, idsFirst + sizeof(idsFirst)/sizeof(idsFirst[0]) );
			neuronContainer.buildAndAppend(nIds.begin(), nIds.end(), conContainerPtr->begin(), conContainerPtr->end());			
		//	conContainerPtr->buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );			 
			foreach(NeuronPtr itrNeuron, neuronContainer){
				result.push_back(itrNeuron->getId());
			}
			nIds.clear();
			for (int i=0; i<10; ++i){
				nIds.push_back(idsSecond[i]);
			}
			double weights[] = {0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0};
			std::vector<double> nWeights(weights, weights + sizeof(weights)/sizeof(weights[0]) );
			conContainerPtr->buildAndAppend(neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
			neuronContainer.buildAndAppend(nIds.begin(), nIds.end(), conContainerPtr->begin(), conContainerPtr->end());			
			neuronContainer.show();
			foreach(NeuronPtr itrNeuron, neuronContainer){
				result.push_back(itrNeuron->getId());
			}
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20))
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
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
			int result;
			{
				ConContainerPtr conContainerPtr( new SimpleContainer<ConPtr> () );
				conContainerPtr->validate();
				result = conContainerPtr->size();
				delete conContainerPtr;
			}
			return wrap( result );			"
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
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory );

			LayerPtr layerPtr ( neuralFactoryPtr->makeLayer() );
			{
				Rcpp::IntegerVector ids(Ids);
				NeuronPtr neuronPtr;
				for ( Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){
					neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
					layerPtr->push_back(neuronPtr);
				}
			}		// neuronPtr is not deleted, layerPtr is accountable for deleting the neurons.

			ConContainerPtr conContainerPtr( neuralFactoryPtr->makeConContainer() );
			{
				ConPtr conPtr;
				Rcpp::NumericVector weights(Weights);
				Rcpp::NumericVector::iterator wItr = weights.begin();
				NeuronIteratorPtr itr( layerPtr->createIterator() ) ;
				for ( itr->first(); !itr->isDone(); itr->next() ) {
					conPtr = neuralFactoryPtr->makeCon( itr->currentItem() , *(wItr++) ) ;
					conContainerPtr->push_back( conPtr );
				}
				delete itr;
			}

		// Test
			std::vector<Handler> result;
			conContainerPtr->show();
			{
				ConIteratorPtr conItr( conContainerPtr->createIterator() );
				for ( conItr->first(); !conItr->isDone(); conItr->next() ) {
					result.push_back( conItr->currentItem()->Id() );
				}
				delete conItr;
			}

			delete conContainerPtr;
			delete layerPtr;
			delete neuralFactoryPtr;
			return wrap(	result	);
			"
	testCodefun <- cfunction(sig=signature(Ids="integer", Weights="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(Ids= c(10,20,30), Weights=c(1.5, 4.6, 8.6))
	checkEquals(result, c(10,20,30))

	# 
	# From:	 10 	 Weight= 	 1.500000
	# From:	 20 	 Weight= 	 4.600000
	# From:	 30 	 Weight= 	 8.600000[1] TRUE


	# From:	 10 	 Weight= 	 1.500000
	# From:	 20 	 Weight= 	 4.600000
	# From:	 30 	 Weight= 	 8.600000 [1] TRUE

}


###############################################################################
test.Container.Cpp.push_back<- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
				NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory );

				LayerPtr layerPtr ( neuralFactoryPtr->makeLayer() );
				{
					NeuronPtr neuronPtr;
					Rcpp::IntegerVector ids(Ids);
					for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){
						neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
						layerPtr->push_back(neuronPtr);
					}
				}


				ConContainerPtr conContainerPtr ( neuralFactoryPtr->makeConContainer() );
				{
					ConPtr	conPtr;
					Rcpp::NumericVector weights(Weights);
					Rcpp::NumericVector::iterator wItr = weights.begin();
					NeuronIteratorPtr itr( layerPtr->createIterator() ) ;
					for ( itr->first(); !itr->isDone(); itr->next() ) {
						conPtr = neuralFactoryPtr->makeCon( itr->currentItem() , *(wItr++) ) ;
						conContainerPtr->push_back( conPtr );
					}
					delete itr;
				}


				std::vector<Handler> result;
				{
					ConIteratorPtr conItr( conContainerPtr->createIterator() );
					for ( conItr->first(); !conItr->isDone(); conItr->next() ) {
						result.push_back( conItr->currentItem()->Id() );
					}
					delete conItr;
				}

				delete conContainerPtr;	conContainerPtr=NULL;
				delete layerPtr;					layerPtr=NULL;
				delete neuralFactoryPtr; 	neuralFactoryPtr=NULL;
				return wrap(	result	);
				"
	testCodefun <- cfunction(sig=signature(Ids="integer", Weights="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(Ids= c(10,20,30), Weights=c(1.5, 4.6, 8.6))
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}


###############################################################################
test.Container.Cpp.size<- function() {
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
				NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory );

				LayerPtr layerPtr ( neuralFactoryPtr->makeLayer() );
				{
					NeuronPtr neuronPtr;
					Rcpp::IntegerVector ids(Ids);
					for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){
						neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
						layerPtr->push_back(neuronPtr);
					}
				}


				std::vector<size_type> result;
				ConContainerPtr conContainerPtr ( neuralFactoryPtr->makeConContainer() );
				{
					ConPtr	conPtr;
					Rcpp::NumericVector weights(Weights);
					Rcpp::NumericVector::iterator wItr = weights.begin();
					NeuronIteratorPtr itr( layerPtr->createIterator() ) ;
					for ( itr->first(); !itr->isDone(); itr->next() ) {
						conPtr = neuralFactoryPtr->makeCon( itr->currentItem() , *(wItr++) ) ;
						conContainerPtr->push_back( conPtr );
						result.push_back(conContainerPtr->size());
					}
					delete itr;
				}

				delete conContainerPtr;			conContainerPtr=NULL;
				delete layerPtr;							layerPtr=NULL;
				delete neuralFactoryPtr;			neuralFactoryPtr=NULL;
				return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(Ids="integer", Weights="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(Ids= c(1,2,3), Weights=c(1.5, 4.6, 8.6))
	checkEquals(result, c(1,2,3))
	# [1] TRUE
}
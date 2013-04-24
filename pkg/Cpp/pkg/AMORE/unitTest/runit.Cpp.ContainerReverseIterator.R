
###############################################################################
test.ContainerReverseIterator.Cpp.Constructor<- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );

			LayerPtr layerPtr ( neuralFactoryPtr->makeLayer() );
			{
				NeuronPtr neuronPtr;
				Rcpp::IntegerVector ids(Ids);
				for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){
					neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
					layerPtr->push_back(neuronPtr);
				}
			}

			std::vector<int> result;
			{
				NeuronIteratorPtr itr = layerPtr->createReverseIterator();
				for ( itr->first(); !itr->isDone(); itr->next() ) {
					result.push_back(itr->currentItem()->getId());
				}
				delete itr;
			}
			delete layerPtr;
			delete neuralFactoryPtr;
			return wrap(	result	);
			"
	testCodefun <- cfunction(sig=signature(Ids="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(Ids= c(10,20,30))
	checkEquals(result, c(30,20,10))
	# [1] TRUE

}


###############################################################################
test.ContainerReverseIterator.Cpp.first<- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );

			LayerPtr layerPtr ( neuralFactoryPtr->makeLayer() );
			{
				NeuronPtr neuronPtr;
				Rcpp::IntegerVector ids(Ids);
				for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){
					neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
					layerPtr->push_back(neuronPtr);
				}
			}

			int result;
			{
				NeuronIteratorPtr itr = layerPtr->createReverseIterator();
				itr->next();
				itr->next();
				itr->first();
				result = itr->currentItem()->getId();
				delete itr;
			}

			delete layerPtr;
			delete neuralFactoryPtr;
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(Ids="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(Ids= c(10,20,30))
	checkEquals(result, 30)
	# [1] TRUE
}


###############################################################################
test.ContainerReverseIterator.Cpp.next<- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
			LayerPtr layerPtr ( neuralFactoryPtr->makeLayer() );
			{
				NeuronPtr neuronPtr;
				Rcpp::IntegerVector ids(Ids);
				for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){
					neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
					layerPtr->push_back(neuronPtr);
				}
			}

	std::vector<Handler> result;
			{
				NeuronIteratorPtr itr = layerPtr->createReverseIterator();
				itr->first();
				result.push_back( itr->currentItem()->getId() );
				itr->next();
				result.push_back( itr->currentItem()->getId() );
				itr->next();
				result.push_back( itr->currentItem()->getId() );
				delete itr;
			}

			delete layerPtr;
			delete neuralFactoryPtr;
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(Ids="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(Ids= c(10,20,30))
	checkEquals(result, c(30,20,10))
	# [1] TRUE
}


###############################################################################
test.ContainerReverseIterator.Cpp.isDone<- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );

			LayerPtr layerPtr ( neuralFactoryPtr->makeLayer() );
			{
				NeuronPtr neuronPtr;
				Rcpp::IntegerVector ids(Ids);
				for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){
					neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
					layerPtr->push_back(neuronPtr);
				}
			}

			std::vector<bool> result;
			{
				NeuronIteratorPtr itr = layerPtr->createReverseIterator();
				itr->first();
				result.push_back( itr->isDone() );
				itr->next();
				result.push_back( itr->isDone() );
				itr->next();
				result.push_back( itr->isDone() );
				itr->next();
				result.push_back( itr->isDone() );
				delete itr;
			}

			delete layerPtr;
			delete neuralFactoryPtr;
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(Ids="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun(Ids= c(10,20,30))
	checkEquals(result, c(FALSE, FALSE, FALSE, TRUE))
	# [1] TRUE
}


###############################################################################
test.ContainerReverseIterator.Cpp.currentItem<- function() {
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			BEGIN_RCPP
			// Test
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );

			LayerPtr layerPtr ( neuralFactoryPtr->makeLayer() );
			{
				NeuronPtr neuronPtr;
				Rcpp::IntegerVector ids(Ids);
				for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){
					neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
					layerPtr->push_back(neuronPtr);
				}
			}

			std::vector<Handler> result;
			{
				NeuronIteratorPtr itr = layerPtr->createReverseIterator();
				itr->first();
				result.push_back( itr->currentItem()->getId() ); // Id==10
				itr->next();
				result.push_back( itr->currentItem()->getId() ); // Id==20
				itr->next();
				result.push_back( itr->currentItem()->getId() ); // Id==30
				itr->next();
				result.push_back( itr->currentItem()->getId() ); // Error: IteratorOutOfBounds
				delete itr;
			}

			delete layerPtr;
			delete neuralFactoryPtr;
			return wrap(result);
			END_RCPP
			"
	testCodefun <- cfunction(sig=signature(Ids="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	checkException( result <- testCodefun(Ids= c(10,20,30)) , silent=TRUE)
	# [1] TRUE
}


###############################################################################
test.ContainerReverseIterator.Cpp.Constructor<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Test
			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
			LayerPtr layerPtr ( neuralFactoryPtr->makeLayer() );
			NeuronPtr neuronPtr;
			Rcpp::IntegerVector ids(Ids);
			for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){  
			neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
			layerPtr->push_back(neuronPtr);
			}
			NeuronIteratorPtr itr = layerPtr->createReverseIterator();
			std::vector<int> result;
			for ( itr->first(); !itr->isDone(); itr->next() ) {
			result.push_back(itr->currentItem()->getId());
			}
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
			NeuronPtr neuronPtr;
			Rcpp::IntegerVector ids(Ids);
			for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){  
			neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
			layerPtr->push_back(neuronPtr);
			}
			NeuronIteratorPtr itr = layerPtr->createReverseIterator();
			itr->next();
			itr->next();
			itr->first();
			int result = itr->currentItem()->getId();
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
			NeuronPtr neuronPtr;
			Rcpp::IntegerVector ids(Ids);
			for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){  
			neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
			layerPtr->push_back(neuronPtr);
			}
			NeuronIteratorPtr itr = layerPtr->createReverseIterator();
			itr->first();
			std::vector<Handler> result;
			result.push_back( itr->currentItem()->getId() );
			itr->next();
			result.push_back( itr->currentItem()->getId() );
			itr->next();
			result.push_back( itr->currentItem()->getId() );
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
			NeuronPtr neuronPtr;
			Rcpp::IntegerVector ids(Ids);
			for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){  
				neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
				layerPtr->push_back(neuronPtr);
			}
			NeuronIteratorPtr itr = layerPtr->createReverseIterator();
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
			NeuronPtr neuronPtr;
			Rcpp::IntegerVector ids(Ids);
			for (Rcpp::IntegerVector::iterator idItr = ids.begin() ; idItr!=ids.end();  ++idItr){  
			neuronPtr = neuralFactoryPtr->makeNeuron(*idItr) ;
			layerPtr->push_back(neuronPtr);
			}
			NeuronIteratorPtr itr = layerPtr->createReverseIterator();
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
	testCodefun <- cfunction(sig=signature(Ids="integer"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	checkException( result <- testCodefun(Ids= c(10,20,30)) , silent=TRUE)
	# [1] TRUE
}






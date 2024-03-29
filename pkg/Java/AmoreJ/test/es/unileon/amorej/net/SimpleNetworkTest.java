package es.unileon.amorej.net;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;

import es.unileon.amorej.AmoreJException;
import es.unileon.amorej.MLPNoNetworkTrainBehaviorFactory;
import es.unileon.amorej.NeuralFactory;

public class SimpleNetworkTest {

	@Test
	public void testValidate() throws AmoreJException {
					NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
					NeuralCreator neuralCreator = neuralFactory.makeNeuralCreator();
					List<Integer> numberOfNeurons = new ArrayList<Integer>( Arrays.asList(2, 5, 4, 1) );
					NeuralNetwork network = neuralCreator.createFeedForwardNetwork(neuralFactory, numberOfNeurons);
					network.show();
					assertTrue(network.validate());
	}

	@Test
	public void testInputSize() throws AmoreJException{
					NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
					NeuralCreator neuralCreator = neuralFactory.makeNeuralCreator();
					List<Integer> numberOfNeurons = new ArrayList<Integer>( Arrays.asList(2, 5, 4, 1) );
					SimpleNetwork network = (SimpleNetwork) neuralCreator.createFeedForwardNetwork(neuralFactory, numberOfNeurons);
					assertEquals(network.inputSize(),2);
	}

	@Test
	public void testOutputSize() throws AmoreJException{
					NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
					NeuralCreator neuralCreator = neuralFactory.makeNeuralCreator();
					List<Integer> numberOfNeurons = new ArrayList<Integer>( Arrays.asList(2, 5, 4, 31) );
					SimpleNetwork network = (SimpleNetwork) neuralCreator.createFeedForwardNetwork(neuralFactory, numberOfNeurons);
					assertEquals(network.outputSize(),31);
	}
//	
// TODO hacer todos estos de abajo
//###############################################################################
//test.SimpleNetwork.Cpp.writeInput <- function() {	
//###############################################################################		
//	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
//	testCode <- '
//			// Data set up		
//			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
//			NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
//			NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(*neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
//			networkPtr->show();
//			// Test
//			Rcpp::NumericVector inputVector(inputData);
//			Rcpp::NumericVector outputVector(2 * networkPtr->outputSize());
//
//			std::vector<double>::iterator inputIterator(inputVector.begin());
//			std::vector<double>::iterator outputIterator(outputVector.begin());
//			
//			networkPtr->singlePatternForwardAction();
//			networkPtr->readOutput(outputIterator);	
//			networkPtr->writeInput(inputIterator);
//			networkPtr->singlePatternForwardAction();
//			networkPtr->readOutput(outputIterator);
//			return wrap(outputVector);
//			'
//	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
//	result <- testCodefun(numberOfNeurons=c(2,3,2), inputData=c(1.4, 4.5) )
//	checkEquals(sum (result [ 1: (length(result)/2) ] !=	result [ (1 +  length(result)/2) : length(result) ] ), length(result)/2)
//}
//
//
//###############################################################################
//test.SimpleNetwork.Cpp.writeTarget <- function() {	
//###############################################################################		
//	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
//	testCode <- '
//			// Data set up		
//			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
//			NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
//			NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(*neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
//			networkPtr->show();
//			// Test
//			Rcpp::NumericVector targetVector(targetData);
//			Rcpp::NumericVector resultVector(2 * networkPtr->outputSize());
//			
//			std::vector<double>::iterator targetIterator(targetVector.begin());
//			std::vector<double>::iterator resultIterator(resultVector.begin());
//			
//			networkPtr->writeTarget(targetIterator);
//			return wrap(true);
//			'
//	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", targetData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
//	result <- testCodefun(numberOfNeurons=c(2,3,2), targetData=c(1.4, 4.5) )
//	checkTrue(result)
//	# [1] TRUE
//}
//
//
//###############################################################################
//test.SimpleNetwork.Cpp.readOutput <- function() {	
//###############################################################################		
//	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
//	testCode <- '
//			// Data set up		
//			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
//			NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
//			
//			NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(*neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
//			networkPtr->show();
//			// Test
//			Rcpp::NumericVector inputVector(inputData);
//			Rcpp::NumericVector outputVector(networkPtr->outputSize());
//	
//     		std::vector<double>::iterator inputIterator(inputVector.begin()) ;
//			std::vector<double>::iterator outputIterator(outputVector.begin()) ;
//
//			networkPtr->writeInput(inputIterator);
//			networkPtr->readOutput(outputIterator);
//			return wrap(outputVector);
//			'
//	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
//	result <- testCodefun(numberOfNeurons=c(2,2,3), inputData=c(1.4, 4.5) )
//	checkEquals(result, rep(0, 3))
//
//}
//
//
//
//###############################################################################
//test.SimpleNetwork.Cpp.singlePatternForwardAction <- function() {	
//###############################################################################		
//	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
//	testCode <- '
//			// Data set up		
//			NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
//			NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
//			NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(*neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
//			networkPtr->show();
//			// Test
//			Rcpp::NumericVector inputVector(inputData);
//			Rcpp::NumericVector outputVector(networkPtr->outputSize());
//			
//			std::vector<double>::iterator inputIterator(inputVector.begin());
//			std::vector<double>::iterator outputIterator(outputVector.begin());
//			
//			networkPtr->writeInput(inputIterator);
//			networkPtr->singlePatternForwardAction();
//			networkPtr->readOutput(outputIterator);
//			return wrap(outputVector);
//			'
//	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
//	result <- testCodefun(numberOfNeurons=c(2,5,4,31), inputData=c(1.4, 4.5) )
//	checkEquals(length(result), 31)
//	# [1] TRUE
//}
//
//
//
//###############################################################################
//test.SimpleNetwork.Cpp.singlePatternBackwardAction <- function() {	
//###############################################################################		
//	
//
//suppressMessages(require("inline"))
//suppressMessages(require("Rcpp"))
//suppressMessages(require("RUnit"))
//
//	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
//	testCode <- '
//		// Data set up		
//				NeuralFactoryPtr neuralFactoryPtr (new ADAPTgdFactory );
//				NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
//				NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(*neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
//
//				neuralFactoryPtr = NeuralFactoryPtr(new ADAPTgdFactory) ;
//				NetworkTrainBehaviorPtr networkTrainBehaviorPtr ( neuralFactoryPtr->makeNetworkTrainBehavior(networkPtr) );
//				networkPtr->setNetworkTrainBehavior( networkTrainBehaviorPtr );
//				networkPtr->setNeuronTrainBehavior( *neuralFactoryPtr );
//		// Test
//			Rcpp::NumericVector inputVector(inputData);
//			Rcpp::NumericVector outputVector(networkPtr->outputSize());
//			Rcpp::NumericVector targetVector(targetData);
//			
//			std::vector<double>::iterator inputIterator(inputVector.begin());
//			std::vector<double>::iterator targetIterator(targetVector.begin());
//			std::vector<double>::iterator outputIterator(outputVector.begin());
//			
//			networkPtr->writeInput(inputIterator);
//			Rprintf(\"====================================================================================================================\");
//			Rprintf(\"Write input: \");
//			Rprintf(\"====================================================================================================================\");
//			networkPtr->show();
//			networkPtr->singlePatternForwardAction();
//			Rprintf(\"====================================================================================================================\");
//			Rprintf(\"Forward: \");
//			Rprintf(\"====================================================================================================================\");
//			networkPtr->show();
//			networkPtr->singlePatternBackwardAction();
//			Rprintf(\"====================================================================================================================\");
//			Rprintf(\"Backward: \");
//			Rprintf(\"====================================================================================================================\");
//			networkPtr->show();	
//			networkPtr->readOutput(outputIterator);
//			return wrap(outputVector);
//			'
//	testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric", targetData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
//	result <- testCodefun(numberOfNeurons=c(2,2,2), inputData=c(1.4, 4.5), targetData=c(0.4, 0.5) )
//	
//	
//	
//	# 
//
//	checkEquals(length(result), 2)
//
//	
//	}
//	
//	
//###############################################################################
//test.SimpleNetwork.Cpp.setNetworkTrainBehavior <- function() {	
//###############################################################################		
//		incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
//		testCode <- '
//				// Data set up		
//		            NeuralFactoryPtr neuralFactoryPtr ( new MLPNoNetworkTrainBehaviorFactory );
//	                NeuralCreatorPtr neuralCreatorPtr ( neuralFactoryPtr->makeNeuralCreator() );
//					NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(*neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
//				// Test
//					Rcpp::List result;
//					result["before"]= networkPtr->getNetworkTrainBehaviorName();
//					neuralFactoryPtr = NeuralFactoryPtr(new ADAPTgdFactory) ;
//					NetworkTrainBehaviorPtr networkTrainBehaviorPtr ( neuralFactoryPtr->makeNetworkTrainBehavior(networkPtr) );
//					networkPtr->setNetworkTrainBehavior( networkTrainBehaviorPtr );
//					result["after"]= networkPtr->getNetworkTrainBehaviorName();
//					return result;
//		'
//		testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric", targetData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
//		result <- testCodefun(numberOfNeurons=c(2,2,2), inputData=c(1.4, 4.5), targetData=c(0.4, 0.5) )	
//		checkEquals(result$before, "MLPNoNetworkTrainBehavior"   ) 
//		checkEquals(result$after,  "ADAPTgdNetworkTrainBehavior" )
//		# [1] TRUE
//		# [1] TRUE
//	}
//	
//	
//###############################################################################
//test.SimpleNetwork.Cpp.setNeuronTrainBehavior <- function() {	
//###############################################################################
//		
//		incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
//		testCode <- '
//				// Data set up		
//				NeuralFactoryPtr neuralFactoryPtr (new MLPNoNetworkTrainBehaviorFactory );
//				NeuralCreatorPtr neuralCreatorPtr( neuralFactoryPtr->makeNeuralCreator() );
//				NeuralNetworkPtr networkPtr = neuralCreatorPtr->createFeedForwardNetwork(*neuralFactoryPtr, as< std::vector<int> >(numberOfNeurons), "Tanh", "Identity");
//				networkPtr->show();
//				// Test
//				neuralFactoryPtr = NeuralFactoryPtr(new ADAPTgdFactory) ;
//				NetworkTrainBehaviorPtr networkTrainBehaviorPtr ( neuralFactoryPtr->makeNetworkTrainBehavior(networkPtr) );
//				networkPtr->setNetworkTrainBehavior( networkTrainBehaviorPtr );
//				networkPtr->show();
//				networkPtr->setNeuronTrainBehavior( *neuralFactoryPtr );
//				networkPtr->show();
//				return wrap(true);
//				'
//		testCodefun <- cfunction(sig=signature(numberOfNeurons="integer", inputData="numeric", targetData="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
//		result <- testCodefun(numberOfNeurons=c(2,2,2), inputData=c(1.4, 4.5), targetData=c(0.4, 0.5) )	
//		checkTrue(result)
//		
//	}
//	
//	
//	

	
}

package es.unileon.amorej;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class SimpleNeuronTests {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testGetId() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		Neuron neuron = neuralFactory.makeNeuron("13");
		assertTrue(neuron.getId().equals("13"));
	}

	@Test
	public void testSetId() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		Neuron neuron = neuralFactory.makeNeuron("13");
		neuron.setId("31");
		assertTrue(neuron.getId().equals("31"));
		neuron.setId("");
		assertTrue(neuron.getId().equals(""));
		neuron.setId("35");
		assertTrue(neuron.getId().equals("35"));
	}

	@Test(expected = AmoreJException.class)
	public void testValidateIdIsNA() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		Neuron neuron = neuralFactory.makeNeuron("NA");
		neuron.validate();
}

	@Test(expected = AmoreJException.class)
	public void testValidateIdIsEmptyString() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		Neuron neuron = neuralFactory.makeNeuron("");
		neuron.validate();
}

	
	
//###############################################################################
//test.Neuron.Cpp.Validate_EmptyCon <- function() {	
//###############################################################################	
//	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
//	testCode <- "
//			//Test
//			NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
//			NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(12) );
//			neuronPtr->validate();			// An empty con does not throw exception
//			return wrap( neuronPtr->getId() );			
//			"
//	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
//	result <- testCodefun()
//	checkEquals(result, 12 )
//	# [1] TRUE
//}

//

}

package es.unileon.amorej;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import es.unileon.amorej.net.NeuralNetwork;

public class ConnectionTests {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testConstructor1Argument() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron = neuralFactory.makeNeuron("1", neuralNetwork);
		Connection connection = new Connection(neuron);
		connection.show();
		connection.validate();
		assertTrue(connection.getId().equals("1"));
		assertEquals(connection.getWeight(), 0.0, 1e-10);
	}
	@Test
	public void testConstructor2Arguments() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron = neuralFactory.makeNeuron("1", neuralNetwork);
		Connection connection = new Connection(neuron, 4.5);
		connection.show();
		connection.validate();
		assertTrue(connection.getId().equals("1"));
		assertEquals(connection.getWeight(), 4.5, 1e-10);
	}
	@Test
	public void testGetNeuron() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron = neuralFactory.makeNeuron("12", neuralNetwork);
		Connection connection = neuralFactory.makeConnection(neuron, 9.8);
		assertTrue(connection.getNextNeuron().getId().equals("12"));
	}

	@Test
	public void testSetNeuron() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron1 = neuralFactory.makeNeuron("12", neuralNetwork);
		Connection connection = neuralFactory.makeConnection(neuron1, 9.7);
		assertTrue(connection.getNextNeuron().getId().equals("12"));
		connection.show();
		Neuron neuron2 = neuralFactory.makeNeuron("21", neuralNetwork);
		connection.setNextNeuron(neuron2);
		assertTrue(connection.getNextNeuron().getId().equals("21"));
		connection.show();
	}

	
	@Test
	public void testGetId() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		Connection connection1 = neuralFactory.makeConnection(null, 8.7);
		assertTrue(connection1.getId().equals("NA"));
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron = neuralFactory.makeNeuron("9", neuralNetwork);
		Connection connection2 = neuralFactory.makeConnection(neuron, 7.8);
		assertTrue(connection2.getId().equals("9"));	
	}
	 

	@Test
	public void testGetWeight() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron = neuralFactory.makeNeuron("16", neuralNetwork);
		Connection connection = neuralFactory.makeConnection(neuron, 12.4);
		assertTrue(connection.getWeight()==12.4);
	}
	

	@Test
	public void testSetWeight() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron = neuralFactory.makeNeuron("16", neuralNetwork);
		Connection connection = neuralFactory.makeConnection(neuron, 12.4);
		assertTrue(connection.getWeight()==12.4);
	    connection.setWeight(2.2);
		assertTrue(connection.getWeight()==2.2);
	}
	
	@Test
	public void testGetInputValue() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron = neuralFactory.makeNeuron("16", neuralNetwork);
		Connection connection = neuralFactory.makeConnection(neuron, 12.4);
	    connection.setWeight(2.2);
		assertTrue(connection.getInputValue()==0.0);
		neuron.setOutput(12.3);
		assertTrue(connection.getInputValue()==12.3);
	}
	


	@Test
	public void testShow() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron = neuralFactory.makeNeuron("16", neuralNetwork);
		Connection connection = neuralFactory.makeConnection(neuron, 12.4);
		connection.show();
	}

	@Test(expected = AmoreJException.class)
		public void testValidateWeight() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron = neuralFactory.makeNeuron("16", neuralNetwork);
		Connection connection = neuralFactory.makeConnection(neuron, 12.4/0.0);
		connection.validate();
	}
	

	@Test(expected = AmoreJException.class)
	public void testValidateFromEmptyId() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron = neuralFactory.makeNeuron("", neuralNetwork);
		Connection connection = neuralFactory.makeConnection(neuron, 2.7);
		connection.validate();
}
	 

	@Test(expected = AmoreJException.class)
	public void testValidateFromNullId() throws AmoreJException {
		Connection connection = new Connection(null, 2.7 );
		connection.validate();
}

	
	@Test(expected = AmoreJException.class)
	public void testException() throws AmoreJException {
		// llamada a la situacion que genera la excepcion
		throw new AmoreJException("Great!");
	}

}

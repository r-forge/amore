package es.unileon.amorej;

import static org.junit.Assert.*;

import org.junit.Test;

import es.unileon.amorej.net.NeuralNetwork;

public class SimpleContainerTests {

	@Test
	public void testConstructorEmptyArgumentList() {

		Container<Connection> connectionContainer = new SimpleContainer<Connection>();
		try {
			connectionContainer.validate();
		} catch (AmoreJException e) {
			e.printStackTrace();
			fail("Exception caught by try catch");
		}
		assertTrue(true);
	}

	@Test
	public void testConstructorInitialCapacity() {

		Container<Connection> connectionContainer = new SimpleContainer<Connection>(
				10);
		try {
			connectionContainer.validate();
		} catch (AmoreJException e) {
			e.printStackTrace();
			fail("Exception caught by try catch");
		}
		assertTrue(true);
	}

	@Test
	public void testGet() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Container<Connection> connectionContainer = neuralFactory
				.makeConnectionContainer();
		int[] intArray = { 0, 1, 2, 3, 4, 5 };
		for (int i : intArray) {
			Neuron neuron = neuralFactory.makeNeuron(String.valueOf(i), neuralNetwork);
			Connection connection = neuralFactory.makeConnection(neuron,
					Math.random());
			connectionContainer.add(connection);
			assertEquals(connectionContainer.size(), i + 1, 1e-10);
		}
		Connection connection = connectionContainer.get(5);
		assertEquals("5", connection.getId());
	}

	@Test
	public void testAdd() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Container<Connection> connectionContainer = neuralFactory
				.makeConnectionContainer();
		int[] intArray = { 0, 1, 2, 3, 4, 5 };
		for (int i : intArray) {
			Neuron neuron = neuralFactory.makeNeuron(String.valueOf(i), neuralNetwork);
			Connection connection = neuralFactory.makeConnection(neuron,
					Math.random());
			connectionContainer.add(connection);
			Connection extractedConnection = connectionContainer.get(i);
			assertEquals(connection.getId(), extractedConnection.getId());
		}
	}

	@Test
	public void testIsEmpty() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Container<Connection> connectionContainer = neuralFactory
				.makeConnectionContainer();
		int[] intArray = { 1, 2, 3, 4, 5, 6 };
		for (int i : intArray) {
			Neuron neuron = neuralFactory.makeNeuron(String.valueOf(i), neuralNetwork);
			Connection connection = neuralFactory.makeConnection(neuron,
					Math.random());
			connectionContainer.add(connection);
		}
		assertEquals(connectionContainer.size(), 6, 1e-10);
		connectionContainer.clear();
		assertTrue(connectionContainer.isEmpty());
		assertEquals(connectionContainer.size(), 0, 1e-10);
		
	}

	@Test
	public void testSize() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Container<Connection> connectionContainer = neuralFactory
				.makeConnectionContainer();
		int[] intArray = { 1, 2, 3, 4, 5, 6 };
		for (int i : intArray) {
			Neuron neuron = neuralFactory.makeNeuron(String.valueOf(i), neuralNetwork);
			Connection connection = neuralFactory.makeConnection(neuron,
					Math.random());
			connectionContainer.add(connection);
			assertEquals(connectionContainer.size(), i, 1e-10);
		}
		connectionContainer.show();
	}

	@Test
	public void testClear() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Container<Connection> connectionContainer = neuralFactory
				.makeConnectionContainer();
		int[] intArray = { 1, 2, 3, 4, 5, 6 };
		for (int i : intArray) {
			Neuron neuron = neuralFactory.makeNeuron(String.valueOf(i),neuralNetwork);
			Connection connection = neuralFactory.makeConnection(neuron,
					Math.random());
			connectionContainer.add(connection);
		}
		assertEquals(connectionContainer.size(), 6, 1e-10);

		connectionContainer.clear();
		assertEquals(connectionContainer.size(), 0, 1e-10);
	}

	@Test
	public void testShow() {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Container<Connection> connectionContainer = neuralFactory
				.makeConnectionContainer();
		int[] intArray = { 1, 2, 3, 4, 5, 6 };
		for (int i : intArray) {
			Neuron neuron = neuralFactory.makeNeuron(String.valueOf(i), neuralNetwork);
			Connection connection = neuralFactory.makeConnection(neuron,
					Math.random());
			connectionContainer.add(connection);
		}
		connectionContainer.show();
	}

	@Test
	public void testValidate() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralNetwork neuralNetwork = neuralFactory.makeNeuralNetwork(neuralFactory);
		Container<Connection> connectionContainer = neuralFactory
				.makeConnectionContainer();
		int[] intArray = { 1, 2, 3, 4, 5, 6 };
		for (int i : intArray) {
			Neuron neuron = neuralFactory.makeNeuron(String.valueOf(i), neuralNetwork);
			Connection connection = neuralFactory.makeConnection(neuron,
					Math.random());
			connectionContainer.add(connection);
		}
		connectionContainer.validate();
	}

}

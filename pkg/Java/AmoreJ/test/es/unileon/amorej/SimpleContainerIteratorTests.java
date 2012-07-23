package es.unileon.amorej;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

public class SimpleContainerIteratorTests {


	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testConstructor() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		Container<Neuron> layer = neuralFactory.makeLayer();
		String[] idList = { "10", "20", "30" };
		for (String id : idList) {
			Neuron neuron = neuralFactory.makeNeuron(id);
			layer.add(neuron);
		}
		Iterator<Neuron> itr = layer.createIterator();
		ArrayList<String> result = new ArrayList<String>();
		for (itr.first(); !itr.isDone(); itr.next()) {
			result.add(itr.currentItem().getId());
		}
		assertTrue(result.get(0).equals(idList[0]));
		assertTrue(result.get(1).equals(idList[1]));
		assertTrue(result.get(2).equals(idList[2]));
	}

	@Test
	public void testFirst() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		Container<Neuron> layer = neuralFactory.makeLayer();
		String[] idList = { "10", "20", "30" };
		for (String id : idList) {
			Neuron neuron = neuralFactory.makeNeuron(id);
			layer.add(neuron);
		}
		Iterator<Neuron> itr = layer.createIterator();
		itr.next();
		itr.next();
		itr.first();
		assertTrue(itr.currentItem().getId().equals("10"));
	}

	
	@Test
	public void testNext() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		Container<Neuron> layer = neuralFactory.makeLayer();
		String[] idList = { "10", "20", "30" };
		for (String id : idList) {
			Neuron neuron = neuralFactory.makeNeuron(id);
			layer.add(neuron);
		}
		Iterator<Neuron> itr = layer.createIterator();
		itr.first();
		assertTrue(itr.currentItem().getId().equals("10"));
		itr.next();
		assertTrue(itr.currentItem().getId().equals("20"));
		itr.next();
		assertTrue(itr.currentItem().getId().equals("30"));
	}

	@Test
	public void testIsDone() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		Container<Neuron> layer = neuralFactory.makeLayer();
		String[] idList = { "10", "20", "30" };
		for (String id : idList) {
			Neuron neuron = neuralFactory.makeNeuron(id);
			layer.add(neuron);
		}
		Iterator<Neuron> itr = layer.createIterator();
		itr.first();
		assertTrue(itr.currentItem().getId().equals("10"));
		assertFalse(itr.isDone());
		itr.next();
		assertTrue(itr.currentItem().getId().equals("20"));
		assertFalse(itr.isDone());
		itr.next();
		assertTrue(itr.currentItem().getId().equals("30"));
		assertFalse(itr.isDone());
		itr.next();
		assertTrue(itr.isDone());
		itr.next();
		assertTrue(itr.isDone());
		itr.next();
		assertTrue(itr.isDone());
	}

	@Test(expected = AmoreJException.class)
	public void testCurrentItem() throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		Container<Neuron> layer = neuralFactory.makeLayer();
		String[] idList = { "10", "20", "30" };
		for (String id : idList) {
			Neuron neuron = neuralFactory.makeNeuron(id);
			layer.add(neuron);
		}
		Iterator<Neuron> itr = layer.createIterator();
		itr.first();
		assertTrue(itr.currentItem().getId().equals("10"));
		assertFalse(itr.isDone());
		itr.next();
		assertTrue(itr.currentItem().getId().equals("20"));
		assertFalse(itr.isDone());
		itr.next();
		assertTrue(itr.currentItem().getId().equals("30"));
		assertFalse(itr.isDone());
		itr.next();
		assertTrue(itr.isDone());
		assertTrue(itr.currentItem().getId().equals("30")); // Exception expected IteratorOutOfBounds
	}

}


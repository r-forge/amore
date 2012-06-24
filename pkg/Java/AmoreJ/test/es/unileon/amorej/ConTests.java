package es.unileon.amorej;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class ConTests {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testConstructor() throws AmoreJException {
		Neuron neuron = new SimpleNeuron("1");
		Connection connection = new Connection(neuron, 4.5);
		connection.show();
		connection.validate();
		assertTrue(connection.getId().equals("1"));
		assertEquals(connection.getWeight(), 4.5, 1e-10);
	}

	@Test
	public void testGetNeuron() {
		Neuron neuron = new SimpleNeuron("12");
		Connection connection = new Connection(neuron, 9.8);
		assertTrue(connection.getNextNeuron().getId().equals("12"));
	}

	@Test
	public void testSetNeuron() {
		Neuron neuron1 = new SimpleNeuron("12");
		Connection connection = new Connection(neuron1, 9.7);
		assertTrue(connection.getNextNeuron().getId().equals("12"));
		connection.show();
		Neuron neuron2 = new SimpleNeuron("21");
		connection.setNextNeuron(neuron2);
		assertTrue(connection.getNextNeuron().getId().equals("21"));
		connection.show();
	}

	
	@Test
	public void testGetId() {
		Connection connection1 = new Connection(null, 8.7);
		assertTrue(connection1.getId().equals("NA"));

		Neuron neuron = new SimpleNeuron("9");
		Connection connection2 = new Connection(neuron, 8.7);
		assertTrue(connection2.getId().equals("9"));
		
	}
	 

	@Test
	public void testGetWeight() {
		Neuron neuron = new SimpleNeuron("16");
		Connection connection = new Connection(neuron, 12.4);
		assertTrue(connection.getWeight()==12.4);
	}
	

	@Test
	public void testSetWeight() {
		Neuron neuron = new SimpleNeuron("16");
		Connection connection = new Connection(neuron, 12.4);
	    connection.setWeight(2.2);
		assertTrue(connection.getWeight()==2.2);
	}
	

	@Test
	public void testShow() {
		Neuron neuron = new SimpleNeuron("16");
		Connection connection = new Connection(neuron, 12.4);
		connection.show();
	}

	@Test(expected = AmoreJException.class)
		public void testValidateWeight() throws AmoreJException {
		Neuron neuron = new SimpleNeuron("16");
		Connection connection = new Connection(neuron, 12.4/0.0 );
		connection.validate();
	}
	
	

	@Test(expected = AmoreJException.class)
	public void testValidateFromEmptyId() throws AmoreJException {
		Neuron neuron = new SimpleNeuron("");
		Connection connection = new Connection(neuron, 2.7 );
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

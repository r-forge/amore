package es.unileon.amorej;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class ConTests {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		assertTrue(true);
	}
	
	@Test(expected=AmoreJException.class)
	public void testException() throws AmoreJException {
		// llamada a la situacion que genera la excepcion
		throw new AmoreJException("Great!");
	}

}

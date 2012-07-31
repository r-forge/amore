package es.unileon.amorej;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ ConnectionTests.class, SimpleContainerIteratorTests.class, SimpleContainerReverseIteratorTests.class,
		SimpleContainerTests.class, SimpleNeuronTests.class, SimpleNetworkTest.class })
public class AllTests {

}

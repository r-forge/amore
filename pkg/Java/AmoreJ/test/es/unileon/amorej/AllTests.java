package es.unileon.amorej;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ ConTests.class, SimpleNeuronTests.class })
public class AllTests {

}

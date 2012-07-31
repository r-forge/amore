package es.unileon.amorej.net;

import es.unileon.amorej.Checkable;
import es.unileon.amorej.NeuralFactory;
import es.unileon.amorej.Visible;

public interface NeuralNetwork extends Visible, Checkable {

	NeuralFactory getFactory();
	void setFactory(NeuralFactory neuralFactory);

}

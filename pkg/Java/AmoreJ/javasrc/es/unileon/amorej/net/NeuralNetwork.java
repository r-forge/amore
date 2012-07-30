package es.unileon.amorej.net;

import es.unileon.amorej.Checkable;
import es.unileon.amorej.Container;
import es.unileon.amorej.Iterator;
import es.unileon.amorej.NeuralFactory;
import es.unileon.amorej.Neuron;
import es.unileon.amorej.Visible;

public interface NeuralNetwork extends Visible, Checkable {

	void addNeuronToLayer(Neuron neuron, int index);
	NeuralFactory getFactory();
	void setFactory(NeuralFactory neuralFactory);

	
int numberOfLayers();
}

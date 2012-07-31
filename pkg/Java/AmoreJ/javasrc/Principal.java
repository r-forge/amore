import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import es.unileon.amorej.AmoreJException;
import es.unileon.amorej.Connection;
import es.unileon.amorej.MLPNoNetworkTrainBehaviorFactory;
import es.unileon.amorej.NeuralFactory;
import es.unileon.amorej.Neuron;
import es.unileon.amorej.net.NeuralCreator;
import es.unileon.amorej.net.NeuralNetwork;


public class Principal {
	public static void main(String args[]) throws AmoreJException {
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		NeuralCreator neuralCreator = neuralFactory.makeNeuralCreator();
		List<Integer> numberOfNeurons = new ArrayList<Integer>( Arrays.asList(2, 5, 4,  2) );
		NeuralNetwork network = neuralCreator.createFeedForwardNetwork(neuralFactory, numberOfNeurons);
		network.show();
		network.show();
		network.validate();
	}
}

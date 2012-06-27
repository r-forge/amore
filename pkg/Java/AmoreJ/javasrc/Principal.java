import java.util.ArrayList;
import java.util.List;

import es.unileon.amorej.AmoreJException;
import es.unileon.amorej.Connection;
import es.unileon.amorej.MLPNoNetworkTrainBehaviorFactory;
import es.unileon.amorej.NeuralFactory;
import es.unileon.amorej.Neuron;


public class Principal {
	public static void main(String args[]) throws AmoreJException {
		String[] idArray = { "1", "2", "3", "4", "5" };
		List<Neuron> nNeurons = new ArrayList<Neuron>();
		NeuralFactory neuralFactory = new MLPNoNetworkTrainBehaviorFactory();
		for (String stringIt : idArray) {
			Neuron neuron = neuralFactory.makeNeuron(stringIt);
			nNeurons.add(neuron);
		}

		Neuron neuron = neuralFactory.makeNeuron("10");
		for (Neuron neuronIt : nNeurons) {
			Connection connection = new Connection(neuronIt, Math.random());
			neuron.addConnection(connection);
		}
		neuron.show();
		neuron.validate();
	}
}

/**
 * 
 */
package es.unileon.amorej.net;

import java.util.List;

import es.unileon.amorej.AmoreJException;
import es.unileon.amorej.NeuralFactory;

/**
 * @author mcasl
 * 
 */
public interface NeuralCreator {
	public NeuralNetwork createFeedForwardNetwork(NeuralFactory neuralFactory, List<Integer> numberOfNeurons) throws AmoreJException;

	public NeuralNetwork createCustomFeedForwardNetwork(NeuralFactory neuralFactory, List<Integer> numberOfNeurons) throws AmoreJException;

	// TODO public NeuralNetwork createFeedForwardNetwork(NeuralFactory neuralFactory, List<Integer> numberOfNeurons, String hiddenLayersActivationFunctionName, String outputLayerActivationFunctionName);
	// TODO public NeuralNetwork createCustomFeedForwardNetwork( NeuralFactory neuralFactory, List<Integer> numberOfNeurons, List hiddenLayersActivationFunction, List outputLayerActivationFunction);

}

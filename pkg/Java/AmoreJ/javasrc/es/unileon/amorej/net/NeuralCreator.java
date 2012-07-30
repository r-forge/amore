/**
 * 
 */
package es.unileon.amorej.net;

import java.util.List;

import es.unileon.amorej.NeuralFactory;

/**
 * @author mcasl
 * 
 */
public interface NeuralCreator {
	public NeuralNetwork createFeedForwardNetwork(NeuralFactory neuralFactory,
			List<Integer> numberOfNeurons); 

	public NeuralNetwork createCustomFeedForwardNetwork(
			NeuralFactory neuralFactory, List<Integer> numberOfNeurons);

// TODO Original , remember to correct the previous ones	
	
//	
//	TODO public NeuralNetwork createFeedForwardNetwork(NeuralFactory neuralFactory,
//			List<Integer> numberOfNeurons,
//			String hiddenLayersActivationFunctionName,
//			String outputLayerActivationFunctionName);
//
//	TODO public NeuralNetwork createCustomFeedForwardNetwork(
//			NeuralFactory neuralFactory, List<Integer> numberOfNeurons,
//			List hiddenLayersActivationFunction,
//			List outputLayerActivationFunction);

}

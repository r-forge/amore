/**
 * 
 */
package es.unileon.amorej;

import java.util.List;

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

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

// Original , remember to correct the previous ones	
	
//	
//	public NeuralNetwork createFeedForwardNetwork(NeuralFactory neuralFactory,
//			List<Integer> numberOfNeurons,
//			String hiddenLayersActivationFunctionName,
//			String outputLayerActivationFunctionName);
//
//	public NeuralNetwork createCustomFeedForwardNetwork(
//			NeuralFactory neuralFactory, List<Integer> numberOfNeurons,
//			List hiddenLayersActivationFunction,
//			List outputLayerActivationFunction);

}

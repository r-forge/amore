package es.unileon.amorej;

public class SimpleNetwork implements NeuralNetwork {
 Container<Neuron> inputLayer;
 Container<Container<Neuron>> hiddenLayers;
 Container<Neuron> outputLayer;
 //  costFunction;
 
	public SimpleNetwork(NeuralFactory neuralFactory) {

  inputLayer   = neuralFactory.makeLayer();
  hiddenLayers = neuralFactory.makeLayerContainer();
  outputLayer  = neuralFactory.makeLayer();
  // costFunction = neuralFactory.makeCostFunction("LMS");
  
  
	}

}
